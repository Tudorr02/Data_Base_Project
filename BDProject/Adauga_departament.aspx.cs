
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;

namespace BDProject
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_Adauga_departament_Click(object sender, EventArgs e)
        {
            OracleConnection con = new OracleConnection("DATA SOURCE=193.226.51.37:1521/o11g;PERSIST SECURITY INFO=True;USER ID=OCTAVIANTUDORILIE;PASSWORD=octaviantudor#18");
            OracleCommand query = new OracleCommand("INSERT INTO DEPARTAMENTE VALUES (:ID,:Nume)", con);
            try
            {


                string nume=TxtB_departament_nume.Text;

                char[]c= nume.ToCharArray();
                int x = 0;

                for(int i = 0; i < nume.Length; i++)
                {
                    x += Convert.ToInt16(c[i]);
                   
                }

                int pass = 1;
                
                for(int i=0;i<GridViewdepartament.Rows.Count;i++)
                {
                    if (x == Convert.ToInt16(GridViewdepartament.Rows[i].Cells[0].Text)) 
                    {
                        sort_Label3.Text = "! Numele departamentului exista deja in baza de date / id asemanator";
                        sort_Label3.Visible = true;
                        pass = 0;
                    }
                }
               
                if(pass == 1 )
                {
                    query.Parameters.Add(new OracleParameter("ID", x));
                    query.Parameters.Add(new OracleParameter("Nume", TxtB_departament_nume.Text));

                    con.Open();
                    query.ExecuteNonQuery();
                    con.Close();

                    GridViewdepartament.DataBind();


                    TxtB_departament_nume.Text = "";
                }
               
           

            }
            catch (Exception exception)
            {
                sort_Label3.Text = "! Introducerea datelor s-a facut gresit, modificarea nu s-a efectuat";
                sort_Label3.Visible = true;
                TxtB_departament_nume.Text = "";
            }
        }

        protected void Client_Main_page_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }
    }
}