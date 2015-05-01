--[**] Incidenten [**]--
select dataanmk as "aanmaak datum" ,naam ,ref_status as "status" ,externnummer,ref_domein + ' - ' + ref_specificatie as "categorie en subcategorie", ref_operatordynanaam as "behandelaar" , aanmeldernaam as "aanmelder"
from incident  
where ref_status = 'gepland' or ref_status = 'in behandeling' or ref_status = 'ingekomen' or ref_status like 'wacht%'
group by dataanmk,ref_domein,ref_specificatie,ref_status,ref_operatordynanaam,aanmeldernaam,naam,externnummer
order by naam desc

--hiero
select cast(dataanmk as DATE) as "Datum", count(*) as "count datum",ref_operatordynanaam
from incident
where ref_operatordynanaam = any
(
	select distinct(ref_operatordynanaam)
	from incident
	where ref_operatordynanaam = 'Hennie Bulthuis' and cast(dataanmk as DATE) < dateadd(MONTH,10,SYSDATETIME()) --or
	    --  ref_operatordynanaam = 'Gerben Grootenhuis' and cast(dataanmk as DATE) < dateadd(day,-10,SYSDATETIME()) or
        --  ref_operatordynanaam = 'Henk Westra' and cast(dataanmk as DATE) < dateadd(day,-10,SYSDATETIME())
)
and ref_status != 'opgelost' and ref_status not like 'Wachten op%' and afgemeld = 0
group by cast(dataanmk as date),ref_operatordynanaam
order by cast(dataanmk as date) desc
--tot hier

select isnull(naam,'naamloos')"naam", isnull(actie,'geen actie')"Actie",isnull(verzoek,'geen verzoek')"Verzoek"
from incident
order by naam desc


-- dit telt de aantal incidenten per domein (Metacom,Diversen,Connect-IT,Mendix)
select count(ref_domein), ref_domein
from incident
where ref_domein = '' or ref_domein = 'Diversen' or ref_domein = 'Connect-IT' or ref_domein = 'mendix' or ref_domein = 'matrix' or ref_domein = 'specifieke applicaties' or ref_domein = 'ict middelen' or ref_domein = 'autodesk' or ref_domein = 'ms office' or ref_domein = 'metacom' or ref_domein = 'dms' or ref_domein = 'cobra'
group by ref_domein
order by count(ref_domein)

select g.naam
from gebruiker g

select *
from actiedoor 

select inlognaam , *
from gebruiker
where inlognaam = 'kme2' or inlognaam = 'hbu1' or inlognaam = 'ggr2' or inlognaam = 'hwe1' or inlognaam = 'dde2'

select Distinct(ref_operatordynanaam) 
from incident

select g.naam as "g.naam",i.ref_operatordynanaam as "i.ref_operatordynanaam",i.operatorid,i.persoonid,g.*
from incident i
right outer join gebruiker g on g.naam = i.ref_operatordynanaam 
where g.naam = 'Kevin Mensink'
order by g.naam

select i.naam, i.aanmeldernaam,i.ref_vestiging,g.naam as "behandelaar",i.actie,i.verzoek,i.korteomschrijving,i.dataanmk,i.ref_status
from incident i
right outer join gebruiker g on g.naam = i.ref_operatordynanaam
right outer join persoon p on p.loginnaamnetwerk = g.inlognaam
where  i.aanmeldernaam is not null and i.ref_vestiging like 'ol%' and i.ref_status != 'opgelost' and i.afgemeld != 1
order by i.dataanmk desc

select ref_status,naam,korteomschrijving
from incident
order by naam asc

SELECT aanmeldernaam, ref_vestiging, ref_operatordynanaam AS behandelaar, naam, i.[status], dataanmk, ref_status, korteomschrijving
FROM incident AS i 
WHERE (aanmeldernaam IS NOT NULL) AND (ref_status <> 'opgelost') and afgemeld = 0 
ORDER BY naam DESC

/*
deel van de toekomst zien van meldingen en een (iets groter) deel van het verleden zodat het overzicht duidelijker is wat er gaat komen/is geweest
*/

select cast(datumafspraak as date)as "Afspraak datum",cast(datwijzig as date) as "wijzigings datum" , naam, korteomschrijving,ref_operatordynanaam
from incident
where
ref_operatordynanaam = 'Hennie Bulthuis' and datumafspraak between datumaangemeld and DATEADD(DAY,90,datwijzig) and ref_status not like 'wacht%' and ref_status != 'opgelost' and afgemeld = 0 or ref_operatordynanaam = 'Hennie Bulthuis' and datumafspraak between datumaangemeld and DATEADD(DAY,-90,datumaangemeld) and ref_status not like 'wacht%' and ref_status != 'opgelost' and afgemeld = 0 or
ref_operatordynanaam = 'Henk Westra' and datumafspraak between datumaangemeld and DATEADD(DAY,90,datwijzig) and ref_status not like 'wacht%' and ref_status != 'opgelost' and afgemeld = 0 or ref_operatordynanaam = 'Henk Westra' and datumafspraak between datumaangemeld and DATEADD(DAY,-90,datumaangemeld) and ref_status not like 'wacht%' and ref_status != 'opgelost' and afgemeld = 0 or
ref_operatordynanaam = 'Gerben Grootenhuis' and datumafspraak between datumaangemeld and DATEADD(DAY,90,datwijzig) and ref_status not like 'wacht%' and ref_status != 'opgelost' and afgemeld = 0 or ref_operatordynanaam = 'Gerben Grootenhuis' and datumafspraak between datumaangemeld and DATEADD(DAY,-90,datumaangemeld) and ref_status not like 'wacht%' and ref_status != 'opgelost' and afgemeld = 0
order by datumaangemeld desc

--waar is deze voor?
select cast(datwijzig as date) as "wijzigings datum",naam
from incident
where 
ref_operatordynanaam = 'Hennie bulthuis' and ref_status != 'Opgelost' and ref_status not like 'wacht%' and afgemeld = 0 or
ref_operatordynanaam = 'Henk Westra' and ref_status != 'Opgelost' and ref_status not like 'wacht%' and afgemeld = 0 or
ref_operatordynanaam = 'Gerben Grootenhuis' and ref_status != 'Opgelost' and ref_status not like 'wacht%' and afgemeld = 0
order by datwijzig desc
-- geen idee

--hiero
select cast(dataanmk as DATE) as "Datum", count(*) as "count datum",ref_operatordynanaam
from incident
where ref_operatordynanaam = any
(
	select distinct(ref_operatordynanaam)
	from incident
	where 
	ref_operatordynanaam = 'Hennie Bulthuis' and datumafspraak between datumaangemeld and DATEADD(DAY,7, cast(GETDATE() as date)) and ref_status not like 'wacht%' and ref_status != 'opgelost' and afgemeld = 0 and ref_operatordynanaam = 'Hennie Bulthuis' and datumafspraak between datumaangemeld and DATEADD(DAY,-7,cast(GETDATE() as date)) and ref_status not like 'wacht%' and ref_status != 'opgelost' and afgemeld = 0 or
	ref_operatordynanaam = 'Henk Westra' and datumafspraak between datumaangemeld and DATEADD(DAY,7,cast(GETDATE() as date)) and ref_status not like 'wacht%' and ref_status != 'opgelost' and afgemeld = 0 and ref_operatordynanaam = 'Henk Westra' and datumafspraak between datumaangemeld and DATEADD(DAY,-7,cast(GETDATE() as date)) and ref_status not like 'wacht%' and ref_status != 'opgelost' and afgemeld = 0 or
	ref_operatordynanaam = 'Gerben Grootenhuis' and datumafspraak between datumaangemeld and DATEADD(DAY,7,cast(GETDATE() as date)) and ref_status not like 'wacht%' and ref_status != 'opgelost' and afgemeld = 0 and ref_operatordynanaam = 'Gerben Grootenhuis' and datumafspraak between datumaangemeld and DATEADD(DAY,-7,cast(GETDATE() as date)) and ref_status not like 'wacht%' and ref_status != 'opgelost' and afgemeld = 0
)
and datumafspraak between datumaangemeld and DATEADD(DAY,7,cast(GETDATE() as date)) and ref_status not like 'wacht%' and ref_status != 'opgelost' and afgemeld = 0 and datumafspraak between datumaangemeld and DATEADD(DAY,-7,cast(GETDATE() as date)) and ref_status not like 'wacht%' and ref_status != 'opgelost' and afgemeld = 0
group by cast(dataanmk as date),ref_operatordynanaam
order by cast(dataanmk as date) desc
--tot hier

select ref_status,count(ref_operatordynanaam) as "meldingen per",cast(datumaangemeld as date) as "Datum aangemeld"
from incident
where ref_operatordynanaam = any
(
	select ref_operatordynanaam
	from incident
	where
	   ref_operatordynanaam = 'Hennie Bulthuis' and datumafspraak between datumaangemeld and DATEADD(DAY,-21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or ref_operatordynanaam = 'Hennie Bulthuis' and datumafspraak between datumaangemeld and DATEADD(DAY,21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or
           ref_operatordynanaam = 'Henk Westra' and datumafspraak between datumaangemeld and DATEADD(DAY,-21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or ref_operatordynanaam = 'Henk Westra' and datumafspraak between datumaangemeld and DATEADD(DAY,21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or
	ref_operatordynanaam = 'Gerben Grootenhuis' and datumafspraak between datumaangemeld and DATEADD(DAY,-21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or ref_operatordynanaam = 'Gerben Grootenhuis' and datumafspraak between datumaangemeld and DATEADD(DAY,21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or
	ref_operatordynanaam = 'Ernst-Jan Companje' and datumafspraak between datumaangemeld and DATEADD(DAY,-21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or ref_operatordynanaam = 'Ernst-Jan Companje' and datumafspraak between datumaangemeld and DATEADD(DAY,21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or
ref_operatordynanaam = 'Helpdesk/Systeembeheer' and datumafspraak between datumaangemeld and DATEADD(DAY,-21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or ref_operatordynanaam = 'Helpdesk/Systeembeheer' and datumafspraak between datumaangemeld and DATEADD(DAY,21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or
	  ref_operatordynanaam = 'Applicatiebeheer' and datumafspraak between datumaangemeld and DATEADD(DAY,-21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or ref_operatordynanaam = 'Applicatiebeheer' and datumafspraak between datumaangemeld and DATEADD(DAY,21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0
)
and 
	   ref_operatordynanaam = 'Hennie Bulthuis' and datumafspraak between datumaangemeld and DATEADD(DAY,-21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or ref_operatordynanaam = 'Hennie Bulthuis' and datumafspraak between datumaangemeld and DATEADD(DAY,21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or
		   ref_operatordynanaam = 'Henk Westra' and datumafspraak between datumaangemeld and DATEADD(DAY,-21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or ref_operatordynanaam = 'Henk Westra' and datumafspraak between datumaangemeld and DATEADD(DAY,21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or
	ref_operatordynanaam = 'Gerben Grootenhuis' and datumafspraak between datumaangemeld and DATEADD(DAY,-21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or ref_operatordynanaam = 'Gerben Grootenhuis' and datumafspraak between datumaangemeld and DATEADD(DAY,21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or
	ref_operatordynanaam = 'Ernst-Jan Companje' and datumafspraak between datumaangemeld and DATEADD(DAY,-21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or ref_operatordynanaam = 'Ernst-Jan Companje' and datumafspraak between datumaangemeld and DATEADD(DAY,21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or
ref_operatordynanaam = 'Helpdesk/Systeembeheer' and datumafspraak between datumaangemeld and DATEADD(DAY,-21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or ref_operatordynanaam = 'Helpdesk/Systeembeheer' and datumafspraak between datumaangemeld and DATEADD(DAY,21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or
	  ref_operatordynanaam = 'Applicatiebeheer' and datumafspraak between datumaangemeld and DATEADD(DAY,-21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 or ref_operatordynanaam = 'Applicatiebeheer' and datumafspraak between datumaangemeld and DATEADD(DAY,21,cast(GETDATE() as date)) and ref_status like '%ingekomen%' and afgemeld = 0 
group by cast(dataanmk as date), ref_status,cast(datumaangemeld as date)
having count(*) > 0
order by cast(datumaangemeld as date) desc

--
select cast(dataanmk as DATE) as "Datum", count(ref_operatordynanaam) as "count datum"
from incident
where ref_operatordynanaam = any
(
	select (ref_operatordynanaam)
	from incident
	where 
	datumafspraak between datumaangemeld and CAST(GETDATE() as date) and ref_status not like 'wacht%' and ref_status != 'opgelost' and afgemeld = 0
)
and DATEPART(YEAR,dataanmk) > 2014
group by CAST(dataanmk as date)
order by CAST(dataanmk as date) desc
--

select cast(datumafspraak as date) "Datum afspraak",naam
from incident
where datumafspraak < DATEDIFF(DAY,dateadd(day,-7,getdate()),DATEADD(day,7,getdate()))
order by naam desc

select count(datumafspraak) from incident
where datumafspraak is null
group by datumafspraak

select cast(getdate() -1 as date)

select distinct ref_operatordynanaam
from incident

--totaal van begin vorig jaar(2014)
select count(naam)
from incident
where cast(dataanmk as date) > '2014-01-01' and afgemeld = 0

--totaal vandaag
select count(naam)
from incident
where cast(dataanmk as date) = cast(SYSDATETIME() as date) and afgemeld = 0

--totaal gisteren, deze moet morgen nog een keer worden getest ivm incorrect tijdsverschil
select count(naam)
from incident
where cast(dataanmk as date) = cast(getdate()-1 as date) and afgemeld = 0

--totaal gisteren overschreden
select count(naam)
from incident
where cast(datumafspraak as date) > cast(getdate()-1 as date) and afgemeld = 0

--totaal overschreden
select count(naam)
from incident
where cast(datumafspraak as date) < cast(GETDATE() as date) and afgemeld = 0

select naam,cast(datumafspraak as date)
from incident
where cast(datumafspraak as date) >= cast(GETDATE() as date) and afgemeld = 0

select count(naam)
from incident
--where cast(datumafspraak as date) < 

SELECT naam, CAST(datumafspraak AS date) AS [streef datum], CAST(dataanmk AS date) AS [aanmeld datum], CAST(datwijzig AS date) AS [wijzigings datum], ref_status, korteomschrijving, ISNULL(actie, 'Nog geen actie') AS Actie 
FROM incident 
WHERE (datumafspraak IS NOT NULL) AND  (afgemeld = 0) and (ref_status NOT LIKE 'wacht%') AND (ref_status != 'opgelost') 
ORDER BY datumafspraak DESC

--
select naam, cast(datumafspraak as date),cast(dataanmk as date) as "aanmaak datum"
from incident
where dataanmk > '2014-01-01' and afgemeld = 0
--

--kijken welke de streef datum hebben overschreden
select naam, isnull(convert(nvarchar,datumafspraak,103),'geen streefdatum') as "streefdatum" ,cast(dataanmk as date) as "aanmeld datum",cast(datwijzig as date) as "wijzigings datum", ref_status,korteomschrijving,isnull(actie,'Nog geen actie') as "Actie"
from incident
where  ref_status != 'opgelost' and afgemeld = 0 
order by datumafspraak desc
--

select naam, isnull(convert(nvarchar,datumafspraak,103),'geen streefdatum') as "streefdatum" ,cast(dataanmk as date) as "aanmeld datum",cast(datwijzig as date) as "wijzigings datum", ref_status,korteomschrijving,isnull(actie,'Nog geen actie') as "Actie"
from incident
where  ref_status != 'opgelost' and afgemeld = 0 and datumafspraak > cast(getdate() as date) 
order by datumafspraak desc

select naam, isnull(convert(nvarchar,datumafspraak,103),'geen streefdatum') as "streefdatum" ,cast(dataanmk as date) as "aanmeld datum",cast(datwijzig as date) as "wijzigings datum", ref_status,korteomschrijving,isnull(actie,'Nog geen actie') as "Actie"
from incident
where  ref_status != 'opgelost' and afgemeld = 0 and datumafspraak is null
order by datumafspraak desc

select count(naam)
from incident
where datumafspraak < cast(getdate() as date) and afgemeld = 0

select *,number
from changeactivity

--backup--
select cast(dataanmk as DATE) as "Datum", count(ref_operatordynanaam) as "count datum"
from incident
where ref_operatordynanaam = any
(
	select distinct(ref_operatordynanaam)
	from incident
)
and DATEPART(YEAR,dataanmk) > 2014
group by CAST(dataanmk as date)
order by CAST(dataanmk as date) desc
--backup--

---- controleert iet of iets is afgemeld of niet
select cast(datumaangemeld as DATE) as "Datum", count(ref_operatordynanaam) as "count datum"
from incident
where ref_operatordynanaam = any
(
	select distinct(ref_operatordynanaam)
	from incident
)
and DATEPART(YEAR,datumaangemeld) > 2014
group by CAST(datumaangemeld as date)
order by CAST(datumaangemeld as date) desc
----

-- kijken naar de status ( als het een eerste- of tweedelijns is )
select naam, [status],cast(dataanmk as date) as "aanmaak datum",cast(datumafspraak as date) as "Datum afspraak"
from incident
where datumafgemeld is null and datumafspraak is null and [status] != -1
order by [status],[aanmaak datum] desc
--

--meldingen met een streef datum welke binnen 2 weken-en-iets-meer zullen moeten worden afgehandeld
select cast(datumafspraak as date) as "streefdatum",count(naam)
from incident
where datumafspraak >= GETDATE() and datumafspraak < DATEADD(day,14,getdate())
group by datumafspraak

select naam, cast(dataanmk as date) as "aanmaak datum"
from incident
where cast(dataanmk as date) <= cast(GETDATE() as date) and afgemeld = 0
order by naam desc

SELECT naam, CAST(datumafspraak AS date) AS [streef datum], CAST(dataanmk AS date) AS [aanmeld datum], CAST(datwijzig AS date) AS [wijzigings datum], ref_status, korteomschrijving, ISNULL(actie, 'Nog geen actie') AS Actie 
FROM incident 
WHERE (datumafspraak IS NOT NULL) AND (ref_status NOT LIKE 'wacht%') AND (ref_status <> 'opgelost') AND (afgemeld = 0) 
ORDER BY datumafspraak DESC


--[**] Wijzigingen [**]--

select c.currentphase, isnull(ca.briefdescription,'nog geen beschrijving') as "briefdescription", c.aanmeldernaam,c.number,ca.ref_change_number ,c.ref_category_name +  ' - ' + c.ref_subcategory_name as "categorie en subcategorie", cast(c.dataanmk as date) as "aanmaak datum", cast(c.datwijzig as date) as "wijzigings datum",cast(c.plannedfinaldate as date) as "Eind datum",c.[description] as "beschrijving",isnull(ca.[action],'nog geen actie') as "action"
from change c
left outer join changeactivity ca on ca.ref_change_number = c.number
where datepart(yyyy,c.plannedfinaldate) not like 2013 and c.plannedfinaldate >= SYSDATETIME()
order by c.plannedfinaldate,ref_change_number desc

select number,dataanmk,submitdate,isnull(briefdescription,'geen beschrijving') as "Korte Beschrijving",isnull([description],'geen beschrijving')as "Lange Beschrijving" ,isnull([action] ,'geen actie') as "Actie",aanmeldernaam
from change
order by number desc

select distinct(ref_change_number),number,cast(plannedfinaldate as date) as "plannedFinalDate"
from changeactivity
where plannedfinaldate >= SYSDATETIME()
group by ref_change_number,plannedfinaldate,number
order by plannedFinalDate asc

select number
from change
where plannedfinaldate >= SYSDATETIME()
order by number desc

select number
from change

select c.number as "Wijzigings nummer" ,count(ca.number) as "Activiteiten"
from changeactivity ca
right outer join change c on c.number = ca.ref_change_number
where c.plannedfinaldate >= SYSDATETIME()
group by c.number,ca.plannedfinaldate,c.plannedfinaldate
order by [Wijzigings nummer]

select distinct(c.number) as "Wijzigings nummer" ,count(ca.number) as "aantal activiteiten"
from change c
right outer join changeactivity ca on ca.ref_change_number = c.number
where c.plannedfinaldate >= SYSDATETIME()
group by c.number
order by c.number desc

select ca.number,cast(ca.plannedfinaldate as date) as "CA Einddatum",cast(c.plannedfinaldate as date) as "C  Einddatum "
from changeactivity ca
right outer join change c on c.number = ca.ref_change_number
where ca.plannedfinaldate >= SYSDATETIME()
order by c.plannedfinaldate

select number, ref_change_number
from changeactivity
where plannedfinaldate >= sysdatetime()

select *
from changeactivity_status

select * 
from changeactivity

select * 
from change

--Gepland:		 F4B5CAC0-6643-4AD8-8244-06BE63C25B28
--In uitvoering: 7A83E774-754B-4BD2-A489-6A86DCDF3243
--Wacht op info: 930A07DE-534D-41D5-9499-DD1702E6C235

select c.number as "c.Number",ca.number as "ca.Number",ca.resolved--,cas.naam
from change c
right outer join changeactivity ca on ca.ref_change_number = c.number
--right outer join changeactivity_status cas on cas.unid = ca.activitystatusid
where ca.resolved = 0 --cas.unid = 'F4B5CAC0-6643-4AD8-8244-06BE63C25B28' and ca.resolved = 0 or cas.unid = '7A83E774-754B-4BD2-A489-6A86DCDF3243' and ca.resolved = 0 or cas.unid = '930A07DE-534D-41D5-9499-DD1702E6C235' and ca.resolved = 0
order by c.number desc

select *
from changeactivity
where ref_change_number like '%W1303 006%'

select *
from soort
order by rechtid desc

select distinct(c.number),count(ca.number) as "Aantal activiteiten"
from change c
right outer join changeactivity ca on ca.ref_change_number = c.number
where ca.resolved = 0 and c.plannedfinaldate >= SYSDATETIME()
group by c.number

--aantal RFCs per aanmelder
select distinct(aanmeldernaam),count(*) as "aantal meldingen per aanmelder" 
from change
group by aanmeldernaam
order by [aantal meldingen per aanmelder] desc

--alles dat is geauthoriseerd maar nog niet is geimplementeerd
select distinct(c.number),count(ca.number) as "aantal activiteiten",cast(c.authorizationdate as date) as "authorisatie datum"
from change c
right outer join changeactivity ca on ca.ref_change_number = c.number
where authorizationdate is not null and implementationdate is null and ca.resolved = 0
group by c.number,c.authorizationdate,ca.resolved
order by c.number desc

--alles wat is geskipped
select distinct(ref_change_number),number ,cast(skippeddate as date) "Skipped datum"
from changeactivity
where skipped = 1

-- alle aanvragen
select number
from change
where rejecteddate is null and authorizationdate is null

select c.number,ca.number,cast(ca.plannedstartdate as date) "planned startdate",cast(ca.plannedfinaldate as date) "Planned finaldate",ca.resolved,c.finaldate
from change c 
right outer join changeactivity ca on ca.ref_change_number = c.number
where c.finaldate is null and resolved = 0






