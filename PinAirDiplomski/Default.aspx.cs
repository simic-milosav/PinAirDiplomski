using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace PinAirDiplomski
{
    public partial class Default : System.Web.UI.Page
    {
        private SqlConnection connection;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                connection = new SqlConnection(@"Data Source=DESKTOP-E0VTEN2\SQLEXPRESS;Initial Catalog=pin_air;Integrated Security=True");
                connection.Open();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Greška prilikom povezivanja sa bazom!')</script>");
            }
        }

        protected void ddl_PolazneDrz_SelectedIndexChanged(object sender, EventArgs e)
        {
            PrikaziAerodrome(ddl_PolazniAer, int.Parse(ddl_PolazneDrz.SelectedValue));
            ddl_PolazneDrz.Items.FindByValue("").Enabled = false;
            PrikaziLetove();
        }

        protected void ddl_DolazneDrz_SelectedIndexChanged(object sender, EventArgs e)
        {
            PrikaziAerodrome(ddl_DolazniAer, int.Parse(ddl_DolazneDrz.SelectedValue));
            ddl_DolazneDrz.Items.FindByValue("").Enabled = false;
            PrikaziLetove();
        }

        protected void ddl_PolazneDrz_DataBound(object sender, EventArgs e)
        {
            ddl_PolazneDrz.Items.Insert(0, new ListItem("--izaberi--", ""));
        }

        protected void ddl_DolazneDrz_DataBound(object sender, EventArgs e)
        {
            ddl_DolazneDrz.Items.Insert(0, new ListItem("--izaberi--", ""));
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            PrikaziLetove();
        }

        protected void ddl_PolazniAer_SelectedIndexChanged(object sender, EventArgs e)
        {
            PrikaziLetove();
        }

        protected void ddl_DolazniAer_SelectedIndexChanged(object sender, EventArgs e)
        {
            PrikaziLetove();
        }

        private void PrikaziAerodrome(DropDownList aerodromi, int idDrzave)
        {
            try
            {
                SqlCommand command = new SqlCommand("select * from Aerodrom where idDrzave = '" + idDrzave + "'", connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable aerodromiTabela = new DataTable();
                adapter.Fill(aerodromiTabela);
                aerodromi.DataSource = aerodromiTabela;
                aerodromi.DataValueField = "KodAer";
                aerodromi.DataTextField = "NazivAer";
                aerodromi.DataBind();
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Greška prilikom učitavanja aerodroma!');</script>");
            }
        }

        private void PrikaziLetove()
        {
            try
            {
                if (!string.IsNullOrEmpty(ddl_PolazniAer.SelectedValue) && !string.IsNullOrEmpty(ddl_DolazniAer.SelectedValue) && ddl_PolazniAer.SelectedValue != ddl_DolazniAer.SelectedValue && Calendar1.SelectedDate != default)
                {
                    SqlCommand command = new SqlCommand("select * from Let where KodAerPolaska = '" + ddl_PolazniAer.SelectedValue + "' AND KodAerDolaska = '" + ddl_DolazniAer.SelectedValue + "' AND DatumOdlaska = '" + Calendar1.SelectedDate + "' AND NOT PreostaloMesta = '0'", connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    DataSet letovi = new DataSet();
                    adapter.Fill(letovi);
                    gd_Letovi.DataSource = letovi;
                    gd_Letovi.DataBind();
                }
            }
            catch (Exception)
            {
                Response.Write("<script>alert('Greška prilikom učitavanja letova!');</script>");
            }
        }

        protected void btn_Dalje_Click(object sender, EventArgs e)
        {
            if (gd_Letovi.SelectedRow != null) 
            {
                Session["Let"] = new Let(gd_Letovi.SelectedRow.Cells[1].Text, int.Parse(gd_Letovi.SelectedRow.Cells[9].Text));
                Session["Connection"] = connection;
                Server.Transfer("Putnik.aspx", true);                
            }
            else
                Response.Write("<script>alert('Niste izabrali let!');</script>");
        }

        protected void gd_Letovi_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
        }
    }
}