--meldingen met een streef data welke binnen 2 weken-en-iets-meer zullen moeten worden afgehandeld
select cast(datumafspraak as date) as "streefdatum",count(naam)
from incident
where datumafspraak >= GETDATE() and datumafspraak < DATEADD(day,14,getdate())
group by datumafspraak
--

--laat alle meldingen zien ook die die zijn afgemeld
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
--

--totaal van alle meldingen per applicatie
select count(ref_domein), ref_domein
from incident
where ref_domein = '' or ref_domein = 'Diversen' or ref_domein = 'Connect-IT' or ref_domein = 'mendix' or ref_domein = 'matrix' or ref_domein = 'specifieke applicaties' or ref_domein = 'ict middelen' or ref_domein = 'autodesk' or ref_domein = 'ms office' or ref_domein = 'metacom' or ref_domein = 'dms' or ref_domein = 'cobra'
group by ref_domein
order by count(ref_domein)
--

-- kijken naar de status ( als het een eerste- of tweedelijns is )
select naam, [status],cast(dataanmk as date) as "aanmaak datum",cast(datumafspraak as date) as "Datum afspraak"
from incident
where datumafgemeld is null and datumafspraak is null and [status] != -1
order by [status],[aanmaak datum] desc
--



