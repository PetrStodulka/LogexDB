/*
Task:2

Write a query that will return the total cost of the most expensive patient in 2017 along with patient details.

Columns returned: Patient_id, First_name, Second_name, gender, date_of_birth, cost

!!!IMPORTANT... It makes no sence to get total cost for year 2017 when all activities should be randomly distributed 2 years to the past.
				Therefore, year 2018 was used.
*/

SELECT TOP 1
	pa.patientid AS [Patient_id]
	, pa.firstname AS [First_name]
	, pa.lastname AS [Second_name]
	, pa.gender AS [gender]
	, pa.date_of_birth [date_of_birth]
	, SUM(pr.price) AS [cost]
FROM [dbo].[test_patients] pa
	INNER JOIN [dbo].[test_medical_trajectory] mt ON mt.patient_id = pa.patientid
	INNER JOIN [dbo].[test_trajectory_detail] td ON td.traject_id = mt.traject_id
	INNER JOIN [dbo].[test_activities] a ON a.id = td.activity_id
	INNER JOIN [dbo].[test_prices] pr ON pr.activity_id = a.id
WHERE td.date_performed >= '2018-01-01'	-- much better performance compare with DATE function on date_performed column
	AND td.date_performed <= '2018-12-31'
GROUP BY
	pa.patientid
	, pa.firstname
	, pa.lastname
	, pa.gender
	, pa.date_of_birth
ORDER BY cost DESC



/*
Task:3

Write a query that will return cost per patient grouped by a year.

Columns returned: Patient_id, cost, year
*/


SELECT mt.patient_id AS [Patient_id]
	, SUM(pr.price) AS [cost]
	, YEAR(td.date_performed) AS [year]
FROM [dbo].[test_medical_trajectory] mt
	INNER JOIN [dbo].[test_trajectory_detail] td ON td.traject_id = mt.traject_id
	INNER JOIN [dbo].[test_activities] a ON a.id = td.activity_id
	INNER JOIN [dbo].[test_prices] pr ON pr.activity_id = a.id
GROUP BY 
	mt.patient_id
	, YEAR(td.date_performed)
ORDER BY 
	[Patient_id]
	, [year]



/*
Task:4

Write a query that will calculate the overall cost per treatment category by month for the year 2017.

Columns returned: Treatment category Id, Cost, Month

!!!IMPORTANT... It makes no sence to get total cost for year 2017 when all activities should be randomly distributed 2 years to the past.
				Therefore, year 2018 was used.
*/

SELECT
	ts.treatment_category_id AS [Treatment category Id]
	, SUM(p.price) AS [Cost]
	, MONTH(td.date_performed) AS [Month]
FROM [dbo].[test_treatment_subcategories] ts
	INNER JOIN [dbo].[test_activities] a ON a.treatment_subcategory_id = ts.category_id
	INNER JOIN [dbo].[test_prices] p ON p.activity_id = a.id
	INNER JOIN [dbo].[test_trajectory_detail] td ON td.activity_id = a.id
WHERE td.date_performed >= '2018-01-01'	-- much better performance compare with DATE function on date_performed column
	AND td.date_performed <= '2018-12-31'
GROUP BY 
	ts.treatment_category_id
	, MONTH(td.date_performed)
ORDER BY
	[Treatment category Id]
	, [Month]
	, [Cost]





/*
Task:5

Create a query that will return all patients labelled by a treatment category.

Rules for labelling:

The patient should be marked by the treatment category corresponding to the subcategory mapped to an activity with the highest cost sum performed within a traject (remember single activity can be performed multiple times in a traject and in this case cost is a sum of instances).

·        For example, Patient 1 has 3 trajects and corresponding activities mapped to a traject.

Example 1:

PatientId,TrajectId, Activity_code, Price

1, 1, 1, 180

1, 1, 1, 180

1, 1, 3, 200

1, 2, 4, 300

1, 3, 4, 300

·        In this case, the patient should be labelled by treatment category mapped to activity 1 as overall cost withing traject 1 for this activity is 360 which is more than the cost for activities 3,4.

·        In case of prices are the same for certain activities use a rank field on treatment subcategory. SubCategory with higher rank will be used.

Columns returned: Treatment category Id, patient_id

*/
/*
INSERT INTO [dbo].[test_activities]
VALUES('TESTT2', 10)

INSERT INTO [dbo].[test_prices]
([activity_id], [price])
VALUES(1001, 382)

INSERT INTO [dbo].[test_trajectory_detail]
VALUES(100964, 1002, '2018-10-26')
*/

WITH TopActivities
as
(
SELECT --TOP 1000
	mt.patient_id
	, td.activity_id
	, a.treatment_subcategory_id
	, SUM(pr.price) AS [Cost]
	, RANK() OVER (PARTITION BY mt.patient_id ORDER BY SUM(pr.price) DESC) AS [Position]
FROM [dbo].[test_medical_trajectory] mt
	INNER JOIN [dbo].[test_trajectory_detail] td ON td.traject_id = mt.traject_id
	INNER JOIN [dbo].[test_activities] a ON a.id = td.activity_id
	INNER JOIN [dbo].[test_prices] pr ON pr.activity_id = a.id
GROUP BY
	mt.patient_id
	, td.activity_id
	, a.treatment_subcategory_id
--ORDER BY 
--	mt.patient_id
),
rankBased AS
(
SELECT a.*
	, ts.treatment_category_id
	, ts.[rank]
	, RANK() OVER (PARTITION BY patient_id ORDER BY [rank] DESC) AS rankPosition
FROM TopActivities a
	INNER JOIN [dbo].[test_treatment_subcategories] ts ON ts.category_id = a.treatment_subcategory_id
WHERE Position = 1
)
SELECT 
	treatment_category_id
	, patient_id
FROM rankBased
WHERE rankPosition = 1
ORDER BY patient_id


