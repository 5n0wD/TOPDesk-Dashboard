﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeStats.aspx.cs" Inherits="Topdesk_Dashboard.ChangeStats" %>

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
                <p class="Paragraph">Naderende einddata voor activiteiten.</p>
                <asp:Chart ID="activityChart" Height="200px" Width="900px" runat="server" DataSourceID="sqlDatasrcOpenstaand">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="geplande einddatum" YValueMembers="Aantal activiteiten"></asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="sqlDatasrcOpenstaand" runat="server" ConnectionString="<%$ ConnectionStrings:topdesk5ConnectionString %>" SelectCommand="SELECT DISTINCT CAST(plannedfinaldate AS date) AS [geplande einddatum], COUNT(*) AS [Aantal activiteiten] FROM changeactivity WHERE (plannedfinaldate &gt;= SYSDATETIME()) AND (resolved = 0) GROUP BY plannedfinaldate ORDER BY [geplande einddatum] DESC"></asp:SqlDataSource>
            </div>
            <p class="Paragraph">Applicatiekaart wijzigingen</p>
            <div id="ApplicatieKaartWijz">
                <asp:Chart ID="Chart1" runat="server" DataSourceID="sqlDSAppkaart" Width="900px" Height="200px">
                    <Series>
                        <asp:Series Name="Series1" CustomProperties="DrawSideBySide=True, PointWidth=0.5" Font="Microsoft Sans Serif, 8px" IsValueShownAsLabel="True" LabelBackColor="White" LabelBorderColor="Red" LegendMapAreaAttributes="#VALX" MarkerStep="5" MarkerStyle="Triangle" Palette="Fire" XValueMember="ref_category_name" YValueMembers="Expr1" YValueType="Int32">
                            <SmartLabelStyle IsOverlappedHidden="False" MaxMovingDistance="60" />
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisY Title="Hoeveelheid meldingen">
                            </AxisY>
                            <AxisX IntervalAutoMode="VariableCount" IsLabelAutoFit="False" IsMarginVisible="False" Title="Applicatie">
                                <LabelStyle Interval="Auto" IntervalOffset="Auto" IsStaggered="True" TruncatedLabels="True" />
                            </AxisX>
                            <Position Height="95" Width="95" X="3" Y="3" />
                        </asp:ChartArea>

                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="sqlDSAppkaart" runat="server" ConnectionString="<%$ ConnectionStrings:topdesk5ConnectionString %>" SelectCommand="SELECT COUNT(ref_category_name) AS Expr1, ref_category_name FROM change GROUP BY ref_category_name ORDER BY Expr1"></asp:SqlDataSource>
            </div>

            <div id="RFC">
                <p class="Paragraph">Wijzigings aanvragen</p>
                <asp:GridView ID="dgvReqForChanges" PageSize="5" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" DataSourceID="sqlDSAuthNonImpl">
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
                    SelectCommand="SELECT number, briefdescription, CAST(dataanmk AS date) AS [aanmaak datum] FROM change WHERE (authorizationdate IS NULL) AND (rejecteddate IS NULL) ORDER BY dataanmk DESC"></asp:SqlDataSource>
            </div>


        </div>
    </form>
</body>
</html>
