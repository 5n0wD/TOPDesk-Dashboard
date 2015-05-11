<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeStats.aspx.cs" Inherits="Topdesk_Dashboard.ChangeStats" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" type="text/css" rel="stylesheet" />

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <asp:Chart ID="Chart1" runat="server" DataSourceID="sqlDatasrcOpenstaand">
                    <Series>
                        <asp:Series Name="Series1"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="sqlDatasrcOpenstaand" runat="server"></asp:SqlDataSource>
            </div>


            <div id="RFC">
                <p class="Paragraph">Wijzigings aanvragen</p>
                <asp:GridView ID="AuthnonimplGrid" PageSize="5" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" DataSourceID="sqlDSAuthNonImpl">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="number" HeaderText="number" SortExpression="number" />
                        <asp:BoundField DataField="briefdescription" HeaderText="briefdescription" SortExpression="briefdescription" />
                        <asp:BoundField DataField="aanmaak datum" DataFormatString="{0:d}" HeaderText="aanmaak datum" ReadOnly="True" SortExpression="aanmaak datum" />
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
                <asp:SqlDataSource ID="sqlDSAuthNonImpl" runat="server" ConnectionString="<%$ ConnectionStrings:topdesk5ConnectionString %>"
                    SelectCommand="select number,briefdescription,cast(dataanmk as date) &quot;aanmaak datum&quot; from change where authorizationdate is null and rejecteddate is null"></asp:SqlDataSource>
            </div>


        </div>
    </form>
</body>
</html>
