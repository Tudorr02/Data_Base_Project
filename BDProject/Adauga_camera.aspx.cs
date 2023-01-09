using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Data;
using System.Drawing;

namespace BDProject
{

    public partial class WebForm10 : System.Web.UI.Page
    {
      
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Contract_Main_page_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }

        public int next_room_id()
        {
            OracleConnection con = new OracleConnection("DATA SOURCE=193.226.51.37:1521/o11g;PERSIST SECURITY INFO=True;USER ID=OCTAVIANTUDORILIE;PASSWORD=octaviantudor#18");

            OracleCommand query3 = new OracleCommand("SELECT C.ID_CAMERA FROM CAMERE C WHERE C.ID_CLADIRE='" + TxtB_cladire.Text + "'", con);

            OracleDataAdapter da = new OracleDataAdapter(query3);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Open();
            query3.ExecuteNonQuery();

            GridView_false.DataSource = dt;
            GridView_false.DataBind();
            
            con.Close();
            int max = 0;

            for (int i = 0; i < GridView_false.Rows.Count; i++)
            {
                string txt = GridView_false.Rows[i].Cells[0].Text;
                if (txt.Length == 9)
                {
                    txt = txt.Substring(0, 1);
                    int nr = Convert.ToInt32(txt);
                    if (nr > max) max = nr;
                }
                if (txt.Length == 10)
                {
                    txt = txt.Substring(0, 2);
                    int nr = Convert.ToInt32(txt);
                    if (nr > max) max = nr;
                }


            }
            return max+1;
        }
        protected void Button_Adauga_cladirea_Click1(object sender, EventArgs e)
        {
            sort_Label2.Visible = false;
            OracleConnection con = new OracleConnection("DATA SOURCE=193.226.51.37:1521/o11g;PERSIST SECURITY INFO=True;USER ID=OCTAVIANTUDORILIE;PASSWORD=octaviantudor#18");
             OracleCommand query = new OracleCommand("INSERT INTO CAMERE VALUES ( :ID_camera_c, :ID_cladire_c, :etaj_c, :ID_tip_c, :ID_reparatii)", con);
            OracleCommand query2 = new OracleCommand("SELECT COUNT(*) FROM CAMERE C WHERE C.ID_CLADIRE='"+TxtB_cladire.Text+"'", con);

           

            
            con.Open();
               
            Int32 id=Convert.ToInt32(query2.ExecuteScalar());
            con.Close();

            if (id == 0)
                id = 1;
            else
                id=next_room_id();
                
            int etaj = (id-1 )/ 5;
            string id_camera = id.ToString();
                id_camera += "_";
                id_camera += TxtB_cladire.Text;
                string id_tip="";

                switch (DropDownList_tip.SelectedItem.Text)
                {
                    case "Single Standard": id_tip = "SNP"; break;
                    case "Single Premium": id_tip = "SP"; break;
                    case "Double Standard": id_tip = "DNP"; break;
                    case "Double Premium": id_tip = "DP"; break;
                    case "Triple Standard": id_tip = "TNP"; break;
                    case "Triple Premium": id_tip = "TP"; break;
                    case "Exclusive": id_tip = "EX"; break;
                }

            try { 

                query.Parameters.Add(new OracleParameter("ID_camera_c", id_camera));
                query.Parameters.Add(new OracleParameter("ID_cladire_c", TxtB_cladire.Text));
                query.Parameters.Add(new OracleParameter("etaj_c", etaj.ToString()));
                query.Parameters.Add(new OracleParameter("ID_tip_c", id_tip));
                query.Parameters.Add(new OracleParameter("ID_reparatii", DropDownList_reparatii.SelectedItem.Text));

               

                con.Open();
                 query.ExecuteNonQuery();
                 con.Close();
                GridView_camere.DataBind();
                GridView1.DataBind();
                TxtB_cladire.Text = "";


            }
             catch (Exception exception)
             {
                 sort_Label2.Text = "Adaugarea camerei nu s-a efectuat! Datele au fost introduse gresit.";

                TxtB_cladire.Text = "";
                sort_Label2.Visible = true;
               
             }

          
            
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            TxtB_cladire.Text = GridView1.Rows[e.NewSelectedIndex].Cells[1].Text;
            e.NewSelectedIndex = -1;
           
        }
    }
}