using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

namespace Topdesk_Dashboard
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region txtDatum
            lblTime.Text = DateTime.Today.Date.ToString("dd/MM/yyyy");
            #endregion
        }

        protected void dgvStreefDatumInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvStreefDatumInfo.PageIndex = e.NewPageIndex;
            dgvStreefDatumInfo.DataBind();
        }
        protected void dgvStreefDatumInfo_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(dgvStreefDatumInfo, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "klik hier";
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Nullable types voor het geval dat, dit ook is afgevangen in de SQL querrie 
                //
                DateTime? wijzigDatum = (DateTime?)DataBinder.Eval(e.Row.DataItem, "wijzigings datum");
                DateTime? aanmeldDatum = (DateTime?)DataBinder.Eval(e.Row.DataItem, "aanmeld datum");
                DateTime? streefDatum = (DateTime?)DataBinder.Eval(e.Row.DataItem, "streef datum");
                //
                DateTime vandaag = new DateTime();
                vandaag = DateTime.Today.Date;

                #region streefdatum overschreden
                if (streefDatum < vandaag)
                {
                    foreach (TableCell cell in e.Row.Cells)
                        cell.BackColor = Color.FromName("darkred");
                }
                else if (streefDatum == vandaag) // streefdatum vandaag
                {
                    foreach (TableCell cell in e.Row.Cells)
                        cell.BackColor = Color.FromName("lightblue");
                }
                #endregion
                //als streefdatum in de toekomst ligt zou er niets moeten gebeuren

                #region nieuw aangemaakt
                if (aanmeldDatum == vandaag)
                {
                    foreach (TableCell cell in e.Row.Cells)
                        cell.Font.Bold = true;
                }
                #endregion
                #region als de wijzigings datum groter is dan de aanmaak datum
                if (wijzigDatum > aanmeldDatum && aanmeldDatum != vandaag && wijzigDatum == vandaag)
                {
                    foreach (TableCell cell in e.Row.Cells)
                        cell.Font.Italic = true;
                }

                #endregion
            }
        }
        protected void dgvStreefDatumInfo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                foreach (GridViewRow row in dgvStreefDatumInfo.Rows)
                {
                    if (row.RowIndex == dgvStreefDatumInfo.SelectedIndex)
                    {
                        row.BackColor = ColorTranslator.FromHtml("#FFF000");
                        row.ToolTip = string.Empty;
                    }
                    else
                    {
                        row.ToolTip = "Klik hier ook.";
                        row.BackColor = ColorTranslator.FromHtml("#EEEEEE");
                        row.ForeColor = ColorTranslator.FromHtml("#000000");

                    }
                }
            }

            GridViewRow dgvRow = dgvStreefDatumInfo.SelectedRow;

            txtIncidentNaam.Text = dgvRow.Cells[0].Text;
            txtStreefDatum.Text = dgvRow.Cells[1].Text;
            txtAanmeldDatum.Text = dgvRow.Cells[2].Text;
            txtWijzigingsDatum.Text = dgvRow.Cells[3].Text;
            txtStatus.Text = dgvRow.Cells[4].Text;
            txtKorteOmschrijving.Text = dgvRow.Cells[5].Text;
            txtActie.Text = dgvRow.Cells[6].Text;
        }
        protected void dgvStreefDatumInfo_PageIndexChanged(object sender, EventArgs e)
        {
            dgvStreefDatumInfo.SelectedIndex = 0;

            GridViewRow dgvRow = dgvStreefDatumInfo.SelectedRow;

            txtIncidentNaam.Text = dgvRow.Cells[0].Text;
            txtStreefDatum.Text = dgvRow.Cells[1].Text;
            txtAanmeldDatum.Text = dgvRow.Cells[2].Text;
            txtWijzigingsDatum.Text = dgvRow.Cells[3].Text;
            txtStatus.Text = dgvRow.Cells[4].Text;
            txtKorteOmschrijving.Text = dgvRow.Cells[5].Text;
            txtActie.Text = dgvRow.Cells[6].Text;
        }
    }
}