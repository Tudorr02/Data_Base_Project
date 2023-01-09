<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adauga_campus.aspx.cs" Inherits="BDProject.WebForm9" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title style="text-align:center">CAMPUS</title>
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
        margin-top :2px;
        margin-right:30%;
    }

    .button1 {border-radius: 5px;
              
             
              border:none;
              font-size:15px;
              padding:7px;
             font-family:'Times New Roman';
              
    }
  
    </style>
    

    <h1 style="text-align:center" >ADAUGA UN CAMPUS NOU</h1>

</head>
<body>

    <form id="form1" runat="server">

        <div>
                <asp:Button class="button1"  runat="server" BackColor="Purple" style="text-align:center; display:block; margin: 0 auto;" ForeColor="White" Text="‹ MainPage" ID="Contract_Main_page" OnClick="Contract_Main_page_Click" />

            <div class="row" style="margin-top:2%">
                <div class="col">
<asp:Label ID="sort_Label2" runat="server" style="z-index: 1; font-family:'Courier New'; font-weight:bold;margin-left:7% ;color:red" Text="Label de sortare, mesaj" Visible="False"></asp:Label>                 
                    <asp:GridView ID="GridView_cladire" runat="server" horizontalalign="Center" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID_CAMPUS" DataSourceID="SqlDataSource1" GridLines="Horizontal" OnSelectedIndexChanged="GridView_cladire_SelectedIndexChanged">
                       <AlternatingRowStyle BackColor="#F7F7F7" />
                       <Columns>
                           <asp:BoundField DataField="ID_CAMPUS" HeaderText="ID_CAMPUS" ReadOnly="True" SortExpression="ID_CAMPUS" />
                           <asp:BoundField DataField="LOCATIE" HeaderText="LOCATIE" SortExpression="LOCATIE" />
                           <asp:BoundField DataField="ARE_CANTINA" HeaderText="ARE_CANTINA" SortExpression="ARE_CANTINA" />
                           <asp:BoundField DataField="ARE_BAZA_SPORTIVA" HeaderText="ARE_BAZA_SPORTIVA" SortExpression="ARE_BAZA_SPORTIVA" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CAMPUS&quot;"></asp:SqlDataSource>
                </div>
                

               
                <div class="col" >
                    
                        <asp:Label  runat="server" Text="Id-ul campusului" style="text-align:left"></asp:Label>
                    <asp:TextBox ID="TxtB_campus_id" class="txtBoxes_box" runat="server" Width="100px" BorderStyle="Solid"  BorderColor="Purple" style="float:right;margin-right:60%" ></asp:TextBox>
                        
                    <div class="txtBoxes">
                        <asp:Label runat="server" Text="Locatie" style="text-align:left"></asp:Label>
                        <asp:TextBox class="txtBoxes_box" ID="TxtB_campus_locatie" runat="server"   Width="200px" BorderStyle="Solid" BorderColor="Purple" style="float:right;margin-right:45%"></asp:TextBox>
                        </div>

                    <div class="txtBoxes">
                        <asp:Label runat="server" Text="Are cantina?" style="text-align:left"></asp:Label>
                        <asp:DropDownList ID="DropDownList_cantina" style="margin-left:3%" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="0">NU</asp:ListItem>
                            <asp:ListItem Value="1">DA</asp:ListItem>
                        </asp:DropDownList>
                        </div >
                    <div class="txtBoxes">
                         <asp:Label runat="server" Text="Are baza sportiva?" style="text-align:left"></asp:Label>
                        <asp:DropDownList ID="DropDownList_baza" runat="server" style="margin-left:3%">
                            <asp:ListItem Value="0">NU</asp:ListItem>
                            <asp:ListItem Value="1">DA</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                     <div class="row" >
                    <asp:Button class="button1" runat ="server" Text="Adauga campusul"  BackColor="Purple" ForeColor="White" style=" margin-left:4%; margin-top:7%" ID="Button_Adauga_cladirea" OnClick="Button_Adauga_cladirea_Click1"></asp:Button>
                        </div>

                    
                </div>
                 
               </div>   


       
    </div>
    </form>
</body>
</html>
