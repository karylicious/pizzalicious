<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="pedido.aspx.cs" Inherits="Pedido" %>


<%@ Register Assembly="AjaxControlToolkit"  Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<%@ Register src="CartControlAux.ascx" tagname="CartControlAux" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

 
    <style type="text/css">

        .style16
        {
            height: 28px;
        }
        .style20
        {
            height: 49px;
        }
        .style18
        {
        }
        .style21
        {
        }
        .style23
        {
            width: 331px;
        }
        .style24
        {
            width: 197px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

  <ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager1" />
    <br />
       <div align="center">
           <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/cesta.aspx" 
               Font-Underline="True">Ver lista do seu Pedido</asp:HyperLink>
    </div>
    <br />

       <br />

        <asp:Panel ID="PanelLista" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButtonLista" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp; Escolha a sua 
            pizza »</div>
    </asp:Panel>

        <asp:Panel id="PanelListaContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="1481px">
        <br />
            <table style="width: 100%; height: 309px;">
                <tr>
                    <td class="style20" style="font-weight: bold">
                        » Pretende criar pizza ou escolher da lista?</td>
                </tr>
                <tr>
                    <td class="style23">
                        <asp:RadioButtonList ID="RadioButtonListCriarEscolher" runat="server" 
                            AutoPostBack="True" 
                            OnSelectedIndexChanged="RadioButtonListCriarEscolher_SelectedIndexChanged">
                            <asp:ListItem>Criar pizza</asp:ListItem>
                            <asp:ListItem>Escolher da lista</asp:ListItem>
                        </asp:RadioButtonList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td ID="TDPizzas" runat="server" align="center" class="style18">
                        <asp:DropDownList ID="DropDownListPizzaList" runat="server" 
                            AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource17" 
                            DataTextField="NomeArtigo" DataValueField="idArtigo" 
                            OnSelectedIndexChanged="DropDownListPizzaList_SelectedIndexChanged">
                            <asp:ListItem>-</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:Image ID="ImagePizzaList" runat="server" Visible="False" />
                        <br />
                        <br />
                        <asp:Label ID="LabeldtList" runat="server" Font-Bold="True" 
                            Text="Ingredientes:" Visible="False"></asp:Label>
                        <asp:Label ID="LabelDetPizzaList" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource17" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [NomeArtigo], [Detalhe],idArtigo FROM [Artigo] where idCategoria=2">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td ID="TDcriarPzz" runat="server" class="style18" style="font-weight: bold">
                        <br />
                        » Pretende criar uma pizza nova ou escolher pizza base?<asp:RadioButtonList 
                            ID="RadioButtonListCriar" runat="server" AutoPostBack="True" Font-Bold="False" 
                            OnSelectedIndexChanged="RadioButtonListRadioButtonListCriar_SelectedIndexChanged">
                            <asp:ListItem>Criar uma pizza nova</asp:ListItem>
                            <asp:ListItem>Escolher pizza base</asp:ListItem>
                        </asp:RadioButtonList>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td ID="TDPizzaBase" runat="server" align="center" class="style18">
                        <br />
                        <asp:DropDownList ID="DropDownListPizzaBase" runat="server" 
                            AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource18" 
                            DataTextField="NomeArtigo" DataValueField="idArtigo" 
                            OnSelectedIndexChanged="DropDownListPizzaBase_SelectedIndexChanged">
                            <asp:ListItem>-</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:Image ID="ImagePizzaBase" runat="server" Visible="False" />
                        <br />
                        <br />
                        <asp:Label ID="LabeldtBase" runat="server" Font-Bold="True" 
                            Text="Ingredientes:" Visible="False"></asp:Label>
                        <asp:Label ID="LabelDetPizzaBase" runat="server"></asp:Label>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource18" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [NomeArtigo], [Detalhe], idArtigo FROM [Artigo] where idCategoria=2">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td ID="TDIngrd" runat="server" align="left" class="style18" 
                        style="font-weight: bold">
                        <br />
                        » Quais os ingredientes que pretende adicionar?&nbsp;<br />
                        <asp:Label ID="LabelAtencao" runat="server" Font-Bold="False" ForeColor="Red" 
                            Text="Atenção: Apenas pode escolher até 6 ingredientes!" Visible="False"></asp:Label>
                        <br />
                        <asp:GridView ID="GridViewIngredientes" runat="server" 
                            AutoGenerateColumns="False" BorderColor="#FFFBD6" BorderStyle="None" 
                            DataSourceID="SqlDataSource22" Font-Bold="False" DataKeyNames="idartigo" 
                            Width="334px">
                            <Columns>
                                <asp:TemplateField HeaderText="idartigo" InsertVisible="False" 
                                    SortExpression="idartigo" Visible="False">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("idartigo") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("idartigo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox1" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField SortExpression="NomeArtigo" HeaderText="Ingrediente">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NomeArtigo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("NomeArtigo") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <EditItemTemplate>
                                        <asp:CheckBox ID="CheckBox2" runat="server" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox2" runat="server"  Text="Extra"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource22" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            
                            SelectCommand="SELECT NomeArtigo, idartigo FROM Artigo  where Tipo='Ingrediente'  and NomeArtigo not like 'Extra%'">
                        </asp:SqlDataSource>
                        <br />
                        » Indique o queijo que pretende<asp:RadioButtonList ID="RadioButtonListQueijo" 
                            runat="server" DataSourceID="SqlDataSource28" DataTextField="NomeArtigo" 
                            DataValueField="idArtigo" Font-Bold="False">
                        </asp:RadioButtonList>
                        <asp:SqlDataSource ID="SqlDataSource28" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT idArtigo, NomeArtigo FROM Artigo WHERE (Tipo = 'Queijo')">
                        </asp:SqlDataSource>
                        <br />
                        » Indique o molho que pretende<asp:RadioButtonList ID="RadioButtonListMolho" 
                            runat="server" DataSourceID="SqlDataSource29" DataTextField="NomeArtigo" 
                            DataValueField="idArtigo" Font-Bold="False">
                        </asp:RadioButtonList>
                        <asp:SqlDataSource ID="SqlDataSource29" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT idArtigo, NomeArtigo FROM Artigo WHERE (Tipo = 'Molho')">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td ID="TDExtraQ" runat="server" align="left" class="style18" 
                        style="font-weight: bold">
                        <br />
                        » Pretende extra queijo?<br />
                        <asp:CheckBox ID="CheckBoxQ" runat="server" Font-Bold="False" 
                            OnCheckedChanged="CheckBoxQ_CheckedChanged" Text="Sim" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td ID="TDExtraM" runat="server" align="left" class="style18" 
                        style="font-weight: bold">
                        <br />
                        » Pretende extra molho?<br />
                        <asp:CheckBox ID="CheckBoxM" runat="server" Font-Bold="False" 
                            OnCheckedChanged="CheckBoxM_CheckedChanged" Text="Sim" />
                        <br />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td ID="TDListTamanho" runat="server" align="left" class="style18" 
                        style="font-weight: bold">
                        » Indique o tamanho que pretende<asp:RadioButtonList 
                            ID="RadioButtonListTamanho" runat="server" DataSourceID="SqlDataSource19" 
                            DataTextField="NomeTamanho" DataValueField="idTamanho" Font-Bold="False">
                        </asp:RadioButtonList>
                        <asp:SqlDataSource ID="SqlDataSource19" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [NomeTamanho], idTamanho FROM [Tamanho] where [NomeTamanho] &lt;&gt; 'Nenhum' ">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td ID="TDQuestMassa" runat="server" align="left" class="style18" 
                        style="font-weight: bold">
                        <br />
                        » Indique a massa que pretende<br />
                    </td>
                </tr>
                <tr>
                    <td align="center" class="style18">
                        <table style="width:100%;">
                            <tr>
                                <td ID="TDListMassa" runat="server" align="left" class="style24">
                                    <asp:RadioButtonList ID="RadioButtonListMassa" runat="server" 
                                        DataSourceID="SqlDataSource20" DataTextField="NomeMassa" 
                                        DataValueField="idMassa">
                                    </asp:RadioButtonList>
                                    <asp:SqlDataSource ID="SqlDataSource20" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                        SelectCommand="SELECT [NomeMassa], [idMassa] FROM [Massa]">
                                    </asp:SqlDataSource>
                                </td>
                                <td runat="server" align="left">
                                    <asp:Panel ID="Panel2" runat="server" BorderStyle="Ridge" Height="123px" 
                                        ScrollBars="Auto">
                                        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource33" 
                                            GroupItemCount="3">
                                            <EmptyDataTemplate>
                                                <table runat="server" 
                                                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                                                    <tr>
                                                        <td>
                                                            No data was returned.</td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                                            <EmptyItemTemplate>
                                                <td runat="server" />
                                            </EmptyItemTemplate>
                                            <GroupTemplate>
                                                <tr ID="itemPlaceholderContainer" runat="server">
                                                    <td ID="itemPlaceholder" runat="server">
                                                    </td>
                                                </tr>
                                            </GroupTemplate>
                                            <ItemTemplate>
                                                <td runat="server" style="background-color: #FFFBD6;color: #333333;">
                                                    <asp:Label ID="NomeMassaLabel" runat="server" Text='<%# Eval("NomeMassa") %>' />
                                                    <br />
                                                    <asp:Image ID="ImagemLabel0" runat="server" 
                                                        imageurl='<%#"~/Imagem_Artigo/"+ Eval("Imagem") %>' />
                                                    <br />
                                                </td>
                                            </ItemTemplate>
                                            <LayoutTemplate>
                                                <table runat="server">
                                                    <tr runat="server">
                                                        <td runat="server">
                                                            <table ID="groupPlaceholderContainer" runat="server" border="1" 
                                                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                                <tr ID="groupPlaceholder" runat="server">
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr runat="server">
                                                        <td runat="server" 
                                                            style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                                        </td>
                                                    </tr>
                                                </table>
                                            </LayoutTemplate>
                                        </asp:ListView>
                                    </asp:Panel>
                                    <asp:SqlDataSource ID="SqlDataSource33" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                        SelectCommand="SELECT [NomeMassa], [Imagem] FROM [Massa]">
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <br />
            <br />


            <br />
            <div align="center">
                <asp:ImageButton ID="ImageButtonAdicionarPizza" runat="server" 
                    ImageUrl="~/Images/adicionaritem.png" 
                    onclick="ImageButtonAdicionarPizza_Click" />
            </div>
            <br />


    </asp:Panel>

        
        <br />
     

        <asp:Panel ID="description_HeaderPanel" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="Description_ToggleImage" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp; Escolha para 
            acompanhar a sua pizza »</div>
    </asp:Panel>

        <asp:Panel id="description_ContentPanel" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="638px">
        <br />
        <br />
            <table style="width: 100%; height: 267px;">
                <tr>
                    <td ID="tdItens2" runat="server" align="center" class="style21" width="90px">
                        <asp:SqlDataSource ID="SqlDataSource34" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT idArtigo, NomeArtigo, Imagem, Detalhe, Volume, Preco FROM Artigo WHERE (idCategoria &lt;&gt; 2)">
                        </asp:SqlDataSource>
                        <asp:Panel ID="Panel3" runat="server" BorderStyle="Ridge" Height="470px" 
                            ScrollBars="Auto" Width="666px">
                            <asp:GridView ID="GridViewUnidades" runat="server" AutoGenerateColumns="False" 
                                DataKeyNames="idArtigo" DataSourceID="SqlDataSource34">
                                <Columns>
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" runat="server" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox6" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="idArtigo" InsertVisible="False" 
                                        SortExpression="idArtigo" Visible="False">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("idArtigo") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("idArtigo") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="NomeArtigo" HeaderText="Produto" 
                                        SortExpression="NomeArtigo" />
                                    <asp:TemplateField HeaderText="Imagem" SortExpression="Imagem">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Imagem") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="imagemLabel" runat="server" 
                                                ImageUrl='<%# "Imagem_Artigo/" + Eval("Imagem") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Detalhe" HeaderText="Detalhes" 
                                        SortExpression="Detalhe" />
                                    <asp:BoundField DataField="Volume" HeaderText="Volume" 
                                        SortExpression="Volume" />
                                    <asp:TemplateField HeaderText="Preço" SortExpression="Preco">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Preco") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="PrecoLabel" runat="server" 
                                                Text='<%# string.Format("{0:c2}",Eval("Preco")) %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quantidade">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="DropDownList1" runat="server">
                                                <asp:ListItem>1</asp:ListItem>
                                                <asp:ListItem>2</asp:ListItem>
                                                <asp:ListItem>3</asp:ListItem>
                                                <asp:ListItem>4</asp:ListItem>
                                                <asp:ListItem>5</asp:ListItem>
                                                <asp:ListItem>6</asp:ListItem>
                                                <asp:ListItem>7</asp:ListItem>
                                                <asp:ListItem>8</asp:ListItem>
                                                <asp:ListItem>9</asp:ListItem>
                                                <asp:ListItem>10</asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                    </td>
                 
                       

                </tr>
            </table>
              <br />
                         <br />
                  

            <div align="center">
                <asp:ImageButton ID="ImageButtonAdicionarProduto" runat="server" 
                    ImageUrl="~/Images/adicionaritem.png" 
                    onclick="ImageButtonAdicionarProduto_Click" />
            </div>
                  

            <br />
                  

    </asp:Panel>
    <br />


       <asp:Panel ID="PanelMenu" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButton1" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;Se preferir escolha 
            um menu »</div>
    </asp:Panel>

        <asp:Panel id="PanelMenuContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="445px">
            <table bgcolor="#FFFBD6" style="width:100%; height: 304px;">
                <tr>
                    <td class="style16">
                        <asp:DropDownList ID="DropDownListMenu" runat="server" 
                            AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource27" 
                            DataTextField="NomeMenu" DataValueField="idMenu" 
                            OnSelectedIndexChanged="DropDownListMenu_SelectedIndexChanged">
                            <asp:ListItem>-</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                        <asp:Label ID="LabelDetalhesMenu" runat="server" Font-Bold="True" 
                            Font-Underline="False" Text="Detalhes:"></asp:Label>
                        <br />
                        <asp:Label ID="LabelDetalhesMenuList" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="LabelPrecoMenuList" runat="server"></asp:Label>
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource27" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [NomeMenu], [Preco], [Detalhe], [idMenu] FROM [Menu]">
                        </asp:SqlDataSource>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td ID="TDDefinicoesMenu" runat="server" class="style20">
                        <table style="width: 100%; height: 183px;">
                            <tr>
                                <td align="left" bgcolor="Maroon" class="style21">
                                    <asp:Repeater ID="RepeaterMenu" runat="server" DataSourceID="SqlDataSource3" 
                                        OnItemCommand="RepeaterMenu_ItemCommand">
                                        <ItemTemplate>
                                            <asp:Button ID="Button1" runat="server" BackColor="Maroon" BorderStyle="None" 
                                                CommandArgument='<%# Eval("idCategoria") %>' Font-Underline="False" 
                                                ForeColor="#FBD7A9" Text='<%# Eval("NomeCategoria")%>' />
                                            <br />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <br />
                                </td>
                                <td align="center" class="style23">
                                    <asp:Label ID="labelauxMenu" runat="server" Font-Bold="True" 
                                        Font-Underline="False" Text="Categoria: "></asp:Label>
                                    <asp:Label ID="labelcatMenu" runat="server" Font-Bold="True" 
                                        Font-Underline="False"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:DropDownList ID="DropDownListArtigosMenu" runat="server" 
                                        AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource4" 
                                        DataTextField="NomeArtigo" DataValueField="idArtigo" 
                                        OnSelectedIndexChanged="DropDownListArtigosMenu_SelectedIndexChanged">
                                        <asp:ListItem>-</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                    <div ID="divitensAMostrarMenu" runat="server">
                                        <asp:Image ID="ImageDetMenu" runat="server" />
                                        <br />
                                        <br />
                                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                            SelectCommand="SELECT [Imagem], [Detalhe], [NomeArtigo], idArtigo FROM [Artigo] WHERE ([idCategoria] = @idCategoria)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="idCategoria" SessionField="catMenuID" 
                                                    Type="Int64" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Underline="False" 
                                            Text="Detalhes:"></asp:Label>
                                        <br />
                                        <asp:Label ID="LabelDetMenu" runat="server"></asp:Label>
                                        <br />
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT         Categoria.idCategoria,Categoria.NomeCategoria
FROM            MenuCategoria INNER JOIN
                         Categoria ON Categoria.idCategoria = MenuCategoria.idCategoria INNER JOIN
                         Menu ON Menu.idMenu = MenuCategoria.idMenu
WHERE        (MenuCategoria.idMenu = @idmenu)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="DropDownListMenu" Name="idmenu" 
                                                    PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <br />
                                        <div align="center">
                                            <asp:ImageButton ID="ImageButtonAdicionarMenu" runat="server" 
                                                ImageUrl="~/Images/adicionaritem.png" 
                                                OnClick="ImageButtonAdicionarMenu_Click" />
                                            &nbsp;</div>
                                    </div>
                                </td>
                                <td bgcolor="Maroon">
                                    <div ID="divListAddMenu" runat="server" align="center">
                                        <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="#FBD7A9" 
                                            Text="Adicionou ao seu menu:"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:ListBox ID="ListBox1Menu" runat="server">
                                            <asp:ListItem>(none)</asp:ListItem>
                                        </asp:ListBox>
                                        <asp:ListBox ID="ListBoxIdItens" runat="server" Visible="False" Width="16px">
                                        </asp:ListBox>
                                        <br />
                                        <br />
                                        <asp:ImageButton ID="ImageButtonRemoverMenu" runat="server" 
                                            ImageUrl="~/Images/removeitem.png" OnClick="ImageButtonRemoverMenu_Click" />
                                        <asp:ImageButton ID="ImageButtonTerminarMenu" runat="server" 
                                            ImageUrl="~/Images/concluirmenu.png" OnClick="ImageButtonTerminarMenu_Click" />
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
    </asp:Panel>
    <br />


      <ajaxToolkit:CollapsiblePanelExtender ID="cpeDesc" runat="Server"
        TargetControlID="description_ContentPanel"
        ExpandControlID="description_HeaderPanel"
        CollapseControlID="description_HeaderPanel"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="description_ToggleImage" /> 



         <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderLista" runat="Server"
        TargetControlID="PanelListaContent"
        ExpandControlID="PanelLista"
        CollapseControlID="PanelLista"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="ImageButtonLista" /> 

         <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server"
        TargetControlID="PanelMenuContent"
        ExpandControlID="PanelMenu"
        CollapseControlID="PanelMenu"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="ImageButtonLista" /> 


                                        <br />

                                        </asp:Content>

