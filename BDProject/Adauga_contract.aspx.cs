using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Common.CommandTrees;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.OracleClient;
using System.Data.SqlClient;
using System.Data;

namespace BDProject
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private string SortDirection
        {
            get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
            set { ViewState["SortDirection"] = value; }
        }
        protected void GridView2_Sorting(object sender, GridViewSortEventArgs e)
        {

            string sortExpression = e.SortExpression;

        }

        protected void GridView_2_DataBound(object sender, EventArgs e)
        {

        }


        protected void Button_Adauga_contract_Click(object sender, EventArgs e)
        {
            OracleConnection con = new OracleConnection("DATA SOURCE=193.226.51.37:1521/o11g;PERSIST SECURITY INFO=True;USER ID=OCTAVIANTUDORILIE;PASSWORD=octaviantudor#18");
            OracleCommand query = new OracleCommand("INSERT INTO CONTRACTE_INCHIRIERE VALUES " +
                "(CONTRACTE_IE_ID_contract_SEQ.nextval, :IDclient, :date_start, :date_final, :roomID )", con);
            try
            {
                sort_Label2.Visible= false;
                query.Parameters.Add(new OracleParameter("IDclient", TxtB_Contract_ID_client.Text));
            query.Parameters.Add(new OracleParameter("date_start", Convert.ToDateTime(TxtB_Inceput_contract.Text)));
            query.Parameters.Add(new OracleParameter("date_final", Convert.ToDateTime(TxtB_Final_contract.Text)));
            query.Parameters.Add(new OracleParameter("roomID", TxtB_Contract_ID_camera.Text));

           
           
                con.Open();
                query.ExecuteNonQuery();
                con.Close();

                GridView_2.DataBind();
                GridView_Camere_libere.DataBind();

                TxtB_Contract_ID_camera.Text = "";
                TxtB_Contract_ID_client.Text = "";
                TxtB_Inceput_contract.Text = "";
                TxtB_Final_contract.Text = "";


            }
            catch (Exception exception)
            {
                sort_Label2.Text = "! Introducerea datelor s-a facut gresit, modificarea nu s-a efectuat";
                sort_Label2.Visible = true;
                TxtB_Contract_ID_camera.Text = "";
                TxtB_Contract_ID_client.Text = "";
                TxtB_Inceput_contract.Text = "";
                TxtB_Final_contract.Text = "";

            }
        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Button_Afisare_camere_disponibile_Click(object sender, EventArgs e)
        {
            GridView_Camere_libere.Visible = true;
        }

        protected void GridView_Camere_libere_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            TxtB_Contract_ID_camera.Text = GridView_Camere_libere.Rows[e.NewSelectedIndex].Cells[1].Text;
            e.NewSelectedIndex = -1;
        }

        protected void Contract_Main_page_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }

        protected void Button_Adauga_cladire_Click(object sender, EventArgs e)
        {

        }
    }

}