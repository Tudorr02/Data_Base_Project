<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adauga_angajat.aspx.cs" Inherits="BDProject.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title style="text-align:center">ANGAJATI</title>
    <style type="text/css">
        
         td, th {
        text-align: center;
    }       
  h1 {color:rebeccapurple; font-family:'Courier New';}
  p { color:purple; text-align:center ;font-size:24px; font-family:'Courier New';}
  
  .row {
	  display: flex; /* equal height of the children */

      
	}
	.col {
	  flex: 1; /* additionally, equal width */
	  
	  padding: 1em;
	 
	  margin: 2px;
	}
   
    .row .txtBoxes{
        margin-top:2%

    }

    .txtBoxes_box{
        border-radius:5px;
        margin-right:25%;
    }

    .button1 {border-radius: 5px;
              
             
              border:none;
              font-size:15px;
              padding:7px;
             font-family:'Times New Roman';
              
    }
  
    </style>
    

    <h1 style="text-align:center" >ADAUGA UN ANGAJAT</h1>

</head>
<body>

    <form id="form1" runat="server">

        <div>
                <asp:Button class="button1"  runat="server" BackColor="Purple" style="text-align:center; display:block; margin: 0 auto;" ForeColor="White" Text="‹ MainPage" ID="Contract_Main_page" OnClick="Angajat_Main_page_Click" />

            <div class="row" >
                <div class="col">
<asp:Label ID="sort_Label_angajat" runat="server" style="z-index: 1 ;color:red; font-family:'Courier New'; font-weight:bold" Text="Label de sortare, mesaj" Visible="False"></asp:Label>                 
                    <asp:GridView ID="GridView_Angajat" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID_ANGAJAT" DataSourceID="SqlDataSource1" GridLines="Horizontal" >
                       <AlternatingRowStyle BackColor="#F7F7F7" />
                       <Columns>
                           <asp:BoundField DataField="ID_ANGAJAT" HeaderText="ID_ANGAJAT" ReadOnly="True" SortExpression="ID_ANGAJAT" />
                           <asp:BoundField DataField="ID_DEPARTAMENT" HeaderText="ID_DEPARTAMENT" SortExpression="ID_DEPARTAMENT" />
                           <asp:BoundField DataField="NUME" HeaderText="NUME" SortExpression="NUME" />
                           <asp:BoundField DataField="PRENUME" HeaderText="PRENUME" SortExpression="PRENUME" />
                           <asp:BoundField DataField="AN_NASTERE" HeaderText="AN_NASTERE" SortExpression="AN_NASTERE" DataFormatString="{0:dd/MM/yyyy}" />
                           <asp:BoundField DataField="ORAS" HeaderText="ORAS" SortExpression="ORAS" />
                           <asp:BoundField DataField="SALARIU" HeaderText="SALARIU" SortExpression="SALARIU" />
                           <asp:BoundField DataField="ID_CAMPUS" HeaderText="ID_CAMPUS" SortExpression="ID_CAMPUS" />
                       </Columns>
                       <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                       <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                       <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                       <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                       <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                       <SortedAscendingCellStyle BackColor="#F4F4FD" />
                       <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                       <SortedDescendingCellStyle BackColor="#D8D8F0" />
                       <SortedDescendingHeaderStyle BackColor="#3E3277" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;ANGAJATI&quot;"></asp:SqlDataSource>
                </div>
                

                

                <div class="col">
                    <asp:GridView runat="server" ID="GridView_Angajati_auto" Visible="False" style="text-align:center" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnSelectedIndexChanging="GridView_Angajati_auto_SelectedIndexChanging" >
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                        </Columns>
                        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                        <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                        <SortedAscendingCellStyle BackColor="#F4F4FD" />
                        <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                        <SortedDescendingCellStyle BackColor="#D8D8F0" />
                        <SortedDescendingHeaderStyle BackColor="#3E3277" />
                    </asp:GridView>


                  </div>
                </div>

               <div class="row" >
                <div class="col">
                    
                        <asp:Label  runat="server" Text="Numele de familie a angajatului" style="text-align:left"></asp:Label>
                    <asp:TextBox ID="TxtB_angajat_Nume" class="txtBoxes_box" runat="server" Width="100px" BorderStyle="Solid" BorderColor="Purple" style="float:right" ></asp:TextBox>
                        
                    <div class="txtBoxes">
                        <asp:Label runat="server" Text="Prenumele angajatului" style="text-align:left"></asp:Label>
                        <asp:TextBox class="txtBoxes_box" ID="TxtB_angajat_prenume" runat="server"  Width="100px" BorderStyle="Solid" BorderColor="Purple" style="float:right"></asp:TextBox>
                        </div>

                    <div class="txtBoxes">
                        <asp:Label runat="server" Text="Data de nastere a angajatului" style="text-align:left"></asp:Label>
                    <asp:TextBox class="txtBoxes_box" ID="TxtB_angajat_data_nastere" runat="server" placeholder="DD/MM/YYYY" Width="100px" BorderStyle="Solid" BorderColor="Purple" style="float:right "></asp:TextBox>
                        </div >
                    <div class="txtBoxes">
                         <asp:Label runat="server" Text="Oras" style="text-align:left"></asp:Label>
                    <asp:TextBox class="txtBoxes_box" ID="TxtB_angajat_oras" runat="server" Width="100px" BorderStyle="Solid" BorderColor="Purple" style="float:right "></asp:TextBox>
                        </div>
                    <div class="txtBoxes">
                         <asp:Label runat="server" Text="Departament" style="text-align:left"></asp:Label>
                    <asp:TextBox class="txtBoxes_box" ID="TxtB_angajat_departament" runat="server" Width="100px" ReadOnly="true" BorderStyle="Solid" BorderColor="Purple" style="float:right "></asp:TextBox>
                        </div>
                    <div class="txtBoxes">
                         <asp:Label runat="server" Text="Salariu" style="text-align:left"></asp:Label>
                    <asp:TextBox class="txtBoxes_box" ID="TxtB_angajat_salariu" runat="server" Width="100px" BorderStyle="Solid" BorderColor="Purple" style="float:right "></asp:TextBox>
                        </div>
                    <div class="txtBoxes">
                         <asp:Label runat="server" Text="ID-ul campusului in care lucreaza" style="text-align:left"></asp:Label>
                    <asp:TextBox class="txtBoxes_box" ID="TxtB_Angajat_campus" runat="server" Width="100px" BorderStyle="Solid" BorderColor="Purple" ReadOnly="true" style="float:right "></asp:TextBox>
                        </div>
                    
                    <div class="row" >
                    <asp:Button CssClass="button1" runat="server" Text="Afisare departamente" BackColor="Purple" style=" margin-top:7%" ForeColor="White" ID="Button_Afisare_departamente" OnClick="Button_Afisare_departamente_Click"></asp:Button>
                    <asp:Button class="button1" runat ="server" Text="Afisare campusuri"  BackColor="Purple" ForeColor="White" style=" margin-left:4%; margin-top:7%" ID="Button_Angajati_Afisare_campusuri" OnClick="Button_Angajati_Afisare_campusuri_Click" ></asp:Button>
                    <asp:Button class="button1" runat ="server" Text="Adauga Angajatul"  BackColor="Purple" ForeColor="White" style=" margin-left:4%; margin-top:7%" ID="Button_Adaugare_angajat" OnClick="Button_Adaugare_angajat_Click"></asp:Button>
    
                    </div>
                </div>
                   <div class="col"></div>
                   <div class="col"></div>
               </div>   


       
    </div>
    </form>
</body>
</html>
