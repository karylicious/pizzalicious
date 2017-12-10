<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PizzaControl.ascx.cs" Inherits="WebUserControl" %>
              <br />
                
          <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Width="615px">
        <asp:GridView ID="grdPizza" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="id_Pizza" OnRowDeleting="grdPizza_RowDeleting" 
    BackColor="#E3C7AA" onselectedindexchanged="grdPizza_SelectedIndexChanged" 
                style="margin-right: 0px" Width="643px">
            <Columns>
                <asp:BoundField DataField="id_ingred" HeaderText="idIngred" ReadOnly="True" 
            SortExpression="id_ingred" Visible="False" />
                <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                <asp:TemplateField HeaderText="Pizza">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("nomePizza") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="tamanho" HeaderText="Tamanho" ReadOnly="True" />
                <asp:BoundField DataField="nome_Ingred" HeaderText="Ingrediente" 
            ReadOnly="True" />
                <asp:BoundField DataField="_extra" HeaderText="Extra" />
                <asp:TemplateField HeaderText="Preço do Ingrediente">
                   <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" 
                            Text='<%# Bind("precoIngred", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Preço da Pizza">
                     <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("precoTotal", "{0:c}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Origem" HeaderText="Origem" ReadOnly="True" 
            SortExpression="Origem" Visible="False" />
                <asp:BoundField DataField="massa" HeaderText="Tipo de Massa" ReadOnly="True" 
            SortExpression="Massa" />
               <asp:BoundField DataField="precoPorTam" HeaderText="Preço por Tamanho" ReadOnly="True" 
            SortExpression="precoPorTam" Visible="False" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                            CommandName="Delete" Text="Eliminar" OnClientClick = "return confirm ('Tem a certeza de que pretende excluir o ingrediente?');" ></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <SelectedRowStyle BackColor="#CC6600" />
        </asp:GridView>
</asp:Panel>




  


<br />
<br />
<br />
<div id="divTam" runat="server" 
    style="font-family: Tahoma; font-weight: bold; font-size: 12px;">
    <br />
    Editar detalhes da
    <asp:Label ID="LabelNomePizza" runat="server"></asp:Label>
    :<br />
    <br />
    Tamanho<br />
    <asp:Image ID="Image1" runat="server" Height="2px" ImageUrl="~/Images/line.png" 
        Width="386px" />
    <br />
    <br />
<asp:DropDownList ID="DropDownListTam" runat="server" 
    DataSourceID="SqlDataSource2" DataTextField="NomeTamanho" 
    DataValueField="idTamanho" Height="17px" Width="170px">
</asp:DropDownList>





    &nbsp;<asp:ImageButton ID="ImageButtonTam" runat="server" 
        ImageUrl="~/Images/alterar.png" onclick="ImageButtonTam_Click" />
        </div>
       
    <br />
<div id="divMassa" runat="server" 
    style="font-family: Tahoma; font-weight: bold; font-size: 12px;">
    Tipo de Massa<br />
    <asp:Image ID="Image3" runat="server" Height="2px" ImageUrl="~/Images/line.png" 
        Width="386px" />
    <br />
    <br />
<asp:DropDownList ID="DropDownListMassa" runat="server" 
    DataSourceID="SqlDataSource3" DataTextField="NomeMassa" DataValueField="idMassa" 
    Height="17px" Width="170px">
</asp:DropDownList>





    &nbsp;<asp:ImageButton ID="ImageButtonMassa" runat="server" 
        ImageUrl="~/Images/alterar.png" onclick="ImageButtonMassa_Click" />
</div>
       
    
       



<br />
<div id="divIngrd" runat="server" 
    
    
    style="font-family: Tahoma; font-weight: bold; font-size: 12px; height: 202px;">
    Ingrediente<br />
    <asp:Image ID="Image2" runat="server" Height="2px" ImageUrl="~/Images/line.png" 
        Width="386px" />
    <br />
    <br />
<asp:DropDownList ID="DropDownListIngrd" runat="server" DataTextField="NomeArtigo" 
    DataValueField="NomeArtigo" Height="17px" Width="170px">
</asp:DropDownList>





    &nbsp;<asp:ImageButton ID="ImageButtonAddIngrd" runat="server" 
        ImageUrl="~/Images/adicionaritem.png" 
        onclick="ImageButtonAddIngrd_Click" />
        &nbsp;<br />
    <div id="divextra" runat="server">
        <br />
        <asp:CheckBox ID="CheckBox1" runat="server" 
            oncheckedchanged="CheckBox1_CheckedChanged" Text="Extra" />
        <br />
        <br />
    </div>
    <br />
&nbsp;





        </div>
<br />
       
    
       



<asp:SqlDataSource ID="SqlDataSourcePizzCriad" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT NomeArtigo FROM Artigo WHERE (Tipo = 'Ingrediente')">
</asp:SqlDataSource>





<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    
        
    
    SelectCommand="SELECT [NomeTamanho], idTamanho FROM [Tamanho] where nomeTamanho&lt;&gt;'Nenhum'">
</asp:SqlDataSource>






<asp:SqlDataSource ID="SqlDataSourceIngrEQ" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    
    
    SelectCommand="SELECT NomeArtigo FROM Artigo WHERE (Tipo = 'Ingrediente') AND (NomeArtigo <>'Extra Molho')">
</asp:SqlDataSource>






<asp:SqlDataSource ID="SqlDataSourceIngrEM" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"     
    
    
    SelectCommand="SELECT NomeArtigo FROM Artigo WHERE (Tipo = 'Ingrediente') AND (NomeArtigo <>'Extra Queijo')">
</asp:SqlDataSource>






<asp:SqlDataSource ID="SqlDataSourceSemExtra" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"   
    
    
    SelectCommand="SELECT NomeArtigo FROM Artigo WHERE (Tipo = 'Ingrediente') AND (NomeArtigo NOT LIKE 'Extra%')">
</asp:SqlDataSource>






<asp:SqlDataSource ID="SqlDataSourceApenasM" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"   
    
    
    
    SelectCommand="SELECT NomeArtigo FROM Artigo WHERE (Tipo = 'Ingrediente') AND (NomeArtigo ='Extra Molho')">
</asp:SqlDataSource>

<asp:SqlDataSource ID="SqlDataSourceApenasQ" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"   
    
    
    
    SelectCommand="SELECT NomeArtigo FROM Artigo WHERE (Tipo = 'Ingrediente') AND (NomeArtigo ='Extra Queijo')">
</asp:SqlDataSource>


<asp:SqlDataSource ID="SqlDataSourceTodosExtras" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"   
    
    
    SelectCommand="SELECT NomeArtigo FROM Artigo WHERE (Tipo = 'Ingrediente') AND (NomeArtigo  LIKE 'Extra%')">
</asp:SqlDataSource>


<asp:SqlDataSource ID="SqlDataSource3" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT [NomeMassa], [idMassa] FROM [Massa]">
</asp:SqlDataSource>





    
