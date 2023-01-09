<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adauga_camera.aspx.cs" Inherits="BDProject.WebForm10" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title style="text-align:center">CAMERA</title>
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
    

    <h1 style="text-align:center" >ADAUGA O CAMERA</h1>

</head>
<body>

    <form id="form1" runat="server">

        <div>
                <asp:Button class="button1"  runat="server" BackColor="Purple" style="text-align:center; display:block; margin: 0 auto;" ForeColor="White" Text="‹ MainPage" ID="Contract_Main_page" OnClick="Contract_Main_page_Click" />

            <div class="row" style="margin-top:2%;margin-left:5%">
                <div class="col" >
<asp:Label ID="sort_Label2" runat="server" style="z-index: 1;margin-left:7% ;color:red; font-family:'Courier New'; font-weight:bold" Text="Label de sortare, mesaj" Visible="False"></asp:Label>                 
                    <asp:GridView ID="GridView_camere" runat="server" horizontalalign="Center" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID_CAMERA" DataSourceID="SqlDataSource1" GridLines="Horizontal">
                       <AlternatingRowStyle BackColor="#F7F7F7" />
                       <Columns>
                           <asp:BoundField DataField="ID_CAMERA" HeaderText="ID_CAMERA" ReadOnly="True" SortExpression="ID_CAMERA" />
                           <asp:BoundField DataField="ID_CLADIRE" HeaderText="ID_CLADIRE" SortExpression="ID_CLADIRE" />
                           <asp:BoundField DataField="ETAJ" HeaderText="ETAJ" SortExpression="ETAJ" />
                           <asp:BoundField DataField="ID_TIP" HeaderText="ID_TIP" SortExpression="ID_TIP" />
                           <asp:BoundField DataField="NECESITA_REPARATII" HeaderText="NECESITA_REPARATII" SortExpression="NECESITA_REPARATII" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CAMERE&quot;"></asp:SqlDataSource>
                </div>
                

               
                <div class="col"  style="margin-left:5%">
                    
                        <asp:Label  runat="server" Text="Tipul camerei" style="text-align:left"></asp:Label>
                    <asp:DropDownList ID="DropDownList_tip" runat="server" style="margin-left:3%">
                        <asp:ListItem Value="0">select</asp:ListItem>
                        <asp:ListItem Value="1">Single Premium</asp:ListItem>
                        <asp:ListItem Value="2">Single Standard</asp:ListItem>
                        <asp:ListItem Value="3">Double Premium</asp:ListItem>
                        <asp:ListItem Value="4">Double Standard</asp:ListItem>
                        <asp:ListItem Value="5">Triple Premium</asp:ListItem>
                        <asp:ListItem Value="6">Triple Standard</asp:ListItem>
                        <asp:ListItem Value="7">Exclusive</asp:ListItem>
                    </asp:DropDownList>             
                    <div class="txtBoxes">
                        <asp:Label runat="server" Text="Necesita reparatii?" style="text-align:left"></asp:Label>
                         <asp:DropDownList ID="DropDownList_reparatii"  style="margin-left:3%" runat="server">
                        <asp:ListItem Value="0">NU</asp:ListItem>
                        <asp:ListItem Value="1">DA</asp:ListItem>
                        
                    </asp:DropDownList> 

                    </div>
                    <div class="txtBoxes">
                        <asp:Label ID="Label1" runat="server" Text="Cladire"></asp:Label>
                        <asp:TextBox CssClass="txtBoxes_box" ID="TxtB_cladire" BorderStyle="Solid" BorderColor="Purple" ReadOnly="true" Width="100px" runat="server"></asp:TextBox>
                    </div>

                   
                     <div class="row" style="margin-top:2%" >
                    <asp:Button class="button1" runat ="server" Text="Adauga camera"  BackColor="Purple" ForeColor="White" style=" margin-left:4%; margin-top:7%" ID="Button_Adauga_cladirea" OnClick="Button_Adauga_cladirea_Click1"></asp:Button>
                         <asp:GridView ID="GridView_false" runat="server" Visible="False"></asp:GridView>
                         </div>

                    
                </div>

                <div class="col" style="margin-right:10%">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" horizontalalign="Center" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID_CLADIRE" DataSourceID="SqlDataSource2" GridLines="Horizontal" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                            <asp:BoundField DataField="ID_CLADIRE" HeaderText="ID_CLADIRE" ReadOnly="True" SortExpression="ID_CLADIRE" />
                            <asp:BoundField DataField="ETAJE" HeaderText="ETAJE" SortExpression="ETAJE" />
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"  ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;C&quot;.ID_CLADIRE ,&quot;C&quot;.ETAJE FROM CLADIRE &quot;C&quot; WHERE (SELECT COUNT(CC.ID_CAMERA) FROM CAMERE CC WHERE CC.ID_CLADIRE=&quot;C&quot;.ID_CLADIRE)&lt;5*&quot;C&quot;.ETAJE"></asp:SqlDataSource>
                </div>
                 
               </div>   


       
    </div>
    </form>
</body>
</html>
