using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;

namespace BDProject
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Client_Main_page_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }


        protected void Button_Adauga_tip_Click(object sender, EventArgs e)
        {
            OracleConnection con = new OracleConnection("DATA SOURCE=193.226.51.37:1521/o11g;PERSIST SECURITY INFO=True;USER ID=OCTAVIANTUDORILIE;PASSWORD=octaviantudor#18");
            OracleCommand query = new OracleCommand("INSERT INTO TIP_CAMERA VALUES ( :ID_TIP, :Denumire, :Premium, :locuri)", con);
            try
            {

                query.Parameters.Add(new OracleParameter("ID_TIP", TxtB_Tip_camera_ID.Text));
                query.Parameters.Add(new OracleParameter("Denumire", TxtB_Tip_denumire.Text));


               //

                string premium= DropDownList_premium.SelectedValue.ToString() == "0" ? "NU" : "DA";
                int nr_locuri = DropDownList_numar_locuri.SelectedIndex + 1;

                query.Parameters.Add(new OracleParameter("Premium", premium.ToString()));
                query.Parameters.Add(new OracleParameter("locuri", nr_locuri));

                

                
                con.Open();
                query.ExecuteNonQuery();
                con.Close();

               GridViewTip.DataBind();

                TxtB_Tip_camera_ID.Text = "";
                TxtB_Tip_denumire.Text = "";
                DropDownList_numar_locuri.SelectedIndex = 0;
                DropDownList_premium.SelectedIndex = 0;



               

            }
            catch (Exception exception)
            {
                sort_Label3.Text = "! Introducerea datelor s-a facut gresit, modificarea nu s-a efectuat";
                sort_Label3.Visible = true;

                TxtB_Tip_camera_ID.Text = "";
                TxtB_Tip_denumire.Text = "";
                DropDownList_numar_locuri.SelectedIndex = 0;
                DropDownList_premium.SelectedIndex = 0;

            }
        }
    }
}