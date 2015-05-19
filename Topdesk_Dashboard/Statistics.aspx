<%@ Page Title="Statistics" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="Topdesk_Dashboard.Statistics" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%-- V1.1 --%>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
    <script src="ScriptFile.js" type="text/javascript"></script>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="scrman" runat="server"></asp:ScriptManager>
    <asp:Timer ID="tmrAutoRefresh" runat="server" Interval="300000" Enabled="True"></asp:Timer>

    <div id="DivContent1">
        <div id="IncidentenEnWijzigingen">
            <div id="IncidentenDiv">
                <p class="InfoParagraph">Incidenten</p>
                <asp:Table ID="IncidentenTable" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" CssClass="divText" ID="lblAllReports" Text="Totaal aantal incidenten:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtTotalAmount" Width="40" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label runat="server" CssClass="divText" ID="lblNoTargetDate" Text="Aantal zonder streefdatum:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtNoTargetDate" Width="40" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" CssClass="divText" ID="lblTotalExceeded" Text="Aantal overschreden:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtTotalExceeded" Width="40" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label runat="server" CssClass="divText" ID="lblTotalToday" Text="Totaal vandaag:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtTotalToday" Width="40" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" CssClass="divText" ID="lblStillToCome" Text="Te realiseren"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtStillToCome" Width="40" ReadOnly="true"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label runat="server" CssClass="divText" ID="lblTotalYesterday" Text="Totaal Gisteren:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtTotalYesterday" Width="40" ReadOnly="true"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>

            <div id="WijzigingenDiv">
                <p class="InfoParagraph">Wijzigingen</p>
                <asp:Table ID="WijzigingenTable" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" CssClass="divText" ID="lblCountWijzig" Text="Totaal aantal wijzigingen:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtCountWijzig" Width="40" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label runat="server" CssClass="divText" ID="lblAantalActiviteiten" Text="Totaal aantal activiteiten:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtAantalActiviteiten" Width="40" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" ID="LblAantlWijzigingsAanvrg" Text="Aantal wijzigingsaanvragen:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtAantalWijzigAanvrg" Width="40" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label runat="server" ID="lblAuthorisedNonImplemented" Text="Geautoriseerd niet geimplementeerd:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtAuthorisedNonImpl" Width="40" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" ID="lblCntToRealize" Text="aantal te realiseren:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtCntToRealize" Width="40" ReadOnly="true"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label runat="server" ID="lblEval" Text="Te Evalueren:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtEval" Width="40" ReadOnly="true"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <cc1:TabContainer ID="tabContInciWijzig" runat="server">
        <cc1:TabPanel runat="server" ID="tabPnlInci" CssClass="TabContPanel" HeaderText="Incidenten">
            <ContentTemplate>
                <iframe width="1300" height="1200" src="IncidentStats.aspx" runat="server"></iframe>
            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel runat="server" ID="tabPnlWijz" CssClass="TabContPanel" HeaderText="Wijzigingen">
            <ContentTemplate>
                <iframe src="ChangeStats.aspx" width="1300" height="1240" runat="server"></iframe>
            </ContentTemplate>
        </cc1:TabPanel>
    </cc1:TabContainer>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
