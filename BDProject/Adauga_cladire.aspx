<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adauga_cladire.aspx.cs" Inherits="BDProject.Adauga_cladire" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title style="text-align:center">CLADIRE</title>
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
    

    <h1 style="text-align:center" >ADAUGA O CLADIRE NOUA</h1>

</head>
<body>

    <form id="form1" runat="server">

        <div>
                <asp:Button class="button1"  runat="server" BackColor="Purple" style="text-align:center; display:block; margin: 0 auto;" ForeColor="White" Text="‹ MainPage" ID="Contract_Main_page" OnClick="Contract_Main_page_Click" />

            <div class="row" style="margin-top:2%">
                <div class="col">
<asp:Label ID="sort_Label2" runat="server" style="z-index: 1;margin-left:20% ; font-family:'Courier New'; font-weight:bold;color:red" Text="Label de sortare, mesaj" Visible="False"></asp:Label>                 
                    <asp:GridView ID="GridView_cladire" runat="server" horizontalalign="Center" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID_CLADIRE" DataSourceID="SqlDataSource1" GridLines="Horizontal">
                       <AlternatingRowStyle BackColor="#F7F7F7" />
                       <Columns>
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
                

                

                <div class="col">

                    <asp:GridView ID="GridView_campus" runat="server" AllowPaging="True" horizontalalign="Center" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID_CAMPUS" DataSourceID="SqlDataSource2" GridLines="Horizontal" OnSelectedIndexChanging="GridView_campus_SelectedIndexChanging">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CAMPUS&quot;"></asp:SqlDataSource>
                  </div>
                </div>

               <div class="row" >
                <div class="col" style="margin-left:10%">
                    
                        <asp:Label  runat="server" Text="ID-ul cladirii" style="text-align:left;margin-top:20%"></asp:Label>
                    <asp:TextBox ID="TxtB_Cladire_id" class="txtBoxes_box" runat="server" Width="100px" BorderStyle="Solid" BorderColor="Purple" style="float:right" ></asp:TextBox>
                        
                    <div class="txtBoxes">
                        <asp:Label runat="server" Text="Id-ul campusului" style="text-align:left"></asp:Label>
                        <asp:TextBox class="txtBoxes_box" ID="TxtB_Cladire_campus" runat="server"  ReadOnly="true" Width="100px" BorderStyle="Solid" BorderColor="Purple" style="float:right"></asp:TextBox>
                        </div>

                    <div class="txtBoxes">
                        <asp:Label runat="server" Text="Etaje" style="text-align:left"></asp:Label>
                    <asp:TextBox class="txtBoxes_box" ID="TxtB_Cladire_etaje" runat="server" Width="100px" placeholder="min(2), max(10)" BorderStyle="Solid" BorderColor="Purple" style="float:right "></asp:TextBox>
                        </div >
                    <div class="txtBoxes">
                         <asp:Label runat="server" Text="Numar stingatoare" style="text-align:left" ></asp:Label>
                    <asp:TextBox class="txtBoxes_box" ID="TxtB_Cladire_nr_stingatoare" runat="server" placeholder=" max 2* etaje" Width="100px"  BorderStyle="Solid" BorderColor="Purple" style="float:right "></asp:TextBox>
                        </div>
                     <div class="row" >
                    <asp:Button class="button1" runat ="server" Text="Adauga cladirea"  BackColor="Purple" ForeColor="White" style=" margin-left:4%; margin-top:7%" ID="Button_Adauga_cladirea" OnClick="Button_Adauga_cladirea_Click1"></asp:Button>
                        </div>

                    
                </div>
                   <div class="col"></div>
                   <div class="col"></div>
               </div>   


       
    </div>
    </form>
</body>
</html>
