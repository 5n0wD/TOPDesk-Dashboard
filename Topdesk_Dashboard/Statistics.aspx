<%@ Page Title="Statistics" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="Topdesk_Dashboard.Statistics" %>

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
                            <asp:Label runat="server" ID="lblAllReports" Text="Totaal aantal incidenten:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtTotalAmount" Width="40" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label runat="server" ID="lblNoTargetDate" Text="Aantal zonder streefdatum:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtNoTargetDate" Width="40" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" ID="lblTotalExceeded" Text="Aantal overschreden:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtTotalExceeded" Width="40" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label runat="server" ID="lblTotalToday" Text="Totaal vandaag:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtTotalToday" Width="40" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label runat="server" ID="lblStillToCome" Text="Te realiseren"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtStillToCome" Width="40" ReadOnly="true"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label runat="server" ID="lblTotalYesterday" Text="Totaal Gisteren:"></asp:Label>
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
                            <asp:Label runat="server" ID="lblCountWijzig" Text="Totaal aantal wijzigingen:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="txtCountWijzig" Width="40" ReadOnly="True"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label runat="server" ID="lblAantalActiviteiten" Text="Aantal activiteiten deze week:"></asp:Label>
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
                            <asp:Label runat="server" ID="Label5" Text="Te realiseren"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="TextBox5" Width="40" ReadOnly="true"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label runat="server" ID="Label6" Text="Totaal Gisteren:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox runat="server" ID="TextBox6" Width="40" ReadOnly="true"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </div>
        </div>
        <button id="btnIncident" type="button" onclick="TabIncident()">Incidenten</button>
        <button id="btnChange" type="button" onclick="TabWijziging()">Wijzigingen</button>
    </div>
    <asp:UpdatePanel runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <table>
                <tr>
                    <td>
                        <div id="tabContentDiv" runat="server" class="TabContentDiv">

                            <object id="tabContent" type=text/html></object>
                        </div>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
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
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
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
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
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
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
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

            <div id="AuthNonImpl">
                <p class="Paragraph">Geautoriseerd maar nog niet geimplementeerd</p>
                <asp:GridView ID="AuthnonimplGrid" PageSize="5" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" DataSourceID="sqlDSAuthNonImpl">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="number" HeaderText="number" SortExpression="number" />
                        <asp:BoundField DataField="aantal activiteiten" HeaderText="aantal activiteiten" ReadOnly="True" SortExpression="aantal activiteiten" />
                        <asp:BoundField DataField="authorisatie datum" DataFormatString="{0:d}" HeaderText="authorisatie datum" ReadOnly="True" SortExpression="authorisatie datum" />
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
                <asp:SqlDataSource ID="sqlDSAuthNonImpl" runat="server" ConnectionString="<%$ ConnectionStrings:topdesk5ConnectionString %>" SelectCommand="SELECT DISTINCT c.number, COUNT(ca.number) AS [aantal activiteiten], CAST(c.authorizationdate AS date) AS [authorisatie datum] FROM change AS c RIGHT OUTER JOIN changeactivity AS ca ON ca.ref_change_number = c.number WHERE (c.authorizationdate IS NOT NULL) AND (c.implementationdate IS NULL) AND (ca.resolved = 0) GROUP BY c.number, c.authorizationdate ORDER BY c.number DESC"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
