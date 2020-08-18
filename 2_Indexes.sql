/*
Task:6

 Optimize schema for performance.
*/

------------------------------------------------------------
--DROPPING INDEXES
------------------------------------------------------------

DROP INDEX IF EXISTS patients_IDX
ON [dbo].[test_patients];

DROP INDEX IF EXISTS medical_trajectory_IDX
ON [dbo].[test_medical_trajectory];

DROP INDEX IF EXISTS trajectory_detail_IDX
ON [dbo].[test_trajectory_detail];

DROP INDEX IF EXISTS trajectory_detail__date_performed_id__IDX
ON [dbo].[test_trajectory_detail];

DROP INDEX IF EXISTS activities_IDX
ON [dbo].[test_activities];

DROP INDEX IF EXISTS activities__subcategory_ID__IDX
ON [dbo].[test_activities];

DROP INDEX IF EXISTS prices_IDX
ON [dbo].[test_prices] ;

DROP INDEX IF EXISTS treatment_subcategories_IDX
ON [dbo].[test_treatment_subcategories];

DROP INDEX IF EXISTS treatment_subcategories__category_ID__IDX
ON [dbo].[test_treatment_subcategories];

DROP INDEX IF EXISTS treatment_categories_IDX
ON [dbo].[test_treatment_categories];

------------------------------------------------------------
------------------------------------------------------------


CREATE CLUSTERED INDEX patients_IDX
ON [dbo].[test_patients] ([patientid]);

------------------------------------------------------------

CREATE CLUSTERED INDEX medical_trajectory_IDX
ON [dbo].[test_medical_trajectory] ([traject_id], [patient_id]);

-------------------------------------------------------------

CREATE CLUSTERED INDEX trajectory_detail_IDX
ON [dbo].[test_trajectory_detail] ([traject_id],[activity_id]);

CREATE NONCLUSTERED INDEX trajectory_detail__date_performed_id__IDX
ON [dbo].[test_trajectory_detail] ([date_performed], [activity_id]);

--------------------------------------------------------------

CREATE CLUSTERED INDEX activities_IDX
ON [dbo].[test_activities] ([id]);

CREATE NONCLUSTERED INDEX activities__subcategory_ID__IDX
ON [dbo].[test_activities] ([treatment_subcategory_id]);

-----------------------------------------------------------------

CREATE CLUSTERED INDEX prices_IDX
ON [dbo].[test_prices] ([activity_id], [price]);

-----------------------------------------------------------------

CREATE CLUSTERED INDEX treatment_subcategories_IDX
ON [dbo].[test_treatment_subcategories] ([category_id]);

CREATE NONCLUSTERED INDEX treatment_subcategories__category_ID__IDX
ON [dbo].[test_treatment_subcategories] ([treatment_category_id]);

-----------------------------------------------------------------

DROP INDEX IF EXISTS treatment_categories_IDX
ON [dbo].[test_treatment_categories];

CREATE CLUSTERED INDEX treatment_categories_IDX
ON [dbo].[test_treatment_categories] ([category_id]);

-----------------------------------------------------------------