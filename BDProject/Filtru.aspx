<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Filtru.aspx.cs" Inherits="BDProject.WebForm8" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title style="text-align:center">FILTRE CAMERA</title>
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
        margin-right:35%;
    }

    .button1 {border-radius: 5px;
              
             
              border:none;
              font-size:15px;
              padding:7px;
             font-family:'Times New Roman';
              
    }
  
    </style>
    

    <h1 style="text-align:center" >FILTRU CAMERA</h1>

</head>
<body>

    <form id="form1" runat="server">

        <div>
                <asp:Button class="button1"  runat="server" BackColor="Purple" style="text-align:center; display:block; margin: 0 auto;" ForeColor="White" Text="‹ MainPage" ID="Contract_Main_page" OnClick="Filtru_Main_page_Click"/>

            <div class="row" style="margin-top:3%" >
                <div class="col">
<asp:Label ID="sort_Label_angajat" runat="server" style="z-index: 1; font-family:'Courier New'; font-weight:bold ;color:red;margin-left:5%" Text="Label de sortare, mesaj" Visible="False"></asp:Label>                 
                    <asp:GridView ID="GridView_filtru_auto" runat="server"  style="margin-left:5%" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" >
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
                
                <div class="col" style="margin-left:7%">
                    
                    
                        <asp:Label ID="Label_gruparare_dupa_cladiri" runat="server" style="font-size:20px"   Text="Afiseaza camere in functie de:"></asp:Label>
                        <div class="txtBoxes" style="margin-top:8%">
                            <asp:Label ID="Label_filtru_cladire" runat="server" Text="CLADIRE"></asp:Label>
                            <asp:TextBox class="txtBoxes_box" ID="TxtB_filtru_cladire" runat="server"  Width="100px" BorderStyle="Solid" BorderColor="Purple" ReadOnly="true" style="float:right"></asp:TextBox>

                        </div>
                    <div class="txtBoxes" style="margin-top:4%">
                            <asp:Label ID="Label_filtru_etaj" runat="server" Text="ETAJ"></asp:Label>
                            <asp:DropDownList ID="DropDownList_filtru" runat="server" style="margin-left:3%;margin-top:3%" AutoPostBack="True">
                                <asp:ListItem Value="0">fara etaj</asp:ListItem>
                                <asp:ListItem Value="1">0</asp:ListItem>
                                <asp:ListItem Value="2">1</asp:ListItem>
                                <asp:ListItem Value="3">2</asp:ListItem>
                                <asp:ListItem Value="4">3</asp:ListItem>
                                <asp:ListItem Value="5">4</asp:ListItem>
                                <asp:ListItem Value="6">5</asp:ListItem>
                                <asp:ListItem Value="7">6</asp:ListItem>
                                <asp:ListItem Value="8">7</asp:ListItem>
                                <asp:ListItem Value="9">8</asp:ListItem>
                                <asp:ListItem Value="10">9</asp:ListItem>
                                <asp:ListItem Value="10">10</asp:ListItem>

                            </asp:DropDownList>
                        </div>

                    <asp:Button ID="Button_filtru"  class="button1"  style="margin-top:8%;text-align:center;margin-left:20%"  runat="server" BackColor="Purple" ForeColor="White" Text="Afiseaza camere" OnClick="Button_filtru_Click" />
                    
                  </div>
                 

              
                

                <div class="col">
                    <asp:GridView runat="server" ID="GridView_filtru_cladiri" style="text-align:center" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="ID_CLADIRE" DataSourceID="SqlDataSource1" OnSelectedIndexChanging="GridView_filtru_cladiri_SelectedIndexChanging" >
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                            <asp:BoundField DataField="ID_CLADIRE" HeaderText="ID_CLADIRE" ReadOnly="True" SortExpression="ID_CLADIRE" />
                            <asp:BoundField DataField="ID_CAMPUS" HeaderText="ID_CAMPUS" SortExpression="ID_CAMPUS" />
                            <asp:BoundField DataField="ETAJE" HeaderText="ETAJE" SortExpression="ETAJE" />
                            <asp:BoundField DataField="NUMAR_STINGATOARE" HeaderText="NUMAR_STINGATOARE" SortExpression="NUMAR_STINGATOARE" />
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


                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CLADIRE&quot;"></asp:SqlDataSource>


                  </div>

        
             </div>  
                     
     
      
        </div>
    </form>
</body>
</html>

