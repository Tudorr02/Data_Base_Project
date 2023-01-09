<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adauga_departament.aspx.cs" Inherits="BDProject.WebForm6" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DEPARTAMENTE</title>

    <style>
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
	 
	 ;
	}
   
    .row .txtBoxes{
        margin-top:2%

    }

    .txtBoxes_box{
        border-radius:5px;
      
        margin-right:50%;
    }

    .button1 {border-radius: 5px;
              
             
              border:none;
              font-size:15px;
              padding:7px;
             font-family:'Times New Roman';
              
    }
  
 
  
  
    </style>

    <h1 style="text-align:center">ADAUGA UN DEPARTAMENT NOU</h1>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                            <asp:Button class="button1"  runat="server" BackColor="Purple" style="text-align:center; display:block; margin: 0 auto;" ForeColor="White" Text="‹ MainPage" ID="Contract_Main_page" OnClick="Client_Main_page_Click" />

            <div class="row">

                <div class="col" style="margin-top:2%;margin-left:38%">
                    <asp:Label ID="sort_Label3" runat="server" style="z-index: 1 ;color:red; font-family:'Courier New'; font-weight:bold" Text="Label de sortare, mesaj" Visible="False"></asp:Label>                 

                    <asp:GridView ID="GridViewdepartament" runat="server" style="text-align:center" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID_DEPARTAMENT" DataSourceID="SqlDataSource_departament" GridLines="Horizontal">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:BoundField DataField="ID_DEPARTAMENT" HeaderText="ID_DEPARTAMENT" ReadOnly="True" SortExpression="ID_DEPARTAMENT" />
                            <asp:BoundField DataField="NUME_DEPARTAMENT" HeaderText="NUME_DEPARTAMENT" SortExpression="NUME_DEPARTAMENT" />
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
                    <asp:SqlDataSource ID="SqlDataSource_departament" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;DEPARTAMENTE&quot;"></asp:SqlDataSource>
                 <div class="row">
                    <asp:Label  runat="server" Text="Numele departamentului" style="text-align:left;margin-top:3%"></asp:Label>
                    <asp:TextBox ID="TxtB_departament_nume" class="txtBoxes_box" runat="server" Width="150px" BorderStyle="Solid" BorderColor="Purple" style="float:right;margin-top:3%;margin-left:2%" ></asp:TextBox>
                     </div>
                    <asp:Button class="button1" runat ="server" Text="Adauga departamentul"  BackColor="Purple" ForeColor="White" style="margin-top:3%" ID="Button_Adauga_departament" OnClick="Button_Adauga_departament_Click" ></asp:Button>
 
                  
                
                </div>

            </div>
        </div>
    </form>
</body>
</html>

