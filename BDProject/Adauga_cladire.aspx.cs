using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;

namespace BDProject
{
    public partial class Adauga_cladire : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Contract_Main_page_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }

        protected void GridView_campus_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            TxtB_Cladire_campus.Text = GridView_campus.Rows[e.NewSelectedIndex].Cells[1].Text;
            e.NewSelectedIndex = -1;
        }

        protected void Button_Adauga_cladirea_Click1(object sender, EventArgs e)
        {
            sort_Label2.Visible = false;
            OracleConnection con = new OracleConnection("DATA SOURCE=193.226.51.37:1521/o11g;PERSIST SECURITY INFO=True;USER ID=OCTAVIANTUDORILIE;PASSWORD=octaviantudor#18");
            OracleCommand query = new OracleCommand("INSERT INTO CLADIRE VALUES (:ID_cladire,:ID_campus,:etaje,:numar_stingatoare)", con);
            try
            {
                
                query.Parameters.Add(new OracleParameter("ID_cladire", TxtB_Cladire_id.Text));
                query.Parameters.Add(new OracleParameter("ID_campus", TxtB_Cladire_campus.Text));
                query.Parameters.Add(new OracleParameter("etaje", TxtB_Cladire_etaje.Text));
                query.Parameters.Add(new OracleParameter("numar_stingatoare", TxtB_Cladire_nr_stingatoare.Text));

                

                con.Open();
                query.ExecuteNonQuery();
                con.Close();

                GridView_cladire.DataBind();
               

                TxtB_Cladire_id.Text = "";
                TxtB_Cladire_campus.Text = "";
                TxtB_Cladire_etaje.Text = "";
                TxtB_Cladire_nr_stingatoare.Text = "";


            }
            catch (Exception exception)
            {
                sort_Label2.Text = "Adaugarea campusului nu s-a efectuat. Datele introdusele sunt incorecte!";
                sort_Label2.Visible = true;
                TxtB_Cladire_id.Text = "";
                TxtB_Cladire_campus.Text = "";
                TxtB_Cladire_etaje.Text = "";
                TxtB_Cladire_nr_stingatoare.Text = "";
            }
        }
    }

}