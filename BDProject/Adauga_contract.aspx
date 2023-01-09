<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adauga_contract.aspx.cs" Inherits="BDProject.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title style="text-align:center">CONTRACTE</title>
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
    

    <h1 style="text-align:center" >ADAUGA UN CONTRACT NOU</h1>

</head>
<body>

    <form id="form1" runat="server">

        <div>
                <asp:Button class="button1"  runat="server" BackColor="Purple" style="text-align:center; display:block; margin: 0 auto;" ForeColor="White" Text="‹ MainPage" ID="Contract_Main_page" OnClick="Contract_Main_page_Click" />

            <div class="row" style="margin-top:2%">
                <div class="col">
<asp:Label ID="sort_Label2" runat="server" style="z-index: 1; font-family:'Courier New'; font-weight:bold ;color:red" Text="Label de sortare, mesaj"  Visible="False"></asp:Label>                 
                    <asp:GridView ID="GridView_2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID_CONTRACT" DataSourceID="SqlDataSource1" GridLines="Horizontal" OnSorting="GridView2_Sorting" OnDataBound="GridView_2_DataBound">
                       <AlternatingRowStyle BackColor="#F7F7F7" />
                       <Columns>
                           <asp:BoundField DataField="ID_CONTRACT" HeaderText="ID_CONTRACT" ReadOnly="True" SortExpression="ID_CONTRACT" />
                           <asp:BoundField DataField="ID_CLIENT" HeaderText="ID_CLIENT" SortExpression="ID_CLIENT" />
                           <asp:BoundField DataField="INCEPUT_CONTRACT" DataFormatString="{0:dd/MM/yyyy}" HeaderText="INCEPUT_CONTRACT" SortExpression="ID_CONTRACT" />
                           <asp:BoundField DataField="FINAL_CONTRACT" DataFormatString="{0:dd/MM/yyyy}" HeaderText="FINAL_CONTRACT" SortExpression="FINAL_CONTRACT" />
                           <asp:BoundField DataField="ID_CAMERA" HeaderText="ID_CAMERA" SortExpression="ID_CAMERA" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;CONTRACTE_INCHIRIERE&quot;"></asp:SqlDataSource>
                </div>
                

                

                <div class="col">
                    <asp:GridView runat="server" ID="GridView_Camere_libere" Visible="False" style="text-align:center" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Horizontal" OnSelectedIndexChanging="GridView_Camere_libere_SelectedIndexChanging">
                        <AlternatingRowStyle BackColor="#F7F7F7" />
                        <Columns>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                            <asp:BoundField DataField="ID_CAMERA" HeaderText="ID_CAMERA" SortExpression="ID_CAMERA" />
                            <asp:BoundField DataField="DENUMIRE" HeaderText="DENUMIRE" SortExpression="DENUMIRE" />
                            <asp:BoundField DataField="ID_CLADIRE" HeaderText="ID_CLADIRE" SortExpression="ID_CLADIRE" />
                            <asp:BoundField DataField="LOCATIE" HeaderText="LOCATIE" SortExpression="LOCATIE" />
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


                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" OnSelecting="SqlDataSource2_Selecting" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT CC.ID_CAMERA,TC.DENUMIRE,CC.ID_CLADIRE,C3.LOCATIE FROM CAMERE CC JOIN TIP_CAMERA TC ON CC.ID_TIP = TC.ID_TIP JOIN CLADIRE C2 ON CC.ID_CLADIRE = C2.ID_CLADIRE JOIN CAMPUS C3 ON C2.ID_CAMPUS = C3.ID_CAMPUS WHERE TC.NUMAR_LOCURI-(SELECT COUNT( CI2.ID_CLIENT ) FROM CONTRACTE_INCHIRIERE CI2 WHERE CC.ID_CAMERA=CI2.ID_CAMERA)&gt;0 AND CC.NECESITA_REPARATII='NU'"></asp:SqlDataSource>
                  </div>
                </div>

               <div class="row" >
                <div class="col">
                    
                        <asp:Label  runat="server" Text="Id-ul clientului" style="text-align:left"></asp:Label>
                    <asp:TextBox ID="TxtB_Contract_ID_client" class="txtBoxes_box" runat="server" Width="100px" BorderStyle="Solid" BorderColor="Purple" style="float:right" ></asp:TextBox>
                        
                    <div class="txtBoxes">
                        <asp:Label runat="server" Text="Data de inceput a contractului" style="text-align:left"></asp:Label>
                        <asp:TextBox class="txtBoxes_box" ID="TxtB_Inceput_contract" runat="server"  placeholder="DD/MM/YYYY" Width="100px" BorderStyle="Solid" BorderColor="Purple" style="float:right"></asp:TextBox>
                        </div>

                    <div class="txtBoxes">
                        <asp:Label runat="server" Text="Data de final a contractului" style="text-align:left"></asp:Label>
                    <asp:TextBox class="txtBoxes_box" ID="TxtB_Final_contract" runat="server" placeholder="DD/MM/YYYY" Width="100px" BorderStyle="Solid" BorderColor="Purple" style="float:right "></asp:TextBox>
                        </div >
                    <div class="txtBoxes">
                         <asp:Label runat="server" Text="ID-ul camerei disponibile" style="text-align:left"></asp:Label>
                    <asp:TextBox class="txtBoxes_box" ID="TxtB_Contract_ID_camera" runat="server" Width="100px" ReadOnly="true" BorderStyle="Solid" BorderColor="Purple" style="float:right "></asp:TextBox>
                        </div>

                    <div class="row" >
                    <asp:Button CssClass="button1" runat="server" Text="Afisare camere disponibile" BackColor="Purple" style=" margin-top:7%" ForeColor="White" ID="Button_Afisare_camere_disponibile" OnClick="Button_Afisare_camere_disponibile_Click"></asp:Button>
                    <asp:Button class="button1" runat ="server" Text="Adauga contractul"  BackColor="Purple" ForeColor="White" style=" margin-left:4%; margin-top:7%" ID="Button_Adauga_contract" OnClick="Button_Adauga_contract_Click"></asp:Button>
                        </div>
                </div>
                   <div class="col"></div>
                   <div class="col"></div>
               </div>   


       
    </div>
    </form>
</body>
</html>
