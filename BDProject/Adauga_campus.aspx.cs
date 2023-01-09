using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;

namespace BDProject
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Contract_Main_page_Click(object sender, EventArgs e)
        {

        }

        protected void Button_Adauga_cladirea_Click1(object sender, EventArgs e)
        {
            sort_Label2.Visible = false;
            OracleConnection con = new OracleConnection("DATA SOURCE=193.226.51.37:1521/o11g;PERSIST SECURITY INFO=True;USER ID=OCTAVIANTUDORILIE;PASSWORD=octaviantudor#18");
            OracleCommand query = new OracleCommand("INSERT INTO CAMPUS VALUES ( :ID_campus_c, :locatie_c, :are_cantina_c, :are_baza_c)", con);
            try
            {

                query.Parameters.Add(new OracleParameter("ID_campus_c", TxtB_campus_id.Text));
                query.Parameters.Add(new OracleParameter("locatie_c", TxtB_campus_locatie.Text));
                query.Parameters.Add(new OracleParameter("are_cantina_c", DropDownList_cantina.SelectedItem.Text));
                query.Parameters.Add(new OracleParameter("are_baza_c", DropDownList_baza.SelectedItem.Text));



                con.Open();
                query.ExecuteNonQuery();
                con.Close();

                GridView_cladire.DataBind();

                TxtB_campus_id.Text = string.Empty;
                TxtB_campus_locatie.Text = string.Empty;
            }
            catch (Exception exception)
            {
                sort_Label2.Text = "Adaugarea campusului nu s-a efectuat";
                sort_Label2.Visible = true;
                TxtB_campus_id.Text = string.Empty;
                TxtB_campus_locatie.Text = string.Empty;
            }


        }

        protected void GridView_cladire_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}