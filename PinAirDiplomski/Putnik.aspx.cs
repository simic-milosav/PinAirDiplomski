using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace PinAirDiplomski
{
    public partial class Putnik : System.Web.UI.Page
    {
        private Let let;
        private SqlConnection connection;

        protected void Page_Load(object sender, EventArgs e)
        {
            let = (Let)Session["Let"];
            connection = (SqlConnection)Session["Connection"];
        }

        protected void btn_Rezervisi_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    SqlCommand noviPutnik = new SqlCommand("insert into Putnik values ('" + txt_Ime.Text + "','" + txt_Prezime.Text + "','" + cal_Rodjendan.SelectedDate + "', '" + txt_Mesto.Text + "', '" + ddl_Drzava.SelectedValue + "', '" + txt_Pasos.Text + "')", connection);
                    noviPutnik.ExecuteNonQuery();
                    SqlCommand novaKarta = new SqlCommand("insert into Karta values ('" + let.IdLeta + "', (select idPutnika from Putnik where BrojPasosa = '" + txt_Pasos.Text + "'))", connection);
                    SqlCommand promenaBrojaMesta = new SqlCommand("update Let set PreostaloMesta = '" + (let.PreostaloMesta - 1) + "' where idLeta = '" + let.IdLeta + "'", connection);
                    novaKarta.ExecuteNonQuery();
                    promenaBrojaMesta.ExecuteNonQuery();
                    connection.Close();
                    Response.Write("<script>alert('Uspešna rezervacija!');</script>");
                    Session.Remove("Let");
                    Session.Remove("Connection");
                    Server.Transfer("Default.aspx");
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Greška prilikom rezervacije karte!');</script>");
            }
        }

        protected void ddl_Drzava_DataBound(object sender, EventArgs e)
        {
            ddl_Drzava.Items.Insert(0, new ListItem("--izaberi--", ""));
        }

        protected void ddl_Drzava_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_Drzava.Items.FindByValue("").Enabled = false;
        }

        protected void CustomValidator1_ServerValidate1(object source, ServerValidateEventArgs args)
        {
            if (cal_Rodjendan.SelectedDate == null || cal_Rodjendan.SelectedDate == default)
                args.IsValid = false;
            else
                args.IsValid = true;
        }
    }
}