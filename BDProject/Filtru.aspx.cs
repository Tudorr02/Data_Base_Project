using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;

namespace BDProject
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        static int select_auto = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            sort_Label_angajat.Visible = false;
            GridView_filtru_auto.Visible = true;
            OracleConnection con = new OracleConnection("DATA SOURCE=193.226.51.37:1521/o11g;PERSIST SECURITY INFO=True;USER ID=OCTAVIANTUDORILIE;PASSWORD=octaviantudor#18");
            OracleCommand comm = new OracleCommand("SELECT * FROM CAMERE", con);
            OracleDataAdapter da = new OracleDataAdapter(comm);

            DataTable dt = new DataTable();
            con.Open();
            comm.ExecuteNonQuery();
            da.Fill(dt);
            GridView_filtru_auto.DataSource = dt;
            GridView_filtru_auto.DataBind();
           

        }

        protected void Filtru_Main_page_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }

        
      
        protected void Contract_Main_page_Command(object sender, CommandEventArgs e)
        {

        }

        protected void Button_filtru_Click(object sender, EventArgs e)
        {
            sort_Label_angajat.Visible = false;
            OracleCommand query=new OracleCommand();
            OracleConnection con = new OracleConnection("DATA SOURCE=193.226.51.37:1521/o11g;PERSIST SECURITY INFO=True;USER ID=OCTAVIANTUDORILIE;PASSWORD=octaviantudor#18");
            int etaj=DropDownList_filtru.SelectedIndex;
            if (TxtB_filtru_cladire.Text.Length > 0 && DropDownList_filtru.SelectedIndex>0)
             {
                 query = new OracleCommand("SELECT  count(C.ID_CAMERA),TC.DENUMIRE FROM CAMERE C JOIN TIP_CAMERA TC on C.ID_TIP = TC.ID_TIP GROUP BY TC.DENUMIRE ," +
                 " C.ID_CLADIRE,C.ETAJ HAVING ID_CLADIRE= :Id_cladire AND C.ETAJ= :Etaj ORDER BY C.ETAJ", con);
                 query.Parameters.Add(new OracleParameter("Id_cladire", TxtB_filtru_cladire.Text));
                 etaj = DropDownList_filtru.SelectedIndex;
                 query.Parameters.Add(new OracleParameter("Etaj", etaj-1));
                 sort_Label_angajat.Text = "Filtrare facuta dupa etaj si cladire";
                sort_Label_angajat.Visible = true;

            }
             if (TxtB_filtru_cladire.Text.Length == 0 && DropDownList_filtru.SelectedIndex > 0)
             {
                 query = new OracleCommand("SELECT  count(C.ID_CAMERA),TC.DENUMIRE, C.ID_CLADIRE FROM CAMERE C JOIN TIP_CAMERA TC on C.ID_TIP = TC.ID_TIP GROUP BY TC.DENUMIRE ," +
                 " C.ID_CLADIRE,C.ETAJ HAVING C.ETAJ= :Etaj ORDER BY C.ETAJ", con);
                  etaj = DropDownList_filtru.SelectedIndex;
                 query.Parameters.Add(new OracleParameter("Etaj", etaj-1));
                 sort_Label_angajat.Text = "Filtrare facuta dupa etaj";
                sort_Label_angajat.Visible = true;
            }
           

             if(TxtB_filtru_cladire.Text.Length > 0 && DropDownList_filtru.SelectedIndex ==0)
             {

                 query = new OracleCommand("SELECT  count(C.ID_CAMERA),TC.DENUMIRE , C.ETAJ FROM CAMERE C JOIN TIP_CAMERA TC on C.ID_TIP = TC.ID_TIP GROUP BY TC.DENUMIRE , C.ID_CLADIRE,C.ETAJ HAVING ID_CLADIRE= :ID_cladire ORDER BY C.ETAJ", con);

                
                query.Parameters.Add(new OracleParameter("Id_cladire", TxtB_filtru_cladire.Text));
                

                sort_Label_angajat.Text = "Filtrare facuta dupa cladire";
                sort_Label_angajat.Visible = true;
            }

             if (TxtB_filtru_cladire.Text.Length != 0 || DropDownList_filtru.SelectedIndex != 0)

             {
               
                 OracleDataAdapter da = new OracleDataAdapter(query);
                 DataTable dt = new DataTable();
                 da.Fill(dt);
                 con.Open();
                 query.ExecuteNonQuery();
                 GridView_filtru_auto.DataSource = dt;
                 GridView_filtru_auto.DataBind();
                 con.Close();


             }
        

            TxtB_filtru_cladire.Text = "";
            DropDownList_filtru.SelectedIndex = 0;
           
        }

        protected void GridView_filtru_cladiri_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            TxtB_filtru_cladire.Text = GridView_filtru_cladiri.Rows[e.NewSelectedIndex].Cells[1].Text;
            e.NewSelectedIndex = -1;
        }
    }
}