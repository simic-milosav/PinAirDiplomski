<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PinAirDiplomski.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Izbor leta"></asp:Label>
            <br />
            <br />
            Molimo Vas da odaberete državu polaska:<br />
            <br />
            <asp:DropDownList ID="ddl_PolazneDrz" runat="server" AutoPostBack="true" DataSourceID="Drzave" DataTextField="NazivDrzave" DataValueField="idDrzave" OnSelectedIndexChanged="ddl_PolazneDrz_SelectedIndexChanged" Width="125px" OnDataBound="ddl_PolazneDrz_DataBound">
            </asp:DropDownList>
            <asp:SqlDataSource ID="Drzave" runat="server" ConnectionString="<%$ ConnectionStrings:pin_airConnectionString %>" SelectCommand="SELECT [idDrzave], [NazivDrzave] FROM [Drzava]"></asp:SqlDataSource>
            <br />
            <br />
            Molimo Vas da odaberete polazni aerodrom:<br />
            <br />
            <asp:DropDownList ID="ddl_PolazniAer" runat="server" AutoPostBack="true" Width="126px" OnSelectedIndexChanged="ddl_PolazniAer_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <br />
            Molimo Vas da odaberete državu dolaska:<br />
            <br />
            <asp:DropDownList ID="ddl_DolazneDrz" runat="server" AutoPostBack="true" DataSourceID="Drzave" DataTextField="NazivDrzave" DataValueField="idDrzave" Width="127px" OnSelectedIndexChanged="ddl_DolazneDrz_SelectedIndexChanged" OnDataBound="ddl_DolazneDrz_DataBound">
            </asp:DropDownList>
            <br />
            <br />
            Molimo Vas da odaberete dolazni aerodrom:<br />
            <br />
            <asp:DropDownList ID="ddl_DolazniAer" runat="server" AutoPostBack="true" Width="129px" OnSelectedIndexChanged="ddl_DolazniAer_SelectedIndexChanged">
            </asp:DropDownList>
            <br />
            <br />
            Molimo Vas da odaberete datum polaska:<br />
            <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
            <br />
            Molimo Vas da odaberete let:<br />
            <br />
            <asp:GridView ID="gd_Letovi" runat="server" AutoGenerateSelectButton="true" Width="314px" OnRowDataBound="gd_Letovi_RowDataBound">
                <SelectedRowStyle BackColor="#66FFFF" />
            </asp:GridView>
            <br />
            <br />
            <asp:Button ID="btn_Dalje" runat="server" Text="Dalje" OnClick="btn_Dalje_Click" />
        </div>
    </form>
</body>
</html>
