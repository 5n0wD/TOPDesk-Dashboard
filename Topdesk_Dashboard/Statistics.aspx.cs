using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Objects.SqlClient;
using System.Drawing;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
using System.Xml;
using System.Xml.Serialization;

namespace Topdesk_Dashboard
{ //V1.4
    public partial class Statistics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Datetime settings + instantie van model + belangrijke spul
            DateTime vandaag = DateTime.Today;//vandaag
            DateTime gisteren = DateTime.Today.AddDays(-1).Date; //gisteren
            DateTime eindGisteren = DateTime.Today.Date.AddSeconds(-1); //laatste seconde van gisteren
            DateTime beginVorigJaar = new DateTime(2014, 1, 1); //begin vorig jaar aangegeven als jaar,maand,dag
            DateTime tienTerugDatum = DateTime.Today.AddDays(-10); //10 dagen terug
            DateTime tienVerderDatum = DateTime.Today.AddDays(10);// 10 dagen verder
            DateTime jaarTerug = DateTime.Today.AddMonths(-15); // een jaar en 3 maanden achteruit

            CountListClass NewListObj = new CountListClass();
            topdesk5Entities TopDeskModel = new topdesk5Entities(); //instantie van de topdesk5Entities
            CounterClass objCounter = new CounterClass();

            byte anonCount = (byte)GetCount();
            objCounter.Count = anonCount;
            objCounter.Date = vandaag.Date;

            NewListObj.CountList = new List<CounterClass>(); // word geserialized 

            string listpath = @"C:\inetpub\wwwroot\XmlFiles\Countlist.xml";
            #endregion

            #region Statistieken van Incidenten en Wijzigingen
            /*
             * LInQ ( Language Integrated Query) een soort SQL maar dan "andersom"
             * je begint bijna altijd met var omdat het vaak onduidelijk is wat voor soort return type je krijgt(int, string, float, maar ook list en arrays)
             * inplaats van select begin je met from waar je een alias voor je model kiest
             * vervolgens kun je de gebruikelijke SQL statements gebruiken o.a. Where,Join,Order by,Group by
             * en je eindigt met de select.
             */
            //incidenten
            //alle incidenten
            var countTotal = (from cntTotal in TopDeskModel.incidents
                              where cntTotal.dataanmk > beginVorigJaar && cntTotal.afgemeld == false && cntTotal.status != -1
                              select cntTotal.naam).Count();
            txtTotalAmount.Text = countTotal.ToString();

            //alle incidenten welke de streefdatum hebben overschreden
            var countTotalExceeded = (from cntTotExc in TopDeskModel.incidents
                                      where cntTotExc.datumafspraak < vandaag && cntTotExc.afgemeld == false
                                      select cntTotExc.naam).Count();
            txtTotalExceeded.Text = countTotalExceeded.ToString();

            //aantal aankomende
            var countUpComing = (from cntUpComing in TopDeskModel.incidents
                                 where cntUpComing.datumafspraak > vandaag && cntUpComing.afgemeld == false
                                 select cntUpComing).Count();
            txtStillToCome.Text = countUpComing.ToString();

            //aantal zonder een afspraak datum
            var countNoTarget = (from cntNoTar in TopDeskModel.incidents
                                 where cntNoTar.datumafspraak == null && cntNoTar.status != -1
                                 select cntNoTar.naam).Count();
            txtNoTargetDate.Text = countNoTarget.ToString();

            //aantal vandaag nieuw binnengekomen
            var countToday = (from cntToday in TopDeskModel.incidents
                              where cntToday.dataanmk >= vandaag && cntToday.afgemeld == false
                              select cntToday.naam).Count();
            txtTotalToday.Text = countToday.ToString();

            //aantal gisteren binnen gekomen
            var countYesterday = (from cntYester in TopDeskModel.incidents
                                  where cntYester.dataanmk >= gisteren && cntYester.dataanmk < eindGisteren && cntYester.afgemeld == false
                                  select cntYester.naam).Count();
            txtTotalYesterday.Text = countYesterday.ToString();

            //changes
            //totaal aantal wijzigingen
            var countWijzigTotal = (from cntwijzTotal in TopDeskModel.changes
                                    where cntwijzTotal.canceldate == null && cntwijzTotal.rejected == false && cntwijzTotal.implementationdate == null && cntwijzTotal.authorizationdate != null && cntwijzTotal.plannedfinaldate >= jaarTerug
                                    select cntwijzTotal.number).Count();
            txtCountWijzig.Text = countWijzigTotal.ToString();

            //totaal aantal aanvragen (RFC)
            var countAanvragen = (from cntAanvrg in TopDeskModel.changes
                                  where cntAanvrg.rejecteddate == null && cntAanvrg.authorizationdate == null
                                  select cntAanvrg.number).Count();
            txtAantalWijzigAanvrg.Text = countAanvragen.ToString();

            //aantal te evalueren
            var countOpenEval = (from cntOpEv in TopDeskModel.changes
                                 where cntOpEv.implementationdate != null && cntOpEv.finaldate == null
                                 select cntOpEv.number).Count();
            txtEval.Text = countOpenEval.ToString();

            //aantal aanstaande wijzigingen
            var countComingChanges = (from cntCmngChanges in TopDeskModel.changes
                                      where cntCmngChanges.authorizationdate != null && cntCmngChanges.rejecteddate == null
                                      select cntCmngChanges.number).Count();
            txtCntToRealize.Text = countComingChanges.ToString();

            //aantal activiteiten in totaal
            var countActWijzigTotal = (from cntActWijzTotal in TopDeskModel.changeactivities
                                       join cntWijzTotal in TopDeskModel.changes
                                           on cntActWijzTotal.ref_change_number equals cntWijzTotal.number
                                       where cntWijzTotal.rejected == false && cntWijzTotal.completed == false && cntActWijzTotal.maystart == true && cntActWijzTotal.resolved == false && cntActWijzTotal.skipped == false && cntActWijzTotal.rejected == false && cntActWijzTotal.plannedfinaldate >= jaarTerug
                                       select cntActWijzTotal.number).Count();
            txtAantalActiviteiten.Text = countActWijzigTotal.ToString();

            //aantal geauthoriseerd maar nog niet geimplementeerd (goed gekeurd maar nog niet meebezig geweest)
            var authNonImpl = (from cntAuthNonImp in TopDeskModel.changes
                               join cntAuthWijzAc in TopDeskModel.changeactivities
                                   on cntAuthNonImp.number equals cntAuthWijzAc.ref_change_number
                               where cntAuthNonImp.authorizationdate != null && cntAuthNonImp.implementationdate == null && cntAuthWijzAc.resolved == false
                               select cntAuthNonImp.number).Count();
            txtAuthorisedNonImpl.Text = authNonImpl.ToString();

            #endregion

            #region norm 50 meldingen
            //bij minder dan 50 meldingen veranderd de kleur van rood naar groen
            if (Convert.ToInt16(txtTotalAmount.Text) > 50)
            {
                txtTotalAmount.BackColor = Color.FromName("red");
                txtTotalAmount.ForeColor = Color.FromName("White");
            }
            else
            {
                txtTotalAmount.BackColor = Color.FromName("green");
                txtTotalAmount.ForeColor = Color.FromName("White");
            }
            #endregion

            #region begin/eind van de dag check en save
            //eerst wordt gekeken of het 5 uur 's avonds is geweest want als het 5 uur is geweest  is het uiteraard ook 8 uur 's morgens geweest 
            if (DateTime.Now.Hour >= 17)
            {
                if (tmrAutoRefresh.Enabled == false)
                    AltSerializeListToXml(NewListObj.CountList, listpath);//
                else
                {
                    tmrAutoRefresh.Enabled = false; //als het 5 uur 's avonds is geweest stopt de timer
                    AltSerializeListToXml(NewListObj.CountList, listpath);
                }
            }
            else if (DateTime.Now.Hour >= 8)
            {
                if (tmrAutoRefresh.Enabled == true)
                {
                    if (File.Exists(listpath) == true)
                    {
                        NewListObj = DeserializeListFromXML(listpath);
                        NewListObj.CountList.Add(objCounter);
                    }
                    else
                        AltSerializeListToXml(NewListObj.CountList, listpath);
                }
                else
                {
                    tmrAutoRefresh.Enabled = true; // als het 8 uur 's morgens is geweest start de timer
                    NewListObj = DeserializeListFromXML(listpath);
                    NewListObj.CountList.Add(objCounter);
                }
            }
            #endregion
        }

        public int GetCount()
        {
            topdesk5Entities TopDeskModel = new topdesk5Entities();

            var anonCount = (from anont in TopDeskModel.incidents
                             where anont.datumafgemeld == null && anont.datumafspraak == null && anont.status != -1
                             orderby anont.datumafspraak ascending, anont.naam descending
                             select new { anont.naam, anont.dataanmk, anont.korteomschrijving }).Count();

            return anonCount;
        }

        #region [OBSOLETE]
        static public void SerializeToXML(CounterClass objCounter) // resultaten van vandaag naar xml zetten[OBSOLETE] 
        {
            XmlSerializer serializer = new XmlSerializer(typeof(CounterClass));
            TextWriter TextWriter = new StreamWriter(File.Create(@"K:\ICT\TopdeskDashboard\Counter.xml"));
            serializer.Serialize(TextWriter, objCounter);
            TextWriter.Close();
        }

        static CounterClass DeserializeFromXML(string path)//resultaten van gisteren naar een variabele zetten[OBSOLETE] 
        {
            XmlSerializer ser = new XmlSerializer(typeof(CounterClass));
            CounterClass cntcls;
            using (XmlReader reader = XmlReader.Create(path))
            {
                cntcls = (CounterClass)ser.Deserialize(reader);
                reader.Close();
            }
            return cntcls;
        }

        static public void SerializeListToXml(CounterClass objCounter, string path)//Lijst naar XML zetten[/OBSOLETE]
        {
            CountListClass objectClc = new CountListClass();
            objectClc.CountList = new List<CounterClass>();
            objectClc.CountList.Add(new CounterClass { Count = objCounter.Count, Date = objCounter.Date });
            XmlSerializer ser = new XmlSerializer(typeof(CountListClass));

            using (FileStream fs = new FileStream(path, FileMode.Create))
            {
                ser.Serialize(fs, objectClc);
                fs.Close();
            }
        }
        #endregion

        static public void AltSerializeListToXml(List<CounterClass> list, string path)//Lijst naar XML zetten
        {
            CountListClass objectClc = new CountListClass();
            objectClc.CountList = new List<CounterClass>();
            objectClc.CountList = list;
            XmlSerializer ser = new XmlSerializer(typeof(CountListClass));

            using (FileStream fs = new FileStream(path, FileMode.Create))
            {
                ser.Serialize(fs, objectClc);
                fs.Close();
            }
        }

        public static CountListClass DeserializeListFromXML(string path)//lijst terughalen van XML
        {
            CountListClass objCounterlist = new CountListClass();
            objCounterlist.CountList = new List<CounterClass>();

            XmlSerializer myser = new XmlSerializer(typeof(CountListClass));
            FileStream myFs = new FileStream(path, FileMode.Open);
            objCounterlist = (CountListClass)myser.Deserialize(myFs);

            myFs.Close();
            return objCounterlist;
        }
    }
}
