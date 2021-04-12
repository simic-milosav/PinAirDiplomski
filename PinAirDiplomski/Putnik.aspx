<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Putnik.aspx.cs" Inherits="PinAirDiplomski.Putnik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Unos podataka o putniku<br />
            <br />
            Ime:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txt_Ime" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_Ime" Display="Dynamic" ErrorMessage="Polje mora biti popunjeno!" ForeColor="Red">*</asp:RequiredFieldValidator>
            <br />
            <br />
            Prezime:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="txt_Prezime" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Prezime" Display="Dynamic" ErrorMessage="Polje mora biti popunjeno" ForeColor="Red">*</asp:RequiredFieldValidator>
            <br />
            <br /> Datum rođenja:
            <asp:Calendar ID="cal_Rodjendan" runat="server"></asp:Calendar>
            <asp:CustomValidator ID="CustomValidator1" runat="server" Display="Dynamic" ErrorMessage="CustomValidator" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate1">Molimo Vas da označite datum rođenja</asp:CustomValidator>
            <br />
            <br />
            Mesto boravka: <asp:TextBox ID="txt_Mesto" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_Mesto" Display="Dynamic" ErrorMessage="Polje mora biti popunjeno" ForeColor="Red">*</asp:RequiredFieldValidator>
            <br />
            <br />
            Država:<asp:DropDownList ID="ddl_Drzava" runat="server" DataSourceID="Drzave" DataTextField="NazivDrzave" DataValueField="idDrzave" OnDataBound="ddl_Drzava_DataBound" OnSelectedIndexChanged="ddl_Drzava_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddl_Drzava" Display="Dynamic" ErrorMessage="Izaberite jednu od opcija" ForeColor="Red" InitialValue="--izaberi--">*</asp:RequiredFieldValidator>
            <asp:SqlDataSource ID="Drzave" runat="server" ConnectionString="<%$ ConnectionStrings:pin_airConnectionString %>" SelectCommand="SELECT [idDrzave], [NazivDrzave] FROM [Drzava]"></asp:SqlDataSource>
            <br />
            <br />
            Broj pasoša:
            <asp:TextBox ID="txt_Pasos" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_Pasos" Display="Dynamic" ErrorMessage="Polje mora biti popunjeno" ForeColor="Red">*</asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Button ID="btn_Rezervisi" runat="server" Text="Rezerviši kartu" OnClick="btn_Rezervisi_Click" />
        </div>
    </form>
</body>
</html>
