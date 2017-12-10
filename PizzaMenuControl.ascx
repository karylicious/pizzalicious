<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PizzaMenuControl.ascx.cs" Inherits="WebUserControl" %>
              <br />
                
          <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Width="615px">
        <asp:GridView ID="grdPizza" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="id_Pizza" BackColor="#E3C7AA" onselectedindexchanged="grdPizza_SelectedIndexChanged" 
                style="margin-right: 0px" Width="643px">
            <Columns>
                <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                <asp:TemplateField HeaderText="Pizza">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("nomePizza") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="nome_Ingred" HeaderText="Ingrediente" 
            ReadOnly="True" />
                <asp:BoundField DataField="_extra" HeaderText="Extra" />
                <asp:BoundField DataField="massa" HeaderText="Tipo de Massa" ReadOnly="True" 
            SortExpression="Massa" />
                <asp:BoundField DataField="tamanho" HeaderText="Tamanho da Pizza" 
                    ReadOnly="True"/>
            </Columns>
            <SelectedRowStyle BackColor="#CC6600" />
        </asp:GridView>
</asp:Panel>




  


<br />
<br />
<br />
<div id="divPizza" runat="server" 
    style="font-family: Tahoma; font-weight: bold; font-size: 12px;">
    <br />
    Subtituir pizza:<br />
    <br />
    Pizzas<br />
    <asp:Image ID="Image1" runat="server" Height="2px" ImageUrl="~/Images/line.png" 
        Width="386px" />
    <br />
    <br />
<asp:DropDownList ID="DropDownListPizza" runat="server" 
    DataSourceID="SqlDataSource2" DataTextField="NomeArtigo" 
    DataValueField="idArtigo" Height="17px" Width="170px">
</asp:DropDownList>





    &nbsp;<asp:ImageButton ID="ImageButtonPizza" runat="server" 
        ImageUrl="~/Images/alterar.png" onclick="ImageButtonPizza_Click" />
        </div>
       
    <br />





<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    
        
    
    SelectCommand="SELECT [NomeArtigo], [idArtigo] FROM [Artigo] where idCategoria=2">
</asp:SqlDataSource>












    
