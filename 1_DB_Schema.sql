--use ZPM2018

DROP TABLE IF EXISTS [dbo].[test_medical_trajectory];
DROP TABLE IF EXISTS [dbo].[test_trajectory_detail];
DROP TABLE IF EXISTS [dbo].[test_patients];
DROP TABLE IF EXISTS [dbo].[test_prices];
DROP TABLE IF EXISTS [dbo].[test_activities];
DROP TABLE IF EXISTS [dbo].[test_treatment_categories];
DROP TABLE IF EXISTS [dbo].[test_treatment_subcategories];

create table dbo.test_medical_trajectory
(
	traject_id int identity(1,1) not null,
	patient_id int not null,
)

create table dbo.test_trajectory_detail(
	traject_id int not null,
	activity_id int not null,
	date_performed date not null
)

create table dbo.[test_patients](
	[patientid] [int] identity(1,1) not null,
	[firstname] [varchar](50) not null,
	[lastname] [varchar](50) not null,
	[address1] [varchar](50) not null,
	[address2] [varchar](50) null,
	[city] [varchar](50) not null,
	[zip] [varchar](9) null,
	[date_of_birth] [date] null,
	[gender] [varchar](1) null
)

create table [dbo].test_prices(
	activity_id int not null,
	price float not null,
	valid_from date,
	valid_to date
)

-------------------------------------------------------------------------------------------------
create table dbo.test_activities(
	id int identity(1,1) not null,
	name varchar(256) not null,
	treatment_subcategory_id int not null
)

create table [dbo].[test_treatment_categories](
	[category_id] [int] not null,
	[name] [varchar](256) not null,
	[rank] smallint not null
)

create table [dbo].[test_treatment_subcategories](
	[category_id] [int] not null,
	[name] [varchar](256) not null,
	treatment_category_id int not null,
	[rank] smallint not null
)


insert into dbo.test_activities
(
	name,
	treatment_subcategory_id
)
select 
	name,
	treatment_subcategory_id
	from (
	Select 'Reiskosten per kilometer.' [name], 107 treatment_subcategory_id Union All
	Select 'Reistijd/vacatie per half uur.',107 Union All
	Select 'Operatieve behandeling van acuut trauma capitis, extraduraal.',5 Union All
	Select 'Craniotomie vanwege een of meerdere epidurale haematomen.',5 Union All
	Select 'Neurovasculaire decompressie achterste schedelgroeve (o.a. Janetta).',4 Union All
	Select 'Craniotomie vanwege acuut subduraal/intracerebraal traumatisch hematoom.',5 Union All
	Select 'Craniotomie vanwege subacuut/chronisch subduraal hematoom.',5 Union All
	Select 'Operatief herstel gecompliceerde impressiefractuur schedel.',5 Union All
	Select 'Exploratie orbita dmv craniotomie.',5 Union All
	Select 'Operatieve behandeling intraparenchymale aandoening supratentorieel oppervlakkig (oa tumor, cavernoom) zonder betrokkenheid ventrikel, basale kernen, thalamus.',5 Union All
	Select 'Operatieve behandeling extra-axiale aandoening supratentorieel convexiteit (oa tumor, AV-fistel) zonder betrokkenheid falx of veneuze sinusssen.',5 Union All
	Select 'Endoscopische operatieve behandeling aandoening intra- en paraventriculair.',1 Union All
	Select 'Subcutaan plaatsen pulsgenerator van DBS neurostimulator bij dwangstoornissen (zie 030197 voor overige aandoeningen).',5 Union All
	Select 'Plaatsen elektrode intracranieel van DBS neurostimulator bij dwangstoornissen (zie 030198 voor overige aandoeningen).',5 Union All
	Select 'Diagnostische intracraniele punctie.',75 Union All
	Select '(Re)exploratie schedel.',5 Union All
	Select 'Boorgat schedel (oa voor drainage epidurale en/of subdurale ruimte).',5 Union All
	Select 'Callosotomie.',5 Union All
	Select 'Plaatsen diepte-elektroden tbv epilepsie chirurgie (of tbv chronische corticografie).',5 Union All
	Select 'Plaatsen elektrodenmat of stripelektroden tbv epilepsie chirurgie (of tbv chronische corticografie).',5 Union All
	Select 'Verwijderen elektrodenmat, stripelektroden of diepte-elektroden, inclusief duraplastiek.',5 Union All
	Select 'Decompressie dmv craniotomie wgs verhoogde intracraniele druk.',5 Union All
	Select 'Decompressie dmv craniectomie wgs verhoogde intracraniele druk.',5 Union All
	Select 'Verwijderen epileptogeen gebied.',5 Union All
	Select 'Functionele hemisferectomie, totaal of partieel.',5 Union All
	Select 'Navigatiegeleide of stereotactische plaatsing intracerebrale devices (oa drains, katheters of naalden).',13 Union All
	Select 'Stereotactische operatie voor de anesthesioloog inclusief de hulp bij ventriculografie en coagulatie.',5 Union All
	Select 'Biopsie aandoening hersenen dmv craniotomie.',5 Union All
	Select 'Navigatiegeleide of stereotactische biopsie aandoening hersenen.',75 Union All
	Select 'Functionele stereotactische operatie, hersenen (zie 030147 voor stereotactische biopsie).',5 Union All
	Select 'Behandeling van oppervlakkige osteomyelitis van het schedeldak.',48 Union All
	Select 'Tracto-nucleotomie centrale zenuwstelsel.',5 Union All
	Select 'Excisie aandoening schedeldak.',5 Union All
	Select 'Open biopsie schedeldak.',5 Union All
	Select 'Percutane biopsie schedel.',75 Union All
	Select 'Navigatie- of echogeleide punctie hersenabces.',13 Union All
	Select 'Vervangen elektrode(s) intracranieel van DBS neurostimulator.',5 Union All
	Select 'Verwijderen of verplaatsen elektrode(s) intracranieel van DBS neurostimulator.',5 Union All
	Select 'Operatieve behandeling intraparenchymale aandoening supratentorieel diep (oa tumor, cavernoom) met betrokkenheid 1e,2e of 3e ventrikel, insula thalamus.',5 Union All
	Select 'Operatieve behandeling intraparenchymale aandoening infratentorieel diep (oa tumor, cavernoom), bodem 4e ventrikel, medulla oblongata en hersenstam.',5 Union All
	Select 'Operatieve behandeling extra-axiale tumor infratentorieel met betrokkenheid foramen magnum, sinussen of brughoek.',5 Union All
	Select 'Operatieve behandeling extra-axiale aandoening supratentorieel convexiteit (oa tumor, AV-fistel) met betrokkenheid falx of veneuze sinussen.',5 Union All
	Select 'Operatieve behandeling schedelbasis tumor centraal, achterste schedelgroeve, clivus, open procedure.',5 Union All
	Select 'Endovasculaire behandeling tumor schedelbasis (zie 030181 voor open procedure, zie 030183 met radionucleaire techniek).',12 Union All
	Select 'Behandeling tumor schedelbasis met radionucleaire technieken (zie 030181 voor open procedure, zie 030182 voor endovasculair).',57 Union All
	Select 'Operatieve behandeling intraparenchymale aandoening infratentorieel oppervlakkig (oa tumor, cavernoom ) in cerebellaire hemisfeer.',5 Union All
	Select 'Behandeling hersentumor met radionucleaire technieken (zie 030184 voor operatieve behandeling).',14 Union All
	Select 'Operatieve behandeling glomustumor (chemodectoom, bijvoorbeeld glomus jugulare, tympanicum of caroticum).',5 Union All
	Select 'Operatieve behandeling tumor schedelbasis frontaal, sphenoid, hypofyse, orbita, transcraniële benadering.',5 Union All
	Select 'Distractie schedelbeenderen bij craniosynostose.',5 Union All
	Select 'Zaagsnedes maken en/of herpositionering schedelbeenderen bij craniosynostose.',5 Union All
	Select 'Verwijderen distractiemateriaal na craniosynostosebehandeling.',5 Union All
	Select 'Plastiek van schedeldefect met autoloog of homoloog bottransplantaat, zonder duratransplantaat, door middel van craniotomie.',5 Union All
	Select 'Plastiek van schedeldefect met autoloog of homoloog bottransplantaat, met duratransplantaat, door middel van craniotomie.',5 Union All
	Select 'Plastiek van schedeldefect met alloplastiek, zonder duratransplantaat, door middel van craniotomie.',5 Union All
	Select 'Plastiek van schedeldefect met alloplastiek, met duratransplantaat, door middel van craniotomie.',5 Union All
	Select 'Subcutaan plaatsen pulsgenerator van DBS neurostimulator (excl. bij dwangstoornissen zie 030117).',5 Union All
	Select 'Plaatsen elektrode(s) intracranieel van DBS neurostimulator (excl. bij dwangstoornissen zie 030118).',5 Union All
	Select 'Stereotactische radiochirurgische behandeling intracraniële tumoren met Gamma Knife (zie 033449 voor stereotactische radiochirurgie bij AVM intracraniële vaten).',58 Union All
	Select 'Operatie wegens craniële meningocele.',5 Union All
	Select 'Duraverwijdingsplastiek.',5 Union All
	Select 'Externe liquordrainage cranieel.',13 Union All
	Select 'Externe liquordrainage spinaal.',5 Union All
	Select 'Duraplastiek spinaal.',5 Union All
	Select 'Plastiek van schedeldefect met autoloog of homoloog bottransplantaat, met duraplastiek, door middel van transmastoïdale/transnasale benadering.',4 Union All
	Select 'Plastiek van schedeldefect met alloplastiek, met duraplastiek, door middel van transmastoïdale/transnasale benadering.',4 Union All
	Select 'Vervangen (deel van) liquorshunt.',5 Union All
	Select 'Drainage cyste hersenen met aanleggen shunt.',5 Union All
	Select 'Fenestratie cyste hersenen d.m.v. craniotomie.',5 Union All
	Select 'Operatie wegens encephalocele.',5 Union All
	Select 'Ventriculostomie.',5 Union All
	Select 'Inbrengen ventrikelreservoir cranieel (oa Ommaya).',5 Union All
	Select 'Inbrengen drukmeter onder de schedel.',5 Union All
	Select 'Revisie of verwijderen liquorshunt of ventrikelreservoir tbv liquordrainage, zonder implantatie nieuw materiaal.',5 Union All
	Select 'Liquordrainage dmv interne liquordrain cranieel.',5 Union All
	Select 'Liquordrainage dmv interne liquordrain spinaal.',5 Union All
	Select 'Endoscopische fenestratie binnen of buiten liquorsysteem.',1 Union All
	Select 'Plaatsen elektrode nervus hypoglossus voor aansluiting op stimulator.',11 Union All
	Select 'Vervangen elektrode nervus hypoglossus.',11 Union All
	Select 'Verwijderen elektrode nervus hypoglossus.',11 Union All
	Select 'Plaatsen ademhalingssensor voor nervus hypoglossus stimulator.',11 Union All
	Select 'Vervangen ademhalingssensor nervus hypoglossus stimulator.',11 Union All
	Select 'Verwijderen ademhalingssensor nervus hypoglossus stimulator.',11 Union All
	Select 'Formeren toegangsweg via neus en/of mond voor ander poortspecialisme.',1 Union All
	Select 'Formeren toegangsweg via mastoid/oor voor ander poortspecialisme.',5 Union All
	Select 'Formeren peridurale toegangsweg voor ander poortspecialisme.',5 Union All
	Select 'Operatie wegens vaat-malformatie aan het ruggemerg of wegens tethered cord, endovasculair (zie 030309 voor open procedure).',12 Union All
	Select 'Re-exploratie spinaal liquorlek of nabloeding.',5 Union All
	Select 'Operatieve behandeling wegens tethered cord, open procedure (zie 030307 voor endovasculair).',5 Union All
	Select 'Vertebrectomie cervicaal met spondylodese.',5 Union All
	Select 'Vertebrectomie thoracaal met spondylodese.',5 Union All
	Select 'Vertebrectomie lumbaal met spondylodese.',5 Union All
	Select 'Vertebrectomie spinaal wegens myelumcompressie met spondylodese.',5 Union All
	Select 'Laminectomie, 1 niveau, (uitgezonderd bij HNP of stenose zie 030327).',5 Union All
	Select 'Laminectomie, 1 niveau, bij HNP of stenose (zie 030326 voor overige aandoeningen).',5 Union All
	Select 'Laminectomie, 2 of meer niveaus, (uitgezonderd bij HNP of stenose zie 030329).',5 Union All
	Select 'Laminectomie, 2 of meer niveaus, bij HNP of stenose (voor overige aandoeningen zie 030328).',5 Union All
	Select 'Verwijderen aandoening extramedullair (oa spinale tumor, vaatafwijking, hematoom).',5 Union All
	Select 'Verwijderen aandoening intramedullair (oa spinale tumor, vaatafwijking).',5 Union All
	Select 'Operatie wegens spinale meningocele.',5 Union All
	Select 'Operatie wegens spina bifida.',5 Union All
	Select 'Eenvoudige coagulatie van het ganglion Gasseri.',10 Union All
	Select 'Stereotactische uitschakeling van het ganglion Gasseri.',13 Union All
	Select 'Implantatie van een elektrode, suboccipitaal i.h.k.v. ONS-studie.',11 Union All
	Select 'Verwijderen of revisie van een elektrode, suboccipitaal i.h.k.v. ONS-studie.',11 Union All
	Select 'Neurectomie bij Mortons metatarsalgie.',5 Union All
	Select 'Extrapelvine of intrapelvine resectie van de nervus obturatorius.',5 Union All
	Select 'Sensibile desinnervatie van de heup.',13 Union All
	Select 'Zenuwdoorsnijding of exerese, bijvoorbeeld de nervus cutaneus femoris lateralis anterior.',5 Union All
	Select 'Cross face zenuwtransplantatie.',5 Union All
	Select 'Jump anastomose nervus hypoglossus - nervus facialis.',5 Union All
	Select 'Primair hechten kleinere (o.a. digitale) zenuw.',5 Union All
	Select 'Primair hechten grotere (plexus/stam o.a. medianus) zenuw.',5 Union All
	Select 'Anastomosering van een of meerdere hersenzenuwen intracranieel.',5 Union All
	Select 'Secundair hechten kleinere (o.a. digitale) zenuw.',5 Union All
	Select 'Secundair hechten grotere (plexus/stam o.a.medianus) zenuw.',5 Union All
	Select 'Reconstructie van kleinere (o.a. digitale) zenuw m.b.v. autoloog zenuwtransplantaat.',5 Union All
	Select 'Reconstructie van grotere (plexus/stam o.a.medianus) zenuw m.b.v. autoloog zenuwtransplantaat.',5 Union All
	Select 'Neurolysen zonder operatiemicroscoop of loupevergroting.',5 Union All
	Select 'Neurolysen m.b.v. operatiemicroscoop of loupevergroting.',4 Union All
	Select 'Exploratie van een tumor van een perifere zenuw.',5 Union All
	Select 'Decompressie zenuw, per zenuw, exclusief neurolysen (zie 030460 en 030461).',5 Union All
	Select 'Operatieve behandeling neuroom of zenuwtumor (excisie of transpositie).',5 Union All
	Select 'Reconstructie van kleinere (o.a. digitale zenuw) m.b.v. lichaamsvreemd materiaal.',5 Union All
	Select 'Reconstructie van grotere (plexus/stam o.a.medianus) zenuw m.b.v. lichaamsvreemd materiaal.',5 Union All
	Select 'Transpositie van zenuw.',5 Union All
	Select 'Transpositie nervus ulnaris.',5 Union All
	Select 'Reconstructie plexus brachialis met behulp van zenuwtransplantaat.',5 Union All
	Select 'Operatie aan de plexus cervicobrachialis.',5 Union All
	Select 'Cervicale sympathectomie.',1 Union All
	Select 'Lumbale sympathectomie, open procedure (zie 030516 voor endoscopisch).',5 Union All
	Select 'Sacrale sympathectomie.',13 Union All
	Select 'Thoracale sympathectomie, open procedure (zie 030518 voor endoscopisch).',5 Union All
	Select 'Lumbale sympathectomie als onderdeel van een vaatreconstructie, abdominaal, open procedure (zie 030519 voor endoscopisch).',5 Union All
	Select 'Endoscopische lumbale sympathectomie (zie 030511 voor open procedure).',1 Union All
	Select 'Endoscopische thoracale sympathectomie (zie 030513 voor open procedure).',1 Union All
	Select 'Endoscopische lumbale sympathectomie als onderdeel van een vaatreconstructie, abdominaal (zie 030515 voor open procedure).',1 Union All
	Select 'Injectie van het sympathische zenuwstelsel.',13 Union All
	Select 'Gehele kuur in hiatus of in sympathische ganglia.',13 Union All
	Select 'Implantatie van een stimulatie-elektrode in arteria carotis.',11 Union All
	Select 'Verwijderen van een stimulatie-elektrode uit arteria carotis.',11 Union All
	Select 'Sympathectomie aan de arteria carotis communis.',5 Union All
	Select 'Peri-arteriële sympathectomie.',5 Union All
	Select 'Neurolytische blokkade van een of meer perifere zenuwen.',13 Union All
	Select 'Epidurale injectie, cervicaal.',13 Union All
	Select 'Epidurale injectie, thoracaal.',13 Union All
	Select 'Epidurale injectie, lumbaal.',13 Union All
	Select 'Epidurale bloodpatch (voor overige epidurale injecties zie 030545 t/m 030547 of 030560).',13 Union All
	Select 'Percutane facetdenervatie met behulp van thermolaesies onder beeldvormende techniek, inclusief prognostische blokkade, cervicaal.',10 Union All
	Select 'Percutane facetdenervatie met behulp van thermolaesies onder beeldvormende techniek, inclusief prognostische blokkade, thoracaal.',10 Union All
	Select 'Percutane facetdenervatie met behulp van thermolaesies onder beeldvormende techniek, inclusief prognostische blokkade, lumbosacraal.',10 Union All
	Select 'Percutane thermolaesie van het dorsale ganglion, ongeacht het aantal, inclusief prognostische blokkade cervicaal.',10 Union All
	Select 'Percutane thermolaesie van het dorsale ganglion, ongeacht het aantal, inclusief prognostische blokkade, thoracaal.',10 Union All
	Select 'Percutane thermolaesie van het dorsale ganglion, ongeacht het aantal, inclusief prognostische blokkade, lumbosacraal.',10 Union All
	Select 'Percutane thermolaesie van het dorsale ganglion, ongeacht het aantal, inclusief prognostische blokkades, een tweede wortel in een aparte zitting, binnen een half jaar.',10 Union All
	Select 'Selectieve thermolaesie van het ganglion Gasseri.',10 Union All
	Select 'Anesthesie bij selectieve thermolaesie van het ganglion Gasseri.',95 Union All
	Select 'Epidurale injectie, sacraal.',13 Union All
	Select 'Epidurale of subarachnoidale injecties van een neurolytische vloeistof.',13 Union All
	Select 'Injectie van het ganglion Gasseri.',13 Union All
	Select 'Anesthesie bij een injectie van het ganglion Gasseri.',95 Union All
	Select 'Cryolaesie van het ganglion sphenopalatinum, onder beeldvormende techniek.',10 Union All
	Select 'Percutane chordotomie, onder beeldvormende techniek.',13 Union All
	Select 'Therapeutische epiduroscopie (exclusief enkel inbrengen epiduraal katheter, epiduraal injectie of epidurale bloodpatch).',1 Union All
	Select 'Neurolytisch thoracaal symphaticusblok, onder beeldvormende techniek.',13 Union All
	Select 'Neurolytisch splanchnicusblok, onder beeldvormende techniek.',13 Union All
	Select 'Anesthesie bij splanchnicusblok.',95 Union All
	Select 'Neurolytisch lumbaal sympathicusblok, onder beeldvormende techniek.',13 Union All
	Select 'Diagnostische epiduroscopie.',1 Union All
	Select 'Inbrengen getunnelde epiduraal- of spinaalkatheter.',13 Union All
	Select 'Mannitol infusie via centrale lijn (minimaal 4 dagen).',48 Union All
	Select 'Carnitine infusie therapie.',48 Union All
	Select 'Ketamine infusie therapie.',48 Union All
	Select 'Behandeling met capsaïcine huidpleister.',48 Union All
	Select 'Intradiscale elektrothermische annuloplasty (IDET, zie 030594 voor biaccuplasty).',10 Union All
	Select 'Thermolaesie ganglion stellatum.',10 Union All
	Select 'Thermolaesie ganglion sphenopalatinum.',10 Union All
	Select 'Anesthesie bij blokkade ganglion sphenopalatinum.',95 Union All
	Select 'Intradiscale biaccuplasty (zie 030590 voor IDET).',10 Union All
	Select 'Radiofrequente behandeling SI gewricht.',10 Union All
	Select 'Conservatieve behandeling sympathisch reflex dystrofie (medicamenteuze behandeling, spalktherapie).',48 Union All
	Select 'Endoscopische subtotale strumectomie (oa. MIVAT).',1 Union All
	Select 'Endoscopische totale strumectomie (oa. MIVAT).',1 Union All
	Select 'Subtotale strumectomie, open procedure (zie 030613 voor endoscopisch).',5 Union All
	Select 'Totale strumectomie, open procedure (zie 030615 voor endoscopisch).',5 Union All
	Select 'Extirpatie van een of meerdere nodi uit de schildklier.',5 Union All
	Select 'Endoscopische exploratie of verwijderen autotransplantaat glandulae parathyreoidiae.',1 Union All
	Select 'Extirpatie van een of meerdere tumoren, uitgaande van de glandulae parathyreoideae, open procedure (zie 030662 voor endoscopisch).',5 Union All
	Select 'Endoscopische extirpatie van een of meerdere tumoren, uitgaande van de glandulae parathyreoideae (zie 030661 voor open procedure).',1 Union All
	Select 'Re-exploratie glandulae parathyreoidiae, inclusief sternomotie.',5 Union All
	Select 'Bijnier operatie, open procedure (zie 030701 voor laparoscopisch) (excl. resectie bijnier, met of zonder excisie omliggend weefsel, zie 030702).',5 Union All
	Select 'Laparoscopische bijnier operatie (zie 030700 voor open procedure) (excl. laparoscopische resectie bijnier, met of zonder excisie omliggend weefsel, zie 030703).',1 Union All
	Select 'Resectie bijnier, met of zonder excisie omliggend weefsel, open procedure (zie 030703 voor laparoscopisch).',5 Union All
	Select 'Laparoscopische resectie bijnier, met of zonder excisie omliggend weefsel (zie 030702 voor open procedure).',1 Union All
	Select 'Partiële of totale hypofysectomie transsfenoïdaal (zie 030189 voor transcraniële benadering hypofyse).',1 Union All
	Select 'Operatieve decompressie van de orbita zonder orbitotomie (laterale orbitotomie zie 030804, anterieure orbitotomie zie 030805).',5 Union All
	Select 'Laterale orbitotomie.',5 Union All
	Select 'Anterieure orbitotomie.',5 Union All
	Select 'Exenteratio orbitae.',5 Union All
	Select 'Orbitectomie (operatief verwijderen afwijking(en) uit de orbita inclusief verwijderen (delen van) de benige oogkas), excl. transcraniële benadering (zie 030189).',5 Union All
	Select 'Biopsie orbita.',75 Union All
	Select 'Verwijderen plombe/explant na ablatiochirurgie.',4 Union All
	Select 'Reconstructie orbita m.b.v. gevasculariseerd bot transplantaat.',5 Union All
	Select 'Reconstructie orbita m.b.v. vrij bot transplantaat.',5 Union All
	Select 'Operatieve behandeling orbita bodemfractuur.',5 Union All
	Select 'Coagulatie van intra-oculaire aandoeningen, mits niet vallend onder 030896 of 030897.',10 Union All
	Select 'Coagulatie van intra-oculaire aandoeningen d.m.v. focale laserbehandeling.',9 Union All
	Select 'Coagulatie van intra-oculaire aandoeningen d.m.v. panretinale laserbehandeling.',9 Union All
	Select 'Behandeling van intra-oculaire aandoeningen d.m.v. YAG-laser (zie 031230 voor operatief verwijderen nastaar).',9 Union All
	Select 'Foto-dynamische therapie, subretinaal.',36 Union All
	Select 'Enucleatio bulbi.',5 Union All
	Select 'Evisceratio bulbi.',5 Union All
	Select 'Plaatsen van een secundair oogbol implantaat.',5 Union All
	Select 'Primaire behandeling van ernstige perforerende verwondingen van de oogbol inclusief herstel van irisprolaps.',5 Union All
	Select 'Verwijdering van een of meerdere intra-oculaire corpora aliena.',4 Union All
	Select 'Scheelzienoperatie regulier (voor operatie van schuine of verticale rechte oogspieren zie 030945, operaties van verlittekende of paralytische vormen zie 030946, vier spieren operatie zie 030989).',4 Union All
	Select 'Scheelzienoperatie schuine of verticale rechte oogspieren (voor operaties verlittekende of paralytische vormen zie 030946, vier spieren operatie zie 030989, reguliere operatie zie 030944).',4 Union All
	Select 'Scheelzienoperatie bij verlittekende oogspieren of paralytisch (voor operatie schuine of verticale rechte oogspieren zie 030945, vier spieren operatie zie 030989, reguliere operatie zie 030944).',4 Union All
	Select 'Vier spieren operatie (voor operatie van schuine of verticale rechte oogspieren zie 030945, voor operaties van verlittekende of paralytische vormen zie 030946, voor reguliere operatie zie 030944).',4 Union All
	Select 'Verwijderen van een of meerdere tumoren van de cornea met plastiek.',4 Union All
	Select 'Verwijdering van een of meerdere tumoren van de cornea zonder plastiek.',4 Union All
	Select 'Overhechting ulcus cornea.',4 Union All
	Select 'Hoornvlieshechting.',4 Union All
	Select 'Perforerende hoornvliestransplantatie (full thickness graft, penetrerende keratoplastiek (PKP)).',4 Union All
	Select 'Voorste lamellaire hoornvliestransplantatie (diepe anterieure lamellaire keratoplastiek (DALK)).',4 Union All
	Select 'Achterste lamellaire hoornvliestransplantatie (posterieure lamellaire keratoplastiek (PLK), o.a. DLEK, DSEK).',4 Union All
	Select 'Verwijdering van een of meerdere corpora aliena, behandeling van een combustio, erosie of etsing van hoornvlies of bindvlies.',4 Union All
	Select 'Tatouage van het hoornvlies.',4 Union All
	Select 'Natrium-EDTA spoeling van het hoornvlies.',48 Union All
	Select 'Herstel operatie corneaflap.',4 Union All
	Select 'Corneale collageen cross-linking (CXL).',36 Union All
	Select 'Phototherapeutische keratectomie (PTK).',36 Union All
	Select 'Photorefractieve keratectomie (PRK).',9 Union All
	Select 'Laser assisted in situ keratomileusis (LASIK).',9 Union All
	Select 'Plaatsen intrastromale corneale ringsegmenten (ICR).',4 Union All
	Select 'Laser assisted epithelial keratomileusis (LASEK).',9 Union All
	Select 'Epitheliaal laser assisted in situ keratomileusis (epi-LASIK).',9 Union All
	Select 'Behandeling met radioactieve plaque op de sclera.',57 Union All
	Select 'Sclerahechting.',4 Union All
	Select 'Verwijdering van iriscyste of iristumor.',4 Union All
	Select 'Chirurgische iridotomie of iridectomie (voor laser variant zie 030896 of 030898).',4 Union All
	Select 'Herstel iridodialysis.',4 Union All
	Select 'Herstel prolapsus iridis.',4 Union All
	Select 'Maken van nieuwe pupil-opening, diaphragmectomie.',4 Union All
	Select 'Needling filterblaas (bleb).',4 Union All
	Select 'Glaucoom operatie (voor goniotomie zie 031140, voor filtrerende operatie met plaatsen van filterimplant zie 031139).',4 Union All
	Select 'Filtrerende operatie voorste oogkamer met plaatsen filterimplant (voor goniotomie zie 031140, voor overige glaucoomoperaties zie 031138).',4 Union All
	Select 'Goniotomie (voor filtrerende operatie voorste oogkamer met plaatsen filterimplant zie 031139, voor overige glaucoomoperaties zie 031138).',4 Union All
	Select 'Verwijderen corpus alienum uit voorste oogkamer.',4 Union All
	Select 'Spoelen voorste oogkamer.',4 Union All
	Select 'Losmaken iris van cornea, inclusief een eventuele iridectomie.',4 Union All
	Select 'Nastaardiscisie, operatief verwijderen nastaar (zie 030898 voor behandeling van intra-oculaire aandoeningen d.m.v. YAG-laser).',9 Union All
	Select 'Cataractoperatie extracapsulair, met inbrengen van kunststoflens (zie 031242 voor m.b.v. niet standaard materialen, of uitgevoerd in amblyogene leeftijd).',4 Union All
	Select 'Cataractoperatie extracapsulair, met inbrengen van kunststoflens, m.b.v. niet standaard materialen of technieken, of uitgevoerd in de amblyogene leeftijd.',4 Union All
	Select 'Verwijdering van geluxeerde lens.',4 Union All
	Select 'Cataractoperatie intracapsulair.',4 Union All
	Select 'Cataractoperatie intracapsulair, met inbrengen van kunststoflens.',4 Union All
	Select 'Cataractoperatie extracapsulair.',4 Union All
	Select 'Implanteren van extra kunststoflens bij faak oog.',4 Union All
	Select 'Implanteren van extra kunststoflens bij pseudofaak oog.',4 Union All
	Select 'Implanteren van kunststoflens bij afaak oog.',4 Union All
	Select 'Refractieve lensverwisseling.',4 Union All
	Select 'Het verwijderen van een kunststoflens.',4 Union All
	Select 'Operatieve repositie van een geluxeerde kunststoflens.',4 Union All
	Select 'Voorsegmentsvitrectomie.',4 Union All
	Select 'Pars plana vitrectomie (zie de codes 031296 en 031297 voor pars plana vitrectomie bij behandeling van ablatio retinae).',4 Union All
	Select 'Pars plana vitrectomie bij behandeling van ablatio retinae (zie code 031297 voor pars plana vitrectomie bij behandeling ablatio retinae inclusief verwijderen tractiemembranen).',4 Union All
	Select 'Pars plana vitrectomie bij behandeling van ablatio retinae incl. verwijderen tractiemembranen (zie code 031296 voor pars plana vitrectomie bij ablatio retinae excl. verwijderen tractiemembr.).',4 Union All
	Select 'Verwijderen siliconenolie.',4 Union All
	Select 'Behandeling ablatio retinae middels uitwendige techniek.',4 Union All
	Select 'Verwijdering van een of meerdere corpora aliena subconjunctivaal, extra-orbitaal (excl. verwijderen plombe/explant na ablatiochirurgie zie 030826).',4 Union All
	Select 'Verwijdering van een of meerdere tumoren van de conjunctiva, met plastiek.',4 Union All
	Select 'Verwijdering van een of meerdere tumoren van de conjunctiva zonder plastiek.',4 Union All
	Select 'Opheffen symblepharon met transplantatie.',5 Union All
	Select 'Vrije plastiek van de conjunctiva met lip of ander slijmvlies.',5 Union All
	Select 'Opheffen symblepharon zonder transplantatie.',5 Union All
	Select 'Verwijdering van een of meer chalazia per zitting.',4 Union All
	Select 'Verwijderen aandoening ooglid zonder reconstructie (zie code 031516 voor verwijderen of correctie aandoening ooglid inclusief reconstructie).',4 Union All
	Select 'Verwijderen of correctie aandoening ooglid inclusief reconstructie met zwaailap of trans- of implantaat (zie code 031515 voor verwijderen aandoening ooglid zonder reconstructie).',4 Union All
	Select 'Implantatie goudgewichtje in bovenooglid.',5 Union All
	Select 'Fornix verdiepende hechtingen.',5 Union All
	Select 'Desinsertie oogspieren bovenooglid.',5 Union All
	Select 'Correctie floppy eyelid.',5 Union All
	Select 'Operatieve behandeling blepharospasme.',5 Union All
	Select 'Herstel laceratie ooglid.',5 Union All
	Select 'Ectropion operatie.',4 Union All
	Select 'Entropion operatie.',4 Union All
	Select 'Verkleining lidspeet, eventueel totale sluiting.',4 Union All
	Select 'Transnasale mediale canthopexie.',1 Union All
	Select 'Blepharoplastiek.',5 Union All
	Select 'Correctie ptosis wenkbrauw - extern (zie 031548 voor endoscopisch).',5 Union All
	Select 'Correctie ptosis wenkbrauw - endoscopisch (zie 031547 voor extern).',1 Union All
	Select 'Canthusreconstructie.',4 Union All
	Select 'Frontalis suspensie.',5 Union All
	Select 'Levator plastiek.',5 Union All
	Select 'Fasanella-servat procedure.',4 Union All
	Select 'Verwijderen van oogharen d.m.v. elektrische epilatie of bevriezing, per zitting.',4 Union All
	Select 'Opheffen van de verkleining van de ooglidspleet respectievelijk van een gesloten lidspleet.',4 Union All
	Select 'Sondage van een of meerdere traanwegstenosen.',16 Union All
	Select 'Herstel traanpunt.',4 Union All
	Select 'Inbrengen plug punctum lacrimale.',4 Union All
	Select 'Verwijderen van een traanzak.',4 Union All
	Select 'Maken van een verbinding tussen neus en conjunctivaalzak, overige (o.a. buisjes van Jones, voor Ex-DCR zie 031656, voor En-DCR zie 031657).',4 Union All
	Select 'Dacryo-cysto-rhinostomie - uitwendig (Ex-DCR, zie code 031657 voor endonasaal, zie 031640 voor maken van een verbinding tussen neus en conjunctivaalzak, overige).',5 Union All
	Select 'Dacryo-cysto-rhinostomie - endonasaal (En-DCR, zie code 031656 voor extern, zie 031640 voor maken van een verbinding tussen neus en conjunctivaalzak, overige).',1 Union All
	Select 'Reconstructie canaliculus.',4 Union All
	Select 'Excisie van een of meer exostosen met los-prepareren van de gehoorgang.',4 Union All
	Select 'Gehoorgangverwijdingsoperatie (meatusplastiek).',5 Union All
	Select 'Excisie van aandoening uitwendige gehoorgang exclusief verwijderen exostosen (zie 031711).',4 Union All
	Select 'Reconstructie oorschelp met autoloog weefsel (Nagata procedures).',5 Union All
	Select 'Plastische correctie van de oorschelp bij cup ear of lop ear deformiteit.',5 Union All
	Select 'Plastische correctie van een standdeviatie van de oorschelp door middel van correctie van het oorskelet.',5 Union All
	Select 'Plastische correctie van een standdeviatie van de oorschelp door middel van excisie van weke delen.',5 Union All
	Select 'Plastische correctie van de oorschelp door middel van correctie van het oorskelet (excl. bij standdeviatie zie 031741 en bij lop ear of cup ear zie 031740).',5 Union All
	Select 'Paracentese trommelvlies.',4 Union All
	Select 'Transmeatale drainage van het middenoor met behulp van een polytheen buisje volgens fowler of daarmede vergelijkbare techniek. Inclusief eventuele adenotomie.',4 Union All
	Select 'Operatieve ingreep aan het oor met exploratie van het cavum tympani en/of het trommelvlies, die beogen het gehoor te verbeteren.',4 Union All
	Select 'Operatieve ingreep aan het oor met exploratie van het cavum tympani en/of trommelvlies, uitgevoerd als tweede tempo na een ingreep als genoemd bij de codes 031820 tot en met 031822.',4 Union All
	Select 'Epitympanale mastoid operatie met ruim openen van de koepel holte, c.q. attico antrotomie bij chronische ontstekingsprocessen.',4 Union All
	Select 'Mastoid operatie met inbegrip van eventuele complicaties.',4 Union All
	Select 'Radicaal operatie met inbegrip van eventuele complicaties.',4 Union All
	Select 'Excisie tumor midden- en/of binnenoor (exclusief verwijdering brughoektumor, zie 030178).',4 Union All
	Select 'Gehoorverbeterende operatie bij otosclerose door middel van de techniek van Shea, waarbij een piston door de voetplaat wordt gebracht.',4 Union All
	Select 'Gehoorverbeterende operaties bij otosclerose door middel van stapedectomie en interpositie.',4 Union All
	Select 'Gehoorverbeterende operatie bij otosclerose door middel van stapedolyse, technieken van Rosen, Fowler enzovoort.',4 Union All
	Select 'Myringoplastiek.',4 Union All
	Select 'Exploratieve tympanotomie.',4 Union All
	Select 'Gehoorverbeterende operatie bij otosclerose door middel van fenestratie van de horizontale booggang.',4 Union All
	Select 'Operatieve ingreep aan het rotsbeen en middenoor bij chronische ontstekingen, die beogen het oor te saneren en het gehoor te verbeteren (tympanoplastiek).',4 Union All
	Select 'Exploratie van de nervus facialis in het rotsbeen en/of het middenoor bij facialisparalyse of -parese.',4 Union All
	Select 'Exploratie van de nervus facialis in het rotsbeen en/of het middenoor bij facialisparalyse of -parese met plastiek van de zenuw wegens continuiteitsverlies.',5 Union All
	Select 'Labyrinth destructie via het masto‹d.',4 Union All
	Select 'Cochleaire implantaten (pre-)implantatie bij volwassenen.',4 Union All
	Select 'Cochleaire implantaten nazorg volwassenen.',87 Union All
	Select 'Cochleaire implantaten (pre-)implantatie bij kinderen.',4 Union All
	Select 'Cochleaire implantaten nazorg kinderen.',87 Union All
	Select 'Vervangen processor cochleair implantaat bij volwassenen.',29 Union All
	Select 'Vervangen processor cochleair implantaat bij kinderen.',29 Union All
	Select 'Plaatsen implantaat in het rotsbeen t.b.v. een botverankerd hoortoestel.',5 Union All
	Select 'Plaatsen koppelstuk (abutment) op implantaat t.b.v. een botverankerd hoortoestel.',5 Union All
	Select 'Vervangen botverankerd hoortoestel.',29 Union All
	Select 'Ozaena operatie.',1 Union All
	Select 'Rhinotomie ter verwijdering van een of meerdere gezwellen uit de neusholten.',1 Union All
	Select 'Verwijdering van een of meerdere neuspoliepen, open procedure (zie 032014 voor endoscopisch).',5 Union All
	Select 'Endoscopische verwijdering van een of meerdere neuspoliepen (zie 032013 voor open procedure).',1 Union All
	Select 'Caustische behandeling van het neusslijmvlies.',10 Union All
	Select 'Submuceuze venster septum resectie, incl.evt. conchotomie. Verwijderen crista septi, welke over de gehele diepte van de neus verloopt, met los prepareren van de slijmvliesbladen valt hieronder.',1 Union All
	Select 'Conchotomie, christotomie, spinectomie, concha-luxatie of concha infractie.',5 Union All
	Select 'Correctief chirurgische behandeling van de deformiteiten aan het benig neusskelet met laterale osteotomie.',5 Union All
	Select 'Correctief chirurgische behandeling van deformiteiten aan het benig neusskelet met laterale osteotomie, gecombineerd met ingrepen ter correctie van het septum en/of het vestibulum nasi.',5 Union All
	Select 'Correctieve ingrepen aan cartilagines laterales en/of ter correctie van de neusvleugels en vestibulum nasi.',5 Union All
	Select 'Septum correctie met mobilisatie en repositie van kraakbeen met mediale osteotomie en eventuele conchotomie.',1 Union All
	Select 'Septum correctie, als bedoeld bij code 032064 gecombineerd met correctie van de neusvleugels en het vestibulum nasi, als bedoeld bij code 032062.',1 Union All
	Select 'Repositie van neusfractuur zonder wondtoilet.',60 Union All
	Select 'Repositie van verse, naar buiten geperforeerde, neusfractuur met uitgebreid wondtoilet.',5 Union All
	Select 'Uitgebreide bloedige repositie bij verse septumfractuur. Onder uitgebreid wordt verstaan het mobiliseren, corrigeren en zonodig implanteren van kraakbeen.',5 Union All
	Select 'Behandeling van een neusbloeding door middel van een Bellocq-tamponade.',49 Union All
	Select 'Behandeling van een neusbloeding met tamponade van voren.',49 Union All
	Select 'Neusreconstructie: sluiten huiddefect d.m.v. lokale transpositielap.',5 Union All
	Select 'Neusreconstructie: sluiten huiddefect d.m.v. voorhoofdslap.',5 Union All
	Select 'Neusreconstructie: reconstructie binnenbekleding neus d.m.v. transpositielap of huidtransplantaat.',5 Union All
	Select 'Neusreconstructie: reconstructie neusskelet m.b.v. kraakbeen en/of bot.',5 Union All
	Select 'Endonasale sinus maxillaris operatie, bijvoorbeeld volgens Claou‚ of Mikulicz.',1 Union All
	Select 'Kaakspoeling.',1 Union All
	Select 'Radicale sinus maxillaris operatie, bijvoorbeeld volgens Caldwell-Luc.',1 Union All
	Select 'Kaakspoeling bij kinderen onder 15 jaar onder algehele anesthesie.',1 Union All
	Select 'Endonasale sinus frontalis operatie, bijvoorbeeld volgens Halle, Mosher of Vacher.',1 Union All
	Select 'Uitwendige drainage sinus frontalis.',5 Union All
	Select 'Radicale sinus frontalis operatie.',1 Union All
	Select 'Endonasale sinus ethmoidalis operatie.',1 Union All
	Select 'Uitwendige operatie van de sinus ethmoidalis.',5 Union All
	Select 'Endonasale sinus sphenoidalis operatie.',1 Union All
	Select 'Pansinusitis (inclusief etmoïd en kaakholte volgens Lima). Hieronder wordt verstaan de behandeling van een ontsteking van drie of meer neusbijholten aan een zijde.',1 Union All
	Select 'Plastische sluiting van een of meerdere bijholtefistels aan een zijde.',5 Union All
	Select 'Tracheotomie.',5 Union All
	Select 'Inbrengen transtracheale zuurstofkatheter met behulp van punctie en dilatatie, een zogenaamde mini-tracheotomie.',13 Union All
	Select 'Diagnostische tracheoscopie.',1 Union All
	Select 'Inbrengen ventiel-stemprothese na eerdere larynxextirpatie.',5 Union All
	Select 'Verwisselen ventiel-stemprothese.',5 Union All
	Select 'Verwijderen of opheffen aandoening larynx, open procedure (zie 032218 voor laryngoscopisch).',5 Union All
	Select 'Therapeutische laryngoscopie voor verwijderen of opheffen aandoening larynx (zie 032217 voor open procedure).',1 Union All
	Select 'Adamsappel reductie (tracheal shaving).',5 Union All
	Select 'Halfzijdige larynxextirpatie.',5 Union All
	Select 'Pharynx-larynxextirpatie inclusief evt. inbrengen ventiel-stemprothese.',5 Union All
	Select 'Resectie aandoening trachea- en/of carina, open procedure (zie 032276 voor endoscopisch).',5 Union All
	Select 'Endoscopisch verwijderen of opheffen aandoening trachea en/of carina (zie 032275 voor open procedure).',1 Union All
	Select 'Hoofdcarina reconstructie.',5 Union All
	Select 'Diagnostische indirecte laryngoscopie, inclusief eventuele proefexcisie(s).',123 Union All
	Select 'Diagnostische directe laryngoscopie, inclusief eventuele proefexcisie(s).',123 Union All
	Select 'Diagnostische directe laryngoscopie onder de operatiemicroscoop, inclusief eventuele proefexcisie(s).',123 Union All
	Select 'Stroboscopisch onderzoek.',123 Union All
	Select 'Tonsillectomie, bij personen tot en met 10 jaar, inclusief eventuele adenotomie.',5 Union All
	Select 'Tonsillectomie, bij personen van 11 tot en met 15 jaar, inclusief eventuele adenotomie.',5 Union All
	Select 'Tonsillectomie, bij personen van 16 jaar en ouder, inclusief eventuele adenotomie.',5 Union All
	Select 'Adenotomie.',5 Union All
	Select 'Verwijdering van een branchiogene cyste of glomustumor.',5 Union All
	Select 'Verwijdering van een mediane halscyste of halsfistel.',5 Union All
	Select 'Verwijdering van een rhinopharynx-fibroom.',1 Union All
	Select 'Opheffing choanale-atresie bij kinderen.',1 Union All
	Select 'Therapeutische of diagnostische sondage met een bronchiale katheter.',16 Union All
	Select 'Operatie van sulcus superior (Pancoast) tumoren, open procedure (zie 032429 voor thoracoscopisch).',5 Union All
	Select 'Thoracoscopische operatie van sulcus superior (Pancoast) tumoren (zie 032428 voor open procedure).',1 Union All
	Select 'Sleeve-resectie, open procedure (zie 032434 voor thoracoscopisch, 032435 voor VATS procedure).',5 Union All
	Select 'Thoracoscopische sleeve-resectie (zie 032433 voor open procedure en 032435 voor VATS procedure).',1 Union All
	Select 'Sleeve-resectie met behulp van video-assisted thoracic surgery (VATS, zie 032434 voor thoracoscopisch, zie 032433 voor open procedure).',1 Union All
	Select 'Bronchoplastiek of hechten bronchusruptuur, open procedure (zie 032453 voor endoscopisch).',5 Union All
	Select 'Endoscopisch(e) bronchoplastiek of hechten bronchusruptuur (zie 032452 voor open procedure).',1 Union All
	Select 'Diagnostische bronchoscopie met chartismeting.',123 Union All
	Select 'Diagnostische bronchoscopie, inclusief een of meerdere proefexcisies, curettage en/of afzuigen van materiaal voor cytologisch en/of pathologisch onderzoek.',123 Union All
	Select 'Therapeutische bronchoscopie, zoals verwijderen van corpora alinea, afzuigen van secretie of installatie van medicamenten.',1 Union All
	Select 'Therapeutische bronchoscopie met laser-coagulatie, zoals bij behandeling van een tumor of bloeding, en / of stentplaatsing.',9 Union All
	Select 'Endobronchiale longvolume reductie (BLVR, zie 032487 voor bronchiale thermoplastiek en voor chirurgische LVR zie 032525 t/m 032527).',1 Union All
	Select 'Bronchiale thermoplastiek (LVR dmv RF ablatie, zie 032486 voor overige minder-invasieve LVR).',1 Union All
	Select 'Plaatsen van intrabronchiaal eenrichtingsventiel(en) voor persisterend luchtlek door middel van therapeutische bronchoscopie.',1 Union All
	Select 'Intrapulmonale drainage.',13 Union All
	Select 'Aanleggen pleuroperitoneale shunt.',5 Union All
	Select 'Bilobectomie, open procedure (zie 032523 voor thoracoscopisch, zie 032524 voor VATS procedure).',5 Union All
	Select 'Thoracoscopische bilobectomie (zie 032522 voor open procedure, zie 032524 voor VATS procedure).',1 Union All
	Select 'Bilobectomie met behulp van video-assisted thoracic surgery (VATS, zie 032523 voor thoracoscopisch, zie 032522 voor open procedure).',1 Union All
	Select 'Longvolume reductie chirurgie (LVRC), open procedure (zie 032526 voor thoracoscopisch, zie 032527 voor VATS procedure).',5 Union All
	Select 'Thoracoscopische longvolume reductie chirurgie (LVRC), zie 032525 voor open procedure, zie 032527 voor VATS procedure).',1 Union All
	Select 'Longvolume reductie chirurgie (LVRC) met behulp van video-assisted thoracic surgery (VATS), zie 032526 voor thoracoscopisch, zie 032525 voor open procedure).',1 Union All
	Select 'Bullectomie met partiele pleurectomie, open procedure (zie 032535 voor thoracoscopisch, zie 032534 voor VATS procedure).',5 Union All
	Select 'Lobectomie of segmentresectie, open procedure (zie 032536 voor thoracoscopisch, zie 032537 voor VATS procedure).',5 Union All
	Select 'Wigresectie, open procedure (zie 032538 voor thoracoscopisch, zie 032539 voor VATS procedure).',5 Union All
	Select 'Bilaterale resectie, midsternaal.',5 Union All
	Select 'Bullectomie met partiële pleurectomie met behulp van video-assisted thoracic surgery (VATS, zie 032535 voor thoracoscopisch, zie 032529 voor open procedure).',1 Union All
	Select 'Thoracoscopische bullectomie met partiele pleurectomie (zie 032529 voor open procedure, zie 032534 voor VATS procedure).',1 Union All
	Select 'Thoracoscopische lobectomie of segmentresectie (zie 032530 voor open procedure, zie 032537 voor VATS procedure).',1 Union All
	Select 'Lobectomie of segmentresectie met behulp van video-assisted thoracic surgery (VATS, zie 032536 voor thoracoscopisch, zie 032530 voor open procedure).',1 Union All
	Select 'Thoracoscopische wigresectie (zie 032532 voor open procedure, zie 032539 voor VATS procedure).',1 Union All
	Select 'Wigresectie met behulp van video-assisted thoracic surgery (VATS, zie 032538 voor thoracoscopisch, zie 032532 voor open procedure).',1 Union All
	Select 'Pleuro-pneumonectomie, open procedure.',5 Union All
	Select 'Pneumonectomie, open procedure (zie 032547 voor thoracoscopisch, zie 032549 voor VATS procedure).',5 Union All
	Select 'Pneumonectomie met uitgebreide verwijdering lymfklieren, open procedure (zie 032548 voor endoscopisch).',5 Union All
	Select 'Thoracoscopische pneumonectomie (zie 032542 voor open procedure, zie 032549 voor VATS procedure).',1 Union All
	Select 'Endoscopische pneumonectomie met uitgebreide verwijdering lymfklieren (zie 032543 voor open procedure).',1 Union All
	Select 'Pneumonectomie met behulp van video-assisted thoracic surgery (VATS, zie 032547 voor thoracoscopisch, zie 032542 voor open procedure).',1 Union All
	Select 'Aanleggen pneumothorax, inclusief periodiek bijvullen, open procedure (zie 032562 voor thoracoscopisch, zie 032563 voor VATS procedure).',5 Union All
	Select 'Extrapleurale pneumolyse.',5 Union All
	Select 'Thoracoscopisch aanleggen pneumothorax, inclusief periodiek bijvullen (zie 032563 voor VATS procedure, zie 032560 voor open procedure).',1 Union All
	Select 'Aanleggen pneumothorax met behulp van video-assisted thoracic surgery (VATS), inclusief periodiek bijvullen (zie 032562 voor thoracoscopisch, zie 032560 voor open procedure).',1 Union All
	Select 'Open longbiopsie (zie 032582 voor endoscopische longbiopsie).',5 Union All
	Select 'Endoscopische longbiopsie (zie 032581 voor open longbiopsie).',1 Union All
	Select 'Behandeling met zuigdrainages van de pleuraholte en het mediastinum.',13 Union All
	Select 'Operatieve behandeling van een empyema thoracis, open procedure (zie 032605 voor VATS procedure).',5 Union All
	Select 'Proefthoracotomie (zie 032606 voor proefthoracoscopie).',5 Union All
	Select 'Het spoelen van een empyeemholte door middel van een intra-thoracale zuigdrain of via een reeds voorhanden zijnde drain, met of zonder inbrengen van medicamenten.',15 Union All
	Select 'Operatieve behandeling van een empyema thoracis met behulp van video-assisted thoracic surgery (VATS, zie 032601 voor open procedure).',1 Union All
	Select 'Proefthoracoscopie (zie 032602 voor proefthoracotomie).',1 Union All
	Select 'Sluiten bronchusfistel of bronchopleurale fistel, open procedure (zie 032618 voor thoracoscopisch, zie 032619 voor VATS procedure).',5 Union All
	Select 'Sluiten bronchusfistel of bronchopleurale fistel, thoracoscopisch (zie 032617 voor open procedure, zie 032619 voor VATS procedure).',1 Union All
	Select 'Sluiten bronchusfistel of bronchopleurale fistel met behulp van video-assisted thoracic surgery (VATS, zie 032617 voor open procedure, zie 032618 voor thoracoscopisch).',1 Union All
	Select 'Sluiten fistel thoraxwand.',5 Union All
	Select 'Verwijderen van een of meerdere corpora aliena uit de pleuraholte, inclusief het eventueel hechten van longweefsel, open procedure (zie 032623 voor thoracoscopisch).',5 Union All
	Select 'Thoracoscopisch verwijderen van een of meerdere corpora aliena uit de pleuraholte, inclusief het eventueel hechten van longweefsel (zie 032622 voor open procedure).',1 Union All
	Select 'Percutane mediastinumbiopsie.',75 Union All
	Select 'Mediastinotomie.',5 Union All
	Select 'Operatie van een of meerdere mediastinumtumoren met behulp van video-assisted thoracic surgery (VATS), eventueel midsternaal (zie 032633 voor endoscopisch, zie 032632 voor open procedure).',1 Union All
	Select 'Open operatie van een of meerdere mediastinumtumoren, eventueel midsternaal (zie 032633 voor endoscopisch, zie 032631 voor VATS procedure).',5 Union All
	Select 'Endoscopische operatie van een of meerdere mediastinumtumoren, eventueel midsternaal (zie 032632 voor open procedure, zie 032631 voor VATS procedure).',1 Union All
	Select 'Decorticatie van de long, open procedure (zie 032651 voor thoracoscopisch, zie 032652 voor VATS procedure).',5 Union All
	Select 'Thoracoscopische decorticatie van de long (zie 032650 voor open procedure, zie 032652 voor VATS procedure).',1 Union All
	Select 'Decorticatie van de long met behulp van video-assisted thoracic surgery (VATS, zie 032650 voor open procedure, zie 032651 voor thoracoscopisch).',1 Union All
	Select 'Pleurodese, open procedure (zie 032654 voor thoracoscopisch, zie 032655 voor VATS procedure).',5 Union All
	Select 'Pleurodese, thoracoscopisch (zie 032653 voor open procedure, zie 032655 voor VATS procedure).',1 Union All
	Select 'Pleurodese met behulp van video-assisted thoracic surgery (VATS, zie 032653 voor open procedure, zie 032654 voor thoracoscopisch).',1 Union All
	Select 'Grote borstwandresectie in verband met een doorgegroeide maligniteit.',5 Union All
	Select 'Sluiten open thoraxverwonding.',5 Union All
	Select 'Thoracoscopische excisie aandoening thoraxwand (zie 032663 voor VATS procedure).',1 Union All
	Select 'Excisie aandoening thoraxwand met behulp van video-assisted thoracic surgery (VATS, zie 032662 voor thoracoscopisch).',1 Union All
	Select 'Video-assisted thoracic surgery (VATS).',1 Union All
	Select 'ECC-perfusie per OK sessie, uitgevoerd of standby (inclusief materiaal, inzet hartlong machine en perfusiepersoneel).',96 Union All
	Select 'Cardiothoracale operatie-unit standby.',5 Union All
	Select 'Pleurabiopsie.',75 Union All
	Select 'Diagnostische pleurapunctie.',75 Union All
	Select 'Diagnostische transthoracale longpunctie.',75 Union All
	Select 'Therapeutische pleurapunctie.',13 Union All
	Select 'Hyperthermische intraperitoneale chemotherapie (HIPEC) in combinatie met cytoreductie i.h.k.v. HIPECmaag-studie.',3 Union All
	Select 'Implantatie van een elektrode bij de derde sacrale zenuw i.h.k.v. SNM-studie.',11 Union All
	Select 'Subcutaan plaatsen pacemaker i.h.k.v. SNM-studie.',11 Union All
	Select 'Verwijderen elektrode bij de derde sacrale zenuw i.h.k.v. SNM-studie.',11 Union All
	Select 'Verwijderen subcutaan geplaatste pacemaker i.h.k.v. SNM-studie.',11 Union All
	Select 'Revisie subcutaan geplaatste pacemaker i.h.k.v. SNM-studie.',11 Union All
	Select 'Stamceltransplantatie autoloog i.h.k.v. BRCA1-studie.',13 Union All
	Select 'Post-transplantatietraject stamceltransplantatie autoloog i.h.k.v. BRCA1-studie.',48 Union All
	Select 'Toedienen groeifactoren autologe stamceltransplantatie i.h.k.v. BRCA1-studie.',13 Union All
	Select 'Harvest stamcellen dmv leukaferese tbv autologe stamceltransplantatie i.h.k.v. BRCA1-studie.',13 Union All
	Select 'Subcutaan plaatsen pulsgenerator, i.h.k.v. ONS-studie.',11 Union All
	Select 'Revisie pulsgenerator i.h.k.v. ONS-studie.',11 Union All
	Select 'Verwijderen subcutaan geplaatste pulsgenerator i.h.k.v. ONS-studie.',11 Union All
	Select 'Adjuvante hyperthermische intraperitoneale chemotherapie (HIPEC) i.h.k.v. HIPECmaag-studie (voor HIPEC in combinatie met cytoreductie i.h.k.v. HIPECmaag-studie zie 032701).',3 Union All
	Select 'Openen van het hartzakje zonder ingreep aan het hart, eventueel drainage van een pericarditis, via een thoracotomie, open procedure (zie 032904 voor percutaan en 032905 voor thoracoscopisch).',5 Union All
	Select 'Partiele pericardresectie.',5 Union All
	Select 'Subtotale pericardresectie.',5 Union All
	Select 'Rethoracotomie zonder extracorporale circulatie tijdens dezelfde opname.',5 Union All
	Select 'Pericardpunctie (zie 032900 voor open procedure en 032905 voor thoracoscopisch).',13 Union All
	Select 'Thoracoscopisch openen van het hartzakje zonder ingreep aan het hart, eventueel drainage van een pericarditis (zie 032900 voor open procedure en 032904 voor percutaan).',1 Union All
	Select 'Onderbinding ductus botalli, open procedure (via hartkatheterisatie zie 032909).',5 Union All
	Select 'Endoscopische onderbinding ductus botalli via hartkatheterisatie (zie 032908 voor open procedure).',1 Union All
	Select 'Operatie coarctatio aortae (isthmus-stenose), tot 15 jaar.',5 Union All
	Select 'Operatie coarctatio aortae (isthmus-stenose), vanaf 15 jaar.',5 Union All
	Select 'Intrathoracale correctie abnormale vaatringen.',5 Union All
	Select 'Correctie afwijkingen aan de grote longarteriën.',5 Union All
	Select 'Operatie tetralogie van Fallot of shunt-operatie bij cyanotische hartgebreken, bijvoorbeeld volgens Waterstone Blalock, Glenn of Potts.',5 Union All
	Select 'Banding arteria pulmonalis.',5 Union All
	Select 'Septectomie volgens Blalock-Hanlon of met inflow-occlusie.',5 Union All
	Select 'Open commissurotomie arteria pulmonalis of aorta.',5 Union All
	Select 'Hisbundel-katheterablatie.',12 Union All
	Select 'Katheterablatie rechter atrium.',12 Union All
	Select 'Katheterablatie accessoire bundel.',12 Union All
	Select 'Katheterablatie linker ventrikel.',12 Union All
	Select 'Katheterablatie rechter ventrikel.',12 Union All
	Select 'Katheterablatie linker atrium.',12 Union All
	Select 'Katheterablatie congenitaal vitium exclusief ductus botalli (zie 032909).',12 Union All
	Select 'Operatie wegens een perforerende hartverwonding.',5 Union All
	Select 'Verwijderen corpora aliena uit het hart (intracardiaal materiaal) met inflow-occlusie (katheters).',12 Union All
	Select 'Ballonpomp per punctie als zelfstandige ingreep.',12 Union All
	Select 'Ballonpomp per punctie als bijkomende ingreep.',12 Union All
	Select 'Ballonpomp per open procedure als zelfstandige ingreep.',5 Union All
	Select 'Ballonpomp per open procedure als bijkomende ingreep.',5 Union All
	Select 'Percutaan inbrengen hartpomp (o.a. Impella).',12 Union All
	Select 'Trachearesectie met reimplantatie linker hoofdbronchus.',1 Union All
	Select 'Trachearesectie met inhechten prothese.',1 Union All
	Select 'Operatie recidief coarctatio aortae.',5 Union All
	Select 'Operatie tricuspidaal-atresie volgens Fontan.',5 Union All
	Select 'Cardiomyectomie.',5 Union All
	Select 'Correctie van een infundibulaire en/of valvulaire pulmonalisstenose.',5 Union All
	Select 'Correctie van een valvulaire aortastenose (commissurotomie).',5 Union All
	Select 'Correctie van een subvalvulaire membraneuze aortastenose.',5 Union All
	Select 'Correctie van een musculaire subvalvulaire aortastenose.',5 Union All
	Select 'Operatie voor ziekte van Ebstein, inclusief klepvervanging.',5 Union All
	Select 'Correctie van een supravalvulaire aortastenose.',5 Union All
	Select 'Sluiten van een atrium-septum defect, type 2.',5 Union All
	Select 'Correctie van partieel abnormale longvenen.',5 Union All
	Select 'Sluiten van een eenvoudig ventrikel-septum defect.',5 Union All
	Select 'Correctie van abnormale coronairverbindingen zoals fistels of een abberante oorsprong.',5 Union All
	Select 'Correctie van een atrium-septum defect, type 1.',5 Union All
	Select 'Correctie van een cor triatrium.',5 Union All
	Select 'Correctie van totaal abnormale longvenen.',5 Union All
	Select 'Sluiten van een ventrikel-septum defect, onder andere opheffing van banding.',5 Union All
	Select 'Percutane mechanische linker hartoor sluiting.',12 Union All
	Select 'Correctie van een ruptuur van de sinus valsalvae.',5 Union All
	Select 'Correctie van een atrio-ventriculair kanaal.',5 Union All
	Select 'Sluiten van een atrium-septum defect type 2 + correctie abnormale longvenen met behulp van patch.',5 Union All
	Select 'Volledige correctie van een tetralogie van Fallot.',5 Union All
	Select 'Correctie van een double-outlet rechter ventrikel.',5 Union All
	Select 'Correctie van een aorta-insufficientie + een ventrikel-septum defect.',5 Union All
	Select 'Aanleggen van een verbinding tussen rechter ventrikel en arteria pulmonalis volgens Rastelli.',5 Union All
	Select 'Norwood procedure bij HLHS (hypoplastisch linker hartsyndroom).',5 Union All
	Select 'Grote correctieve procedures voor gecompliceerde congenitale afwijkingen.',5 Union All
	Select 'Arteriële switch operatie.',5 Union All
	Select 'Correctie truncus arteriosus.',5 Union All
	Select 'MAZE-procedure, open.',5 Union All
	Select 'Endoscopische MAZE-procedure.',1 Union All
	Select 'Hartklepplastiek, open procedure.',5 Union All
	Select 'Hartklepvervanging, open procedure.',5 Union All
	Select 'Thoracoscopische plastiek of vervanging van hartklep.',1 Union All
	Select 'TAAA (thoraco-abdominaal aorta aneurysma), open procedure.',5 Union All
	Select 'Endovasculaire TAAA (thoraco-abdominaal aorta aneurysma).',12 Union All
	Select 'Vervanging aorta descendens thoracalis, open procedure.',5 Union All
	Select 'Endovasculaire vervanging aorta descendens thoracalis.',12 Union All
	Select 'Vervanging aorta ascendens met aortaboog.',5 Union All
	Select 'Vervanging aortaboog.',5 Union All
	Select 'Vervanging aortawortel, aorta ascendens en aortaboog.',5 Union All
	Select 'Vervanging aortawortel.',5 Union All
	Select 'Vervanging aortaklep, aortawortel en aorta ascendens.',5 Union All
	Select 'Vervanging aorta ascendens zonder circulatiestilstand.',5 Union All
	Select 'Vervanging aorta ascendens met circulatiestilstand.',5 Union All
	Select 'Aortocoronaire bypass operatie met uitsluitend veneuze graft(s) en/of kunststof materiaal.',5 Union All
	Select 'Aortocoronaire bypass met 1 arteriële graft, inclusief eventuele veneuze graft(s) en/of kunststof materiaal.',5 Union All
	Select 'Aortocoronaire bypass operatie met 2 arteriële grafts, inclusief eventuele veneuze graft(s) en/of kunststof materiaal.',5 Union All
	Select 'Aortocoronaire bypass operatie met 3 of meer arteriële grafts, inclusief eventuele veneuze graft(s) en/of kunststof materiaal.',5 Union All
	Select 'Resectie aneurysma van de linkerventrikel.',5 Union All
	Select 'Sluiten van een ventrikel-septum perforatie.',5 Union All
	Select 'Sluiten van een ventrikel-septum perforatie in dezelfde zitting als een andere verrichting met extracorporale circulatie.',5 Union All
	Select 'Operatie wegens een of meerdere tumoren van het atrium, onder andere myxomen.',5 Union All
	Select 'Operatie wegens een of meerdere tumoren van de ventrikel.',5 Union All
	Select 'Embolectomie uit de arteria pulmonalis, respectievelijk correctie perifere arteria pulmonalis.',5 Union All
	Select 'Correcties aan de intrathoracale grote arteriën, o.a. aortaruptuur of aneurysma arteria anonyma, open procedure (zie 033155 voor endovasculair).',5 Union All
	Select 'Endovasculaire correcties aan de intrathoracale grote arteriën, o.a. aortaruptuur of aneurysma arteria anonyma (zie 033154 voor open procedure).',12 Union All
	Select 'Rethoracotomie met extracorporale circulatie tijdens dezelfde opname.',5 Union All
	Select 'Intensieve therapie in aansluiting op een hartoperatie met extracorporale circulatie.',48 Union All
	Select 'Katheterisatie van het rechter hart, inclusief eventuele drukmeting, O2-bepaling, angiografie (veneuze hartkatheterisatie), aansluiting van een uitwendige pacemaker.',72 Union All
	Select 'Anesthesie bij katheterisatie van het rechterhart (code 33219).',95 Union All
	Select 'Neuroprotectieve hypothermiebehandeling.',41 Union All
	Select 'Katheterisatie linker en evt. rechter hart, inclusief evt. angiografie (coronair en/of hart en/of arteria pulmonalis), drukmeting, O2-bepaling (arterieel en/of hart), aortografie, aansl.uitw.pm.',73 Union All
	Select 'PTCA eentak ter opheffing/verwijdering stenosen coronaire arterien.',12 Union All
	Select 'PTCA meertak of hoofdstam ter opheffing/verwijdering stenosen coronaire arterien.',12 Union All
	Select 'PTCA ter opheffing/verwijdering chronische occlusie coronaire arterien.',12 Union All
	Select 'PTCA met passage coronaire arterien graft.',12 Union All
	Select 'PTCA ter sluiting coronaire fistel.',12 Union All
	Select 'Stamceltherapie d.m.v. lokale infusie in het myocard.',13 Union All
	Select 'Acute PTCA ter opheffing/verwijdering stenosen coronaire.',12 Union All
	Select 'Alcoholablatie HOCM.',12 Union All
	Select 'Katheterdilatatie van hartklep.',12 Union All
	Select 'Kathetersluiting en/of dilatatie van congenitaal of verworven hartvitium.',12 Union All
	Select 'Percutane hartklep implantatie.',12 Union All
	Select 'Transkatheter hartklepimplantatie, open procedure.',5 Union All
	Select 'Percutane hartklepplastiek, exclusief katheterdilatatie van hartklep (zie 033241).',12 Union All
	Select 'Complexe transveneuze verwijdering van een implanteerbare intracardiale pacemaker met gebruik van specifieke extractietools.',12 Union All
	Select 'Conventionele transveneuze explantatie van endocardiale elektroden van AICD of pacemaker d.m.v. simpele tractie technieken (voor complexe transv. leadextractie AICD of PM zie resp. 033258 of 033257).',11 Union All
	Select 'Intracoronaire Optische Coherentie Tomografie (Intracoronaire OCT, voor FFR zie 039476, voor IVUS zie 039477).',73 Union All
	Select 'Complexe transveneuze verwijdering van endocardiale elektroden van een pacemaker met gebruik van specifieke extractietools.',11 Union All
	Select 'Complexe transveneuze verwijdering van endocardiale elektroden van een subcutane automatische defibrillator (AICD) met gebruik van specifieke extractietools.',11 Union All
	Select 'Inbrengen implanteerbare intracardiale pacemaker.',11 Union All
	Select 'Atrial pacing.',11 Union All
	Select 'Hisbundel electrocardiografie.',73 Union All
	Select 'Atrial pacing + hisbundel-electrocardiografie.',73 Union All
	Select 'Atrial pacing + therapeutische uitwendige pacemaker.',12 Union All
	Select 'Hisbundel-electrocardiografie + therapeutische uitwendige pacemaker.',11 Union All
	Select 'Atrial pacing + hisbundel-electrocardiografie + therapeutische uitwendige pacemaker.',11 Union All
	Select 'Het inbrengen van een stimulatie-elektrode en het aansluiten van een uitwendige pacemaker.',11 Union All
	Select 'Het inbrengen van een stimulatie-elektrode en het aansluiten van een subcutaan geplaatste pacemaker.',11 Union All
	Select 'Het inbrengen van twee endocardiale elektroden en het aansluiten van een subcutaan geplaatste pacemaker.',11 Union All
	Select 'Het inbrengen van twee endocardiale elektroden en één sinus coronarius elektrode, en het aansluiten en het afregelen van een biventriculaire pacemaker.',11 Union All
	Select 'Het inbrengen van twee endocardiale elektroden en het aansluiten van een subcutane automatische defibrillator, inclusief het aansluitend testen van de defibrillatiedrempel onder algehele anesthesie.',11 Union All
	Select 'Het inbrengen van een of twee endocardiale elektroden plus sinuscoronarius elektrode en aansluiten subcut.automatische defibrillator, incl. aansluitend testen van defibrillator onder alg.anesthesie.',11 Union All
	Select 'Vervanging van een pacemaker.',15 Union All
	Select 'Verwijdering van een pacemaker.',15 Union All
	Select 'Poliklinische controle op de werking van de pacemaker, inclusief het eventueel gebruik van de cardioverter.',55 Union All
	Select 'Het bevestigen van een stimulatie-elektrode op het epicard na het openen van het hartzakje en het aansluiten van een subcutaan geplaatste pacemaker.',11 Union All
	Select 'Inbrengen endocard.elektrode en bevestigen tweede elektrode op het epicard, of bevestigen beide elektroden op epicard na openen hartzakje en aansluiten subc.pacemaker.',11 Union All
	Select 'Resuscitatie, zonder intubatie, al of niet met defibrillatie (excl. met intubatie zie 033289).',25 Union All
	Select 'Resuscitatie, met intubatie, al of niet met defibrillatie (zie 033288 voor zonder intubatie).',25 Union All
	Select 'Behandeling met de cardioverter.',11 Union All
	Select 'Vervangen van subcutane automatische defibrillator (AICD) excl. elektroden, incl. aansluiten elektroden en afregelen van defibrillator.',11 Union All
	Select 'Implanteren en aansluiten device voor korte termijn circulatoire ondersteuning hart.',5 Union All
	Select 'Implantatie Ventricular Assist Device (VAD) - lange termijn ondersteuning hart.',5 Union All
	Select 'Implantatie BiVentricular Assist Device (BiVAD) - lange termijn ondersteuning hart.',5 Union All
	Select 'Implantatie van subcutane automatische defibrillator (AICD) excl. elektroden, incl. aansluiten elektroden en afregelen van defibrillator.',11 Union All
	Select 'Endocardresectie of destructie aandoening endocard m.b.v. laser of cryocoagulatie.',9 Union All
	Select 'Embolectomie van intrathoracale bloedvaten, open procedure (zie 033302 voor endovasculair).',5 Union All
	Select 'Embolectomie van intrathoracale bloedvaten, endovasculair (zie 033301 voor open procedure).',12 Union All
	Select 'Reconstructie van de aorta of haar directe zijtakken, zoals de arteria subclavia, open procedure (zie 033342 voor endovasculair).',5 Union All
	Select 'Reconstructie van de aorta of haar directe zijtakken, zoals de arteria subclavia, endovasculair (zie 033341 voor open procedure).',12 Union All
	Select 'Percutane transluminale angioplastiek niet-coronaire centrale arteriën exclusief de nierarterie (zie 033360).',12 Union All
	Select 'Percutane transluminale angioplastiek van de nierarterie.',12 Union All
	Select 'Embolectomie van bloedvaten van hoofd, hals en hersenbasis.',12 Union All
	Select 'Therapeutische punctie arterioveneuze malformatie (zie 033427 voor open procedure, zie 033428 voor endoscopisch).',13 Union All
	Select 'Craniotomie voor high-flow bypass.',5 Union All
	Select 'Craniotomie voor aanleggen distale bypass (oa STA-MCA) en/of desobstructie intracranieel vat.',5 Union All
	Select 'Operatieve behandeling intracranieel aneurysma achterste deel cirkel van Willis.',5 Union All
	Select 'Operatieve behandeling intracranieel aneurysma voorste deel cirkel van Willis, frontotemporale benadering.',5 Union All
	Select 'Craniotomie voor verwijderen arterioveneuze malformatie, diep gelegen of SM-graad 3 of hoger.',5 Union All
	Select 'Craniotomie voor verwijderen arterioveneuze malformatie, oppervlakkig cerebraal of cerebellair, SM-graad 1 of 2.',5 Union All
	Select 'Herstel arterioveneuze malformatie, open procedure (zie 033428 voor endoscopisch, zie 033420 voor therapeutische punctie, zie 033425 en 033426 voor intracraniële vaten).',5 Union All
	Select 'Endoscopisch herstel arterioveneuze malformatie (zie 033427 voor open procedure, zie 033420 voor therapeutische punctie, zie 033448 voor intracraniële vaten).',1 Union All
	Select 'Operatieve behandeling extracraniële aneurysmata.',5 Union All
	Select 'Occlusie van een ongeruptureerd intracranieel aneurysma met behulp van coils.',12 Union All
	Select 'Occlusie van een geruptureerd intracranieel aneurysma met behulp van coils.',12 Union All
	Select 'Occlusie van een intracraniële vaatmalformatie met behulp van coils of lijm.',12 Union All
	Select 'Craniovasculaire neurointerventie met behulp van ballonocclusie.',12 Union All
	Select 'Preventieve craniovasculaire neurointerventie met behulp van coil of lijm ivm de behandeling van een meningeoom.',12 Union All
	Select 'Endovasculair herstel intracraniële aneurysmata.',12 Union All
	Select 'Operatief herstel intracraniële arterioveneuze fistel d.m.v. craniotomie.',5 Union All
	Select 'Herstel intracraniële arterioveneuze fistel m.b.v. endovasculaire of radionucleaire technieken.',12 Union All
	Select 'Endovasculair herstel arterioveneuze malformatie intracraniële vaten (zie 033425 en 033426 via craniotomie, zie 033449 voor radionucleair).',12 Union All
	Select 'Radionucleaire behandeling arterioveneuze malformatie intracraniële vaten (stereotactische radiochirurgie, zie 033425 en 033426 via craniotomie, zie 033448 voor endovasculair).',14 Union All
	Select 'Reconstructie aan een slagader zoals arteria carotis door middel van transplantaat, endarteriectomie of patch.',5 Union All
	Select 'Extracraniele onderbinding van een der halsslagaders als zelfstandige ingreep bij verwondingen.',5 Union All
	Select 'Carotis onderbinding bij cerebrale vaatafwijkingen, inclusief het opzetten en op een later tijdstip verwijderen van de selverstone-klem (volledige behandeling).',5 Union All
	Select 'Excisiebiopsie van de arteria temporalis.',75 Union All
	Select 'Navigatiegeleide, endoscopische of stereotactische evacuatie intracerebraal hematoom.',1 Union All
	Select 'Percutane angioplastiek cerebropetale arteriën (zie 033672 voor niet-coronaire perifere arteriën en 033351 voor niet-coronaire centrale arteriën).',12 Union All
	Select 'Evacuatie intracerebraal hematoom, supratentorieel, niet traumatisch (zie 033498 voor infratentorieel).',5 Union All
	Select 'Evacuatie intracerebraal hematoom, infratentorieel, niet traumatisch (zie 033497 voor supratentorieel).',5 Union All
	Select 'Embolectomie van bloedvaten in de buik, open procedure (zie 033502 voor endovasculair).',5 Union All
	Select 'Embolectomie van bloedvaten in de buik, endovasculair (zie 033501 voor open procedure).',12 Union All
	Select 'Embolisatie van bekken vene(n).',12 Union All
	Select 'Klepreconstructie, diep veneus.',15 Union All
	Select 'Operaties aan intra-abdominaal gelegen grote arteriën, zonder herstel der continuïteit of ateriectomie, open procedure (zie 033521 voor endoscopisch).',5 Union All
	Select 'Endoscopische operaties aan intra-abdominaal gelegen grote arteriën, zonder herstel der continuïteit of ateriectomie (zie 033520 voor open procedure).',1 Union All
	Select 'Reconstructie aan de aorta of haar directe zijtakken zoals arteria renales en arteria iliaca, open procedure (zie 033555 voor endovasculair).',5 Union All
	Select 'Reconstructie aan de aorta of haar directe zijtakken zoals arteria renales en arteria iliaca, endovasculair (zie 033554 voor open procedure).',12 Union All
	Select 'Inbrengen van een aorta-bifurcatie prothese en reconstructie van een arteria renales, open procedure (zie 033560 voor endovasculair).',5 Union All
	Select 'Inbrengen van een aorta-bifurcatie prothese en reconstructie van een arteria renales, endovasculair (zie 033559 voor open procedure).',12 Union All
	Select 'Inbrengen van een aorta-bifurcatie prothese en reconstructie van beide arteriae renales, open procedure (zie 033562 voor endovasculair).',5 Union All
	Select 'Inbrengen van een aorta-bifurcatie prothese en reconstructie van beide arteriae renales, endovasculair (zie 033561 voor open procedure).',12 Union All
	Select 'Aanleggen arterioveneuze fistel centrale vaten.',5 Union All
	Select 'Opheffen arterioveneuze fistel centrale vaten.',5 Union All
	Select 'Mechano-chemische endoveneuze ablatiebehandeling (Clarivein), voor overige endoveneuze behandeling stamvene onderste extremiteit zie 033621.',12 Union All
	Select 'Rekanalisatie van gecomprimeerde vena cava inferior of van haar directe zijtak(ken).',5 Union All
	Select 'Rekanalisatie van geobstrueerde vena cava inferior of van haar directe zijtak(ken).',5 Union All
	Select 'Rekanalisatie van geobstrueerde vena cava inferior met rekanalisatie van haar directe zijtak(ken).',5 Union All
	Select 'Rekanalisatie van gecomprimeerde vena cava superior of van haar directe zijtak(ken).',5 Union All
	Select 'Rekanalisatie van de geobstrueerde vena cava superior of van haar directe zijtak(ken).',5 Union All
	Select 'Embolectomie van perifere bloedvaten.',5 Union All
	Select 'Venasectie.',15 Union All
	Select 'Aanleggen van locale intraveneuze anesthesie + bloedleegte of plexus blokkade van een extremiteit in combinatie met andere ingrepen in dezelfde zitting.',97 Union All
	Select 'Inbrengen van een port-a-cath systeem.',5 Union All
	Select 'Veneuze trombectomie, open procedure, exclusief bij acute diepe trombose (zie 033607).',5 Union All
	Select 'Veneuze trombectomie bij acute diepe trombose, open procedure (bij niet acute diepe trombose zie 033606).',5 Union All
	Select 'Veneuze trombectomie met plaatsen stent bij acute diepe trombose, open procedure.',5 Union All
	Select 'Intraveneuze trombolyse (IVT), exclusief bij acute diepe trombose (zie 033611).',13 Union All
	Select 'Intraveneuze trombolyse (IVT) bij acute diepe trombose (bij niet acute diepe trombose zie 033610).',48 Union All
	Select 'Intraveneuze trombolyse (IVT) met plaatsen stent bij acute diepe trombose.',12 Union All
	Select 'Operatieve behandeling vaatlijden stamvene onderste extremiteit (zie 033582 voor Clarivein en 033621 voor overige endoveneuze behandeling).',15 Union All
	Select 'Endoveneuze behandeling vaatlijden stamvene onderste extremiteit exclusief Clarivein (zie 033582).',12 Union All
	Select 'Flebectomie volgens Muller of transilluminated powered flebectomie (TIPP).',5 Union All
	Select 'Sclerocompressietherapie (exclusief echogeleide sclerocompressietherapie zie 033624).',10 Union All
	Select 'Echogeleide sclerocompressietherapie.',10 Union All
	Select 'Operaties aan extra-thoracaal gelegen grote arteriën, zonder herstel der continu‹teit arteriectomie aan de extremiteiten.',5 Union All
	Select 'Onderbinden van een groot bloedvat of lymfevat.',5 Union All
	Select 'Rekanalisatie van geobstrueerde vena femoralis of van haar directe diep veneuze zijtak(ken).',12 Union All
	Select 'Endov.reconstr.van perifere slagader d.m.v.transplant., endarteriectomie, endostent of patch (zie 033669 voor open reconstr.m.b.v. operatiemicr., zie 033670 voor open reconstr.zonder operatiemicr.).',12 Union All
	Select 'Open reconstructie van een perifere slagader d.m.v. transplantaat, endarteriectomie of patch m.b.v. operatiemicroscoop (zie 033670 voor reconstructie zonder operatiemicrosc., zie 033668 voor endov.).',4 Union All
	Select 'Open reconstructie van een perifere slagader door middel van transplantaat, endarteriectomie of patch (zie 033669 voor reconstructie m.b.v. operatiemicroscoop, zie 033668 voor endov.).',5 Union All
	Select 'Percutane angioplastiek niet-coronaire perifere arteriën (zie 033351 voor niet-coronaire centrale arteriën).',12 Union All
	Select 'Aanleggen axillo-bifemorale bypass.',5 Union All
	Select 'Aanleggen axillo-femorale bypass.',5 Union All
	Select 'Aanleggen cross-over arteria subclavia of arteria femoralis.',5 Union All
	Select 'Aanleggen femoro-popliteale bypass, open procedure (zie 033679 voor endovasculair).',5 Union All
	Select 'Endovasculaire behandeling femoro-popliteale traject (zie 033678 voor open procedure).',12 Union All
	Select 'Aanleggen femoro-tibiale bypass, open procedure (zie 033681 voor endovasculair).',5 Union All
	Select 'Endovasculaire behandeling femoro-tibiale traject (zie 033680 voor open procedure).',12 Union All
	Select 'Operatie voor perifere aneurysma(ta) of perifere arterioveneuze fistel(s), open procedure (zie 033683 voor endovasculair).',5 Union All
	Select 'Endovasculaire operatie voor perifere aneurysma(ta) of perifere arterioveneuze fistel(s) (zie 033682 voor open procedure).',12 Union All
	Select 'Reconstructie van perifere (slag)ader zonder transplantaat, open procedure (zie 033685 voor endovasculair).',5 Union All
	Select 'Reconstructie van perifere (slag)ader zonder transplantaat, endovasculair (zie 033684 voor open procedure).',12 Union All
	Select 'Aanleggen intraperitoneale shunt ten behoeve van continue ambulante peritoneale dialyse (CAPD), open procedure (zie 033687 voor laparoscopisch).',5 Union All
	Select 'Laparoscopisch aanleggen intraperitoneale shunt ten behoeve van continue ambulante peritoneale dialyse (CAPD, zie 033686 voor open procedure).',1 Union All
	Select 'Aanleggen uitwendige arterioveneuze shunt.',5 Union All
	Select 'Aanleggen inwendige arterioveneuze shunt.',5 Union All
	Select 'Aanleggen inwendige arterioveneuze shunt met bypass.',5 Union All
	Select 'Doppler met eventuele polsvolumerecording (PVR).',72 Union All
	Select 'Opheffen uitwendige arterioveneuze shunt.',5 Union All
	Select 'Opheffen inwendige arterioveneuze shunt.',5 Union All
	Select 'Reconstructie arteriële of veneuze pool bij in- of uitwendige arterioveneuze shunt exclusief revisie inwendige arterioveneuze shunt (zie 033700 en 033701).',5 Union All
	Select 'Inbrengen centrale veneuze katheter of een navelkatheter bij pasgeborenen voor voeding of drukmeting.',12 Union All
	Select 'Revisie inwendige arterioveneuze shunt, endovasculair (zie 033701 voor open procedure).',12 Union All
	Select 'Revisie inwendige arterioveneuze shunt, open procedure (zie 033700 voor endovasculair).',5 Union All
	Select 'Revisie intraperitoneale shunt ten behoeve van continue ambulante peritoneale dialyse (CAPD), open procedure (zie 033703 voor laparoscopisch).',5 Union All
	Select 'Revisie intraperitoneale shunt ten behoeve van continue ambulante peritoneale dialyse, laparoscopisch (CAPD, zie 033702 voor open procedure).',1 Union All
	Select 'Uitgebreide verwijdering van para-aortale lymfklieren, open procedure (zie 033723 voor laparoscopisch).',5 Union All
	Select 'Stageringslymfadenectomie van het kleine bekken, open procedure (zie 033724 voor laparoscopisch niet retroperitoneaal, zie 033725 voor laparoscopisch retroperitoneaal).',5 Union All
	Select 'Laparoscopische uitgebreide verwijdering van para-aortale lymfklieren (zie 033721 voor open procedure).',1 Union All
	Select 'Laparoscopische stageringslymfadenectomie van het kleine bekken (zie 033722 voor open procedure, zie 033725 voor laparoscopisch retroperitoneaal).',1 Union All
	Select 'Laparoscopische retroperitoneale stageringslymfadenectomie van het kleine bekken (zie 033722 voor open procedure, zie 033724 voor laparoscopisch niet retroperitoneaal).',1 Union All
	Select 'Therapeutische verwijdering van alle lymfklieren tussen onderkaak en clavicula incl. verwijdering van de musculus sternocleidomastoideus en vena jugularis.',5 Union All
	Select 'Regionale lymfklierextirpatie, open procedure (zie 033742 voor endoscopisch).',5 Union All
	Select 'Endoscopische regionale lymfklierextirpatie (zie 033741 voor open procedure).',1 Union All
	Select 'Een of meerdere lymfatico-veneuze anastomosen van een volledige extremiteit.',4 Union All
	Select 'Diagnostische lymfklierextirpatie, supraclaviculair of infraclaviculair (excl. sentinel node procedure zie 033781 voor open procedure en 033782 voor laparoscopisch).',5 Union All
	Select 'Verwijderen poortwachterklier, open procedure (sentinel node procedure, zie 033782 voor laparoscopisch).',5 Union All
	Select 'Laparoscopisch verwijderen poortwachterklier (sentinel node procedure, zie 033781 voor open procedure).',1 Union All
	Select 'Miltoperatie, waaronder extirpatie, open procedure (zie 033821 voor laparoscopisch).',5 Union All
	Select 'Laparoscopische miltoperatie, waaronder extirpatie (zie 033820 voor open procedure).',1 Union All
	Select 'Stageringslaparotomie bijvoorbeeld maligne lymfomen inclusief miltextirpatie en eventuele fixatie van de ovaria (zie 033824 voor stageringslaparoscopie).',5 Union All
	Select 'Miltextirpatie als onderdeel van een laparotomie om andere redenen, open procedure (zie 033825 voor laparoscopisch).',5 Union All
	Select 'Stageringslaparoscopie bijvoorbeeld maligne lymfomen inclusief miltextirpatie en eventuele fixatie van de ovaria (zie 033822 voor stageringslaparotomie).',1 Union All
	Select 'Laparoscopische miltextirpatie als onderdeel van een laparoscopie om andere redenen (zie 033823 voor open procedure).',1 Union All
	Select 'Locale excisie mammatumor met vriescoupe of onder rontgencontrole onder algehele anesthesie.',5 Union All
	Select 'Conusexcisie van de mamma.',5 Union All
	Select 'Therapeutische ductoscopie.',1 Union All
	Select 'Diagnostische ductoscopie, inclusief eventueel biopt(en) en/of eventuele excisie(s).',1 Union All
	Select '(Subcutane) mastectomie met of zonder huidreductie, zonder okseltoilet.',5 Union All
	Select 'Gynaecomastie-extirpatie.',5 Union All
	Select 'Mamma amputatie met verwijderen van oksellymfklieren.',5 Union All
	Select 'Mamma amputatie met uitgebreide verwijdering van axillaire infraclaviculaire en retrosternale lymfklieren.',5 Union All
	Select 'Plastische correctie deformiteit van mamma (excl. plastische correctie deformiteit van mamma d.m.v. Autologe Vet Transplantatie na eerdere mammareconstructie of mammasparende operatie, zie 033974).',5 Union All
	Select 'Chirurgische tepel(hof) reconstructie.',5 Union All
	Select 'Mammareconstructie d.m.v. BRAVA-AFT (Autologous Fat Transfer) systeem i.h.k.v. BREAST-studie.',5 Union All
	Select 'Plastische correctie deformiteit van mamma d.m.v. Autologe Vet Transplantatie na eerdere mammareconstructie of mammasparende operatie.',5 Union All
	Select 'Operatieve verwijdering van een of meerdere geretineerde tandelementen.',5 Union All
	Select 'Plastiek Frenulum linguae door middel van opschuif- of Z-plastiek.',5 Union All
	Select 'Extirpatie van een gedeelte van de tong.',5 Union All
	Select 'Primaire behandeling van gehemeltespleten in het voorste gedeelte van het palatum.',5 Union All
	Select 'Primaire behandeling van gehemeltespleten in het achterste gedeelte van het palatum.',5 Union All
	Select 'Sluiten palatumfistel.',5 Union All
	Select 'Aanspannen lip d.m.v. wig excisie.',5 Union All
	Select 'Uvulopalatofaryngoplastiek (UPPP).',5 Union All
	Select 'Laser-geassisteerde uvulopalatoplastiek (LAUP).',9 Union All
	Select 'Uvulopalateale flap (UPF).',5 Union All
	Select 'Radiofrequente thermotherapie van de tongbasis (RFTB).',10 Union All
	Select 'Hyoïdthyroïdpexie (HTP, hyoïdsuspensie).',5 Union All
	Select 'Extirpatie tumor weke delen van de mond.',5 Union All
	Select 'Verwijdering van een of meerdere speekselstenen, per klier en/of ductus.',5 Union All
	Select 'Partiele extirpatie van het opppervlakkig deel van de glandula parotis.',5 Union All
	Select 'Totale extirpatie van het oppervlakkig deel van de glandula parotis.',5 Union All
	Select 'Extirpatie van de glandula submandibularis of de glandula sublingualis.',5 Union All
	Select 'Totale parotidectomie.',5 Union All
	Select 'Operatie van een speekselfistel.',5 Union All
	Select 'Operatieve behandeling oesophagusstenose, open procedure (zie 034303 voor endoscopisch).',5 Union All
	Select 'Endoscopische operatie cardiospasmus.',1 Union All
	Select 'Endoscopische operatieve behandeling oesophagusstenose (zie 034301 voor open procedure).',1 Union All
	Select 'Endoscopische oesophagotomie (zie 034309 voor open procedure).',1 Union All
	Select 'Oesophagotomie, open procedure (zie 034308 voor endoscopisch).',5 Union All
	Select 'Operatieve behandeling oesophagus-divertikel volgens Zenker, open procedure (zie 034311 voor endoscopisch).',5 Union All
	Select 'Endoscopische operatieve behandeling oesophagus-divertikel volgens Zenker (zie 034310 voor open procedure).',1 Union All
	Select 'Behandeling van een oesophagus-divertikel met laserchirurgie.',9 Union All
	Select 'Oesofago-oesofagostomie.',5 Union All
	Select 'Endoscopische radiofrequente ablatie (RF-ablatie) aandoening oesophagus (voor endoscopische mucosectomie zie 034640).',2 Union All
	Select 'Resectie van oesophaguscarcinoom.',1 Union All
	Select 'Oesophagusresectie, open procedure (zie 034324 voor thoracoscopisch).',5 Union All
	Select 'Thoracoscopische oesophagusresectie (zie 034323 voor open procedure).',1 Union All
	Select 'Oesophagusresectie met colonimplantatie (met jejunuminterpositie zie 034398, met gastric pull-up zie 034399).',5 Union All
	Select 'Operatieve behandeling oesofagusatresie excl. long gap oesofagusatresie (zie 035354), open procedure (zie 034355 voor thoracoscopisch).',5 Union All
	Select 'Thoracoscopische operatieve behandeling oesofagusatresie excl. long gap oesofagusatresie (zie 035353) (zie 034353 voor open procedure).',1 Union All
	Select 'Operatieve behandeling oesophagusperforatie.',5 Union All
	Select 'Implantatie van een elektrode in de lagere oesofageale sphincter (LES).',11 Union All
	Select 'Verwijderen van een elektrode in de lagere oesofageale sphincter (LES).',11 Union All
	Select 'Echo-oesofagoscopie, inclusief eventuele biopten.',123 Union All
	Select 'Echo-bronchoscopie (EBUS), inclusief eventuele biopten.',123 Union All
	Select 'Endo-echografie ter beoordeling bovenbuikorganen, inclusief eventuele biopten.',123 Union All
	Select 'Endo-echografie ter beoordeling van tumoren in het distale colon, inclusief eventuele biopten.',123 Union All
	Select 'Oesofagusfunctieonderzoek, inclusief eventuele 24-uurs metingen (manometrie, impedantiemetrie en/of pH-meting).',75 Union All
	Select 'Behandeling Zenker-divertikel.',1 Union All
	Select 'Therapeutische endoscopie van oesofagus, maag of duodenum.',1 Union All
	Select 'Therapeutische endo-echografie van de pancreas (exclusief ETN en ETD, zie 035418 en 035419).',1 Union All
	Select 'Oesophagusresectie met jejunuminterpositie (met colonimplantatie zie 034342, met gastric pull-up zie 034399).',5 Union All
	Select 'Oesophagusresectie met gastric pull-up (met jejunuminterpositie zie 034398, met colonimplantatie zie 034342).',5 Union All
	Select 'Endoscopisch inbrengen maagballon.',1 Union All
	Select 'Gastrotomie (bijvoorbeeld voor het verwijderen van een of meerdere poliepen of corpora aliena), open procedure (zie 034402 voor endoscopisch).',5 Union All
	Select 'Endoscopische gastrotomie (bijvoorbeeld voor het verwijderen van een of meerdere poliepen of corpora aliena) (zie 034401 voor open procedure).',1 Union All
	Select 'Ramstedt operatie voor pylorusstenose, open procedure (zie 034411 voor endoscopisch).',5 Union All
	Select 'Endoscopische ramstedt operatie voor pylorusstenose (zie 034410 voor open procedure).',1 Union All
	Select 'Stamvagotomie plus antrumresectie.',5 Union All
	Select 'Maagresectie.',5 Union All
	Select 'Maagresectie in combinatie met cholecystectomie.',5 Union All
	Select 'R2-resectie van de maag.',5 Union All
	Select 'Reconstructieve operatie aan de resectiemaag volgens bijvoorbeeld Henley of Roux-Y.',5 Union All
	Select 'Totale maagresectie, thoracaal of abdominaal.',5 Union All
	Select 'Volumereductieoperatie maag, open procedure (zie 034451 voor endoscopisch).',5 Union All
	Select 'Endoscopische volumereductieoperatie maag (zie 034450 voor open procedure).',1 Union All
	Select 'Laparoscopische gastric bypass operatie (oa. biliopancreatische deviatie, duodenale switch).',1 Union All
	Select 'Laparoscopisch inbrengen maagband.',1 Union All
	Select 'Laparoscopisch verwijderen maagbandje.',1 Union All
	Select 'Fundoplicatie, open procedure (zie 034471 voor laparoscopisch).',5 Union All
	Select 'Laparoscopische fundoplicatie (zie 034470 voor open procedure).',1 Union All
	Select '13C octaanzuur ademtest (maagledigingstest).',73 Union All
	Select '13C ureum ademtest (Helicobacter pylori).',73 Union All
	Select 'Waterstofademtest (glucose, fructose of lactose).',73 Union All
	Select 'Orale maagbiopsie met capsule onder beeldvormende techniek.',75 Union All
	Select 'Gastrostomie, open procedure (zie 034503 voor endoscopisch).',5 Union All
	Select 'Aanleggen gastrostomie als onderdeel van een laparotomie, open procedure (zie 034504 voor endoscopisch).',5 Union All
	Select 'Endoscopische gastrostomie (zie 034501 voor open procedure).',1 Union All
	Select 'Endoscopisch aanleggen gastrostomie als onderdeel van een laparoscopie (zie 034502 voor open procedure).',1 Union All
	Select 'Operatief sluiten van gastroschisis (voor sluiten omfalocele zie 034535).',5 Union All
	Select 'Gastro-enterostomie, open procedure (zie 034533 voor endoscopisch).',5 Union All
	Select 'Endoscopische gastro-enterostomie (zie 034531 voor open procedure).',1 Union All
	Select 'Endoscopische stamvagotomie plus gastro-enterostomie als zelfstandige verrichting.',1 Union All
	Select 'Operatief sluiten van omfalocele (voor sluiten gastroschisis zie 034530).',5 Union All
	Select 'Endoscopisch opheffen van een gastro-enterostomie, als zelfstandige verrichting.',1 Union All
	Select 'Operatie bij maagdarmcolonfistel, open procedure.',5 Union All
	Select 'Overhechting maagperforatie, open procedure (zie 034566 voor endoscopisch).',5 Union All
	Select 'Endoscopische overhechting maagperforatie (zie 034564 voor open procedure).',1 Union All
	Select 'Enterotomie bijvoorbeeld voor het verwijderen van een of meerdere poliepen of corpora aliena, open procedure (zie 034603 voor endoscopisch).',5 Union All
	Select 'Endoscopische enterotomie bijvoorbeeld voor het verwijderen van een of meerdere poliepen of corpora aliena (zie 034602 voor open procedure).',1 Union All
	Select 'Resectie meckels divertikel, inclusief eventuele appendectomie, open procedure (zie 034613 voor endoscopisch).',5 Union All
	Select 'Endoscopische resectie meckels divertikel, inclusief eventuele appendectomie (zie 034612 voor open procedure).',1 Union All
	Select 'Diagnostische endoscopie van oesofagus, maag en/of duodenum met behulp van flexibele endoscoop, eventueel inclusief biopten of antroduodenale manometrie.',123 Union All
	Select 'Endoscopisch inbrengen endoluminale sleeve.',1 Union All
	Select 'Beklemde breuk + darmresectie.',5 Union All
	Select 'Dunne darmresectie, open procedure (zie 034639 voor endoscopisch).',5 Union All
	Select 'Endoscopische dunne darmresectie (zie 034638 voor open procedure).',1 Union All
	Select 'Endoscopische mucosectomie.',1 Union All
	Select 'Rectale zuigbiopsie.',75 Union All
	Select 'Orale dunnedarm biopsie met capsule onder beeldvormende techniek.',75 Union All
	Select 'Diagnostische endoscopie van het colon met behulp van flexibele endoscoop, eventueel inclusief biopten, poliepectomie of colonmanometrie.',123 Union All
	Select 'Capsule endoscopie.',72 Union All
	Select 'Diagnostische endoscopie alleen van het sigmoïd met behulp van een flexibele endoscoop, inclusief eventuele biopten en poliepectomie.',123 Union All
	Select 'Rectoscopie of proctoscopie.',123 Union All
	Select 'Endoscopische retrograde cholangiopancreaticografie (ERCP).',1 Union All
	Select 'Enteroscopie (b.v. enkel- of dubbelballon) met behulp van een flexibele endoscoop inclusief eventuele biopten en poliepectomie.',1 Union All
	Select 'Endoscopisch plaatsen stent in tractus digestivus (proximaal of distaal).',1 Union All
	Select 'Interventie-coloscopie (behandeling bloeding, dilatatie) niet zijnde stentplaatsing (zie 034696).',1 Union All
	Select 'Adjuvante hyperthermische intraperitoneale chemotherapie (HIPEC, voor HIPEC in combinatie met cytoreductie zie 039958, voor HIPEC i.h.k.v. HIPECmaag-studie zie 032714).',3 Union All
	Select 'Totale colectomie plus rectumamputatie, open procedure (zie 034734 voor endoscopisch).',5 Union All
	Select 'Totale colectomie met ileorectale anastomose, open procedure (zie 034735 voor endoscopisch).',5 Union All
	Select 'Endoscopische totale colectomie plus rectumamputatie (zie 034732 voor open procedure).',1 Union All
	Select 'Endoscopische totale colectomie met ileorectale anastomose (zie 034733 voor open procedure).',1 Union All
	Select 'Colonresectie, al dan niet met coecostomie, open procedure (zie 034739 voor endoscopisch).',5 Union All
	Select 'Endoscopische colonresectie, al dan niet met coecostomie (zie 034738 voor open procedure).',1 Union All
	Select 'Aanleggen van een anus preaternaturalis na laparotomie bijvoorbeeld bij ileus of peritonitis, open procedure (zie 034753 voor endoscopisch).',5 Union All
	Select 'Endoscopisch aanleggen van een anus preaternaturalis na laparotomie bijvoorbeeld bij ileus of peritonitis (zie 034752 voor open procedure).',1 Union All
	Select 'Enterostomie als onderdeel van een laparotomie of om andere redenen, open procedure (zie 034793 voor endoscopisch).',5 Union All
	Select 'Endoscopische enterostomie als onderdeel van een laparoscopie of om andere redenen (zie 034792 voor open procedure).',1 Union All
	Select 'Ileostomie, open procedure (zie 034797 voor endoscopisch).',5 Union All
	Select 'Endoscopische ileostomie (zie 034796 voor open procedure).',1 Union All
	Select 'Enterostomie, open procedure (zie 034799 voor endoscopisch).',5 Union All
	Select 'Endoscopische enterostomie (zie 034798 voor open procedure).',1 Union All
	Select 'Entero-anastomose operatie, open procedure (zie 034809 voor endoscopisch).',5 Union All
	Select 'Endoscopische entero-anastomose operatie (zie 034808 voor open procedure).',1 Union All
	Select 'Ileorectale anastomose, open procedure (zie 034811 voor endoscopisch).',5 Union All
	Select 'Endoscopische ileorectale anastomose (zie 034810 voor open procedure).',1 Union All
	Select 'Duodeno-duodenostomie, open procedure (zie 034813 voor laparoscopisch).',5 Union All
	Select 'Laparoscopische duodeno-duodenostomie (zie 034812 voor open procedure).',1 Union All
	Select 'Overhechten darmperforatie, open procedure (zie 034835 voor laparoscopisch).',5 Union All
	Select 'Reconstructie anus praeternaturalis van het colon, intraperitoneaal.',5 Union All
	Select 'Reconstructie anus praeternaturalis van het colon, extraperitoneaal.',5 Union All
	Select 'Laparoscopisch overhechten darmperforatie (zie 034832 voor open procedure).',1 Union All
	Select 'Opheffen van anus praeternaturalis door middel van colonresectie, waarna buikwandplastiek.',5 Union All
	Select 'Sluiten van een anus praeternaturalis, extraperitoneaal.',5 Union All
	Select 'Opheffen van een entero- of ileostomie, open procedure (zie 034854 voor laparoscopisch).',5 Union All
	Select 'Laparoscopisch opheffen van een entero- of ileostomie (zie 034853 voor open procedure).',1 Union All
	Select 'Klieven laddse banden en darmen in non-rotatie stand brengen, open procedure (zie 034879 voor laparoscopisch).',5 Union All
	Select 'Laparoscopisch klieven laddse banden en darmen in non-rotatie stand brengen (zie 034878 voor open procedure).',1 Union All
	Select 'Ileusoperatie zonder resectie of anastomose, open procedure (zie 034881 voor endoscopisch).',5 Union All
	Select 'Endoscopische ileusoperatie zonder resectie of anastomose (zie 034880 voor open procedure).',1 Union All
	Select 'Resectie darmweefsel levende donor.',5 Union All
	Select 'Operatie van appendiculair abces, open procedure (zie 034901 voor endoscopisch).',5 Union All
	Select 'Endoscopische operatie van appendiculair abces, zie 034900 voor open procedure).',1 Union All
	Select 'Appendectomie, open procedure (zie 034911 voor laparoscopisch).',5 Union All
	Select 'Endoscopische appendectomie (zie 034910 voor open procedure).',1 Union All
	Select 'Electro-coagulatie of cryochirurgische behandeling rectumcarcinoom, de eerste behandeling.',10 Union All
	Select 'Electro-coagulatie of cryochirurgische behandeling rectumcarcinoom, iedere volgende behandeling binnen een jaar.',10 Union All
	Select 'Verwijderen aandoening m.b.v. transanale endoscopische microchirurgie (TEM, zie 037332 voor opheffen recto-vaginale fistel m.b.v. TEM).',1 Union All
	Select 'Operatie rectumprolaps bij volwassenen, resectie anaal.',5 Union All
	Select 'Operatie rectumprolaps bij volwassenen, abdominaal.',5 Union All
	Select 'Operatie rectumprolaps bij kinderen.',5 Union All
	Select 'Anterior resectie van het rectosigmoid, al dan niet met coecostomie of tijdelijke anus praeternaturalis, open procedure (zie 035025 voor endoscopisch).',5 Union All
	Select 'Endoscopische anterior resectie van het rectosigmoid, al dan niet met coecostomie of tijdelijke anus praeternaturalis (zie 035024 voor open procedure).',1 Union All
	Select 'Rectum-extirpatie, inclusief aanleggen anus praeternaturalis, open procedure (zie 035027 voor laparoscopisch).',5 Union All
	Select 'Laparoscopische rectum-extirpatie, inclusief aanleggen anus praeternaturalis (zie 035026 voor open procedure).',1 Union All
	Select 'Implantatie artificial bowel sphincter.',5 Union All
	Select 'Vervangen (deel van) artificial bowel sphincter.',5 Union All
	Select 'Revisie (deel van) artificial bowel sphincter.',5 Union All
	Select 'Verwijderen (deel van) artificial bowel sphincter.',5 Union All
	Select 'Excisie van een fissura ani.',5 Union All
	Select 'Operatie van een fistula ani.',5 Union All
	Select 'Operatie recidief fistula ani.',5 Union All
	Select 'Post anal repair.',5 Union All
	Select 'Niet operatieve ambulante behandeling van haemorrhoïden door middel van scleroseren, bandligatie, infraroodcoagulatie of cryochirurgie. De eerste behandeling.',10 Union All
	Select 'Niet operatieve ambulante behandeling van haemorrhoïden door middel van scleroseren, bandligatie, infraroodcoagulatie of cryochirurgie. Iedere volgende behandeling binnen een jaar.',10 Union All
	Select 'Operatie van haemorrhoïden (niet het scleroseren).',5 Union All
	Select 'Behandeling haemorrhoïden door middel van manuele dilatatie onder narcose.',46 Union All
	Select 'Posterieure sagittale anorectaal plastiek (PSARP), open procedure (zie 035141 voor ASARP, zie 035142 voor LARP).',5 Union All
	Select 'Anterieure sagittale anorectaal plastiek (ASARP), open procedure (zie 035140 voor PSARP, zie 035142 voor LARP).',5 Union All
	Select 'Laparoscopische anorectale pull-through plastiek (LARP, zie 035140 voor PSARP, zie 035141 voor ASARP).',1 Union All
	Select 'Operatieve behandeling atresia ani in een of meerdere zittingen.',5 Union All
	Select 'Operatie rectumprolaps bij volwassenen, sphincterplastiek, open procedure (zie 035154 voor endoscopisch).',5 Union All
	Select 'Secundaire sphincter reconstructie in verband met fecale incontinentie, open procedure.',5 Union All
	Select 'Endoscopische operatie rectumprolaps bij volwassenen, sphincterplastiek (zie 035152 voor open procedure).',1 Union All
	Select 'Rekking sluitspier van de endeldarm.',46 Union All
	Select 'Endoscopische leveroperatie wegens een of meerdere abcessen, cysten of een ruptuur (zie 035212 voor open procedure).',1 Union All
	Select 'Open leveroperatie wegens een of meerdere abcessen, cysten of een ruptuur (zie 035211 voor endoscopisch).',5 Union All
	Select 'Kwabresectie lever, open procedure (zie 035222 voor laparoscopisch).',5 Union All
	Select 'Laparoscopische kwabresectie lever (zie 035221 voor open procedure).',1 Union All
	Select 'Resectie leverweefsel levende donor.',5 Union All
	Select 'Radiofrequentie ablatie (RF-ablatie) aandoening lever (zie 039690 voor tumorablatie algemeen).',10 Union All
	Select 'Cryo-ablatie aandoening lever (zie 039690 voor tumorablatie algemeen).',10 Union All
	Select 'Leverbiopsie.',75 Union All
	Select 'Heropenen van de galwegen, eventueel papilla Vateri-plastiek, open procedure.',5 Union All
	Select 'Primair openen van de galwegen met bilidigestieve anastomose al of niet met cholecystectomie, open procedure.',5 Union All
	Select 'Heropenen van de galwegen met bilidigestieve anastomose.',5 Union All
	Select 'Hepatico-jejunostomie.',5 Union All
	Select 'Resectie choledochuscyste en herstel van galwegen.',5 Union All
	Select 'Galblaas drainage, open procedure (zie 035342 voor endoscopisch).',5 Union All
	Select 'Extracorporele Shock Wave Lithotrypsie (ESWL) voor galwegstenen (zie 038858 voor ESWT bot- en spierstelsel).',64 Union All
	Select 'Endoscopische galblaas drainage (zie 035340 voor open procedure).',1 Union All
	Select 'Cholecystectomie.',5 Union All
	Select 'Cholecystectomie inclusief choledochotomie, open procedure (zie 035356 voor endoscopisch).',5 Union All
	Select 'Cholecystectomie plus appendectomie, open procedure (zie 035357 voor endoscopisch).',5 Union All
	Select 'Thoracoscopische operatieve behandeling long gap oesofagusatresie (zie 035354 voor open procedure).',1 Union All
	Select 'Operatieve behandeling long gap oesofagusatresie, open procedure (zie 035353 voor thoracoscopisch).',5 Union All
	Select 'Cholecystectomie per laparoscoop, inclusief eventueel peroperatief te verrichten cholangiogram.',1 Union All
	Select 'Endoscopische cholecystectomie inclusief choledochotomie (zie 035351 voor open procedure).',1 Union All
	Select 'Endoscopische cholecystectomie plus appendectomie (zie 035352 voor open procedure).',1 Union All
	Select 'Endoscopische transluminale necrosectomie (ETN) pancreas (zie 035419 voor ETD pancreas).',1 Union All
	Select 'Endoscopische transluminale drainage (ETD) pancreas (zie 035418 voor ETN pancreas).',1 Union All
	Select 'Pancreas extirpatie, open procedure (zie 035422 voor laparoscopisch).',5 Union All
	Select 'Laparoscopische pancreas extirpatie (zie 035421 voor open procedure).',1 Union All
	Select 'Pancreatico-duodenectomie volgens Whipple.',5 Union All
	Select 'Pancreas operatie, open procedure (zie 035497 voor laparoscopisch).',5 Union All
	Select 'Laparoscopische pancreas operatie (zie 035496 voor open procedure).',1 Union All
	Select 'Diagnostische ascitespunctie.',75 Union All
	Select 'Therapeutische ascitespunctie.',13 Union All
	Select 'Subcutaan inbrengen van anticonceptiestaafje met behulp van applicator.',5 Union All
	Select 'Proeflaparotomie.',5 Union All
	Select 'Plaatsen van implanteerbare insulinepomp (CIPII) voor intraperitoneale toediening van insuline.',5 Union All
	Select 'Verwijderen of revisie van implanteerbare insulinepomp (CIPII) voor intraperitoneale toediening van insuline.',5 Union All
	Select 'Vervangen van implanteerbare insulinepomp (CIPII) voor intraperitoneale toediening van insuline.',5 Union All
	Select 'Bijvullen van implanteerbare insulinepomp (CIPII) voor intraperitoneale toediening van insuline.',29 Union All
	Select 'Excisie vet en operatieve correctie van huiddeformiteit van de onderbuik, met of zonder behandeling van een navelbreuk, de zogenaamde vetschortoperatie.',5 Union All
	Select 'Therapeutische laparoscopie, bv. ter opheffing van adhesiolysis, excisie intra-abdominale cysten, endometriose (excl. bij vruchtbaarheidsproblematiek zie 035581).',1 Union All
	Select 'Therapeutische laparoscopie bij vruchtbaarheidsproblematiek.',1 Union All
	Select 'Diagnostische laparoscopie, inclusief eventuele proefexcisie(s) (excl. bij vruchtbaarheidsproblematiek, zie 035583).',1 Union All
	Select 'Diagnostische laparoscopie bij vruchtbaarheidsproblematiek (inclusief tubatesten).',1 Union All
	Select 'Laparoscopische behandeling endometriosis, cyste punctie.',1 Union All
	Select 'Laparoscopische of laparotomische behandeling endometriosis, uitgebreide chirurgie in een stadium IV-V.',6 Union All
	Select 'Laparoscopische of laparotomische behandeling endometriosis, cysteverwijdering.',6 Union All
	Select 'Aanleggen en periodiek bijvullen pneumoperitoneum.',1 Union All
	Select 'Hernia inguinalis, open procedure (zie 035710 voor laparoscopisch).',5 Union All
	Select 'Hernia incarcerata, zonder darmresectie, open procedure (zie 035712 voor endoscopisch).',5 Union All
	Select 'Recidief hernia inguinalis, open procedure (zie 035713 voor endoscopisch).',5 Union All
	Select 'Endoscopische operatie hernia inguinalis (zie 035700 voor open procedure.',1 Union All
	Select 'Endoscopische operatie hernia incarcerata, zonder darmresectie (zie 035702 voor open procedure).',1 Union All
	Select 'Endoscopische operatie recidief hernia inguinalis (zie 035703 voor open procedure).',1 Union All
	Select 'Hernia femoralis, open procedure (zie 035721 voor endoscopisch).',5 Union All
	Select 'Endoscopische operatie hernia femoralis (zie 035720 voor open procedure).',1 Union All
	Select 'Hernia cicatricialis, open procedure (zie 035741 voor laparoscopisch).',5 Union All
	Select 'Laparoscopische operatie hernia cicatricialis (zie 035740 voor open procedure).',1 Union All
	Select 'Hernia epigastrica, open procedure (zie 035751 voor endoscopisch).',5 Union All
	Select 'Endoscopische operatie hernia epigastrica (zie 035750 voor open procedure).',1 Union All
	Select 'Hernia umbilicalis bij personen vanaf 12 jaar, open procedure (zie 035762 voor endoscopisch).',5 Union All
	Select 'Hernia umbilicalis bij personen tot 12 jaar, open procedure (zie 035763 voor endoscopisch).',5 Union All
	Select 'Endoscopische operatie hernia umbilicalis bij personen vanaf 12 jaar (zie 035760 voor open procedure).',1 Union All
	Select 'Endoscopische operatie hernia umbilicalis bij personen tot 12 jaar (zie 035761 voor open procedure).',1 Union All
	Select 'Hernia diaphragmatica, abdominaal, open procedure (zie 035774 voor endoscopisch, zie 034470 voor open fundoplicatie).',5
) d


insert into dbo.test_treatment_subcategories
(
	category_id,
	[name],
	treatment_category_id,
	[rank]
)
select
	category_id,
	[name],
	treatment_category_id,
	[rank]
from (
	Select 1 category_id, 1 [rank],1 treatment_category_id,'Endo-/laparoscopische ingreep' [name] Union all
	Select 2, 1,1,'Endoscopische radiofrequentietherapie' Union all
	Select 3, 1,1,'Hyperthermische Intraperitoneale Chemotherapie (HIPEC)' Union all
	Select 4, 1,1,'Microchirurgische ingreep' Union all
	Select 5, 1,1,'Open chirurgische ingreep' Union all
	Select 6, 1,1,'Open of endoscopische ingreep' Union all
	Select 7, 1,1,'Transurethrale ingreep' Union all
	Select 8, 1,1,'Transvaginale ingreep' Union all
	Select 9, 2,2,'(Invasieve) Laserbehandeling' Union all
	Select 10, 2,2,'Coagulatie-, ablatie-, abrasie- of sclerotherapie' Union all
	Select 11, 2,2,'Elektrische stimulatietherapie' Union all
	Select 12, 2,2,'Endovasculaire procedure' Union all
	Select 13, 2,2,'Injectie, punctie of katheterisatie' Union all
	Select 14, 2,2,'Invasieve radiologische/-nucleaire therapie' Union all
	Select 15, 2,2,'Lichte chirurgische ingreep' Union all
	Select 16, 2,2,'Sondage procedure of plaatsen sonde (niet endoscopisch)' Union all
	Select 17, 3,3,'Add-on geneesmiddelen' Union all
	Select 18, 3,3,'Anticonceptie' Union all
	Select 19, 3,3,'Beademing' Union all
	Select 20, 3,3,'Begeleiding bij complexe thuisbehandeling' Union all
	Select 21, 3,3,'Begeleiding bij oncologische behandeling' Union all
	Select 22, 3,3,'Begeleiding bij transplantatiezorg' Union all
	Select 23, 3,3,'Behandeling met hyperbare zuurstof' Union all
	Select 24, 3,3,'Bloedproducten' Union all
	Select 25, 3,3,'Cardiologische resucitatie' Union all
	Select 26, 3,3,'Chemotherapie' Union all
	Select 27, 3,3,'Compressietherapie' Union all
	Select 28, 3,3,'Conservatieve fractuur, constusie, luxatie of bandlaesie behandeling' Union all
	Select 29, 3,3,'Controle van medische hulpmiddelen en thuisapparatuur' Union all
	Select 30, 3,3,'Dagverpleging' Union all
	Select 31, 3,3,'Dermatologische laserbehandeling' Union all
	Select 32, 3,3,'Dialyse' Union all
	Select 33, 3,3,'Dieetadvisering' Union all
	Select 34, 3,3,'Druktherapie' Union all
	Select 35, 3,3,'Exsanguinatie' Union all
	Select 36, 3,3,'Fototherapie (lichttherapie, fotodynamisch, fotochemisch)' Union all
	Select 37, 3,3,'Gipsnegatief' Union all
	Select 38, 3,3,'Gipsredressie' Union all
	Select 39, 3,3,'Infuusbeleid pasgeborene' Union all
	Select 40, 3,3,'Inhalatietherapie' Union all
	Select 41, 3,3,'Intensive Care' Union all
	Select 42, 3,3,'Kinderoncologische therapie' Union all
	Select 43, 3,3,'Klinische opname' Union all
	Select 44, 3,3,'Kunstverlossing' Union all
	Select 45, 3,3,'Longastmacentrum therapie' Union all
	Select 46, 3,3,'Manuele dilatatie' Union all
	Select 47, 3,3,'Manuele therapeutische handeling' Union all
	Select 48, 3,3,'Medicamenteuze therapie (aspecifiek voor geneesmiddel)' Union all
	Select 49, 3,3,'Neustamponade' Union all
	Select 50, 3,3,'Opvang pasgeborene' Union all
	Select 51, 3,3,'Paramedische behandeling' Union all
	Select 52, 3,3,'Perifeer infuus inbrengen' Union all
	Select 53, 3,3,'Plasma-, foto- of aferese' Union all
	Select 54, 3,3,'Poliklinische bevalling' Union all
	Select 55, 3,3,'Poliklinische controle pacemaker' Union all
	Select 56, 3,3,'Protonentherapie' Union all
	Select 57, 3,3,'Radionucleaire therapie' Union all
	Select 58, 3,3,'Radiotherapie' Union all
	Select 59, 3,3,'Redressie/repositie onder narcose' Union all
	Select 60, 3,3,'Repositie (poliklinisch / zonder narcose)' Union all
	Select 61, 3,3,'Reumatologische hyperthermie behandeling' Union all
	Select 62, 3,3,'Revalidatie' Union all
	Select 63, 3,3,'Sexuologische behandeling vaginisme' Union all
	Select 64, 3,3,'Shockwave therapie (bijv. bij nierstenen)' Union all
	Select 65, 3,3,'Spontane partus' Union all
	Select 66, 3,3,'Stabiliseren patiënt voor overplaatsing' Union all
	Select 67, 3,3,'Stollingsfactoren' Union all
	Select 68, 3,3,'Traumaopvang' Union all
	Select 69, 3,3,'Urologische zelfkatheterisatie instructie' Union all
	Select 70, 3,3,'Vruchtbaarheidsbehandeling' Union all
	Select 71, 3,3,'Wondbehandeling' Union all
	Select 72, 4,4,'Beeldvorming' Union all
	Select 73, 4,4,'Functieonderzoek' Union all
	Select 74, 4,4,'Laboratorium diagnostiek' Union all
	Select 75, 4,4,'Overige diagnostiek' Union all
	Select 76, 5,5,'(Intercollegiaal) consult' Union all
	Select 77, 5,5,'Analyse doorverwijzing' Union all
	Select 78, 5,5,'Begeleiding / controle bloedstollingswaarde' Union all
	Select 79, 5,5,'Consult Kaakchirurgie' Union all
	Select 80, 5,5,'Counseling en informatieverstrekking' Union all
	Select 81, 5,5,'Eerste consult / intake' Union all
	Select 82, 5,5,'Herhaalconsult / follow-up' Union all
	Select 83, 5,5,'Huisbezoek' Union all
	Select 84, 5,5,'Keuringen' Union all
	Select 85, 5,5,'Medebehandeling' Union all
	Select 86, 5,5,'Multidisciplinair Overleg' Union all
	Select 87, 5,5,'Nazorg' Union all
	Select 88, 5,5,'Paramedisch consult' Union all
	Select 89, 5,5,'Paramedische screening' Union all
	Select 90, 5,5,'Preassessment' Union all
	Select 91, 5,5,'Rapportage' Union all
	Select 92, 5,5,'Second opinion' Union all
	Select 93, 5,5,'SEH contact' Union all
	Select 94, 5,5,'Teleconsult' Union all
	Select 95, 6,6,'Anesthesie' Union all
	Select 96, 6,6,'ECC-perfusie' Union all
	Select 97, 6,6,'Regionale Anesthesie' Union all
	Select 98, 6,6,'Sedatie' Union all
	Select 99, 7,7,'Bijzondere kunst- en hulpmiddelen' Union all
	Select 100, 7,7,'Cardiologische hulpmiddelen' Union all
	Select 101, 7,7,'Hulpmiddelen bewegingsapparaat' Union all
	Select 102, 7,7,'Neurologische hulpmiddelen' Union all
	Select 103, 8,8,'Intensive care toeslag' Union all
	Select 104, 8,8,'Kosten bij kaakchirurgische ingreep' Union all
	Select 105, 8,8,'Opslag van ei- of spermacellen' Union all
	Select 106, 8,8,'Paramedische toeslag' Union all
	Select 107, 8,8,'Reiskosten' Union all
	Select 108, 8,8,'Toeslag ondersteunend specialisme' Union all
	Select 109, 8,8,'Toeslag specialistische zorg' Union all
	Select 110, 8,8,'Vacatiegelden' Union all
	Select 111, 8,8,'Zorgcoordinatie' Union all
	Select 112, 9,9,'IC transport' Union all
	Select 113, 9,9,'Micu transport' Union all
	Select 114, 9,9,'Transport patiënt buiten het OK-complex.' Union all
	Select 115, 10,10,'Donorbindweefsel' Union all
	Select 116, 10,10,'Donorbloedvatweefsel' Union all
	Select 117, 10,10,'Donorbotpoeder of botmatrix' Union all
	Select 118, 10,10,'Donorbotweefsel' Union all
	Select 119, 10,10,'Donorcornea' Union all
	Select 120, 10,10,'Donorhuid' Union all
	Select 121, 10,10,'Donorsclera' Union all
	Select 122, 11,11,'Administratief' Union all
	Select 123, 2,4,'Diagnostische endoscopieën' Union all
	Select 124, 4,4,'Diagnostische punctie of biopsie'
) d

insert into dbo.test_treatment_categories
(
	category_id,
	[name],
	[rank]
)
select 
	category_id,
	[name],
	[rank]
from (
	Select 1 category_id, 1 [rank],'Operatieve behandeling' [name] Union all
	Select 2, 2,'Injecties, katheterisaties en andere minimaal invasieve therapieën' Union all
	Select 3, 3,'Niet-invasieve therapie' Union all
	Select 4, 4,'Diagnostiek' Union all
	Select 5, 5,'Consultatie' Union all
	Select 6, 6,'Anesthesie' Union all
	Select 7, 7,'Hulpmiddelen' Union all
	Select 8, 8,'Kosten of toeslagen' Union all
	Select 9, 9,'Transport' Union all
	Select 10, 10,'Weefselproducten' Union all
	Select 11, 11,'Overige'
) d



-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
------- PETR'S CODE----------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------
--PATIENTS-------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

DROP TABLE IF EXISTS #Patients

create table #Patients(
	[firstname] [varchar](50) not null,
	[lastname] [varchar](50) not null,
	[address] [varchar](50) not null,
	[city] [varchar](50) not null,
	[gender] [varchar](1) null,
)

INSERT INTO #Patients(
	 [firstname]
	, [lastname]
	, [address]
	, [city]
	, [gender]
)
SELECT
	 [firstname]
	, [lastname]
	, [address]
	, [city]
	, [gender]
FROM (
	SELECT 'Riley' [firstname], 'Cochran' [lastname], 'P.O. Box 996, 4820 Ullamcorper Rd.' [address], 'Traiskirchen' [city], 'M' [gender] UNION ALL
	SELECT 'Brooks', 'Hooper', '545-8457 Tellus, Road', 'San Francisco', 'M' UNION ALL
	SELECT 'Joshua', 'Clark', 'Ap #956-7207 Mauris Rd.', 'Rum', 'M' UNION ALL
	SELECT 'Ari', 'Gould', '2034 Vitae St.', 'Buenaventura', 'M' UNION ALL
	SELECT 'Darion', 'Baird', '832-3052 Eu St.', 'Göppingen', 'M' UNION ALL
	SELECT 'Kasey', 'Hays', 'P.O. Box 376, 1859 Quam. Ave', 'Watson Lake', 'M' UNION ALL
	SELECT 'Clay', 'Roach', '272-3673 Id, St.', 'Oberursel', 'M' UNION ALL
	SELECT 'Deshawn', 'Nguyen', 'P.O. Box 978, 6598 Elit Ave', 'Bosa', 'M' UNION ALL
	SELECT 'Silas', 'Deleon', 'P.O. Box 179, 5404 Vel Ave', 'Rio Saliceto', 'M' UNION ALL
	SELECT 'Lucas', 'Simon', 'Ap #344-5234 Gravida St.', 'Oakham', 'M' UNION ALL
	SELECT 'Jayce', 'French', '7800 Ut Rd.', 'Yerbas Buenas', 'M' UNION ALL
	SELECT 'Jairo', 'Barrett', 'P.O. Box 899, 7116 Sed St.', 'Schwerin', 'M' UNION ALL
	SELECT 'Brenden', 'Lee', '2324 Dictum Rd.', 'Anápolis', 'M' UNION ALL
	SELECT 'Branden', 'Serrano', '752-3846 Elementum St.', 'Stavoren', 'M' UNION ALL
	SELECT 'Landen', 'Rios', '885-4430 Faucibus Av.', 'Chetwynd', 'M' UNION ALL
	SELECT 'Kadin', 'Schmidt', 'Ap #431-3835 Tellus St.', 'Leganés', 'M' UNION ALL
	SELECT 'Daniel', 'Hayes', 'P.O. Box 134, 6109 Elit. Road', 'Kotli', 'M' UNION ALL
	SELECT 'Alijah', 'Moreno', 'P.O. Box 887, 2792 Fringilla, Rd.', 'Incourt', 'M' UNION ALL
	SELECT 'Rene', 'Phillips', '595-1813 Viverra. Rd.', 'Rocca d Arazzo', 'M' UNION ALL
	SELECT 'Jaron', 'Humphrey', 'P.O. Box 611, 2920 Nec Rd.', 'Ficarolo', 'M' UNION ALL
	SELECT 'Humberto', 'Mclean', 'Ap #457-5433 Nec Rd.', 'Issy-les-Moulineaux', 'M' UNION ALL
	SELECT 'Jaxson', 'Winters', 'P.O. Box 196, 4426 Elit, Av.', 'Wolvertem', 'M' UNION ALL
	SELECT 'Collin', 'Dickerson', 'Ap #251-5961 Egestas. Rd.', 'Balıkesir', 'M' UNION ALL
	SELECT 'Porter', 'Beltran', 'Ap #568-5928 In Rd.', 'Jonesboro', 'M' UNION ALL
	SELECT 'Yadiel', 'Fischer', 'P.O. Box 384, 5183 Felis, Avenue', 'Eisleben', 'M' UNION ALL
	SELECT 'Sawyer', 'Chavez', 'P.O. Box 502, 8575 Lacinia St.', 'Portland', 'M' UNION ALL
	SELECT 'Justin', 'Khan', 'P.O. Box 152, 8424 Velit Street', 'Rachecourt', 'M' UNION ALL
	SELECT 'Asher', 'Chen', 'Ap #134-3805 Donec St.', 'Enkhuizen', 'M' UNION ALL
	SELECT 'Mohammad', 'Beck', 'P.O. Box 443, 657 Convallis Rd.', 'Bury St. Edmunds', 'M' UNION ALL
	SELECT 'Izayah', 'Cuevas', '190-4165 Lobortis Rd.', 'Tramonti di Sopra', 'M' UNION ALL
	SELECT 'Yahir', 'Alvarez', '983-6636 Duis Rd.', 'Hall in Tirol', 'M' UNION ALL
	SELECT 'Slade', 'Beasley', '291-7701 Pede. Ave', 'Morwell', 'M' UNION ALL
	SELECT 'Gustavo', 'Hale', 'P.O. Box 290, 6257 Gravida St.', 'North Barrackpur', 'M' UNION ALL
	SELECT 'Myles', 'Rosario', '8588 Curae; Rd.', 'Oosterhout', 'M' UNION ALL
	SELECT 'Emilio', 'Mason', 'P.O. Box 760, 6714 Sed St.', 'Pune', 'M' UNION ALL
	SELECT 'Kamron', 'Oconnell', 'P.O. Box 706, 6017 Justo Road', 'Vierzon', 'M' UNION ALL
	SELECT 'Kael', 'Salazar', '150-5490 Erat St.', 'Bellegem', 'M' UNION ALL
	SELECT 'Marvin', 'Mcbride', 'Ap #128-4758 Tortor St.', 'Dendermonde', 'M' UNION ALL
	SELECT 'Terrell', 'Salinas', 'Ap #328-1810 Neque. Street', 'Todi', 'M' UNION ALL
	SELECT 'Jaden', 'Long', 'P.O. Box 828, 9269 Sed Street', 'Villingen-Schwenningen', 'M' UNION ALL
	SELECT 'Everett', 'Reese', '4555 Nullam Av.', 'Quesada', 'M' UNION ALL
	SELECT 'Alessandro', 'Curtis', 'Ap #384-5006 Integer Rd.', '100 Mile House', 'M' UNION ALL
	SELECT 'Reid', 'Odonnell', '172-8342 Maecenas St.', 'Paradise', 'M' UNION ALL
	SELECT 'Tyler', 'Rice', 'P.O. Box 875, 9466 Donec Road', 'Castelmarte', 'M' UNION ALL
	SELECT 'Ramon', 'Morris', '4143 Odio Road', 'Siena', 'M' UNION ALL
	SELECT 'Conor', 'Taylor', 'P.O. Box 841, 532 Et, Avenue', 'Dera Ismail Khan', 'M' UNION ALL
	SELECT 'Elijah', 'Bell', '3044 Conubia Road', 'Wagga Wagga', 'M' UNION ALL
	SELECT 'Emery', 'Haas', 'P.O. Box 926, 7266 Imperdiet St.', 'Beaconsfield', 'M' UNION ALL
	SELECT 'Dawson', 'Joseph', 'P.O. Box 609, 8227 Elementum, St.', 'Fort Smith', 'M' UNION ALL
	SELECT 'Titus', 'Norris', '1663 Morbi Rd.', 'Milano', 'M' UNION ALL
	SELECT 'Alonso', 'Keller', 'P.O. Box 704, 8634 Viverra. Rd.', 'Rampur', 'M' UNION ALL
	SELECT 'Jayvon', 'Tapia', '564-6665 Felis, Av.', 'Lewiston', 'M' UNION ALL
	SELECT 'Elliott', 'Aguilar', 'Ap #932-2976 Dolor Rd.', 'Fortaleza', 'M' UNION ALL
	SELECT 'Emiliano', 'Ponce', 'Ap #381-8626 Tellus. Avenue', 'Guadalupe', 'M' UNION ALL
	SELECT 'Kolton', 'Villegas', 'P.O. Box 145, 4515 Non Street', 'Shawinigan', 'M' UNION ALL
	SELECT 'Cortez', 'Douglas', 'Ap #851-6430 Scelerisque Rd.', 'Glossop', 'M' UNION ALL
	SELECT 'Emanuel', 'Newton', '5150 Etiam Road', 'Lacombe', 'M' UNION ALL
	SELECT 'Pierre', 'Clarke', '512-7420 Justo St.', 'Niort', 'M' UNION ALL
	SELECT 'Tobias', 'Galvan', '885 Lorem Av.', 'Caxias', 'M' UNION ALL
	SELECT 'Cristian', 'Tran', 'P.O. Box 514, 1869 Ornare, Av.', 'Davenport', 'M' UNION ALL
	SELECT 'Rory', 'Sanders', '208 Eu Avenue', 'Randazzo', 'M' UNION ALL
	SELECT 'Leonel', 'Downs', 'P.O. Box 841, 6311 Donec St.', 'Reading', 'M' UNION ALL
	SELECT 'Royce', 'Mcfarland', '872-7728 Felis. Ave', 'Lisciano Niccone', 'M' UNION ALL
	SELECT 'Jamison', 'Arias', '3983 Vel, St.', 'Clarksville', 'M' UNION ALL
	SELECT 'Chaz', 'Leach', '709-7191 Vitae Rd.', 'Wagga Wagga', 'M' UNION ALL
	SELECT 'Grant', 'Morrison', '340-789 Dictum Ave', 'Sneek', 'M' UNION ALL
	SELECT 'Brady', 'Farley', '4079 Vitae, Ave', 'Adria', 'M' UNION ALL
	SELECT 'Jamie', 'Cochran', '9723 Gravida Road', 'Poza Rica', 'M' UNION ALL
	SELECT 'Alvin', 'Figueroa', 'P.O. Box 316, 4286 Nam St.', 'Mansfield', 'M' UNION ALL
	SELECT 'Riley', 'Franco', '193-3620 Imperdiet Rd.', 'Lonzee', 'M' UNION ALL
	SELECT 'Rohan', 'Henry', 'Ap #732-7852 Mauris Rd.', 'Tropea', 'M' UNION ALL
	SELECT 'Jeffrey', 'Molina', 'P.O. Box 154, 6388 Dui, Ave', 'Maple Creek', 'M' UNION ALL
	SELECT 'Marshall', 'Crane', '9003 Mauris St.', 'Francavilla Fontana', 'M' UNION ALL
	SELECT 'Larry', 'Carter', 'P.O. Box 769, 2125 Tellus Avenue', 'Annapolis County', 'M' UNION ALL
	SELECT 'Maverick', 'Salas', '1517 Ridiculus St.', 'North Barrackpur', 'M' UNION ALL
	SELECT 'Cassius', 'Buck', 'P.O. Box 925, 3141 Integer Rd.', 'Dallas', 'M' UNION ALL
	SELECT 'Erik', 'Bradford', '227-5916 Cursus Road', 'La Valle/Wengen', 'M' UNION ALL
	SELECT 'Leland', 'Tanner', 'Ap #605-8981 Sit Rd.', 'Masterton', 'M' UNION ALL
	SELECT 'Timothy', 'Booth', '9317 Mauris Road', 'Sooke', 'M' UNION ALL
	SELECT 'Howard', 'Trujillo', 'Ap #692-1638 Rutrum, St.', 'Weyburn', 'M' UNION ALL
	SELECT 'Immanuel', 'Burke', 'Ap #157-371 Montes, Rd.', 'Presteigne', 'M' UNION ALL
	SELECT 'Humberto', 'Suarez', '328-6491 Quisque St.', 'Deventer', 'M' UNION ALL
	SELECT 'Alexander', 'Liu', 'Ap #910-4481 Dui, Av.', 'Wilmont', 'M' UNION ALL
	SELECT 'Ian', 'Livingston', '9090 Enim St.', 'Erpe', 'M' UNION ALL
	SELECT 'Shawn', 'Berry', '416-7016 Nunc. Av.', 'Bo‘lhe', 'M' UNION ALL
	SELECT 'Clay', 'Parrish', 'P.O. Box 432, 6217 Vel St.', 'São Gonçalo', 'M' UNION ALL
	SELECT 'Lamar', 'Turner', 'P.O. Box 642, 9100 Imperdiet Av.', 'Kansas City', 'M' UNION ALL
	SELECT 'Rylan', 'Archer', '3192 Aliquet St.', 'Lavoir', 'M' UNION ALL
	SELECT 'Collin', 'Gentry', '9829 Eu, Av.', 'Port Harcourt', 'M' UNION ALL
	SELECT 'Jaydin', 'Dudley', 'P.O. Box 361, 5939 Dolor. Road', 'Habay-la-Vieille', 'M' UNION ALL
	SELECT 'Muhammad', 'Chung', '9426 Mauris St.', 'Olmué', 'M' UNION ALL
	SELECT 'Cohen', 'Harper', 'Ap #344-6636 Cursus Rd.', 'Glenrothes', 'M' UNION ALL
	SELECT 'Aydan', 'Pitts', '5803 Phasellus Rd.', 'Ciudad Apodaca', 'M' UNION ALL
	SELECT 'Fabian', 'Cohen', 'P.O. Box 992, 679 Curabitur Ave', 'Salisbury', 'M' UNION ALL
	SELECT 'Brendon', 'Mcmahon', '248-2109 Duis Avenue', 'Taldom', 'M' UNION ALL
	SELECT 'Gideon', 'Weiss', '2178 Sed, St.', 'Tamines', 'M' UNION ALL
	SELECT 'Reese', 'Horn', 'Ap #846-4921 Nunc Av.', 'Kitchener', 'M' UNION ALL
	SELECT 'Samuel', 'Duke', '2566 Ac St.', 'Ophain-Bois-Seigneur-Isaac', 'M' UNION ALL
	SELECT 'Deven', 'Silva', '886-875 Nonummy Rd.', 'Neudörfl', 'M' UNION ALL
	SELECT 'Mario', 'Mccann', '640-8868 Augue Ave', 'Lanark County', 'M' UNION ALL
	SELECT 'Rene', 'Pineda', 'Ap #742-4597 Magna. Rd.', 'Prague', 'M' UNION ALL
	SELECT 'Waylon', 'Moran', '453-1639 Amet, Rd.', 'Akhtubinsk', 'M' UNION ALL
	SELECT 'Elian', 'Whitney', 'Ap #607-1328 Consectetuer Av.', 'Arauco', 'M' UNION ALL
	SELECT 'Ace', 'Washington', '683 Orci Av.', 'Placilla', 'M' UNION ALL
	SELECT 'Aydin', 'Carrillo', 'Ap #204-8390 Nulla St.', 'Bassano in Teverina', 'M' UNION ALL
	SELECT 'Jerome', 'Fox', 'Ap #717-8382 Lacus Road', 'Richmond', 'M' UNION ALL
	SELECT 'Damien', 'Novak', 'P.O. Box 572, 8907 Fusce Av.', 'Santarém', 'M' UNION ALL
	SELECT 'Rudy', 'Fields', 'Ap #376-6430 Erat, Rd.', 'Solre-sur-Sambre', 'M' UNION ALL
	SELECT 'Paul', 'Knapp', '362-7926 Libero Street', 'Portofino', 'M' UNION ALL
	SELECT 'Darius', 'Wagner', '198-3683 Sed Ave', 'Embourg', 'M' UNION ALL
	SELECT 'Dexter', 'Meyers', '965-3006 Pellentesque St.', 'Dmitrov', 'M' UNION ALL
	SELECT 'Declan', 'Ellis', '2113 Consectetuer Av.', 'Columbus', 'M' UNION ALL
	SELECT 'Kenyon', 'Spencer', 'Ap #906-4219 Dictum St.', 'Houston', 'M' UNION ALL
	SELECT 'Branden', 'Moss', '8955 Justo Road', 'Grande Prairie', 'M' UNION ALL
	SELECT 'Asher', 'Cooke', 'P.O. Box 549, 4831 Non Rd.', 'Ziarat', 'M' UNION ALL
	SELECT 'Randall', 'Michael', '2087 Ante Road', 'Borghetto di Vara', 'M' UNION ALL
	SELECT 'Ronald', 'Moon', '4240 Consectetuer Road', 'Kakisa', 'M' UNION ALL
	SELECT 'Jakob', 'Neal', '9622 At St.', 'Izel', 'M' UNION ALL
	SELECT 'Zavier', 'Ramsey', 'P.O. Box 206, 5419 Dui, Street', 'Castelbuono', 'M' UNION ALL
	SELECT 'Jayce', 'Rangel', '633-7546 Eleifend Street', 'Oudenaken', 'M' UNION ALL
	SELECT 'Preston', 'Montes', 'Ap #501-7630 Ullamcorper, Rd.', 'Cairo Montenotte', 'M' UNION ALL
	SELECT 'Kian', 'Mercado', 'P.O. Box 713, 5552 Lacus. Ave', 'Castri di Lecce', 'M' UNION ALL
	SELECT 'Reginald', 'Baker', 'Ap #882-5780 Massa. St.', 'Medio Atrato', 'M' UNION ALL
	SELECT 'Tristin', 'Mora', 'Ap #693-2540 Ligula. Street', 'Couture-Saint-Germain', 'M' UNION ALL
	SELECT 'Reese', 'Hunter', 'P.O. Box 126, 5507 Tellus Street', 'Sefro', 'M' UNION ALL
	SELECT 'Dean', 'Randolph', '703-4188 Gravida Rd.', 'Snaaskerke', 'M' UNION ALL
	SELECT 'Edward', 'Atkins', '282 Consectetuer Rd.', 'Russell', 'M' UNION ALL
	SELECT 'Elliot', 'Stone', '317 A Avenue', 'Valleyview', 'M' UNION ALL
	SELECT 'Jerry', 'Frey', '2836 Diam St.', 'Sadiqabad', 'M' UNION ALL
	SELECT 'Griffin', 'Ibarra', '222-7007 A Street', 'Mosquera', 'M' UNION ALL
	SELECT 'Dante', 'Oliver', 'P.O. Box 806, 7956 Fusce Av.', 'Corbara', 'M' UNION ALL
	SELECT 'Raiden', 'Singh', '836-6829 Fringilla Avenue', 'Vollezele', 'M' UNION ALL
	SELECT 'Giancarlo', 'Whitaker', 'Ap #931-5134 Mauris St.', 'Geelong', 'M' UNION ALL
	SELECT 'Abram', 'Mayer', 'Ap #379-9530 Integer Rd.', 'Lanark', 'M' UNION ALL
	SELECT 'Victor', 'Scott', 'P.O. Box 824, 368 Vulputate, Road', 'Legal', 'M' UNION ALL
	SELECT 'Kamron', 'Cook', 'P.O. Box 761, 1581 Ornare Rd.', 'Scalloway', 'M' UNION ALL
	SELECT 'Cristian', 'Hudson', 'P.O. Box 558, 3291 Ac, Avenue', 'Chillán', 'M' UNION ALL
	SELECT 'Tomas', 'Kim', 'P.O. Box 814, 6072 Quam. Street', 'Falciano del Massico', 'M' UNION ALL
	SELECT 'Antony', 'Calhoun', 'P.O. Box 288, 5478 Sem Avenue', 'Jedburgh', 'M' UNION ALL
	SELECT 'Spencer', 'Cannon', 'P.O. Box 717, 7568 Id Rd.', 'Forges', 'M' UNION ALL
	SELECT 'Misael', 'Haynes', 'Ap #689-5942 At Street', 'Premeno', 'M' UNION ALL
	SELECT 'Rhett', 'Welch', 'P.O. Box 272, 4525 Ridiculus Av.', 'Port Moody', 'M' UNION ALL
	SELECT 'Gideon', 'Huffman', 'P.O. Box 900, 7568 Ante. Rd.', 'Richmond Hill', 'M' UNION ALL
	SELECT 'Antoine', 'Huff', '5239 Suspendisse Street', 'Fauvillers', 'M' UNION ALL
	SELECT 'Camron', 'Patel', '658-6415 Phasellus Rd.', 'Zaventem', 'M' UNION ALL
	SELECT 'Jaime', 'Mendez', 'P.O. Box 486, 704 Libero. Av.', 'Jeongeup', 'M' UNION ALL
	SELECT 'Yael', 'Giles', '2951 Sapien. Ave', 'Toowoomba', 'M' UNION ALL
	SELECT 'Christian', 'Mclaughlin', '453-4730 Sodales St.', 'Tarvisio', 'M' UNION ALL
	SELECT 'Xavier', 'Ramirez', '844-7586 Nulla Ave', 'Georgia', 'M' UNION ALL
	SELECT 'Teagan', 'Williamson', '855-7409 Faucibus St.', 'Scarborough', 'M' UNION ALL
	SELECT 'Kolton', 'Brady', '9092 Feugiat Rd.', 'Etroubles', 'M' UNION ALL
	SELECT 'Malakai', 'Garcia', '886-143 Ut, Av.', 'Lipetsk', 'M' UNION ALL
	SELECT 'Jared', 'Woodward', 'P.O. Box 561, 7925 Ut Avenue', 'Merdorp', 'M' UNION ALL
	SELECT 'Easton', 'Ball', 'P.O. Box 784, 7937 Sed Road', 'Forres', 'M' UNION ALL
	SELECT 'Brycen', 'Gregory', 'P.O. Box 511, 7150 Ligula Avenue', 'Wałbrzych', 'M' UNION ALL
	SELECT 'Lance', 'Villanueva', '938-4051 Dolor Rd.', 'Iowa City', 'M' UNION ALL
	SELECT 'Julien', 'Holmes', '292-8185 Convallis Road', 'Kalat', 'M' UNION ALL
	SELECT 'Ace', 'James', '6977 Mauris Rd.', 'Anklam', 'M' UNION ALL
	SELECT 'Morgan', 'Parsons', 'Ap #286-3524 Et, St.', 'Barasat', 'M' UNION ALL
	SELECT 'Elijah', 'Jones', 'Ap #517-2833 Elit, Ave', 'Cúcuta', 'M' UNION ALL
	SELECT 'Karter', 'Andrews', 'Ap #336-528 Lobortis Avenue', 'Padre las Casas', 'M' UNION ALL
	SELECT 'Rodrigo', 'Maddox', '798-3898 Ut St.', 'Kitzbühel', 'M' UNION ALL
	SELECT 'Randall', 'Roy', '783-3053 Porttitor St.', 'Paulista', 'M' UNION ALL
	SELECT 'Darian', 'Reyes', '8093 Mollis Avenue', 'Dmitrov', 'M' UNION ALL
	SELECT 'Haiden', 'Reilly', 'P.O. Box 503, 7298 Dolor Rd.', 'Shrewsbury', 'M' UNION ALL
	SELECT 'John', 'Christian', 'Ap #659-5020 Tincidunt St.', 'Peine', 'M' UNION ALL
	SELECT 'Aaden', 'Farmer', '446-7177 Erat. Street', 'Colbún', 'M' UNION ALL
	SELECT 'Francis', 'Mann', '5270 Sociis Av.', 'Rivière-du-Loup', 'M' UNION ALL
	SELECT 'Phoenix', 'Carroll', 'Ap #367-2122 Aliquet Ave', 'St. Johann in Tirol', 'M' UNION ALL
	SELECT 'Miles', 'Boyer', 'Ap #962-9615 Diam Street', 'Wabamun', 'M' UNION ALL
	SELECT 'Terrance', 'Craig', '975-1243 Amet Road', 'Mariakerke', 'M' UNION ALL
	SELECT 'Daniel', 'Webb', 'Ap #300-8590 Vestibulum Ave', 'Harbour Grace', 'M' UNION ALL
	SELECT 'Dakota', 'Crosby', '3236 Nunc, Road', 'Körfez', 'M' UNION ALL
	SELECT 'Hunter', 'Campbell', '585-7611 Luctus Rd.', 'Cherepovets', 'M' UNION ALL
	SELECT 'Jermaine', 'Ortiz', 'Ap #763-1863 Phasellus Avenue', 'Jaranwala', 'M' UNION ALL
	SELECT 'Riley', 'Gibson', '9092 Quam. Street', 'Vieste', 'M' UNION ALL
	SELECT 'Dexter', 'Gill', 'P.O. Box 263, 2036 Amet Rd.', 'Rapone', 'M' UNION ALL
	SELECT 'Kamden', 'Palmer', '8837 At Avenue', 'Poole', 'M' UNION ALL
	SELECT 'Camden', 'Hardin', 'P.O. Box 508, 6442 Pellentesque Av.', 'Mollem', 'M' UNION ALL
	SELECT 'Tyree', 'Garza', '4343 Habitant St.', 'Vigo', 'M' UNION ALL
	SELECT 'Giovanni', 'Sheppard', '888-6317 Nunc. St.', 'Aalst', 'M' UNION ALL
	SELECT 'Tyshawn', 'Luna', '636 Suspendisse Rd.', 'Villers-aux-Tours', 'M' UNION ALL
	SELECT 'Conner', 'Rivera', '4108 Commodo St.', 'Pero', 'M' UNION ALL
	SELECT 'Gilberto', 'Burch', '6206 Hendrerit Rd.', 'Mglin', 'M' UNION ALL
	SELECT 'Gregory', 'Maldonado', '9141 Lectus Ave', 'Pushchino', 'M' UNION ALL
	SELECT 'Ty', 'Patrick', '379-8634 Montes, Av.', 'Domodedovo', 'M' UNION ALL
	SELECT 'Alexander', 'Griffith', 'P.O. Box 431, 4739 Eget Rd.', 'Williams Lake', 'M' UNION ALL
	SELECT 'Antoine', 'Rocha', 'Ap #409-2806 Euismod Av.', 'San Pedro de la Paz', 'M' UNION ALL
	SELECT 'Coleman', 'Clayton', '7938 Tortor Rd.', 'Bellary', 'M' UNION ALL
	SELECT 'Marques', 'Haney', '5409 Vel Rd.', 'San Ignacio', 'M' UNION ALL
	SELECT 'Davian', 'Peterson', '494 Ultricies Avenue', 'Airdrie', 'M' UNION ALL
	SELECT 'Zachary', 'Vasquez', 'P.O. Box 846, 9764 Vitae Street', 'TrognŽe', 'M' UNION ALL
	SELECT 'Franco', 'Hernandez', '7788 Nec St.', 'Miami', 'M' UNION ALL
	SELECT 'Atticus', 'Powell', '522-3692 Aliquam Street', 'Kolhapur', 'M' UNION ALL
	SELECT 'Mohamed', 'Hoover', '1429 Ad Rd.', 'Coreglia Antelminelli', 'M' UNION ALL
	SELECT 'Allen', 'Hopkins', '422 Proin Rd.', 'Şereflikoçhisar', 'M' UNION ALL
	SELECT 'Konnor', 'Hess', 'P.O. Box 211, 5213 Nisl Rd.', 'Linlithgow', 'M' UNION ALL
	SELECT 'Richard', 'Drake', '500-6792 Donec Road', 'Solingen', 'M' UNION ALL
	SELECT 'Caden', 'Young', '7900 Adipiscing St.', 'Malgesso', 'M' UNION ALL
	SELECT 'Raiden', 'Koch', 'Ap #610-6367 Molestie Road', 'Amstelveen', 'M' UNION ALL
	SELECT 'Johan', 'Ewing', '5747 Non, Rd.', 'Satka', 'M' UNION ALL
	SELECT 'Declan', 'Bolton', '265-6648 Congue, St.', 'Bannu', 'M' UNION ALL
	SELECT 'Elijah', 'Snyder', 'P.O. Box 570, 6524 Tempus Road', 'Jerzu', 'M' UNION ALL
	SELECT 'Beckham', 'Hines', '2033 Arcu. Road', 'Salihli', 'M' UNION ALL
	SELECT 'Kelvin', 'Owens', '6386 Vel, St.', 'Cassano Spinola', 'M' UNION ALL
	SELECT 'Mitchell', 'Swanson', 'P.O. Box 495, 5888 Dictum St.', 'Radom', 'M' UNION ALL
	SELECT 'Marcel', 'Barnes', '4066 Gravida. St.', 'Fogo', 'M' UNION ALL
	SELECT 'Leonardo', 'Booker', '2145 Diam. Rd.', 'Northumberland', 'M' UNION ALL
	SELECT 'Bradley', 'Mckee', '651-405 Nunc St.', 'Hollabrunn', 'M' UNION ALL
	SELECT 'Andy', 'Johnston', 'Ap #911-7392 Dolor Street', 'Helmsdale', 'M' UNION ALL
	SELECT 'Darnell', 'Mata', '1907 Arcu. St.', 'Gianico', 'M' UNION ALL
	SELECT 'Bernard', 'Shea', '4872 Id St.', 'Sanzeno', 'M' UNION ALL
	SELECT 'Landyn', 'Cantu', '1854 Consequat Ave', 'North Berwick', 'M' UNION ALL
	SELECT 'Ricky', 'Willis', 'P.O. Box 250, 2744 Amet St.', 'Calgary', 'M' UNION ALL
	SELECT 'Irvin', 'Kane', '106-8061 Risus. Rd.', 'Leke', 'M' UNION ALL
	SELECT 'Jadiel', 'Esparza', 'P.O. Box 647, 8933 Tempor Av.', 'Uijeongbu', 'M' UNION ALL
	SELECT 'Waylon', 'Shannon', '9006 Cras Avenue', 'Campinas', 'M' UNION ALL
	SELECT 'Rayan', 'Choi', 'Ap #717-1141 Augue, Road', 'Kurgan', 'M' UNION ALL
	SELECT 'Lawrence', 'Delgado', 'Ap #547-502 Vivamus Avenue', 'Milwaukee', 'M' UNION ALL
	SELECT 'Carlos', 'Camacho', '2426 Ornare Avenue', 'Wernigerode', 'M' UNION ALL
	SELECT 'Jasiah', 'Carlson', 'P.O. Box 789, 9599 Volutpat Rd.', 'Gianico', 'M' UNION ALL
	SELECT 'Lukas', 'Nixon', 'Ap #854-8187 Ornare. Road', 'Villa Verde', 'M' UNION ALL
	SELECT 'Kenyon', 'Sexton', 'P.O. Box 251, 4816 Malesuada Avenue', 'Lauco', 'M' UNION ALL
	SELECT 'Waylon', 'Bernard', 'Ap #816-4060 Pellentesque Rd.', 'Futrono', 'M' UNION ALL
	SELECT 'Gordon', 'Branch', '891-9615 Purus, Ave', 'Solihull', 'M' UNION ALL
	SELECT 'Muhammad', 'Best', '7843 Ut Rd.', 'Ophoven', 'M' UNION ALL
	SELECT 'Tyson', 'Higgins', 'P.O. Box 440, 7354 Praesent Ave', 'Valbrevenna', 'M' UNION ALL
	SELECT 'Krish', 'Rosales', '5513 Fermentum St.', 'Palombaro', 'M' UNION ALL
	SELECT 'Howard', 'Howell', '111-2571 Velit. Road', 'Glabais', 'M' UNION ALL
	SELECT 'Brian', 'Love', '484-3380 Penatibus Avenue', 'Wichelen', 'M' UNION ALL
	SELECT 'Trevor', 'Levine', '8652 Cursus Ave', 'Wenduine', 'M' UNION ALL
	SELECT 'Armando', 'Valenzuela', '280-7326 Risus Avenue', 'Fort Wayne', 'M' UNION ALL
	SELECT 'Jaydin', 'Flores', 'Ap #248-8850 Lectus Rd.', 'Roux-Miroir', 'M' UNION ALL
	SELECT 'Anderson', 'Davis', 'Ap #828-3416 Dolor Ave', 'Vertou', 'M' UNION ALL
	SELECT 'Trevor', 'Sampson', 'P.O. Box 321, 6996 Euismod St.', 'Rocca Massima', 'M' UNION ALL
	SELECT 'Chaz', 'Conway', 'Ap #491-3992 At, Av.', 'Onitsha', 'M' UNION ALL
	SELECT 'Ivan', 'Petty', 'Ap #978-1560 Eu Ave', 'Norman Wells', 'M' UNION ALL
	SELECT 'Will', 'Hunt', 'Ap #756-157 Orci St.', 'Bayswater', 'M' UNION ALL
	SELECT 'Seamus', 'Hurst', 'Ap #109-2056 Porta Av.', 'Pamplona', 'M' UNION ALL
	SELECT 'Lorenzo', 'Rasmussen', 'Ap #851-537 Ridiculus St.', 'Saskatoon', 'M' UNION ALL
	SELECT 'Colt', 'Hawkins', 'Ap #871-4102 Sed St.', 'Toulon', 'M' UNION ALL
	SELECT 'Clay', 'Dougherty', '465-5636 Tortor. Rd.', 'Austin', 'M' UNION ALL
	SELECT 'Aaden', 'Schaefer', 'Ap #784-7488 Sociis Street', 'Morro d Alba', 'M' UNION ALL
	SELECT 'Martin', 'Gonzales', '426-2155 Ipsum. St.', 'Borgerhout', 'M' UNION ALL
	SELECT 'Demarion', 'Montoya', 'Ap #754-7079 Ligula. Rd.', 'Avernas-le-Bauduin', 'M' UNION ALL
	SELECT 'Ben', 'Chapman', 'Ap #705-2655 Congue Ave', 'Oudegem', 'M' UNION ALL
	SELECT 'Fisher', 'Benitez', 'P.O. Box 273, 154 Ligula. St.', 'Namen', 'M' UNION ALL
	SELECT 'Maximo', 'Snow', 'P.O. Box 747, 8145 Consectetuer Rd.', 'Blitar', 'M' UNION ALL
	SELECT 'Jovanni', 'Harrington', '4085 Magna. Road', 'Hondelange', 'M' UNION ALL
	SELECT 'Andres', 'Delacruz', '5938 Nisi Avenue', 'Santa Cruz', 'M' UNION ALL
	SELECT 'Lawson', 'Dunlap', '527-8878 Eu, St.', 'Malbaie', 'M' UNION ALL
	SELECT 'Peyton', 'Banks', 'P.O. Box 678, 6502 Donec Rd.', 'Barrackpur', 'M' UNION ALL
	SELECT 'Uriah', 'Juarez', 'Ap #173-5264 Cras Av.', 'Anyang', 'M' UNION ALL
	SELECT 'Hamza', 'Bradley', 'Ap #319-3363 Semper Street', 'Meer', 'M' UNION ALL
	SELECT 'Edward', 'Leblanc', 'Ap #906-5267 In Avenue', 'Den Helder', 'M' UNION ALL
	SELECT 'Reece', 'Mcintyre', '686-1877 Odio Rd.', 'Calvera', 'M' UNION ALL
	SELECT 'Brayden', 'Wallace', '701-9956 Tortor Rd.', 'Hawera', 'M' UNION ALL
	SELECT 'Lyric', 'Wyatt', '6616 Accumsan Road', 'Tirúa', 'M' UNION ALL
	SELECT 'Demarcus', 'Herman', 'Ap #433-7751 Dapibus Avenue', 'Portici', 'M' UNION ALL
	SELECT 'Memphis', 'Dyer', '8460 A, St.', 'Kalken', 'M' UNION ALL
	SELECT 'Victor', 'Cooper', 'Ap #365-358 Risus. St.', 'Barra do Corda', 'M' UNION ALL
	SELECT 'Kameron', 'Schultz', 'P.O. Box 991, 397 Enim. St.', 'Nijkerk', 'M' UNION ALL
	SELECT 'Blaze', 'Roman', '1998 Amet, Rd.', 'Steenhuffel', 'M' UNION ALL
	SELECT 'Ramiro', 'Johns', 'Ap #123-6184 Sed St.', 'Mezen', 'M' UNION ALL
	SELECT 'Sebastian', 'Conner', '451-7037 Nulla Avenue', 'Elen', 'M' UNION ALL
	SELECT 'Wesley', 'Ford', 'Ap #213-5990 Quisque Road', 'Jeonju', 'M' UNION ALL
	SELECT 'Tyson', 'Bryant', 'Ap #508-3711 Vitae St.', 'Girona', 'M' UNION ALL
	SELECT 'Jax', 'Terrell', '1196 Nec Road', 'Vishakhapatnam', 'M' UNION ALL
	SELECT 'Quentin', 'Moody', '866-6141 Nascetur Ave', 'Wambeek', 'M' UNION ALL
	SELECT 'Valentino', 'Patterson', 'P.O. Box 650, 4389 Orci St.', 'Serrata', 'M' UNION ALL
	SELECT 'Shawn', 'Guzman', 'P.O. Box 928, 4957 Id Rd.', 'Drayton Valley', 'M' UNION ALL
	SELECT 'Thomas', 'Mathis', 'P.O. Box 806, 742 Ut Ave', 'San Clemente', 'M' UNION ALL
	SELECT 'Allen', 'Stewart', 'P.O. Box 285, 5584 Amet, Rd.', 'King Township', 'M' UNION ALL
	SELECT 'Carter', 'Brewer', '362-2424 Dui. St.', 'Warangal', 'M' UNION ALL
	SELECT 'Jase', 'Zimmerman', 'Ap #943-9525 Lobortis. Rd.', 'Sint-Stevens-Woluwe', 'M' UNION ALL
	SELECT 'Aniya', 'May', '955-7822 Quis Road', 'Whitby', 'F' UNION ALL
	SELECT 'Kendal', 'Velazquez', '543-8382 Lectus Rd.', 'Dunedin', 'F' UNION ALL
	SELECT 'Karlee', 'Glass', 'P.O. Box 867, 9223 Fames St.', 'Magdeburg', 'F' UNION ALL
	SELECT 'Rosemary', 'Mcintosh', 'Ap #780-9572 Scelerisque Av.', 'Dunfermline', 'F' UNION ALL
	SELECT 'Madison', 'Fisher', 'Ap #913-5283 A, Av.', 'Mogi das Cruzes', 'F' UNION ALL
	SELECT 'Lara', 'Phelps', 'P.O. Box 313, 7298 Nisi. Rd.', 'Chattanooga', 'F' UNION ALL
	SELECT 'Christina', 'Levy', 'Ap #654-5275 Amet Street', 'Zierikzee', 'F' UNION ALL
	SELECT 'Mira', 'Hanna', 'P.O. Box 917, 8349 Mattis. Ave', 'Shipshaw', 'F' UNION ALL
	SELECT 'Kate', 'Meza', '8717 Habitant Ave', 'Goes', 'F' UNION ALL
	SELECT 'Aleah', 'Cummings', '619-3524 Rhoncus. Ave', 'Susegana', 'F' UNION ALL
	SELECT 'Kennedi', 'Warren', 'Ap #829-1383 Molestie Ave', 'Thurso', 'F' UNION ALL
	SELECT 'Paola', 'Walters', '8471 Risus Rd.', 'Blind River', 'F' UNION ALL
	SELECT 'Mina', 'Kelley', '2702 Sagittis. Rd.', 'Puente Alto', 'F' UNION ALL
	SELECT 'Paige', 'Barnett', '919-1508 Velit. Rd.', 'Newtown', 'F' UNION ALL
	SELECT 'Jaylee', 'Hancock', '241-6834 Parturient St.', 'Springdale', 'F' UNION ALL
	SELECT 'India', 'Kaufman', 'Ap #602-8848 Magna Road', 'Valleyview', 'F' UNION ALL
	SELECT 'Justice', 'Daniel', 'Ap #382-5676 Facilisi. Road', 'Cap-Saint-Ignace', 'F' UNION ALL
	SELECT 'Halle', 'Hull', '6687 Proin Rd.', 'Marilles', 'F' UNION ALL
	SELECT 'Jaqueline', 'Coleman', '523-462 Magna Street', 'Porpetto', 'F' UNION ALL
	SELECT 'Yaretzi', 'Olson', 'Ap #554-2854 Sociosqu Ave', 'Pangnirtung', 'F' UNION ALL
	SELECT 'Alexus', 'Petersen', '637-8290 Imperdiet Rd.', 'Minitonas', 'F' UNION ALL
	SELECT 'Amaya', 'Good', '937-2483 Dui Road', 'Warspite', 'F' UNION ALL
	SELECT 'Aubrey', 'Pugh', 'Ap #614-8778 Ligula St.', 'Kidwelly', 'F' UNION ALL
	SELECT 'Logan', 'Garner', 'Ap #680-4442 Fames Av.', 'Roio del Sangro', 'F' UNION ALL
	SELECT 'Tamia', 'Klein', '577 Penatibus St.', 'Sclayn', 'F' UNION ALL
	SELECT 'Viviana', 'Jenkins', 'P.O. Box 313, 7298 Nisi. Rd.', 'Chicoutimi', 'F' UNION ALL
	SELECT 'Renee', 'Contreras', '8015 Commodo Avenue', 'Joncret', 'F' UNION ALL
	SELECT 'Nicole', 'Larson', '808-7116 Magnis Rd.', 'Hasselt', 'F' UNION ALL
	SELECT 'Saniyah', 'Krause', 'Ap #889-2203 Blandit St.', 'Fino Mornasco', 'F' UNION ALL
	SELECT 'Shirley', 'Mills', '800-9615 Nascetur Rd.', 'Torrevecchia Teatina', 'F' UNION ALL
	SELECT 'Sasha', 'Galloway', '563-6022 Libero. Avenue', 'Lauro de Freitas', 'F' UNION ALL
	SELECT 'Mayra', 'Evans', '902-570 Non Rd.', 'Sukkur', 'F' UNION ALL
	SELECT 'Mylie', 'Bond', 'P.O. Box 201, 9615 Ultricies Rd.', 'Castel Giorgio', 'F' UNION ALL
	SELECT 'Micah', 'Hamilton', '6769 Suspendisse Ave', 'Folx-les-Caves', 'F' UNION ALL
	SELECT 'Kennedy', 'Nelson', 'P.O. Box 125, 7763 Posuere Ave', 'Rothesay', 'F' UNION ALL
	SELECT 'Kamryn', 'Arellano', '471-5844 Sapien, Street', 'Lochranza', 'F' UNION ALL
	SELECT 'Cora', 'Webster', 'P.O. Box 789, 6858 Magna. St.', 'Novgorod', 'F' UNION ALL
	SELECT 'Ann', 'Valdez', '6812 Nonummy. St.', 'Ellesmere Port', 'F' UNION ALL
	SELECT 'Hannah', 'Price', 'P.O. Box 164, 4432 Donec Av.', 'Brussegem', 'F' UNION ALL
	SELECT 'Caitlin', 'Robbins', 'P.O. Box 579, 1483 Vel, Rd.', 'Ancaster Town', 'F' UNION ALL
	SELECT 'Eden', 'Wall', '181-486 Id St.', 'North Battleford', 'F' UNION ALL
	SELECT 'Gisselle', 'Small', 'P.O. Box 649, 6730 Vel, Rd.', 'Ayas', 'F' UNION ALL
	SELECT 'Natasha', 'Decker', '513-4783 Sit St.', 'San Pedro de Atacama', 'F' UNION ALL
	SELECT 'Litzy', 'Mccoy', '867-2942 Ridiculus Road', 'Brest', 'F' UNION ALL
	SELECT 'Julianna', 'Greer', '1396 Tristique St.', 'Kessenich', 'F' UNION ALL
	SELECT 'Gracie', 'Weeks', '606-3893 Libero Rd.', 'Hamme', 'F' UNION ALL
	SELECT 'Taniya', 'Chase', '3481 Vivamus Street', 'Arbre', 'F' UNION ALL
	SELECT 'Marely', 'Gross', '765-2572 Dolor St.', 'Aprelevka', 'F' UNION ALL
	SELECT 'Lana', 'Vaughn', '6850 Ultrices Avenue', 'Hamme-Mille', 'F' UNION ALL
	SELECT 'Hannah', 'Hood', '8198 Amet, Rd.', 'Newquay', 'F' UNION ALL
	SELECT 'Elsa', 'Jacobs', 'Ap #863-3192 Non St.', 'Antofagasta', 'F' UNION ALL
	SELECT 'Lailah', 'Green', '957-9629 Magna. Rd.', 'Oelegem', 'F' UNION ALL
	SELECT 'Zion', 'Newman', 'Ap #946-2414 Odio Road', 'Tollembeek', 'F' UNION ALL
	SELECT 'Alyvia', 'Chaney', 'P.O. Box 257, 8817 Ornare Rd.', 'Jambes', 'F' UNION ALL
	SELECT 'Kaila', 'Everett', 'Ap #412-2795 Quis, Street', 'Raurkela', 'F' UNION ALL
	SELECT 'Leyla', 'Cervantes', 'Ap #929-8008 Mollis Road', 'King s Lynn', 'F' UNION ALL
	SELECT 'Brenda', 'Porter', '3640 Eu Street', 'Bruderheim', 'F' UNION ALL
	SELECT 'Anika', 'Harvey', 'Ap #389-2590 Morbi St.', 'Seongnam', 'F' UNION ALL
	SELECT 'Whitney', 'Lin', 'Ap #237-1656 Sollicitudin Avenue', 'Sant Angelo Limosano', 'F' UNION ALL
	SELECT 'Zion', 'Aguirre', '955-7970 Donec St.', 'Cheltenham', 'F' UNION ALL
	SELECT 'Chloe', 'Irwin', 'Ap #106-7123 Congue Rd.', 'Dendermonde', 'F' UNION ALL
	SELECT 'Kaley', 'Edwards', 'P.O. Box 515, 5736 Neque Rd.', 'Stranraer', 'F' UNION ALL
	SELECT 'Ashanti', 'Pollard', '9940 Dictum Avenue', 'Sousa', 'F' UNION ALL
	SELECT 'Kamila', 'Cameron', '7734 Per Road', 'Maracalagonis', 'F' UNION ALL
	SELECT 'Hallie', 'Rowland', 'P.O. Box 572, 2390 Pellentesque Av.', 'Serik', 'F' UNION ALL
	SELECT 'Logan', 'Lane', '766-4170 Nisl. St.', 'Cambridge', 'F' UNION ALL
	SELECT 'Braelyn', 'Mcguire', '317-3935 Curabitur St.', 'Orvault', 'F' UNION ALL
	SELECT 'Mikaela', 'Lang', 'P.O. Box 458, 3093 Eu, Street', 'Ramillies', 'F' UNION ALL
	SELECT 'Adalynn', 'Mcdowell', '4023 Sit St.', 'Abolens', 'F' UNION ALL
	SELECT 'Scarlet', 'Little', 'P.O. Box 802, 6214 Ornare St.', 'South Bend', 'F' UNION ALL
	SELECT 'Heidy', 'Lawrence', '475-9926 Lorem Av.', 'Lo Barnechea', 'F' UNION ALL
	SELECT 'Eliza', 'Thornton', 'Ap #814-4537 Elit. Av.', 'Koblenz', 'F' UNION ALL
	SELECT 'Cindy', 'Gay', 'Ap #189-8081 Nunc Rd.', 'Bathurst', 'F' UNION ALL
	SELECT 'Francesca', 'Roberson', '9851 Molestie Street', 'Fallo', 'F' UNION ALL
	SELECT 'Nathaly', 'Murillo', '857 Dapibus Rd.', 'Birmingham', 'F' UNION ALL
	SELECT 'Alexandra', 'Bush', 'Ap #747-7155 Maecenas Rd.', 'Ourense', 'F' UNION ALL
	SELECT 'Monica', 'Strong', 'Ap #904-9420 Sed, St.', 'Rocca Santo Stefano', 'F' UNION ALL
	SELECT 'Valeria', 'Wiggins', 'P.O. Box 107, 7027 Iaculis Av.', 'Whitewater Region Township', 'F' UNION ALL
	SELECT 'Holly', 'Vance', 'P.O. Box 210, 4049 Iaculis Rd.', 'Maria', 'F' UNION ALL
	SELECT 'Madelynn', 'Mccormick', '377-527 Interdum. Street', 'Salamanca', 'F' UNION ALL
	SELECT 'Donna', 'Ballard', 'Ap #682-3238 Cursus Avenue', 'San Juan de la Costa', 'F' UNION ALL
	SELECT 'Karli', 'Cole', '323-3517 Nulla Rd.', 'Palestrina', 'F' UNION ALL
	SELECT 'Sofia', 'Owen', '483-6606 Cras Rd.', 'Karachev', 'F' UNION ALL
	SELECT 'Riley', 'Castro', 'P.O. Box 326, 4015 Nunc Rd.', 'Lodhran', 'F' UNION ALL
	SELECT 'Viviana', 'Sawyer', '234-6813 Augue, Road', 'Awka', 'F' UNION ALL
	SELECT 'Taniyah', 'Holder', '140-976 Orci. Rd.', 'Mount Pearl', 'F' UNION ALL
	SELECT 'Ayla', 'Hughes', '5547 Nibh Av.', 'Craco', 'F' UNION ALL
	SELECT 'Janae', 'Holloway', 'Ap #433-4127 Non St.', 'Williams Lake', 'F' UNION ALL
	SELECT 'Anabella', 'Oconnor', '155-1487 Malesuada. St.', 'Bozeman', 'F' UNION ALL
	SELECT 'Ainsley', 'Bates', '120-7553 Sociis Ave', 'Langley', 'F' UNION ALL
	SELECT 'Paisley', 'Bird', '343-9595 Donec St.', 'Andong', 'F' UNION ALL
	SELECT 'Brooke', 'Colon', '488 Suspendisse Av.', 'Meix-Devant-Virton', 'F' UNION ALL
	SELECT 'Aubrey', 'Holden', '5844 In Rd.', 'Holman', 'F' UNION ALL
	SELECT 'Charlize', 'Ingram', '6834 Malesuada. Road', 'Guysborough', 'F' UNION ALL
	SELECT 'Valeria', 'Rogers', 'P.O. Box 791, 967 Dolor Avenue', 'Chimbote', 'F' UNION ALL
	SELECT 'Hayley', 'Lawson', 'P.O. Box 665, 6345 At, St.', 'Corte Brugnatella', 'F' UNION ALL
	SELECT 'Bella', 'Barry', 'Ap #692-503 Sed Rd.', 'Mglin', 'F' UNION ALL
	SELECT 'Jazlynn', 'Wheeler', '535-823 Faucibus St.', 'Kavaratti', 'F' UNION ALL
	SELECT 'Destinee', 'Pittman', 'Ap #667-7836 Vel St.', 'Macon', 'F' UNION ALL
	SELECT 'Presley', 'Bailey', 'P.O. Box 438, 5149 Id, Rd.', 'Kessenich', 'F' UNION ALL
	SELECT 'Juliette', 'Ferrell', '5455 Dolor, Avenue', 'Castiglione del Lago', 'F' UNION ALL
	SELECT 'Phoenix', 'Hodge', '5395 Vivamus St.', 'Illkirch-Graffenstaden', 'F' UNION ALL
	SELECT 'Kathryn', 'Harrison', 'Ap #926-6497 Sem, St.', 'Reutov', 'F' UNION ALL
	SELECT 'Trinity', 'Gallegos', 'P.O. Box 960, 3040 Magna. Avenue', 'Vandoies/Vintl', 'F' UNION ALL
	SELECT 'Brooklyn', 'Brown', 'P.O. Box 419, 3499 Dolor Ave', 'Raigarh', 'F' UNION ALL
	SELECT 'Viviana', 'Whitehead', '264-1110 A, Street', 'Ramara', 'F' UNION ALL
	SELECT 'Cherish', 'Fletcher', '779-2225 Morbi Rd.', 'Priolo Gargallo', 'F' UNION ALL
	SELECT 'Amara', 'Dennis', '2976 Aliquam Rd.', 'Sromness', 'F' UNION ALL
	SELECT 'Nayeli', 'Christensen', '156-4746 Maecenas St.', 'Ajaccio', 'F' UNION ALL
	SELECT 'Addison', 'Mays', 'P.O. Box 921, 5156 Dolor St.', 'Asnières-sur-Seine', 'F' UNION ALL
	SELECT 'Jewel', 'Carpenter', '6618 Molestie Rd.', 'Jackson', 'F' UNION ALL
	SELECT 'Izabelle', 'Dillon', 'P.O. Box 780, 5673 Cras Av.', 'San Costantino Calabro', 'F' UNION ALL
	SELECT 'Ireland', 'Payne', '720-5426 Felis St.', 'Oordegem', 'F' UNION ALL
	SELECT 'Maritza', 'Wilkins', 'Ap #275-7286 A St.', 'Thisnes', 'F' UNION ALL
	SELECT 'Jazlene', 'Byrd', 'Ap #372-7647 Augue Rd.', 'Seattle', 'F' UNION ALL
	SELECT 'Georgia', 'Calderon', '902-640 Aliquam Av.', 'Colina', 'F' UNION ALL
	SELECT 'Arielle', 'Vaughan', '818-7096 Lectus St.', 'Bazel', 'F' UNION ALL
	SELECT 'Amelie', 'Mercer', '9294 Risus. Av.', 'Rapagnano', 'F' UNION ALL
	SELECT 'Victoria', 'Boyd', '6430 Justo Street', 'Weyburn', 'F' UNION ALL
	SELECT 'Clara', 'Doyle', 'P.O. Box 431, 8061 Lectus St.', 'Tomé', 'F' UNION ALL
	SELECT 'Shelby', 'Cherry', 'Ap #109-5062 Ante Av.', 'Swansea', 'F' UNION ALL
	SELECT 'Lizbeth', 'David', 'P.O. Box 264, 1122 In St.', 'Garzón', 'F' UNION ALL
	SELECT 'Brooklyn', 'Henderson', '1671 Nulla Av.', 'Tillicoultry', 'F' UNION ALL
	SELECT 'Liana', 'Lloyd', 'Ap #187-473 In St.', 'Haveli', 'F' UNION ALL
	SELECT 'Iliana', 'Stafford', '145-7435 Gravida Road', 'Khanewal', 'F' UNION ALL
	SELECT 'Mckinley', 'Pope', 'Ap #955-7237 Elit. St.', 'Wiesbaden', 'F' UNION ALL
	SELECT 'Micah', 'Allison', 'P.O. Box 215, 7313 Dictum Avenue', 'Surabaya', 'F' UNION ALL
	SELECT 'Erika', 'Meyer', 'Ap #766-4858 Semper St.', 'Wilmington', 'F' UNION ALL
	SELECT 'Norah', 'Ryan', 'Ap #785-872 Volutpat. Rd.', 'Austin', 'F' UNION ALL
	SELECT 'Ximena', 'Perkins', '2583 Proin Av.', 'Arauca', 'F' UNION ALL
	SELECT 'Catherine', 'Potter', '4061 Nec, Rd.', 'Velaine-sur-Sambre', 'F' UNION ALL
	SELECT 'Kadence', 'Rivas', '797-9001 Ultrices St.', 'McCallum', 'F' UNION ALL
	SELECT 'Kaylee', 'Dorsey', '1387 Molestie Rd.', 'Cheyenne', 'F' UNION ALL
	SELECT 'Camille', 'Avila', '6068 Fringilla St.', 'Neder-Over-Heembeek', 'F' UNION ALL
	SELECT 'Rhianna', 'Mejia', 'Ap #468-7009 Interdum Ave', 'Futrono', 'F' UNION ALL
	SELECT 'Adyson', 'Graves', '108-2633 Cursus Av.', 'Incheon', 'F' UNION ALL
	SELECT 'Tianna', 'Kennedy', '914-4650 Purus St.', 'San Juan de Pasto', 'F' UNION ALL
	SELECT 'Sara', 'Gibbs', 'Ap #266-9596 Venenatis Road', 'Strasbourg', 'F' UNION ALL
	SELECT 'Yaritza', 'Richardson', '750-7882 Eget, Rd.', 'Goiânia', 'F' UNION ALL
	SELECT 'Kiana', 'Cantrell', 'Ap #714-5011 Aenean Avenue', 'Leverkusen', 'F' UNION ALL
	SELECT 'Brynn', 'Bonilla', '734-6450 Nunc Av.', 'Tarbes', 'F' UNION ALL
	SELECT 'Yoselin', 'Harris', 'P.O. Box 608, 6896 Ante. Av.', 'Kiel', 'F' UNION ALL
	SELECT 'Carina', 'Guerra', 'P.O. Box 163, 6559 Vitae, Rd.', 'Lampa', 'F' UNION ALL
	SELECT 'Jordan', 'Maynard', 'Ap #100-1738 Sed, Ave', 'Ulloa (Barrial)', 'F' UNION ALL
	SELECT 'Melanie', 'Mccarty', 'Ap #700-1544 Gravida Ave', 'Dornoch', 'F' UNION ALL
	SELECT 'Edith', 'Sweeney', 'Ap #305-9024 Mauris Avenue', 'Tribogna', 'F' UNION ALL
	SELECT 'Paloma', 'Walsh', '3976 Quam Ave', 'Okene', 'F' UNION ALL
	SELECT 'Jaylen', 'Lozano', '535-519 Vel St.', 'Wrigley', 'F' UNION ALL
	SELECT 'Iliana', 'Lucas', '6938 Dignissim St.', 'Tebing Tinggi', 'F' UNION ALL
	SELECT 'Edith', 'Stevenson', 'P.O. Box 791, 9498 Quam. St.', 'Priero', 'F' UNION ALL
	SELECT 'Ariana', 'Morse', 'P.O. Box 270, 2991 Fames Avenue', 'Bayswater', 'F' UNION ALL
	SELECT 'Luz', 'Collins', 'P.O. Box 158, 1109 Eros Ave', 'Meix-le-Tige', 'F' UNION ALL
	SELECT 'Denisse', 'Norton', 'P.O. Box 582, 2899 Scelerisque St.', 'Brechin', 'F' UNION ALL
	SELECT 'Jacquelyn', 'Lara', '360-8271 Sem Ave', 'Sahagún', 'F' UNION ALL
	SELECT 'Marin', 'Park', 'P.O. Box 240, 1335 Purus. Avenue', 'Reno', 'F' UNION ALL
	SELECT 'Natalia', 'Freeman', '421-4633 Est St.', 'Kirkland', 'F' UNION ALL
	SELECT 'Justice', 'Bray', '202-2288 Commodo St.', 'Osogbo', 'F' UNION ALL
	SELECT 'Janessa', 'Church', '910-8917 Vivamus Road', 'Mahbubnagar', 'F' UNION ALL
	SELECT 'Shirley', 'Berg', 'P.O. Box 417, 3949 Egestas. Street', 'Cajamarca', 'F' UNION ALL
	SELECT 'Alexandra', 'Gutierrez', '7749 Luctus Street', 'Lexington', 'F' UNION ALL
	SELECT 'Sanaa', 'Brooks', 'P.O. Box 359, 2383 Aliquet Ave', 'Mantova', 'F' UNION ALL
	SELECT 'Makena', 'Mccullough', '8773 Justo St.', 'Dumai', 'F' UNION ALL
	SELECT 'Makenna', 'Durham', 'P.O. Box 532, 1312 Penatibus Ave', 'Andalo', 'F' UNION ALL
	SELECT 'Katherine', 'Ritter', '9480 Odio St.', 'Sasaram', 'F' UNION ALL
	SELECT 'Justice', 'Olsen', 'P.O. Box 371, 5615 Sed, St.', 'Sint-Ulriks-Kapelle', 'F' UNION ALL
	SELECT 'Miriam', 'Murray', '8246 In Street', 'Medea', 'F' UNION ALL
	SELECT 'Bianca', 'Allen', 'Ap #149-6542 Velit. St.', 'Olivar', 'F' UNION ALL
	SELECT 'Aliana', 'Dominguez', 'Ap #444-1009 Aliquam Av.', 'Northallerton', 'F' UNION ALL
	SELECT 'Parker', 'Warner', '787 Mollis. Road', 'Passau', 'F' UNION ALL
	SELECT 'Litzy', 'Cunningham', 'Ap #907-2727 Vulputate, Rd.', 'Zedelgem', 'F' UNION ALL
	SELECT 'Anastasia', 'Cowan', 'Ap #821-1662 Nulla St.', 'Grembergen', 'F' UNION ALL
	SELECT 'Arely', 'Mooney', 'Ap #603-8663 Eu Street', 'Neudörfl', 'F' UNION ALL
	SELECT 'Natalia', 'Vang', '9589 Non Av.', 'Königs Wusterhausen', 'F' UNION ALL
	SELECT 'Janiya', 'Rojas', 'Ap #359-2363 Mi. Road', 'Vlezenbeek', 'F' UNION ALL
	SELECT 'Kianna', 'Sanchez', 'Ap #840-8025 Tincidunt Rd.', 'Hangu', 'F' UNION ALL
	SELECT 'Iyana', 'Chambers', 'Ap #524-9405 Mauris Ave', 'Montebello', 'F' UNION ALL
	SELECT 'Alisson', 'Dixon', 'P.O. Box 217, 2226 Sem Rd.', 'Seogwipo', 'F' UNION ALL
	SELECT 'Kassidy', 'Johnson', 'P.O. Box 585, 6744 Cras Av.', 'Tranent', 'F' UNION ALL
	SELECT 'Carley', 'Casey', 'Ap #428-331 In Rd.', 'San Vicente de Cañete', 'F' UNION ALL
	SELECT 'Lia', 'Thomas', '9181 Dictum St.', 'Jamioulx', 'F' UNION ALL
	SELECT 'Mila', 'Estrada', '903-4977 Ac Avenue', 'Sant Angelo a Cupolo', 'F' UNION ALL
	SELECT 'Areli', 'Logan', '462-1099 Diam Avenue', 'Fahler', 'F' UNION ALL
	SELECT 'Rosa', 'Frederick', '746-6177 Pellentesque Ave', 'Smithers', 'F' UNION ALL
	SELECT 'Miriam', 'Cox', '7853 Elementum, Rd.', 'Merbes-Sainte-Marie', 'F' UNION ALL
	SELECT 'Kamryn', 'Frazier', '985 Volutpat Av.', 'Oranienburg', 'F' UNION ALL
	SELECT 'Savanna', 'Gardner', '203-6291 Elit. Road', 'Freirina', 'F' UNION ALL
	SELECT 'Jazlynn', 'Monroe', '464 Laoreet St.', 'Miranda', 'F' UNION ALL
	SELECT 'Sadie', 'Strickland', 'Ap #408-2650 Felis. Street', 'Bragança', 'F' UNION ALL
	SELECT 'Carly', 'Rich', 'Ap #252-6230 Elit Av.', 'Dagelis', 'F' UNION ALL
	SELECT 'Raelynn', 'Wong', 'Ap #272-8657 Nunc Ave', 'Campagna', 'F' UNION ALL
	SELECT 'Evie', 'Fleming', '1606 Phasellus Ave', 'Montacuto', 'F' UNION ALL
	SELECT 'Anahi', 'Ramos', '628-1712 Mauris St.', 'Las Vegas', 'F' UNION ALL
	SELECT 'Marley', 'Hurley', '185-342 Risus. Road', 'Stargard Szczeciński', 'F' UNION ALL
	SELECT 'Aliana', 'Rodgers', 'P.O. Box 859, 5990 Quis Rd.', 'Newton Abbot', 'F' UNION ALL
	SELECT 'India', 'Stephenson', '261-5024 Hendrerit Rd.', 'New Westminster', 'F' UNION ALL
	SELECT 'Nathalia', 'Miles', 'Ap #691-1607 A, Road', 'Winnipeg', 'F' UNION ALL
	SELECT 'Kailey', 'Tucker', '3200 Molestie Rd.', 'Beauwelz', 'F' UNION ALL
	SELECT 'Jewel', 'Marks', 'P.O. Box 721, 7795 Lectus Rd.', 'Antakya', 'F' UNION ALL
	SELECT 'Cassandra', 'Anderson', '358-746 Tincidunt Av.', 'Großpetersdorf', 'F' UNION ALL
	SELECT 'Lauryn', 'Francis', '1015 Sed Av.', 'Sandviken', 'F' UNION ALL
	SELECT 'Lila', 'Stevens', 'Ap #523-5718 Metus. Ave', 'Portland', 'F' UNION ALL
	SELECT 'Arabella', 'Shepard', 'Ap #240-9632 Erat Ave', 'Denver', 'F' UNION ALL
	SELECT 'Delilah', 'Elliott', 'P.O. Box 172, 4250 Donec Street', 'Sudbury', 'F' UNION ALL
	SELECT 'Emily', 'Lewis', '879-1829 Eleifend Ave', 'Frascati', 'F' UNION ALL
	SELECT 'Hallie', 'Stokes', 'Ap #605-3624 Ipsum St.', 'Castelluccio Valmaggiore', 'F' UNION ALL
	SELECT 'Lisa', 'Harrell', 'Ap #900-4676 Justo St.', 'Colchester', 'F' UNION ALL
	SELECT 'Skyla', 'Simmons', 'Ap #570-1790 Arcu Road', 'Lowell', 'F' UNION ALL
	SELECT 'Miracle', 'Mcneil', 'P.O. Box 584, 6721 Integer Rd.', 'Warwick', 'F' UNION ALL
	SELECT 'Dana', 'Gonzalez', '2024 Malesuada Av.', 'Tavistock', 'F' UNION ALL
	SELECT 'Sanaa', 'Blackburn', '6830 Metus. Road', 'Malartic', 'F' UNION ALL
	SELECT 'Dana', 'Melendez', 'P.O. Box 235, 973 Eu Street', 'St. Thomas', 'F' UNION ALL
	SELECT 'Abagail', 'Coffey', '241-4053 Magna, Av.', 'Archennes', 'F' UNION ALL
	SELECT 'Paris', 'Huynh', '2874 Sit St.', 'Copertino', 'F' UNION ALL
	SELECT 'Belen', 'Zhang', '8156 Sagittis. St.', 'Mandya', 'F' UNION ALL
	SELECT 'Allison', 'Wiley', '3014 Imperdiet Ave', 'Montreal', 'F' UNION ALL
	SELECT 'Lisa', 'Pearson', '8844 Tellus. Road', 'Zelem', 'F' UNION ALL
	SELECT 'Janiyah', 'Benson', 'Ap #973-1724 Aliquet Rd.', 'Heredia', 'F' UNION ALL
	SELECT 'Aiyana', 'Richard', '5149 Elit, Rd.', 'Auburn', 'F' UNION ALL
	SELECT 'Charlotte', 'Frank', 'Ap #194-3314 Mauris. Rd.', 'Cardedu', 'F' UNION ALL
	SELECT 'Ann', 'Holt', '6733 Magna. St.', 'Kalyan', 'F' UNION ALL
	SELECT 'Emelia', 'Donaldson', '462-5063 Eget Rd.', 'Cerreto di Spoleto', 'F' UNION ALL
	SELECT 'Melany', 'Farrell', 'Ap #511-3327 Fames Ave', 'Luziânia', 'F' UNION ALL
	SELECT 'Saniya', 'Mckenzie', '203-8324 Sociis Rd.', 'Guri', 'F' UNION ALL
	SELECT 'Cecilia', 'Walton', 'P.O. Box 307, 1110 Id, Av.', 'Ankara', 'F' UNION ALL
	SELECT 'Annabel', 'Adams', '8995 Massa Av.', 'Louvain-la-Neuve', 'F' UNION ALL
	SELECT 'Madilyn', 'Sanford', 'P.O. Box 768, 6523 Dis Rd.', 'Casacalenda', 'F' UNION ALL
	SELECT 'Nevaeh', 'Sloan', 'P.O. Box 740, 6615 Risus. Road', 'Reutov', 'F' UNION ALL
	SELECT 'Aubree', 'Dunn', '726-738 Metus Road', 'Grand-Hallet', 'F' UNION ALL
	SELECT 'Brooklyn', 'Castaneda', 'Ap #783-9320 Lorem Rd.', 'San Vicente del Caguán', 'F' UNION ALL
	SELECT 'Naima', 'Santiago', 'Ap #837-6758 Fringilla Road', 'Lloydminster', 'F' UNION ALL
	SELECT 'Sara', 'Herrera', 'P.O. Box 462, 5424 Tellus Rd.', 'Santa Rosa de Cabal', 'F' UNION ALL
	SELECT 'Cloe', 'Obrien', '657-6123 Justo Rd.', 'Shawinigan', 'F' UNION ALL
	SELECT 'Kylee', 'Solomon', 'Ap #734-1204 Litora Ave', 'Duisburg', 'F' UNION ALL
	SELECT 'Kennedy', 'Bean', '553-1775 Convallis Road', 'Gentinnes', 'F' UNION ALL
	SELECT 'Micaela', 'White', '933-4220 Quis Street', 'Raurkela', 'F' UNION ALL
	SELECT 'Olive', 'Wilson', 'Ap #741-8695 Diam. Street', 'Pucón', 'F' UNION ALL
	SELECT 'Mira', 'Summers', 'Ap #649-577 Augue. Road', 'Cirencester', 'F' UNION ALL
	SELECT 'Sophia', 'King', '8600 Accumsan Av.', 'Castlegar', 'F' UNION ALL
	SELECT 'Kennedy', 'Knight', 'Ap #626-5525 Vulputate, Rd.', 'Fort Wayne', 'F' UNION ALL
	SELECT 'Jayda', 'Goodman', 'Ap #773-5422 Mollis. Rd.', 'Ghislarengo', 'F' UNION ALL
	SELECT 'Casey', 'Barber', 'Ap #907-2626 Non Rd.', 'Minervino di Lecce', 'F' UNION ALL
	SELECT 'Angel', 'Hansen', 'Ap #160-9113 Aliquet Av.', 'Tuktoyaktuk', 'F' UNION ALL
	SELECT 'Kaylyn', 'Hanson', 'P.O. Box 695, 8564 Ridiculus St.', 'Bellevue', 'F' UNION ALL
	SELECT 'Josie', 'Flowers', 'Ap #861-5442 Morbi Rd.', 'Mexico City', 'F' UNION ALL
	SELECT 'Kadence', 'Henson', 'Ap #600-3687 Eu Avenue', 'San Chirico Nuovo', 'F' UNION ALL
	SELECT 'Guadalupe', 'Carson', '608-7613 Tincidunt St.', 'Gävle', 'F' UNION ALL
	SELECT 'Kayley', 'Weaver', 'Ap #811-7539 Egestas, Avenue', 'Salisbury', 'F' UNION ALL
	SELECT 'Ciara', 'Le', '990-4230 Magna Road', 'Halle', 'F' UNION ALL
	SELECT 'Averi', 'Middleton', 'Ap #910-2500 Lacus. St.', 'Minto', 'F' UNION ALL
	SELECT 'Kassidy', 'Fry', '475-6350 Integer St.', 'Gloucester', 'F' UNION ALL
	SELECT 'Joselyn', 'Pacheco', '4334 Consectetuer, Avenue', 'Haarlem', 'F' UNION ALL
	SELECT 'Karina', 'Becker', 'P.O. Box 357, 8738 Blandit Avenue', 'Nieuwkerken-Waas', 'F' UNION ALL
	SELECT 'Adison', 'Copeland', 'P.O. Box 159, 8670 Congue. Rd.', 'Düsseldorf', 'F' UNION ALL
	SELECT 'Rachel', 'Lynn', 'P.O. Box 316, 7362 Molestie Rd.', 'Lake Cowichan', 'F' UNION ALL
	SELECT 'Maritza', 'Foster', '619-2656 Luctus Rd.', 'Bergerac', 'F' UNION ALL
	SELECT 'Katelyn', 'Wilkerson', '3086 Molestie. Av.', 'Melsbroek', 'F' UNION ALL
	SELECT 'Miah', 'Bass', '1374 Tortor, St.', 'Huizingen', 'F' UNION ALL
	SELECT 'Courtney', 'Landry', 'P.O. Box 445, 8492 Dolor, Ave', 'Słupsk', 'F' UNION ALL
	SELECT 'Theresa', 'Stark', '685 Aliquam Road', 'Crawley', 'F' UNION ALL
	SELECT 'Breanna', 'Perez', 'Ap #520-2714 Lacinia St.', 'West Valley City', 'F' UNION ALL
	SELECT 'Mary', 'Vazquez', '933-4596 Quisque Ave', 'Kessel', 'F' UNION ALL
	SELECT 'Reagan', 'Gillespie', '4443 Ante Ave', 'Ramillies', 'F' UNION ALL
	SELECT 'Teresa', 'Fuller', 'Ap #179-6669 Cras Avenue', 'Amiens', 'F' UNION ALL
	SELECT 'Zoie', 'Lowery', '440-2910 Non, St.', 'Denver', 'F' UNION ALL
	SELECT 'Siena', 'Hill', 'P.O. Box 784, 7913 Amet, St.', 'Medicine Hat', 'F' UNION ALL
	SELECT 'Lyric', 'Richmond', 'Ap #937-2522 Pede, St.', 'Kingston', 'F' UNION ALL
	SELECT 'Armani', 'Morales', '725-8296 Nulla Av.', 'Drogenbos', 'F' UNION ALL
	SELECT 'Heaven', 'Nunez', 'P.O. Box 501, 7633 Ullamcorper. Avenue', 'Eernegem', 'F' UNION ALL
	SELECT 'Ivy', 'Briggs', 'Ap #531-9008 Libero Road', 'Siliguri', 'F' UNION ALL
	SELECT 'Londyn', 'Bowman', '105-5843 Erat, Rd.', 'Baisy-Thy', 'F' UNION ALL
	SELECT 'Lily', 'Stanley', '235-5178 Proin Rd.', 'Cisnes', 'F' UNION ALL
	SELECT 'Frances', 'York', 'Ap #672-9680 Mollis Av.', 'Vielsalm', 'F' UNION ALL
	SELECT 'Mariyah', 'Morton', '3244 Augue Avenue', 'Lapscheure', 'F' UNION ALL
	SELECT 'Sylvia', 'Moyer', '6804 Erat St.', 'Gasteiz', 'F' UNION ALL
	SELECT 'Corinne', 'Mariol', '643-1193 Commodo Ave', 'Beverley', 'F'
) d

/* CHECK FOR DUPLICATES

SELECT firstname + ' ' + lastname, COUNT(*)
FROM #Patients
GROUP BY firstname + ' ' + lastname
HAVING COUNT(*) > 1;

WITH AllPatients
AS
(
	SELECT DISTINCT
		p1.firstname [firstname]
		, p2.lastname [lastname]
		, p1.address [address]
		, p1.city [city]
	FROM #Patients p1
		CROSS JOIN #Patients p2
)
SELECT firstname + ' ' + lastname, [address],  COUNT(*)
FROM AllPatients
GROUP BY firstname + ' ' + lastname, [address]
HAVING COUNT(*) > 1;
*/

TRUNCATE TABLE dbo.test_patients

INSERT INTO dbo.test_patients(
    [firstname]
	, [lastname]
	, [address1]
	, [address2]
	, [city]
	, [zip]
	, [date_of_birth]
	, [gender]
)
SELECT
	[firstname]
	, [lastname]
	, [address1]
	, [address2]
	, [city]
	, 10000 + ABS(CHECKSUM(NEWID())) % 90000 AS [zip] -- 10 000 - 99 999
	, CAST(DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 32850 ), '1920-01-01') AS DATE) AS [date_of_birth] -- 90 years (1920-2010)
	, [gender]
FROM (
	SELECT DISTINCT TOP 300000
		p1.firstname AS [firstname]
		, p2.lastname AS [lastname]
		, p1.address AS [address1]
		, CASE
			WHEN p2.address NOT LIKE 'P.O. Box%' THEN NULL
			ELSE  p2.address
		  END AS [address2]
		, p1.city AS [city]
		, p1.gender
	FROM #Patients p1
		CROSS JOIN #Patients p2
) d



-----------------------------------------------------------------------------------------------------------------------
--PRICES---------------------------------------------------------------------------------------------------------------
-- valim_from < valid_to by using CROSS APPLY


TRUNCATE TABLE [dbo].[test_prices]

INSERT INTO [dbo].[test_prices](
	[activity_id]
	, [price]
	, [valid_from]
	, [valid_to]
)
SELECT 
	id AS [activity_id]
	, 10 + ABS(CHECKSUM(NEWID())) % 191 AS [price] -- 10-200
	, a.valid_from AS [valid_from]
	, DATEADD(DAY, ABS(CHECKSUM(NEWID()) % DATEDIFF(DAY, a.valid_from, GETDATE()) ), a.valid_from) AS [valid_to]
FROM [dbo].[test_activities]
	CROSS APPLY (
		SELECT CAST(DATEADD(DAY, ABS(CHECKSUM(NEWID()) % 10950 ), '1990-01-01') AS DATE) AS [valid_from] -- 30 years
	) AS a




-----------------------------------------------------------------------------------------------------------------------
--MEDICAL TRAJECTORY---------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
--Map trajects to patients at random. Each of the patients must be mapped to at least 1 traject.

DECLARE @randCount INT;
DECLARE @MaxPatientId INT = (SELECT MAX(patientid)
					  FROM [dbo].[test_patients]
					 )

SET @randCount = ABS((CHECKSUM(NEWID()))) % 200000 + 1; -- add another random 1-200 000 rows


TRUNCATE TABLE [dbo].[test_medical_trajectory]

INSERT INTO [dbo].[test_medical_trajectory](
	[patient_id]
)
SELECT * FROM (
	SELECT 	TOP (@MaxPatientId) -- TOP because of UNION and ORDER BY NEWID()
		patientid
	FROM [dbo].[test_patients]
	ORDER BY NEWID()
) a
UNION ALL
SELECT * FROM (
	SELECT TOP (@randCount) patientid
	FROM [dbo].[test_patients]
	ORDER BY NEWID()
) b;
GO



-----------------------------------------------------------------------------------------------------------------------
--TRAJECTORY DETAIL---------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------

--This view is neccessary because function NEWID() is nondeterministic and cannot be used within GetDatePerformed function
CREATE OR ALTER VIEW dbo.VNEWID
AS
SELECT NEWID() AS vNEWID;
GO

--GetDatePerformed function was created to encapsulate logic
CREATE OR ALTER FUNCTION GetDatePerformed(@trajectId INT)
RETURNS DATE
AS
BEGIN
	DECLARE @yearsPast INT = -2; -- all activities should be randomly distributed 2 years to the past
	DECLARE @daysPast INT = 730 
	DECLARE @timeRange INT = 92; -- Date performed for activities within the same traject cannot be more than 3 months apart
	DECLARE @newID UNIQUEIDENTIFIER;
	DECLARE @datePerformed DATE;

	SELECT @newID = VNEWID FROM VNEWID;
	SET @datePerformed = DATEADD(DAY, (@trajectId % (@daysPast - @timeRange) + ABS(CHECKSUM(@newID)) % @timeRange), DATEADD(YEAR, @yearsPast, CAST(GETDATE() AS DATE)));

	RETURN @datePerformed;
END;
GO


DROP TABLE IF EXISTS #TrajctoryDetail;

DECLARE @randCount INT;
DECLARE @randCount2 INT = ABS((CHECKSUM(NEWID()))) % 3 + 1;
DECLARE @InitCount INT;
DECLARE @MaxTrajectoryId INT = (SELECT MAX(traject_id)
					  FROM [dbo].[test_medical_trajectory]
					 )
DECLARE @MaxActivityId INT = (SELECT MAX(id)
					  FROM [dbo].[test_activities]
					 );

SELECT 
	mt1.traject_id AS [traject_id]
	, ABS((CHECKSUM(NEWID()))) % @MaxActivityId + 1 AS [activity_id]
	INTO #TrajctoryDetail
FROM [dbo].[test_medical_trajectory] mt1
	CROSS JOIN [dbo].[test_medical_trajectory] mt2
WHERE mt1.traject_id < @MaxTrajectoryId
	AND mt2.traject_id <= 3


SELECT @InitCount = COUNT(*) FROM #TrajctoryDetail
SET @randCount = 5000000 - @InitCount
SET @randCount2 = CHECKSUM(@randCount / @MaxTrajectoryId) + 1

TRUNCATE TABLE [dbo].[test_trajectory_detail]

INSERT INTO [dbo].[test_trajectory_detail] (
	[traject_id]
	, [activity_id]
	, [date_performed]
)
SELECT 
	traject_id
	, activity_id
	, dbo.GetDatePerformed(traject_id) AS [date_performed]
FROM #TrajctoryDetail
UNION ALL
SELECT * FROM (
	SELECT TOP (@randCount)
		mt1.traject_id AS [traject_id]
		, ABS((CHECKSUM(NEWID()))) % @MaxActivityId + 1 AS [activity_id]
		, dbo.GetDatePerformed(mt1.traject_id) AS [date_performed]
	FROM [dbo].[test_medical_trajectory] mt1
		CROSS JOIN [dbo].[test_medical_trajectory] mt2
	WHERE mt1.traject_id <= @randCount
		AND mt2.traject_id <= @randCount2
	ORDER BY NEWID()
) b;



/*
SELECT COUNT(*) FROM [dbo].[test_medical_trajectory];
SELECT COUNT(*) FROM [dbo].[test_trajectory_detail];
SELECT COUNT(*) FROM [dbo].[test_patients];
SELECT COUNT(*) FROM [dbo].[test_prices];
SELECT COUNT(*) FROM [dbo].[test_activities];
SELECT COUNT(*) FROM [dbo].[test_treatment_categories];
SELECT COUNT(*) FROM [dbo].[test_treatment_subcategories];

SELECT TOP 10 * FROM [dbo].[test_medical_trajectory];
SELECT TOP 10 * FROM [dbo].[test_trajectory_detail];
SELECT TOP 10 * FROM [dbo].[test_patients];
SELECT TOP 10 * FROM [dbo].[test_prices];
SELECT TOP 10 * FROM [dbo].[test_activities];
SELECT TOP 10 * FROM [dbo].[test_treatment_categories];
SELECT TOP 10 * FROM [dbo].[test_treatment_subcategories];
*/












