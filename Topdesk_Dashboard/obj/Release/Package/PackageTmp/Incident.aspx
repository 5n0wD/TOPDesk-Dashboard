<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Incident.aspx.cs" EnableEventValidation="false" ValidateRequest="false" Inherits="Topdesk_Dashboard.Dashboard" %>

<%-- V1.3 --%>
<asp:Content ID="Style" ContentPlaceHolderID="Stylesheets" runat="server">
    <title title="Incident">Incidenten overzicht</title>
</asp:Content>

<%--Content--%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="DivContent1">
        <div id="StreefDatumInfoDiv">
            <%--tabel 1--%>
            <%--Datum in een label--%>
            <asp:Label CssClass="lblCssClass" ID="lblPlaceholder" Text="Het is vandaag: " runat="server"></asp:Label><asp:Label CssClass="lblCssClass" ID="lblTime" runat="server"></asp:Label>

            <asp:GridView ID="dgvStreefDatumInfo" runat="server" AutoGenerateColumns="False" CellPadding="3" DataSourceID="StreefDatumIncidentInfoDataSource" BorderWidth="1px" AllowPaging="True" PageSize="22" BackColor="White" BorderColor="#999999" BorderStyle="None" OnPageIndexChanging="dgvStreefDatumInfo_PageIndexChanging" OnRowDataBound="dgvStreefDatumInfo_RowDataBound" OnSelectedIndexChanged="dgvStreefDatumInfo_SelectedIndexChanged" GridLines="Vertical" HeaderStyle-CssClass="GridViewHeader" RowStyle-CssClass="GridViewRows" OnPageIndexChanged="dgvStreefDatumInfo_PageIndexChanged">
                <Columns>
                    <asp:BoundField DataField="naam" HeaderText="naam" SortExpression="naam" />
                    <asp:BoundField DataField="streef datum" HeaderText="streef datum" SortExpression="streef datum" DataFormatString="{0:d}" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataField="aanmeld datum" HeaderText="aanmeld datum" SortExpression="aanmeld datum" DataFormatString="{0:d}" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataField="wijzigings datum" HeaderText="wijzigings datum" SortExpression="wijzigings datum" DataFormatString="{0:d}" ReadOnly="True"></asp:BoundField>
                    <asp:BoundField DataField="ref_status" HeaderText="ref_status" SortExpression="ref_status">
                        <HeaderStyle Width="200px" Wrap="True" />
                    </asp:BoundField>
                    <asp:BoundField DataField="korteomschrijving" HeaderText="korteomschrijving" SortExpression="korteomschrijving">
                        <HeaderStyle CssClass="HiddenOmschrijvingHeader" />
                        <ItemStyle CssClass="HiddenOmschrijvingItems" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Actie" HeaderText="Actie" ReadOnly="True" SortExpression="Actie">
                        <HeaderStyle CssClass="HiddenActieHeader" />
                        <ItemStyle CssClass="HiddenActieItems" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="Black" HorizontalAlign="Center" BackColor="#999999" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#FFF000" Font-Bold="True" ForeColor="#FF0000" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView>
            <asp:SqlDataSource ID="StreefDatumIncidentInfoDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:topdesk5ConnectionString %>" SelectCommand="SELECT naam, CAST(datumafspraak AS date) AS [streef datum], CAST(dataanmk AS date) AS [aanmeld datum], CAST(datwijzig AS date) AS [wijzigings datum], ref_status, korteomschrijving, ISNULL(actie, 'Nog geen actie') AS Actie FROM incident WHERE (datumafspraak IS NOT NULL) AND (ref_status NOT LIKE 'wacht%') AND (ref_status &lt;&gt; 'opgelost') AND (afgemeld = 0) ORDER BY datumafspraak DESC"></asp:SqlDataSource>
            <%--tabel 1--%>
        </div>
        <div id="InfoPanelDiv">
            <div id="innerInfoPanelDiv" class="auto-style1">
                <asp:Table ID="tblAspTable" runat="server">
                    <asp:TableRow>
                        <asp:TableCell><asp:Label runat="server" Text="IncidentNaam:"></asp:Label></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtIncidentNaam" runat="server" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" Text="Streef Datum:"></asp:Label></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtStreefDatum" runat="server" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" Text="Aanmeld Datum:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtAanmeldDatum" runat="server" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" Text="Wijzigings Datum:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtWijzigingsDatum" runat="server" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" Text="Status:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtStatus" runat="server" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" Text="Korte Omschrijving:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtKorteOmschrijving" runat="server" ReadOnly="True" Width="400px"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell VerticalAlign="Top">
                            <asp:Label runat="server" Text="Actie:" ></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtActie" runat="server" ReadOnly="True" TextMode="MultiLine" Height="449px" Width="350px"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentplaceHolder2" runat="server">
    <div id="DivContent2">
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div id="divContent3">
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
