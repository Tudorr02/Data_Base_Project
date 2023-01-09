<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adauga_client.aspx.cs" Inherits="BDProject.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CLIENTI</title>

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
	 
	  margin: 2px;
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
  
  
        #Select1 {
            z-index: 1;
            left: 188px;
            top: 722px;
            position: absolute;
        }
  
  
    </style>

    <h1 style="text-align:center">ADAUGA UN CLIENT NOU</h1>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                            <asp:Button class="button1"  runat="server" BackColor="Purple" style="text-align:center; display:block; margin: 0 auto;" ForeColor="White" Text="‹ MainPage" ID="Contract_Main_page" OnClick="Client_Main_page_Click" />

            <div class="row" style="margin-left:10%">

                <div class="col" style="margin-top:2%">
                    <asp:Label ID="sort_Label3" runat="server" style="z-index: 1 ;font-family:'Courier New'; font-weight:bold ;color:red" Text="Label de sortare, mesaj" Visible="False"></asp:Label>                 

                    <asp:GridView ID="GridViewClient" runat="server" style="display:block" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID_CLIENT" DataSourceID="SqlDataSource1" GridLines="Horizontal">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:BoundField DataField="ID_CLIENT" HeaderText="ID_CLIENT" ReadOnly="True" SortExpression="ID_CLIENT" />
                            <asp:BoundField DataField="NUME" HeaderText="NUME" SortExpression="NUME" />
                            <asp:BoundField DataField="PRENUME" HeaderText="PRENUME" SortExpression="PRENUME" />
                            <asp:BoundField DataField="FACULTATE" HeaderText="FACULTATE" SortExpression="FACULTATE" />
                            <asp:BoundField DataField="DATA_NASTERE" DataFormatString="{0:dd/MM/yyyy}" HeaderText="DATA_NASTERE" SortExpression="DATA_NASTERE" />
                            <asp:BoundField DataField="SEX" HeaderText="SEX" SortExpression="SEX" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CLIENTI&quot;"></asp:SqlDataSource>
                </div>

                 <div class="col" style="margin-top:2%">
                    
                        <asp:Label  runat="server" Text="Numele de familie al clientului" style="text-align:left"></asp:Label>
                    <asp:TextBox ID="TxtB_Client_nume_familie" class="txtBoxes_box" runat="server" Width="100px" BorderStyle="Solid" BorderColor="Purple" style="float:right" ></asp:TextBox>
                        
                    <div class="txtBoxes">
                        <asp:Label runat="server" Text="Prenumele clientului" style="text-align:left"></asp:Label>
                        <asp:TextBox class="txtBoxes_box" ID="TxtB_Client_prenume" runat="server"  Width="100px" BorderStyle="Solid" BorderColor="Purple" style="float:right"></asp:TextBox>
                        </div>

                    <div class="txtBoxes">
                        <asp:Label runat="server" Text="Data de nastere a clientului" style="text-align:left"></asp:Label>
                    <asp:TextBox class="txtBoxes_box" ID="TxtB_Client_data_nastere" runat="server" placeholder="DD/MM/YYYY" Width="100px" BorderStyle="Solid" BorderColor="Purple" style="float:right "></asp:TextBox>
                        </div >
                    <div class="txtBoxes">
                         <asp:Label runat="server" Text="Facultate (optional)" style="text-align:left"></asp:Label>
                    <asp:TextBox class="txtBoxes_box" ID="TxtB_Client_facultate" runat="server" Width="170px"  BorderStyle="Solid" BorderColor="Purple" style="float:right "></asp:TextBox>
                        </div>

                      <div class="txtBoxes">
                         <asp:Label runat="server" Text="Sex" style="text-align:left"></asp:Label>
                                     
                          <asp:DropDownList ID="DropDownList1" style="margin-left:2%" runat="server" AutoPostBack="True">
                              <asp:ListItem Value="0">Masculin</asp:ListItem>
                              <asp:ListItem Value="1">Feminin</asp:ListItem>
                              
                          </asp:DropDownList>
                          

                     

                    <div class="row" >
                    <asp:Button class="button1" runat ="server" Text="Adauga clientul"  BackColor="Purple" ForeColor="White" style=" margin-left:4%; margin-top:3%" ID="Button_Adauga_client" OnClick="Button_Adauga_client_Click"></asp:Button>
                        </div>
                </div>

            </div>
        </div>
            </div>
    </form>
</body>
</html>
