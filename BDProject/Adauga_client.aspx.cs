using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess;
using System.Data.OracleClient;

namespace BDProject
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Client_Main_page_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }

        protected void Button_Adauga_client_Click(object sender, EventArgs e)
        {
            sort_Label3.Visible = false;
            OracleConnection con = new OracleConnection("DATA SOURCE=193.226.51.37:1521/o11g;PERSIST SECURITY INFO=True;USER ID=OCTAVIANTUDORILIE;PASSWORD=octaviantudor#18");
            OracleCommand query = new OracleCommand("INSERT INTO CLIENTI VALUES (CLIENTI_ID_client_SEQ.nextval, :Nume, :Prenume,:Facultate, :Data_nastere, :Sex)", con);
            try
            {

                query.Parameters.Add(new OracleParameter("Nume", TxtB_Client_nume_familie.Text));
            query.Parameters.Add(new OracleParameter("Prenume", TxtB_Client_prenume.Text));
            query.Parameters.Add(new OracleParameter("Facultate", TxtB_Client_facultate.Text));
            query.Parameters.Add(new OracleParameter("Data_nastere",Convert.ToDateTime(TxtB_Client_data_nastere.Text)));

            string sex = DropDownList1.SelectedValue.ToString() == "0" ? "M" : "F";

            query.Parameters.Add(new OracleParameter("Sex", sex));

            
           con.Open();
                query.ExecuteNonQuery();
                con.Close();

                GridViewClient.DataBind();
                

               TxtB_Client_data_nastere.Text = "";
               TxtB_Client_facultate.Text = "";
               TxtB_Client_nume_familie.Text = "";
                TxtB_Client_prenume.Text = "";


            }
            catch (Exception exception)
            {
                sort_Label3.Text = "! Introducerea datelor s-a facut gresit, modificarea nu s-a efectuat.";
                sort_Label3.Visible = true;
                TxtB_Client_data_nastere.Text = "";
                TxtB_Client_facultate.Text = "";
                TxtB_Client_nume_familie.Text = "";
                TxtB_Client_prenume.Text = "";
            }
        }
    }
}