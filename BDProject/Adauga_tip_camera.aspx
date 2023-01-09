<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adauga_tip_camera.aspx.cs" Inherits="BDProject.WebForm7" %>

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
	  display: flex;

      
	}
	.col {
	  flex: 1; 
	  
	  padding: 1em;
	}
   
    .row .txtBoxes{
        margin-top:2%

    }

    .txtBoxes_box{
        border-radius:5px;
        
       
    }

    .button1 {border-radius: 5px;
              
             
              border:none;
              font-size:15px;
              padding:7px;
             font-family:'Times New Roman';
              
    }
  
  
       
  
    </style>

    <h1 style="text-align:center">ADAUGA UN TIP NOU DE CAMERA</h1>
</head>
<body>
    <form id="form1" runat="server">
        <div>
          <asp:Button class="button1"  runat="server" BackColor="Purple" style="text-align:center; display:block; margin: 0 auto;" ForeColor="White" Text="‹ MainPage" ID="Contract_Main_page" OnClick="Client_Main_page_Click" />

            <div class="row" >
                

                <div class="col" style="margin-top:2%;margin-left:3%">
                    <asp:Label ID="sort_Label3" runat="server" style="z-index: 1; font-family:'Courier New'; font-weight:bold ;color:red;margin-left:30%" Text="Label de sortare, mesaj" Visible="False"></asp:Label>                 

                    <asp:GridView ID="GridViewTip" runat="server" style="margin-left:30%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID_TIP" DataSourceID="SqlDataSource1" GridLines="Horizontal">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:BoundField DataField="ID_TIP" HeaderText="ID_TIP" ReadOnly="True" SortExpression="ID_TIP" />
                            <asp:BoundField DataField="DENUMIRE" HeaderText="DENUMIRE" SortExpression="DENUMIRE" />
                            <asp:BoundField DataField="PREMIUM" HeaderText="PREMIUM" SortExpression="PREMIUM" />
                            <asp:BoundField DataField="NUMAR_LOCURI" HeaderText="NUMAR_LOCURI" SortExpression="NUMAR_LOCURI" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;TIP_CAMERA&quot;"></asp:SqlDataSource>
                
                  
            </div>

                <div class="col">
                <div class="txtBoxes" style="margin-top:5%">
                    <asp:Label  runat="server" Text="ID-ul tipului" style="text-align:left"></asp:Label>
                    <asp:TextBox class="txtBoxes_box" ID="TxtB_Tip_camera_ID"  runat="server" Width="100px"  style="float:right;margin-right:60%" BorderStyle="Solid" BorderColor="Purple" ></asp:TextBox>
                    </div>    

            

                    <div class="txtBoxes" style="margin-top:2%">
                   <asp:Label runat="server" Text="Denumirea tipului" style="text-align:left"></asp:Label>
                    <asp:TextBox class="txtBoxes_box" ID="TxtB_Tip_denumire"  style="float:right; margin-right:60%" runat="server"  Width="100px" BorderStyle="Solid" BorderColor="Purple" ></asp:TextBox>
                        </div>

                <div class="row" style="margin-top:2%">
                     <asp:Label runat="server" Text="Premium" style="text-align:left"></asp:Label>
                        <asp:DropDownList ID="DropDownList_premium" style="margin-left:2%" runat="server">
                            <asp:ListItem Value="0">NU</asp:ListItem>
                            <asp:ListItem Value="1">DA</asp:ListItem>
                           
                        </asp:DropDownList>
                    </div>

                    <div class="row" style="margin-top:2%">
                    <asp:Label runat="server" Text="Numar_locuri" style="text-align:left"></asp:Label>
                        <asp:DropDownList ID="DropDownList_numar_locuri" style="margin-left:2%" runat="server">
                            <asp:ListItem Value="0">1</asp:ListItem>
                            <asp:ListItem Value="1">2</asp:ListItem>
                            <asp:ListItem Value="2">3</asp:ListItem>
                          
                        </asp:DropDownList>
                        </div>

                     <asp:Button class="button1" runat ="server" Text="Adauga tipul de camera"  BackColor="Purple" ForeColor="White" style="float:left;  margin-top:3%" ID="Button_Adauga_tip" OnClick="Button_Adauga_tip_Click"></asp:Button>
                
                </div>

        </div>
            </div>
    </form>
</body>
</html>

