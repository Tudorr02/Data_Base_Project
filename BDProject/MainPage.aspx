<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="BDProject.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title style="text-align:center">PROIECT BD</title>
    <style type="text/css">
        
         td, th {
        text-align: center;
    }       
  h1 {color:rebeccapurple; font-family:'Courier New';}
  p { color:purple; text-align:center ;font-size:24px; font-family:'Courier New';}
  
  .row {
	  display: flex;
      float:inherit;
                    /* equal height of the children */
	}
	.col {
	  flex: 1; /* additionally, equal width */
	  
	  padding: 1em;
	 
	  margin: 2px;
	}	

    .button1 {border-radius: 5px;
              
              background-color:purple;
              font-size:20px;
              border:none;
              font:bolder;
              text-align:center;
              margin:auto;
              display:block;
              margin-top:1%;
              padding:10px;
             font-family:'Times New Roman';

    }
  
    </style>
    

    
    <h1 style="text-align:center" >CAMIN STUDENTESC PRIVAT</h1>
</head>
<body>
    <form id="form1" runat="server" aria-orientation="horizontal" >
        
            
            <p style=" width:auto; margin-top: 40px"><b>Doresc sa aflu date despre</p></b>
       
        <div align="center">
            <asp:DropDownList id="ddl1"  AutoPostBack="true" runat="server"   OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="text-align:center;height: 25px; width: 200px;">
                <asp:ListItem Value="0">SELECTEAZA UN TABEL</asp:ListItem>
                <asp:ListItem Value="1">CONTRACTE</asp:ListItem>
                <asp:ListItem Value="2">CLIENTI</asp:ListItem>
                <asp:ListItem Value="3">CAMERE</asp:ListItem>
                <asp:ListItem Value="4">CLADIRI</asp:ListItem>
                <asp:ListItem Value="5">CAMPUSURI</asp:ListItem>
                <asp:ListItem Value="6">ANGAJATI</asp:ListItem>
                <asp:ListItem Value="7">DEPARTAMENTE</asp:ListItem>
                <asp:ListItem Value="8">TIPURILE DE CAMERA</asp:ListItem>
                 

                
            </asp:DropDownList>
            </div>
       
         
       

        <div class="col" style="position:relative; text-align:center" >
                        <asp:Button class="button1" ID="Button_Clienti"  ForeColor="White" runat="server" Text="Adauga un client" OnClick="Button_Clienti_Click" Visible="False"></asp:Button>
                        <asp:Button class="button1" ID="Button_Contract"  ForeColor="White" runat="server" Text="Adauga un contract" OnClick="Button_Contract_Click" Visible="False"></asp:Button>
                       <div style="">
                        <asp:Button class="button1" ID="Button_Camere" ForeColor="White" runat="server" Text="Adauga o camera" Visible="False" OnClick="Button_Camere_Click"></asp:Button>
                        <asp:Button class="button1" ID="Button_Camere_filtru" ForeColor="White" runat="server" Text="Filtru camere" Visible="False" OnClick="Button_Camere_filtru_Click"></asp:Button>
                        
                       </div>
                        <asp:Button class="button1" ID="Button_Cladiri"  ForeColor="White" runat="server" Text="Adauga o cladire" Visible="False" OnClick="Button_Cladiri_Click"></asp:Button>
        
                         <asp:Button class="button1" ID="Button_Campusuri"   ForeColor="White" runat="server" Text="Adauga un campus" Visible="False" OnClick="Button_Campusuri_Click"></asp:Button>
                        <asp:Button class="button1" ID="Button_Angajati"  ForeColor="White" runat="server" Text="Adauga un angajat" Visible="False" OnClick="Button_Angajati_Click"></asp:Button>
                        <asp:Button class="button1" ID="Button_Departamente"  ForeColor="White" runat="server" Text="Adauga un departament" Visible="False" OnClick="Button_Departamente_Click"></asp:Button>
                        <asp:Button class="button1" ID="Button_Tip_camera"  ForeColor="White" runat="server" Text="Adauga un tip de camera" OnClick="Button_Tip_camera_Click" Visible="False"></asp:Button>


         </div>
        <div class="row">
	        <div class="col">
                <asp:Label ID="sort_Label1" runat="server" style="z-index: 1; font-family:'Courier New'; font-weight:bold ;margin-left:10% ;color:red" Text="Label de sortare, mesaj" Visible="False"></asp:Label>
                <asp:GridView  HorizontalAlign="Center"  ID="GridView1" runat="server" style="margin-top:1%;text-align:center;z-index: 1; height: 200px; width: 600px" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" AllowSorting="True" OnSorting="GridView1_Sorting" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDataBound="GridView1_RowDataBound">

                    <AlternatingRowStyle BackColor="#F7F7F7" />
                    <Columns>
       

                        <asp:ButtonField  ButtonType="Button" CommandName="Delete" Text="Delete" />
                        <asp:CommandField ButtonType="Button" ShowEditButton="True" />
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
        
        <div class="col"  >
            <div class="row">
            <asp:Label ID="Label_stergere" runat="server" Visible="False">Stergerea acestei linii implica eliminarea urmatoarelor inregistrari.<br>Doriti continuarea procedurii?</asp:Label>
                <asp:Button ID="Button_stergere_da" runat="server" style="margin-left:2%" Text="DA" Visible="False" OnClick="Button_stergere_da_Click" />
                 <asp:Button ID="Button_stergere_nu" runat="server" style="margin-left:2%" Text="NU" OnClick="Button_stergere_nu_Click" Visible="False" />
            </div>
            <asp:GridView ID="GridView_Stergere" HorizontalAlign="Center" style="margin-top:1%" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" Visible="False" GridLines="Horizontal">
                <AlternatingRowStyle BackColor="#F7F7F7" />
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
		
              
        
    </form>

</body>
    

</html>
