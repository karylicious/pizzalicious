<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="gerirpedidos.aspx.cs" Inherits="gerirpedidos" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   <ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager1" />
   
      <asp:SqlDataSource ID="SqlDataSourcePedidosLista" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Pedido] ORDER BY [Data] DESC">
    </asp:SqlDataSource>
       <div align="center">
           <asp:LinkButton ID="LinkButton3" runat="server" Font-Underline="True" 
               PostBackUrl="~/gestao.aspx">Voltar para Administração</asp:LinkButton>
    </div>
       <br />

        <asp:Panel ID="PanelPedido" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButtonLista" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;
           Lista de Pedidos         
        </div>
    </asp:Panel>

        <asp:Panel id="PanelPedidoContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="309px">
	    <table style="width: 100%; height: 282px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                
            <asp:Panel ID="Panel4" runat="server" ScrollBars="Auto" Width="638px" 
                Height="243px" BorderStyle="Inset">
           
             <asp:GridView ID="GridViewListaPedidos" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSourcePedidosLista" Width="312px" DataKeyNames="idPedido" 
                    BackColor="#E3C7AA" Height="247px" 
                    onselectedindexchanged="GridViewListaPedidos_SelectedIndexChanged">
                 <Columns>
                     <asp:TemplateField ShowHeader="False">
                         <ItemTemplate>
                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                 CommandName="Select" Text="Select"></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:BoundField DataField="idPedido" HeaderText="Id do Pedido" InsertVisible="False" 
                         ReadOnly="True" SortExpression="idPedido" />
                     <asp:BoundField DataField="idUser" HeaderText="Id do User" 
                         SortExpression="idUser" />
                     <asp:BoundField DataField="Data" HeaderText="Data" 
                         SortExpression="Data" />
                     <asp:BoundField DataField="Morada" HeaderText="Morada" 
                         SortExpression="Morada" />
                     <asp:BoundField DataField="Localidade" HeaderText="Localidade" 
                         SortExpression="Localidade" />
                     <asp:BoundField DataField="CodPostal" HeaderText="Código-Postal" 
                         SortExpression="CodPostal" />
                     <asp:BoundField DataField="idPromocao" HeaderText="Id da Promoção" 
                         SortExpression="idPromocao" />
                     <asp:BoundField DataField="ModPag" HeaderText="Modo de Pagamento" 
                         SortExpression="ModPag" />
                     <asp:BoundField DataField="Troco" HeaderText="Troco" SortExpression="Troco" />
                     <asp:BoundField DataField="idPontos" HeaderText="Id dos Pontos" 
                         SortExpression="idPontos" />
                      <asp:BoundField DataField="Cancelado" HeaderText="Cancelado" 
                         SortExpression="Cancelado" />
                 </Columns>
                 <SelectedRowStyle BackColor="#FFFBD6" />
        </asp:GridView>
            </asp:Panel>
      
         
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </asp:Panel>



        
        <br />
     

        <asp:Panel ID="PanelCarrinho" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="Description_ToggleImage" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp; Ver detalhes de um 
            Pedido seleccionado anteriormente</div>
    </asp:Panel>

        <asp:Panel id="PanelCarrinhoContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="464px">
        <br />
	    <table style="width: 100%; height: 270px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <asp:Panel ID="Panel10" runat="server" Height="330px" ScrollBars="Auto" 
                        Width="638px" BorderStyle="Inset">
                        <div style="background-color: #E3C7AA" id="divPedido" runat="server">
                            <asp:GridView ID="GridViewDetalhePedido" runat="server" 
                                AutoGenerateColumns="False" BackColor="#E3C7AA" DataKeyNames="idPedido" 
                                DataSourceID="SqlDataSourcePedidosSel" Height="189px" Width="654px">
                                <Columns>
                                    <asp:BoundField DataField="NomeArtigo" HeaderText="Produto" 
                                        SortExpression="NomeArtigo" />
                                    <asp:TemplateField HeaderText="Imagem" SortExpression="Imagem">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Imagem") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                       <asp:Image ID="imagemLabel" runat="server"  ImageUrl='<%# "Imagem_Artigo/" + Eval("Imagem") %>'></asp:Image>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Quantidade" HeaderText="Quantidade" 
                                        SortExpression="Quantidade" />
                                    <asp:TemplateField HeaderText="Preço" SortExpression="Preco">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Preco") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%#  string.Format("{0:c2}",Eval("Preco"))  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                   
                                </Columns>
                            </asp:GridView>
                            <asp:GridView ID="GridViewMenuSelec" runat="server" AutoGenerateColumns="False" 
                                BackColor="#E3C7AA" DataKeyNames="idMenu" DataSourceID="SqlDataSource5" 
                                Width="656px" Height="152px">
                                <Columns>
                                    <asp:BoundField DataField="NomeMenu" HeaderText="Produto"  
                                        SortExpression="NomeMenu" />
                                    <asp:TemplateField HeaderText="Imagem" SortExpression="Imagem">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Imagem") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                          <asp:Image ID="imagemLabel" runat="server"  ImageUrl='<%# "Imagem_Artigo/" + Eval("Imagem") %>'></asp:Image>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Quantidade" HeaderText="Quantidade" 
                                        SortExpression="Quantidade" />
                                    <asp:TemplateField HeaderText="Preço" SortExpression="Preco">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Preco") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                             <asp:Label ID="PrecoLabel" runat="server" Text='<%# string.Format("{0:c2}",Eval("Preco")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                   
                                </Columns>
                                <HeaderStyle ForeColor="#E3C7AA" />
                            </asp:GridView>
                            <br />
                        </div>
                    </asp:Panel>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourcePedidosSel" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        SelectCommand="SELECT Artigo.NomeArtigo, Artigo.Imagem ,TamanhoArtigoPedido.Quantidade, TamanhoArtigoPedido.Preco, Pedido.idPedido FROM Pedido INNER JOIN TamanhoArtigoPedido ON Pedido.idPedido = TamanhoArtigoPedido.idPedido INNER JOIN TamanhoArtigo ON TamanhoArtigoPedido.idTamArtigo = TamanhoArtigo.idTamArtigo INNER JOIN Tamanho ON TamanhoArtigo.idTamanho = Tamanho.idTamanho INNER JOIN Artigo ON TamanhoArtigo.idArtigo = Artigo.idArtigo WHERE (Pedido.idPedido = @idPedido)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridViewListaPedidos" Name="idPedido" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT        Menu.NomeMenu, Menu.Imagem, MenuPedido.Quantidade, MenuPedido.Preco, Menu.idMenu, MenuPedido.idPedido
                           
FROM            Menu INNER JOIN
                         MenuPedido ON Menu.idMenu = MenuPedido.idMenu INNER JOIN
                         Pedido ON MenuPedido.idPedido = Pedido.idPedido
WHERE        (MenuPedido.idPedido = @idPedido)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridViewListaPedidos" Name="idPedido" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </asp:Panel>
       
         <br />



         
     

        <asp:Panel ID="PanelPizzaDetalhe" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButton1" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp; Ver detalhes das 
            Pizzas do Pedido anteriormente seleccionado</div>
    </asp:Panel>

        <asp:Panel id="PanelPizzaDetalheContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="366px">
        <br />
	    <table style="width: 100%; height: 282px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <asp:Panel ID="Panel11" runat="server" Height="243px" ScrollBars="Auto" 
                        Width="638px" BorderStyle="Inset">
                        <asp:GridView ID="GridViewPizza" runat="server" AutoGenerateColumns="False" 
                            BackColor="#E3C7AA" DataSourceID="SqlDataSourcePizza" 
                            Height="247px" Width="657px">
                            <Columns>
                                <asp:BoundField DataField="NomeArtigo" HeaderText="Pizza" 
                                    SortExpression="NomeArtigo" />
                                <asp:BoundField DataField="Ingrediente" HeaderText="Ingrediente" 
                                    SortExpression="Ingrediente" />
                                <asp:BoundField DataField="Extra" HeaderText="Extra" 
                                    SortExpression="Extra" />
                                <asp:BoundField DataField="NomeTamanho" HeaderText="Tamanho" 
                                    SortExpression="NomeTamanho" />
                                <asp:TemplateField HeaderText="Preço" SortExpression="Preco">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Preco") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%#  string.Format("{0:c2}",Eval("Preco"))  %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="NomeMassa" HeaderText="Massa" 
                                    SortExpression="NomeMassa" />
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourcePizza" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        SelectCommand="SELECT Pedido.idPedido, Artigo.NomeArtigo, Tamanho.NomeTamanho, Artigo_1.NomeArtigo AS Ingrediente, Ingrediente.Extra, Artigo_1.Preco, Massa.NomeMassa FROM Artigo RIGHT OUTER JOIN MassaArtigo ON Artigo.idArtigo = MassaArtigo.idArtigo LEFT OUTER JOIN Massa ON MassaArtigo.idMassa = Massa.idMassa RIGHT OUTER JOIN MassaArtigoPedido ON MassaArtigo.idMassaArtigo = MassaArtigoPedido.idMassaArtigo LEFT OUTER JOIN Pedido ON MassaArtigoPedido.idPedido = Pedido.idPedido LEFT OUTER JOIN Ingrediente ON Artigo.idArtigo = Ingrediente.idArtigo RIGHT OUTER JOIN Artigo AS Artigo_1 ON Ingrediente.idIngrediente = Artigo_1.idArtigo RIGHT OUTER JOIN TamanhoArtigo ON Artigo.idArtigo = TamanhoArtigo.idArtigo LEFT OUTER JOIN Tamanho ON TamanhoArtigo.idTamanho = Tamanho.idTamanho RIGHT OUTER JOIN TamanhoArtigoPedido ON TamanhoArtigo.idTamArtigo = TamanhoArtigoPedido.idTamArtigo AND Pedido.idPedido = TamanhoArtigoPedido.idPedido WHERE (TamanhoArtigoPedido.idPedido = @idPedido)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridViewListaPedidos" Name="idPedido" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </asp:Panel>
       
         <br />



          <asp:Panel ID="PanelMenuDetalhe" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButton3" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp; Ver detalhes dos 
            Menus do Pedido anteriormente seleccionado</div>
    </asp:Panel>

        <asp:Panel id="PanelMenuDetalheContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="358px">
        <br />
	    <table style="width: 100%; height: 282px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <asp:Panel ID="Panel12" runat="server" Height="243px" ScrollBars="Auto" 
                        Width="638px" BorderStyle="Inset">
                        <asp:GridView ID="GridViewMenuus" runat="server" AutoGenerateColumns="False" 
                            BackColor="#E3C7AA" DataKeyNames="idArtigo" DataSourceID="SqlDataSourceMenuus" 
                            Height="224px" Width="642px">
                            <Columns>
                                <asp:BoundField DataField="Menu" HeaderText="Menu" 
                                    SortExpression="Menu" ReadOnly="True" />
                                <asp:BoundField DataField="NomeArtigo" HeaderText="Produto" 
                                    SortExpression="NomeArtigo" />
                                <asp:TemplateField HeaderText="Imagem" SortExpression="Imagem">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Imagem") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Image ID="imagemLabel" runat="server"  ImageUrl='<%# "Imagem_Artigo/" + Eval("Imagem") %>'></asp:Image>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Quantidade" HeaderText="Quantidade" 
                                    SortExpression="Quantidade" />
                                <asp:TemplateField HeaderText="Preço" SortExpression="Preco">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Preco") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="PrecoLabel" runat="server" Text='<%# string.Format("{0:c2}",Eval("Preco")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourceMenuus" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT        MenuPedidoTamanhoArtigo.idTamArtigo, MenuPedido.Quantidade, MenuPedido.Preco, Artigo.NomeArtigo, Artigo.Imagem, Categoria.NomeCategoria, Artigo.idArtigo,
                             (SELECT        NomeMenu
                               FROM            Menu
                               WHERE        (idMenu = MenuPedido.idMenu)) AS Menu
FROM            MenuPedidoTamanhoArtigo INNER JOIN
                         MenuPedido ON MenuPedidoTamanhoArtigo.idMenuPedido = MenuPedido.idMenuPedido INNER JOIN
                         TamanhoArtigo ON MenuPedidoTamanhoArtigo.idTamArtigo = TamanhoArtigo.idTamArtigo INNER JOIN
                         Artigo ON TamanhoArtigo.idArtigo = Artigo.idArtigo INNER JOIN
                         Categoria ON Artigo.idCategoria = Categoria.idCategoria
WHERE        (MenuPedidoTamanhoArtigo.idMenuPedido =
                             (SELECT        idMenuPedido
                               FROM            MenuPedido AS MenuPedido_1
                               WHERE        (idPedido = @idpedido)))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridViewListaPedidos" Name="idpedido" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </asp:Panel>
       
         <br />

          <asp:Panel ID="PanelPizzaMenu" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButton2" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp; Ver detalhes das Pizzas dos Menus do Pedido anteriormente seleccionado</div>
    </asp:Panel>

        <asp:Panel id="PanelPizzaMenuContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="358px">
        <br />
	    <table style="width: 100%; height: 282px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <asp:Panel ID="Panel3" runat="server" Height="243px" ScrollBars="Auto" 
                        Width="638px" BorderStyle="Inset">
                        <asp:GridView ID="GridViewPizzaMenu" runat="server" AutoGenerateColumns="False" 
                            BackColor="#E3C7AA" DataSourceID="SqlDataSourcePizzaMenu" 
                            Height="245px" Width="639px">
                            <Columns>
                                <asp:BoundField DataField="NomeMenu" HeaderText="Menu" 
                                    SortExpression="NomeMenu" />
                                <asp:BoundField DataField="Pizza" HeaderText="Pizza" SortExpression="Pizza" />
                                <asp:BoundField DataField="Ingrediente" HeaderText="Ingrediente" 
                                    SortExpression="Ingrediente" />
                                <asp:BoundField DataField="Extra" HeaderText="Extra" SortExpression="Extra" />
                                <asp:BoundField DataField="NomeTamanho" HeaderText="Tamanho" 
                                    SortExpression="NomeTamanho" />
                                <asp:TemplateField HeaderText="Preço" SortExpression="Preco">
                                    <ItemTemplate>
                                       <asp:Label ID="Label1" runat="server" Text='<%#  string.Format("{0:c2}",Eval("Preco"))  %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Preco") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="NomeMassa" HeaderText="Massa" 
                                    SortExpression="NomeMassa" />
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSourcePizzaMenu" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        SelectCommand="SELECT Artigo_1.NomeArtigo AS Ingrediente, Menu.NomeMenu, Pedido.idPedido, Artigo.NomeArtigo AS Pizza, Tamanho.NomeTamanho, Menu.Preco, Massa.NomeMassa, Ingrediente.Extra FROM Tamanho INNER JOIN Pedido INNER JOIN Artigo INNER JOIN TamanhoArtigo ON Artigo.idArtigo = TamanhoArtigo.idArtigo INNER JOIN MenuPedido INNER JOIN Menu ON MenuPedido.idMenu = Menu.idMenu INNER JOIN MenuPedidoTamanhoArtigo ON MenuPedido.idMenuPedido = MenuPedidoTamanhoArtigo.idMenuPedido ON TamanhoArtigo.idTamArtigo = MenuPedidoTamanhoArtigo.idTamArtigo ON Pedido.idPedido = MenuPedido.idPedido ON Tamanho.idTamanho = TamanhoArtigo.idTamanho AND Tamanho.idTamanho = Menu.idTamanho INNER JOIN Massa ON Menu.idMassa = Massa.idMassa RIGHT OUTER JOIN Artigo AS Artigo_1 RIGHT OUTER JOIN Ingrediente ON Artigo_1.idArtigo = Ingrediente.idIngrediente ON Artigo.idArtigo = Ingrediente.idArtigo WHERE (Pedido.idPedido = @idPedido)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridViewListaPedidos" Name="idpedido" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </asp:Panel>
       
         <br />


        <ajaxToolkit:CollapsiblePanelExtender ID="cpeDesc" runat="Server"
        TargetControlID="PanelCarrinhoContent"
        ExpandControlID="PanelCarrinho"
        CollapseControlID="PanelCarrinho"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="description_ToggleImage" /> 



         <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderLista" runat="Server"
        TargetControlID="PanelPedidoContent"
        ExpandControlID="PanelPedido"
        CollapseControlID="PanelPedido"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="ImageButtonLista" /> 




         <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server"
        TargetControlID="PanelPizzaDetalheContent"
        ExpandControlID="PanelPizzaDetalhe"
        CollapseControlID="PanelPizzaDetalhe"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="ImageButtonLista" /> 



         <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="Server"
        TargetControlID="PanelMenuDetalheContent"
        ExpandControlID="PanelMenuDetalhe"
        CollapseControlID="PanelMenuDetalhe"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="ImageButtonLista" /> 


        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender3" runat="Server"
        TargetControlID="PanelPizzaMenuContent"
        ExpandControlID="PanelPizzaMenu"
        CollapseControlID="PanelPizzaMenu"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="ImageButtonLista" /> 


         </asp:Content>

