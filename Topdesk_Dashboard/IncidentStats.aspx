<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IncidentStats.aspx.cs" Inherits="Topdesk_Dashboard.IncidentStats" %>

<!DOCTYPE html>

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
        </div>



    </form>
</body>
</html>
