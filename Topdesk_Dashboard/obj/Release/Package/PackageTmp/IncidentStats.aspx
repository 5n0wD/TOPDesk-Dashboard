<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentStats.aspx.cs" Inherits="Topdesk_Dashboard.IncidentStats" %>

<!DOCTYPE html>
<%-- V1.4 --%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet.css" type="text/css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="DivContent2">
                <p class="Paragraph">Incidenten melding per 10 dagen, vanaf begin 2015</p>
                <div class="ChartDiv">
                    <asp:Chart ID="Chart2" runat="server" DataSourceID="AOTimeDatasource" Width="900px" Height="200px" DataMember="DefaultView">
                        <Series>
                            <asp:Series
                                ChartArea="ChartArea1" Name="Meldingen per dag" XValueMember="Datum" XValueType="Date" YValueMembers="count datum" YValueType="Int32" LegendMapAreaAttributes="#VALX" MarkerStep="2">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisY Maximum="15" Minimum="0" Title="Aantal" IsLabelAutoFit="False">
                                    <LabelStyle IsStaggered="True" />
                                </AxisY>
                                <AxisX Title="Datum">
                                </AxisX>
                                <AxisX2 IntervalType="Weeks">
                                </AxisX2>
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    <asp:SqlDataSource ID="AOTimeDatasource" runat="server" ConnectionString="<%$ ConnectionStrings:topdesk5ConnectionString %>" SelectCommand="select cast(datumaangemeld as DATE) as &quot;Datum&quot;, count(ref_operatordynanaam) as &quot;count datum&quot; from incident where ref_operatordynanaam = any ( select distinct(ref_operatordynanaam) from incident ) and DATEPART(YEAR,datumaangemeld) &gt; 2014 group by CAST(datumaangemeld as date) order by CAST(datumaangemeld as date) desc"></asp:SqlDataSource>
                </div>
            </div>

            <div id="DivContent3">
                <p class="Paragraph">Aantal meldingen dat binnenkort moeten worden opgelost</p>
                <div class="ChartDiv">
                    <asp:Chart ID="Chart3" runat="server" DataSourceID="StillToComeDataSource" Height="200px" Width="900px" Palette="Bright">
                        <Series>
                            <asp:Series Name="Series1" ChartArea="ChartArea1" XValueMember="streefdatum" YValueMembers="AantalPerDag"></asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                                <AxisY Maximum="15" Minimum="0" Title="Aantal" IntervalAutoMode="VariableCount" IsLabelAutoFit="False">
                                </AxisY>
                                <AxisX Title="Datum" IsLabelAutoFit="False">
                                    <LabelStyle IsStaggered="True" />
                                </AxisX>
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                    <asp:SqlDataSource ID="StillToComeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:topdesk5ConnectionString %>" SelectCommand="SELECT CAST(datumafspraak AS date) AS streefdatum, COUNT(naam) AS AantalPerDag FROM incident WHERE (datumafspraak &gt;= GETDATE()) AND (datumafspraak &lt; DATEADD(day, 14, GETDATE())) GROUP BY datumafspraak"></asp:SqlDataSource>
                </div>
            </div>

            <div id="DivContent4">
                <p class="Paragraph">Applicatie kaart</p>
                <div class="ChartDiv">
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="900px" Height="200px" Palette="Fire">
                        <Series>
                            <asp:Series Name="Series1" CustomProperties="DrawSideBySide=True, PointWidth=0.5" Font="Microsoft Sans Serif, 8px" IsValueShownAsLabel="True" LabelBackColor="White" LabelBorderColor="Red" LegendMapAreaAttributes="#VALX" MarkerStep="5" MarkerStyle="Triangle" Palette="Fire" XValueMember="ref_domein" YValueMembers="Expr1" YValueType="Int32">
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:topdesk5ConnectionString %>" SelectCommand="SELECT COUNT(ref_domein) AS Expr1, ref_domein FROM incident WHERE (ref_domein = ' ') OR (ref_domein = 'Diversen') OR (ref_domein = 'Connect-IT') OR (ref_domein = 'mendix') OR (ref_domein = 'matrix') OR (ref_domein = 'specifieke applicaties') OR (ref_domein = 'ict middelen') OR (ref_domein = 'autodesk') OR (ref_domein = 'ms office') OR (ref_domein = 'dms') OR (ref_domein = 'cobra') OR (ref_domein = 'metacom') GROUP BY ref_domein ORDER BY Expr1"></asp:SqlDataSource>
                </div>
            </div>
            &nbsp
            <div id="DivContent1en2">
                <div class="ChartDiv">
                    <div id="binnenGekomenMeldingen">
                        <p class="Paragraph">Binnen gekomen meldingen</p>
                        <asp:GridView ID="GridView1" PageSize="5" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                            <AlternatingRowStyle BackColor="#DCDCDC" />
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
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
