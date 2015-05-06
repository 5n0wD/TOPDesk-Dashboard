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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //
            //
            //
        }

        protected void dgvChangeInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvChangeInfo.PageIndex = e.NewPageIndex;
            dgvChangeInfo.DataBind();
        }
        protected void dgvChangeInfo_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(dgvChangeInfo, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "klik hier";
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Nullable types voor het geval dat, dit ook is afgevangen in de SQL querrie 
                //
                DateTime? wijzigDatum = (DateTime?)DataBinder.Eval(e.Row.DataItem, "wijzigings datum");
                DateTime? aanmaakDatum = (DateTime?)DataBinder.Eval(e.Row.DataItem, "aanmaak datum");
                DateTime? eindDatum = (DateTime?)DataBinder.Eval(e.Row.DataItem, "Eind datum");
                //
                DateTime vandaag = new DateTime();
                vandaag = DateTime.Today.Date;

                #region streefdatum overschreden
                if (eindDatum < vandaag)
                {
                    foreach (TableCell cell in e.Row.Cells)
                        cell.BackColor = Color.FromName("darkred");
                }
                else if (eindDatum == vandaag) // streefdatum vandaag
                {
                    foreach (TableCell cell in e.Row.Cells)
                        cell.BackColor = Color.FromName("lightblue");
                }
                #endregion
                //als streefdatum in de toekomst ligt zou er niets moeten gebeuren


                #region nieuw aangemaakt
                if (aanmaakDatum == vandaag)
                {
                    foreach (TableCell cell in e.Row.Cells)
                        cell.Font.Bold = true;
                }
                #endregion
                #region als de wijzigings datum groter is dan de aanmaak datum
                if (wijzigDatum > aanmaakDatum && aanmaakDatum != vandaag && wijzigDatum == vandaag)
                {
                    foreach (TableCell cell in e.Row.Cells)
                        cell.Font.Italic = true;
                }
                #endregion
            }
        }
        protected void dgvChangeInfo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                foreach (GridViewRow row in dgvChangeInfo.Rows)
                {
                    if (row.RowIndex == dgvChangeInfo.SelectedIndex)
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

            GridViewRow dgvRow = dgvChangeInfo.SelectedRow;

            txtWijzigingNaam.Text = dgvRow.Cells[0].Text;
            txtActiviteitNaam.Text = dgvRow.Cells[1].Text;
            txtStreefDatum.Text = dgvRow.Cells[6].Text;
            txtAanmeldDatum.Text = dgvRow.Cells[4].Text;
            txtWijzigingsDatum.Text = dgvRow.Cells[5].Text;
            txtKorteOmschrijving.Text = dgvRow.Cells[2].Text;
            txtActie.Text = dgvRow.Cells[7].Text;
        }
        protected void dgvChangeInfo_PageIndexChanged(object sender, EventArgs e)
        {
            dgvChangeInfo.SelectedIndex = 0;

            GridViewRow dgvRow = dgvChangeInfo.SelectedRow;

            txtWijzigingNaam.Text = dgvRow.Cells[0].Text;
            txtActiviteitNaam.Text = dgvRow.Cells[1].Text;
            txtStreefDatum.Text = dgvRow.Cells[6].Text;
            txtAanmeldDatum.Text = dgvRow.Cells[4].Text;
            txtWijzigingsDatum.Text = dgvRow.Cells[5].Text;
            txtKorteOmschrijving.Text = dgvRow.Cells[2].Text;
            txtActie.Text = dgvRow.Cells[7].Text;
        }
    }
}