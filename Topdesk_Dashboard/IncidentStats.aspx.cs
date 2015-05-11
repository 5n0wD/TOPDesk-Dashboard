using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Topdesk_Dashboard
{
    public partial class IncidentStats : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region Datetime settings + instantie
            DateTime vandaag = DateTime.Today;//vandaag
            DateTime gisteren = DateTime.Today.AddDays(-1).Date; //gisteren
            DateTime eindGisteren = DateTime.Today.Date.AddSeconds(-1); //laatste seconde van gisteren
            DateTime beginVorigJaar = new DateTime(2014, 1, 1); //begin vorig jaar aangegeven als jaar,maand,dag
            DateTime tienTerugDatum = DateTime.Today.AddDays(-10); //10 dagen terug
            DateTime tienVerderDatum = DateTime.Today.AddDays(10);

            topdesk5Entities TopDeskModel = new topdesk5Entities();
            #endregion

            #region chart settings
            /*
             * instellingen voor de chart bovenste (in de webpagina) grafiek
             * AxisX bevat instellingen voor de X as
             * AxisY bevat instellingen voor de Y as
             */

            Chart3.ChartAreas[0].AxisX.Maximum = tienVerderDatum.ToOADate();
            Chart3.ChartAreas[0].AxisX.Minimum = vandaag.ToOADate();
            Chart3.ChartAreas[0].AxisY.Minimum = 0;
            Chart3.ChartAreas[0].AxisY.Maximum = 20;

            Chart2.ChartAreas[0].AxisX.Maximum = vandaag.ToOADate();
            Chart2.ChartAreas[0].AxisX.Minimum = tienTerugDatum.ToOADate();
            Chart2.ChartAreas[0].AxisY.Minimum = 0;
            Chart2.ChartAreas[0].AxisY.Maximum = 20;
            #endregion

            #region Meldingen die op dit moment geen streefdatum hebben
            var anontype = (from anont in TopDeskModel.incidents
                            where anont.datumafgemeld == null && anont.status != -1 && anont.datumafspraak == null
                            orderby anont.datumafspraak ascending, anont.naam descending
                            select new { anont.naam, anont.dataanmk, anont.korteomschrijving }).ToList();

            GridView1.DataSource = anontype;
            GridView1.DataBind();

            #endregion

        }
    }
}