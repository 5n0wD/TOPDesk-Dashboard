<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Change.aspx.cs" Inherits="Topdesk_Dashboard.WebForm1" %>
<%-- V1.1 --%>
<asp:Content ID="Style" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="DivContent1" runat="server">
        <asp:GridView runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="WijzigingsDataSource" GridLines="Vertical" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="currentphase" HeaderText="currentphase" SortExpression="currentphase" />
                <asp:BoundField DataField="briefdescription" HeaderText="briefdescription" ReadOnly="True" SortExpression="briefdescription" />
                <asp:BoundField DataField="ref_change_number" HeaderText="ref_change_number" ReadOnly="True" SortExpression="ref_change_number" />
                <asp:BoundField DataField="aanmeldernaam" HeaderText="aanmeldernaam" SortExpression="aanmeldernaam" />
                <asp:BoundField DataField="number" HeaderText="number" SortExpression="number" />
                <asp:BoundField DataField="categorie en subcategorie" HeaderText="categorie en subcategorie" ReadOnly="True" SortExpression="categorie en subcategorie" />
                <asp:BoundField DataField="aanmaak datum" DataFormatString="{0:d}" HeaderText="aanmaak datum" ReadOnly="True" SortExpression="aanmaak datum" />
                <asp:BoundField DataField="wijzigings datum" DataFormatString="{0:d}" HeaderText="wijzigings datum" ReadOnly="True" SortExpression="wijzigings datum" />
                <asp:BoundField DataField="Eind datum" DataFormatString="{0:d}" HeaderText="Eind datum" ReadOnly="True" SortExpression="Eind datum" />
                <asp:BoundField DataField="beschrijving" HeaderText="beschrijving" SortExpression="beschrijving" >
                <HeaderStyle CssClass="HiddenOmschrijvingHeader" />
                <ItemStyle CssClass="HiddenOmschrijvingItems" />
                </asp:BoundField>
                <asp:BoundField DataField="action" HeaderText="action" ReadOnly="True" SortExpression="action" >
                <HeaderStyle CssClass="HiddenActieHeader" />
                <ItemStyle CssClass="HiddenActieItems" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="WijzigingsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:topdesk5ConnectionString %>" SelectCommand="SELECT c.currentphase, ISNULL(ca.briefdescription, N'nog geen beschrijving') AS briefdescription, ISNULL(ca.ref_change_number, N'nog geen nummer') AS ref_change_number, c.aanmeldernaam, c.number, c.ref_category_name + ' - ' + c.ref_subcategory_name AS [categorie en subcategorie], CAST(c.dataanmk AS date) AS [aanmaak datum], CAST(c.datwijzig AS date) AS [wijzigings datum], CAST(c.plannedfinaldate AS date) AS [Eind datum], c.description AS beschrijving, ISNULL(ca.action, N'nog geen actie') AS action FROM change AS c LEFT OUTER JOIN changeactivity AS ca ON ca.ref_change_number = c.number WHERE (DATEPART(yyyy, c.plannedfinaldate) NOT LIKE 2013) ORDER BY c.number"></asp:SqlDataSource>

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
</asp:Content>
