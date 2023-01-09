using System;

using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Configuration;
using System.Data;
using System.Drawing;
using static System.Net.Mime.MediaTypeNames;
using System.Globalization;
using System.Web.UI;
using System.Text;
using System.Data.SqlClient;

namespace BDProject
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        OracleConnection con = new OracleConnection("DATA SOURCE=193.226.51.37:1521/o11g;PERSIST SECURITY INFO=True;USER ID=OCTAVIANTUDORILIE;PASSWORD=octaviantudor#18");
        static string table;
        static string ID_table;
        static string delete_row;
        protected void Page_Load(object sender, EventArgs e)
        {
            sort_Label1.Visible= false;
            GridView1.EditIndex = -1;
            

            


        }
        public bool checkEmptyTable(DataTable _dt,string _table)
        {
           
            return false;
         
        
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            sort_Label1.Visible = false;
            int selectedValue = Int16.Parse(ddl1.SelectedItem.Value);
            
            OracleCommand cmd;
            table = "";

            //--- Show results in page.
            //Response.Write("Selected Text is " + " and selected value is :" + (selectedValue+10));
            Button_Camere.Visible = false;
            Button_Cladiri.Visible = false;
            Button_Clienti.Visible = false;
            Button_Contract.Visible = false;
            Button_Departamente.Visible = false;
            Button_Tip_camera.Visible = false;
            Button_Campusuri.Visible = false;
            Button_Angajati.Visible = false;
            Button_Camere_filtru.Visible = false;
            Label_stergere.Visible = false;
            Button_stergere_da.Visible = false;
            Button_stergere_nu.Visible = false; 
            GridView_Stergere.Visible = false;  
            switch (selectedValue)
            {
                case 0: 
                  GridView1.Visible = false;

                    break;
                case 1: 
                    GridView1.Visible= true;
                    table = "CONTRACTE_INCHIRIERE";
                    ID_table = "ID_CONTRACT";
                    Button_Contract.Visible = true;
                    break;
                case 2:
                    GridView1.Visible = true;
                    table = "CLIENTI";
                    ID_table = "ID_CLIENT";
                    Button_Clienti.Visible = true;
                    break;
                case 3:
                    GridView1.Visible= true;
                    table = "CAMERE";
                    ID_table = "ID_CAMERA";
                    Button_Camere.Visible = true;
                    Button_Camere_filtru.Visible=true;
                    break;
                case 4:
                    GridView1.Visible = true;
                    table = "CLADIRE";
                    ID_table = "ID_CLADIRE";
                    Button_Cladiri.Visible = true;
                    break;
                case 5:
                    GridView1.Visible = true;
                    table = "CAMPUS";
                    ID_table = "ID_CAMPUS";
                    Button_Campusuri.Visible = true;
                    break;
                case 6:
                    GridView1.Visible = true;
                    table = "ANGAJATI";
                    ID_table = "ID_ANGAJAT";
                    Button_Angajati.Visible = true;
                    break;
                case 7:
                    GridView1.Visible = true;
                    table = "DEPARTAMENTE";
                    ID_table = "ID_DEPARTAMENT";
                    Button_Departamente.Visible = true;
                    break;
                case 8:
                    GridView1.Visible = true;
                    table = "TIP_CAMERA";
                    ID_table = "ID_TIP";
                    Button_Tip_camera.Visible = true;
                    break;
                
            }
            

            if (selectedValue != 0)
            {
                cmd = new OracleCommand("SELECT * FROM " + table, con);


                
                    OracleDataAdapter da = new OracleDataAdapter(cmd);
                    DataTable dt = new DataTable();
                if (!checkEmptyTable(dt, table))
                {
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                }
                
            }
            else
            {
                GridView1.Visible = false;
            }
            con.Close();
           


        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {
           
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            
            this.SortingBindGrid(e.SortExpression);
            sort_Label1.Visible = true;

        }

        private string SortDirection
        {
            get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
            set { ViewState["SortDirection"] = value; }
        }


        private void SortingBindGrid(string sortExpression = null)
        {
            
            string constr = "DATA SOURCE=193.226.51.37:1521/o11g;PERSIST SECURITY INFO=True;USER ID=OCTAVIANTUDORILIE;PASSWORD=octaviantudor#18";
            using (OracleConnection con = new OracleConnection(constr))
            {
             
                using (OracleCommand cmd = new OracleCommand("SELECT * FROM "+table ,con))
                {
                    using (OracleDataAdapter sda = new OracleDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            if (sortExpression != null)
                            {
                                DataView dv = dt.AsDataView();
                                this.SortDirection = this.SortDirection == "ASC" ? "DESC" : "ASC";
                                
                                if (this.SortDirection == "DESC")
                                    sort_Label1.Text = "!Tabelul este sortat descrescator dupa "+sortExpression;
                                else
                                    sort_Label1.Text = "!Tabelul este sortat crescator dupa " + sortExpression;

                                
                                

                                dv.Sort = sortExpression + " " + this.SortDirection;
                                GridView1.DataSource = dv;
                            }
                            else
                            {
                                GridView1.DataSource = dt;
                            }
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.SortingBindGrid();
            (GridView1.Rows[e.NewEditIndex].Cells[2].Controls[0] as TextBox).Text = "🔒 " + (GridView1.Rows[e.NewEditIndex].Cells[2].Controls[0] as TextBox).Text;
            (GridView1.Rows[e.NewEditIndex].Cells[2].Controls[0] as TextBox).ReadOnly = true;

            switch (table)
            {

                case "CONTRACTE_INCHIRIERE": 
                   
                    
                   ///data resizing
                    (GridView1.Rows[e.NewEditIndex].Cells[4].Controls[0] as TextBox).Text = (GridView1.Rows[e.NewEditIndex].Cells[4].Controls[0] as TextBox).Text.Remove(10);
                    (GridView1.Rows[e.NewEditIndex].Cells[5].Controls[0] as TextBox).Text = (GridView1.Rows[e.NewEditIndex].Cells[5].Controls[0] as TextBox).Text.Remove(10);
                    break;





                case "CLIENTI":

                    ///data resizing
                    (GridView1.Rows[e.NewEditIndex].Cells[6].Controls[0] as TextBox).Text = (GridView1.Rows[e.NewEditIndex].Cells[6].Controls[0] as TextBox).Text.Remove(10);
                    break;

                case "CAMERE":
                   
                    (GridView1.Rows[e.NewEditIndex].Cells[3].Controls[0] as TextBox).ReadOnly = true;
                    (GridView1.Rows[e.NewEditIndex].Cells[4].Controls[0] as TextBox).ReadOnly = true;
                    (GridView1.Rows[e.NewEditIndex].Cells[5].Controls[0] as TextBox).ReadOnly = true;

                    //lock emoji
                    (GridView1.Rows[e.NewEditIndex].Cells[3].Controls[0] as TextBox).Text = "🔒 " + (GridView1.Rows[e.NewEditIndex].Cells[3].Controls[0] as TextBox).Text;
                    (GridView1.Rows[e.NewEditIndex].Cells[4].Controls[0] as TextBox).Text = "🔒 " + (GridView1.Rows[e.NewEditIndex].Cells[4].Controls[0] as TextBox).Text;
                    (GridView1.Rows[e.NewEditIndex].Cells[5].Controls[0] as TextBox).Text = "🔒 " + (GridView1.Rows[e.NewEditIndex].Cells[5].Controls[0] as TextBox).Text;

                    break;

                case "CLADIRE":
                    (GridView1.Rows[e.NewEditIndex].Cells[3].Controls[0] as TextBox).ReadOnly = true;
                    (GridView1.Rows[e.NewEditIndex].Cells[4].Controls[0] as TextBox).ReadOnly = true;
                    
                    //lock emoji
                    (GridView1.Rows[e.NewEditIndex].Cells[3].Controls[0] as TextBox).Text = "🔒 " + (GridView1.Rows[e.NewEditIndex].Cells[3].Controls[0] as TextBox).Text;
                    (GridView1.Rows[e.NewEditIndex].Cells[4].Controls[0] as TextBox).Text = "🔒 " + (GridView1.Rows[e.NewEditIndex].Cells[4].Controls[0] as TextBox).Text;
                    break;


                case "ANGAJATI":
                   
                    /// date resizing
                    (GridView1.Rows[e.NewEditIndex].Cells[6].Controls[0] as TextBox).Text = (GridView1.Rows[e.NewEditIndex].Cells[6].Controls[0] as TextBox).Text.Remove(10);

                    /// salary edit
                    string salary = (GridView1.Rows[e.NewEditIndex].Cells[8].Controls[0] as TextBox).Text;
                    salary=salary.Replace(",", ".");
                    
                    (GridView1.Rows[e.NewEditIndex].Cells[8].Controls[0] as TextBox).Text = salary.ToString();

                    break;

                case "TIP_CAMERA":

                   
                    break;

                


            }


        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            if (table == "DEPARTAMENTE" || table=="CAMPUS" || table=="CLADIRE" || table=="CAMERE" || table=="TIP_CAMERA" || table=="CLIENTI")
            {
                Button_stergere_da.Visible = true;
                Button_stergere_nu.Visible = true;
                OracleCommand cmd=new OracleCommand();
                string dep_ID = GridView1.Rows[e.RowIndex].Cells[2].Text;

                if (table=="DEPARTAMENTE")
                {
                    Label_stergere.Text = "Stergerea acestui departament conduce la stergerea tuturor angajatilor din departamentul respectiv.\r\n Doriti continuarea procedurii?";
                    cmd = new OracleCommand("SELECT * FROM ANGAJATI WHERE ID_DEPARTAMENT=" + dep_ID, con);
                }
                if (table == "CAMPUS")
                {
                    Label_stergere.Text = "Stergerea acestui campus conduce la stergerea : cladirilor ( tabelul de mai jos),camerelor ( asociate cladirilor)  si contractelor ( asociate camerelor).Doriti continuarea procedurii?";
                    cmd = new OracleCommand("SELECT * FROM CLADIRE WHERE ID_CAMPUS='" + dep_ID + "'", con);

                }
                if (table == "CLADIRE")
                {

                    Label_stergere.Text = "Stergerea acestei cladiri conduce la stergerea : camerelor ( tabelul de mai jos) si contractelor (asociate camerelor).Doriti continuarea procedurii?";
                    cmd=new OracleCommand("SELECT * FROM CAMERE WHERE ID_CLADIRE='"+dep_ID+"'",con);
                }

                if(table=="CAMERE")
                {
                    Label_stergere.Text = "Stergerea acestei camere conduce la stergerea tuturor contractelor facute pe aceasta camera.Doriti sa continuati procedura?";
                    cmd = new OracleCommand("SELECT * FROM CONTRACTE_INCHIRIERE WHERE ID_CAMERA='" + dep_ID + "'", con);
                }

                if(table=="TIP_CAMERA")
                {
                    Label_stergere.Text = "Stergerea acestui tip de camera conduce la stergerea: tuturor camerelor de acest tip(tabelul de mai jos) , contractelor(asociate camerelor) .Doriti sa continuati procedura?";
                    cmd = new OracleCommand("SELECT * FROM CAMERE WHERE ID_TIP='" + dep_ID + "'", con);

                }

                if(table=="CLIENTI")
                {
                    Label_stergere.Text = "Stergerea acestui client conduce la stergerea tuturor contractelor asociate (tabelul de mai jos).Doriti sa continuati procedura?";
                    cmd = new OracleCommand("SELECT * FROM CONTRACTE_INCHIRIERE WHERE ID_CLIENT='" + dep_ID + "'", con);

                }

                Label_stergere.Visible = true;
                OracleDataAdapter da = new OracleDataAdapter(cmd);

                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView_Stergere.DataSource = dt;
                GridView_Stergere.DataBind();
                GridView_Stergere.Visible = true;
                delete_row = dep_ID;


            }
            else
            {

                using (OracleCommand cmd = new OracleCommand("DELETE FROM " + table + " CI WHERE CI." + ID_table + "= :ID", con))
                {
                    cmd.Parameters.Add(new OracleParameter("ID", GridView1.Rows[e.RowIndex].Cells[2].Text));

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    catch (Exception exception)
                    {

                        sort_Label1.Text = "Nu s-a realizat stergerea liniei selectate!";
                        sort_Label1.Visible = true;
                    }


                }

                this.SortingBindGrid();
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
                        
           
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            
            GridViewRow row = GridView1.Rows[e.RowIndex];
            string query="";
            int block = 0;

            switch (table)
            {
                case "CONTRACTE_INCHIRIERE":
                    string contract_ID = (row.Cells[2].Controls[0] as TextBox).Text.Substring(3);///this is locked
                    string customer_ID_c = (row.Cells[3].Controls[0] as TextBox).Text;
                    string start_contract = (row.Cells[4].Controls[0] as TextBox).Text;
                    string final_contract = (row.Cells[5].Controls[0] as TextBox).Text;
                    string room_ID = (row.Cells[6].Controls[0] as TextBox).Text;
                    query = "UPDATE CONTRACTE_INCHIRIERE SET ID_CAMERA='" + room_ID + "',ID_CLIENT="+customer_ID_c+", INCEPUT_CONTRACT=TO_DATE('"+start_contract+"','DD/MM/YYYY'),FINAL_CONTRACT=TO_DATE('"+final_contract+"','DD/MM/YYYY') WHERE ID_CONTRACT=" + contract_ID;
                    break;

                case "CLIENTI":
                    string customer_ID= (row.Cells[2].Controls[0] as TextBox).Text.Substring(2);///this is locked
                    string first_name = (row.Cells[3].Controls[0] as TextBox).Text;
                    string last_name = (row.Cells[4].Controls[0] as TextBox).Text;
                    string university_name = (row.Cells[5].Controls[0] as TextBox).Text;
                    string date_of_birth = (row.Cells[6].Controls[0] as TextBox).Text;
                    string sex = (row.Cells[7].Controls[0] as TextBox).Text;
                    query = "UPDATE CLIENTI SET NUME='"+first_name+"', PRENUME='"+last_name+"' ,FACULTATE='"+university_name+"' ,DATA_NASTERE=TO_DATE('"+date_of_birth+"','DD/MM/YYYY'), SEX='"+sex+"' WHERE ID_CLIENT="+customer_ID;
                    if (sex != "M" && sex != "F")
                    {
                        sort_Label1.Text = "CAMPUL SEX POATE SA FIE DOAR 'M/F' !";
                        sort_Label1.Visible = true;
                        block = 1;
                        
                    }
                    break;

                case "CAMERE":
                    string repair = (row.Cells[6].Controls[0] as TextBox).Text;
                    string room_id = (row.Cells[2].Controls[0] as TextBox).Text.Substring(3);
                    query= "UPDATE CAMERE SET NECESITA_REPARATII='"+repair+"' WHERE ID_CAMERA='"+room_id+"'";
                    if (repair != "DA" && repair != "NU" && table == "CAMERE")
                    {
                        sort_Label1.Text = "CAMPUL NECESITA_REPARATII POATE SA FIE DOAR 'DA/NU' !";
                        sort_Label1.Visible = true;
                        block = 1;
                        
                    }
                    break;

                case "CLADIRE":
                    string building_ID = (row.Cells[2].Controls[0] as TextBox).Text.Substring(3);
                    string nr_stingatoare = (row.Cells[5].Controls[0] as TextBox).Text;
                    string nr_etaje = (row.Cells[4].Controls[0] as TextBox).Text.Substring(3);
                    
                    if (Int16.Parse(nr_stingatoare) > 2 *Int16.Parse(nr_etaje))
                    {
                        sort_Label1.Text = "Numarul de stingatoare acordat in urma alocarii este prea mare, s-a setat capacitatea maxima !";
                        sort_Label1.Visible = true;
                        nr_stingatoare = (2 * Int16.Parse(nr_etaje)).ToString();    
                    }
                    query= "UPDATE CLADIRE SET NUMAR_STINGATOARE ="+nr_stingatoare+" WHERE ID_CLADIRE ='"+building_ID+"'";
                    break;

                case "CAMPUS":
                    
                    string campus_ID= (row.Cells[2].Controls[0] as TextBox).Text.Substring(3);
                    string location = (row.Cells[3].Controls[0] as TextBox).Text;
                    string are_cantina = (row.Cells[4].Controls[0] as TextBox).Text;
                    string are_baza_sportiva = (row.Cells[5].Controls[0] as TextBox).Text;
                    
                    if(are_cantina!="DA" && are_cantina!="NU")
                    {
                        sort_Label1.Text = "CAMPUL ARE_CANTINA POATE SA FIE DOAR 'DA/NU' !";
                        sort_Label1.Visible = true;
                        block = 1;
                    }

                    if (are_baza_sportiva != "DA" && are_baza_sportiva!= "NU")
                    {
                        sort_Label1.Text = "CAMPUL ARE_BAZA_SPORTIVA POATE SA FIE DOAR 'DA/NU' !";
                        sort_Label1.Visible = true;
                        block = 1;
                    }
                    query = "UPDATE CAMPUS SET LOCATIE='"+location+"' , ARE_BAZA_SPORTIVA='"+are_baza_sportiva+"', ARE_CANTINA='"+are_cantina+"' WHERE ID_CAMPUS='"+campus_ID+"'";
                    break;

                case "ANGAJATI":
                    string employee_ID = (row.Cells[2].Controls[0] as TextBox).Text.Substring(3);
                    string department_ID = (row.Cells[3].Controls[0] as TextBox).Text;
                    string first_name_e = (row.Cells[4].Controls[0] as TextBox).Text;
                    string  last_name_e= (row.Cells[5].Controls[0] as TextBox).Text;
                    string date_of_birth_e = (row.Cells[6].Controls[0] as TextBox).Text;
                    string city = (row.Cells[7].Controls[0] as TextBox).Text;
                    string salary=(row.Cells[8].Controls[0] as TextBox).Text;
                    string campus_ID_e=(row.Cells[9].Controls[0] as TextBox).Text;
                    query = "UPDATE  ANGAJATI SET ID_DEPARTAMENT=" + department_ID + ",NUME='" + first_name_e + "',PRENUME='" + last_name_e + "',AN_NASTERE= TO_DATE('" + date_of_birth_e + "','DD/MM/YYYY'),ORAS='" + city + "',SALARIU='" + salary + "',ID_CAMPUS='" + campus_ID_e + "' WHERE ID_ANGAJAT="+employee_ID;
                    break;

                case "DEPARTAMENTE":
                    string department_ID_d = (row.Cells[2].Controls[0] as TextBox).Text.Substring(3);
                    string department_name = (row.Cells[3].Controls[0] as TextBox).Text;

                    query = "UPDATE DEPARTAMENTE SET NUME_DEPARTAMENT='"+department_name+"' WHERE ID_DEPARTAMENT=" + department_ID_d;
                    break;

                case "TIP_CAMERA":
                    string tip_ID = (row.Cells[2].Controls[0] as TextBox).Text.Substring(3);
                    string denumire = (row.Cells[3].Controls[0] as TextBox).Text;
                    string premium = (row.Cells[4].Controls[0] as TextBox).Text;
                    string locuri = (row.Cells[5].Controls[0] as TextBox).Text;

                    if (premium != "DA" && premium != "NU")
                    {
                        sort_Label1.Text = "CAMPUL PREMIUM POATE SA FIE DOAR 'DA/NU' !";
                        sort_Label1.Visible = true;
                        block = 1;
                    }

                    if (locuri !="1" && locuri!="2" && locuri!="3")
                    {
                        sort_Label1.Text = "NU SE POT ALOCA MAI MULT DE 3 LOCURI PENTRU O CAMERA' !";
                        sort_Label1.Visible = true;
                        block = 1;
                    }

                    query = "UPDATE TIP_CAMERA SET DENUMIRE='"+denumire+"', PREMIUM='"+premium+"', NUMAR_LOCURI="+locuri+" WHERE ID_TIP='"+tip_ID+"'";
                    break;

            }
;
            if(block==0)
            {
               

                using (OracleCommand cmd = new OracleCommand(query, con))
                {

                   
                    try
                    {
                        con.Open();
                     cmd.ExecuteNonQuery();
                     con.Close();


                    }
                    catch (Exception exception)
                    {
                        sort_Label1.Text = "! Introducerea datelor s-a facut gresit, modificarea nu s-a efectuat";
                        sort_Label1.Visible = true;
                    }
                    
                    
                }
            }
        
            //Reset the edit index.
            GridView1.EditIndex = -1;

            //Bind data to the GridView control.
            SortingBindGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;

            //Bind data to the GridView control.
            SortingBindGrid();
        }

        protected void Button_Contract_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adauga_contract.aspx");
        }

        protected void Button_Clienti_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adauga_client.aspx");
        }

        protected void Button_Tip_camera_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adauga_tip_camera.aspx");
        }

        protected void Button_stergere_da_Click(object sender, EventArgs e)
        {
           
            using (OracleCommand cmd = new OracleCommand("DELETE FROM "+table+" WHERE "+ID_table+"= :ID", con))
            {
               
                cmd.Parameters.Add(new OracleParameter("ID", delete_row));

                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView_Stergere.Visible = false;
                    Label_stergere.Visible = false;
                    Button_stergere_da.Visible = false;
                    Button_stergere_nu.Visible = false;
                }
                catch (Exception exception)
                {

                    sort_Label1.Text = "Nu s-a realizat stergerea liniei selectate!";
                    sort_Label1.Visible = true;
                }


            }

            this.SortingBindGrid();



        }

        protected void Button_stergere_nu_Click(object sender, EventArgs e)
        {

            GridView_Stergere.Visible = false;
            Label_stergere.Visible = false;
            Button_stergere_da.Visible = false;
            Button_stergere_nu.Visible = false;
        }

        protected void Button_Departamente_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adauga_departament.aspx");
        }

        protected void Button_Angajati_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adauga_angajat.aspx");
        }

        protected void Button_Cladiri_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adauga_cladire.aspx");
        }

        protected void Button_Campusuri_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adauga_campus.aspx");
        }

        protected void Button_Camere_Click(object sender, EventArgs e)
        {
            Response.Redirect("Adauga_camera.aspx");
        }

        protected void Button_Camere_filtru_Click(object sender, EventArgs e)
        {
            Response.Redirect("Filtru.aspx");
        }
    }
}