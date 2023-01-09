using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Data;

namespace BDProject
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        static int select_auto = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Angajat_Main_page_Click(object sender, EventArgs e)
        {
            Response.Redirect("MainPage.aspx");
        }

        protected void Button_Afisare_departamente_Click(object sender, EventArgs e)
        {
            GridView_Angajati_auto.Visible = false;
            OracleConnection con = new OracleConnection("DATA SOURCE=193.226.51.37:1521/o11g;PERSIST SECURITY INFO=True;USER ID=OCTAVIANTUDORILIE;PASSWORD=octaviantudor#18");
            OracleCommand comm = new OracleCommand("SELECT D.NUME_DEPARTAMENT, D.ID_DEPARTAMENT FROM DEPARTAMENTE D",con);
            OracleDataAdapter da = new OracleDataAdapter(comm);
          
            DataTable dt= new DataTable();
            da.Fill(dt);
            GridView_Angajati_auto.DataSource= dt;
            GridView_Angajati_auto.DataBind();
            GridView_Angajati_auto.Visible = true;
            select_auto = 1;

        }

        protected void GridView_Angajati_auto_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {

            switch (select_auto)
            {
                case 1: TxtB_angajat_departament.Text = GridView_Angajati_auto.Rows[e.NewSelectedIndex].Cells[2].Text;
                    break;
                case 2:
                    TxtB_Angajat_campus.Text = GridView_Angajati_auto.Rows[e.NewSelectedIndex].Cells[2].Text;
                    break;
            }
            e.NewSelectedIndex = -1;
        }

        protected void Button_Angajati_Afisare_campusuri_Click(object sender, EventArgs e)
        {
            
            GridView_Angajati_auto.Visible = false;
            OracleConnection con = new OracleConnection("DATA SOURCE=193.226.51.37:1521/o11g;PERSIST SECURITY INFO=True;USER ID=OCTAVIANTUDORILIE;PASSWORD=octaviantudor#18");
            OracleCommand comm = new OracleCommand("SELECT C.LOCATIE,C.ID_CAMPUS FROM CAMPUS C", con);
            OracleDataAdapter da = new OracleDataAdapter(comm);

            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView_Angajati_auto.DataSource = dt;
            GridView_Angajati_auto.DataBind();
            GridView_Angajati_auto.Visible = true;
            select_auto = 2;
        }

        protected void Button_Adaugare_angajat_Click(object sender, EventArgs e)
        {
            OracleConnection con = new OracleConnection("DATA SOURCE=193.226.51.37:1521/o11g;PERSIST SECURITY INFO=True;USER ID=OCTAVIANTUDORILIE;PASSWORD=octaviantudor#18");
            OracleCommand comm = new OracleCommand("INSERT INTO ANGAJATI VALUES (ANGAJATI_ID_angajat_SEQ.nextval, :Departament, :Nume, :Prenume, :Data_nastere,:Oras, :Salariu, :Campus)",con);
            try
            {
                comm.Parameters.Add(new OracleParameter("Departament", TxtB_angajat_departament.Text));
            comm.Parameters.Add(new OracleParameter("Nume", TxtB_angajat_Nume.Text));
            comm.Parameters.Add(new OracleParameter("Prenume",TxtB_angajat_prenume.Text));
            comm.Parameters.Add(new OracleParameter("Data_nastere", Convert.ToDateTime(TxtB_angajat_data_nastere.Text)));
            comm.Parameters.Add(new OracleParameter("Oras",TxtB_angajat_oras.Text));
            comm.Parameters.Add(new OracleParameter("Salariu",TxtB_angajat_salariu.Text));
            comm.Parameters.Add(new OracleParameter("Campus", TxtB_Angajat_campus.Text));
            //TxtB_angajat_salariu.Text
            
                con.Open();
                comm.ExecuteNonQuery();
                con.Close();

                GridView_Angajat.DataBind();


                TxtB_Angajat_campus.Text = "";
                TxtB_angajat_Nume.Text = "";
                TxtB_angajat_data_nastere.Text = "";
                TxtB_angajat_oras.Text = "";
                TxtB_angajat_prenume.Text = "";
                TxtB_angajat_departament.Text = "";
                TxtB_angajat_salariu.Text = "";


            }
            catch (Exception exception)
            {
                sort_Label_angajat.Text = "! Introducerea datelor s-a facut gresit, modificarea nu s-a efectuat";
                sort_Label_angajat.Visible = true;
                TxtB_Angajat_campus.Text = "";
                TxtB_angajat_Nume.Text = "";
                TxtB_angajat_data_nastere.Text = "";
                TxtB_angajat_oras.Text = "";
                TxtB_angajat_prenume.Text = "";
                TxtB_angajat_departament.Text = "";
                TxtB_angajat_salariu.Text = "";
            }


        }
    }
}