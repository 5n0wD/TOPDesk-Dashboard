<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Change.aspx.cs" Inherits="Topdesk_Dashboard.WebForm1" %>

<%-- V1.1 --%>
<asp:Content ID="Style" ContentPlaceHolderID="Stylesheets" runat="server">
    <title title="Wijziging">Wijzigingen Overzicht</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="DivContent1" runat="server">
        <div id="ChangeInfoDiv">
            <asp:GridView runat="server" ID="dgvChangeInfo" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="WijzigingsDataSource" GridLines="Vertical" AutoGenerateColumns="False" AllowPaging="True" PageSize="23" OnSelectedIndexChanged="dgvChangeInfo_SelectedIndexChanged" OnPageIndexChanged="dgvChangeInfo_PageIndexChanged" OnPageIndexChanging="dgvChangeInfo_PageIndexChanging" OnRowDataBound="dgvChangeInfo_RowDataBound">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="Nummer" HeaderText="Nummer" SortExpression="Nummer"></asp:BoundField>
                    <asp:BoundField DataField="Actviteit" HeaderText="Actviteit" ReadOnly="True" SortExpression="Actviteit"></asp:BoundField>
                    <asp:BoundField DataField="briefdescription" HeaderText="briefdescription" ReadOnly="True" SortExpression="briefdescription" />
                    <asp:BoundField DataField="categorie en subcategorie" HeaderText="categorie en subcategorie" SortExpression="categorie en subcategorie" ReadOnly="True">
                        <HeaderStyle CssClass="HiddenTableColumns" />
                        <ItemStyle CssClass="HiddenTableColumns" />
                    </asp:BoundField>
                    <asp:BoundField DataField="aanmaak datum" HeaderText="aanmaak datum" SortExpression="aanmaak datum" DataFormatString="{0:d}" ReadOnly="True" />
                    <asp:BoundField DataField="wijzigings datum" HeaderText="wijzigings datum" ReadOnly="True" SortExpression="wijzigings datum" DataFormatString="{0:d}"></asp:BoundField>
                    <asp:BoundField DataField="Eind datum" DataFormatString="{0:d}" HeaderText="Eind datum" ReadOnly="True" SortExpression="Eind datum" />
                    <asp:BoundField DataField="beschrijving" HeaderText="beschrijving" SortExpression="beschrijving">
                        <HeaderStyle CssClass="HiddenTableColumns" />
                        <ItemStyle CssClass="HiddenTableColumns" />
                    </asp:BoundField>
                    <asp:BoundField DataField="action" HeaderText="action" ReadOnly="True" SortExpression="action">
                        <HeaderStyle CssClass="HiddenTableColumns" />
                        <ItemStyle CssClass="HiddenTableColumns" />
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
            <asp:SqlDataSource ID="WijzigingsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:topdesk5ConnectionString %>"
                SelectCommand="select c.number as &quot;Nummer&quot;,isnull(ca.number,'nog geen activiteit(en)') as &quot;Actviteit&quot;,isnull(ca.briefdescription,'nog geen beschrijving') as &quot;briefdescription&quot;,c.ref_category_name +  ' - ' + c.ref_subcategory_name as &quot;categorie en subcategorie&quot;, cast(c.dataanmk as date) as &quot;aanmaak datum&quot;, cast(c.datwijzig as date) as &quot;wijzigings datum&quot;,cast(c.plannedfinaldate as date) as &quot;Eind datum&quot;,c.[description] as &quot;beschrijving&quot;,isnull(ca.[action],'nog geen actie') as &quot;action&quot;
from change c
left outer join changeactivity ca on ca.ref_change_number = c.number
where datepart(yyyy,c.plannedfinaldate) not like 2013 and c.plannedfinaldate &gt;= SYSDATETIME()
order by c.plannedfinaldate asc"></asp:SqlDataSource>
        </div>
        <div id="ChangeInfoPanel">
            <div id="innerInfoPanelDiv" class="auto-style1">
                <asp:Table ID="tblAspTable" runat="server">
                    <asp:TableRow>
                        <asp:TableCell><asp:Label runat="server" Text="Wijzigings Naam:"></asp:Label></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtWijzigingNaam" runat="server" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><asp:Label runat="server" Text="Activiteit nummer: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtActiviteitNaam" runat="server"></asp:TextBox>
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
                            <asp:Label runat="server" Text="Streef Datum:"></asp:Label></asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtStreefDatum" runat="server" ReadOnly="True"></asp:TextBox>
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

