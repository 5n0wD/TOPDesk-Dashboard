using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Topdesk_Dashboard
{    //V1.4
    public partial class ChangeStats : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime vandaag = DateTime.Today;//vandaag
            DateTime gisteren = DateTime.Today.AddDays(-1).Date; //gisteren
            DateTime eindGisteren = DateTime.Today.Date.AddSeconds(-1); //laatste seconde van gisteren
            DateTime beginVorigJaar = new DateTime(2014, 1, 1); //begin vorig jaar aangegeven als jaar,maand,dag
            DateTime tienTerugDatum = DateTime.Today.AddDays(-10); //10 dagen terug
            DateTime tienVerderDatum = DateTime.Today.AddDays(10);

            activityChart.ChartAreas[0].AxisX.Maximum = tienVerderDatum.ToOADate();
            activityChart.ChartAreas[0].AxisX.Minimum = vandaag.ToOADate();
            activityChart.ChartAreas[0].AxisY.Minimum = 0;
            activityChart.ChartAreas[0].AxisY.Maximum = 20;



        }
    }
}