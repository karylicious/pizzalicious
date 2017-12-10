<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="gerirmenu.aspx.cs" Inherits="gerirmenu" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">



 <ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager1" />
   
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT * FROM [Menu]" 
        DeleteCommand="DELETE FROM [Menu] WHERE [idMenu] = @idMenu" 
        InsertCommand="INSERT INTO [Menu] ([NomeMenu], [Preco], [Detalhe], [idCategoria], [Imagem], [idTamanho], [idMassa]) VALUES (@NomeMenu, @Preco, @Detalhe, @idCategoria, @Imagem, @idTamanho, @idMassa)" 
        UpdateCommand="UPDATE [Menu] SET [NomeMenu] = @NomeMenu, [Preco] = @Preco, [Detalhe] = @Detalhe, [idCategoria] = @idCategoria, [Imagem] = @Imagem, [idTamanho] = @idTamanho, [idMassa] = @idMassa WHERE [idMenu] = @idMenu">
          <DeleteParameters>
              <asp:Parameter Name="idMenu" Type="Int64" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="NomeMenu" Type="String" />
              <asp:Parameter Name="Preco" Type="Decimal" />
              <asp:Parameter Name="Detalhe" Type="String" />
              <asp:Parameter Name="idCategoria" Type="Int64" />
              <asp:Parameter Name="Imagem" Type="String" />
              <asp:Parameter Name="idTamanho" Type="Int64" />
              <asp:Parameter Name="idMassa" Type="Int64" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="NomeMenu" Type="String" />
              <asp:Parameter Name="Preco" Type="Decimal" />
              <asp:Parameter Name="Detalhe" Type="String" />
              <asp:Parameter Name="idCategoria" Type="Int64" />
              <asp:Parameter Name="Imagem" Type="String" />
              <asp:Parameter Name="idTamanho" Type="Int64" />
              <asp:Parameter Name="idMassa" Type="Int64" />
              <asp:Parameter Name="idMenu" Type="Int64" />
          </UpdateParameters>
    </asp:SqlDataSource>
       <div align="center">
           <asp:LinkButton ID="LinkButton3" runat="server" Font-Underline="True" 
               PostBackUrl="~/gestao.aspx">Voltar para Administração</asp:LinkButton>
    </div>
       <br />

        <asp:Panel ID="PanelLista" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButtonLista" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;
           Lista de Menus         
        </div>
    </asp:Panel>

        <asp:Panel id="PanelListaContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="262px">
	    <table style="width: 100%; height: 282px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                
            <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto" Width="638px" 
                Height="243px">
           
             <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource2" Width="454px" DataKeyNames="idMenu" 
                    BackColor="#E3C7AA" Height="224px">
                 <Columns>
                     <asp:TemplateField ShowHeader="False">
                         <ItemTemplate>
                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                 CommandName="Edit" Text="Editar"></asp:LinkButton>
                             &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                 CommandName="Delete" Text="Eliminar"></asp:LinkButton>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                 CommandName="Update" Text="Actualizar"></asp:LinkButton>
                             &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                 CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                         </EditItemTemplate>
                     </asp:TemplateField>
                     <asp:BoundField DataField="idMenu" HeaderText="Id" InsertVisible="False" 
                         ReadOnly="True" SortExpression="idMenu" />
                     <asp:BoundField DataField="NomeMenu" HeaderText="Nome" 
                         SortExpression="NomeMenu" />
                     <asp:TemplateField HeaderText="Preço" SortExpression="Preco">
                         <ItemTemplate>
                             <asp:Label ID="Label2" runat="server" Text='<%# string.Format("{0:c2}",Eval("Preco"))  %>'></asp:Label>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Preco") %>'></asp:TextBox>
                         </EditItemTemplate>
                     </asp:TemplateField>
                     <asp:BoundField DataField="Detalhe" HeaderText="Detalhes" 
                         SortExpression="Detalhe" />
                     <asp:BoundField DataField="idCategoria" HeaderText="Id da Categoria correspondente" 
                         SortExpression="idCategoria" ReadOnly="True" />
                     <asp:TemplateField HeaderText="Imagem" SortExpression="Imagem">
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%# "Imagem_Artigo/" + Eval("Imagem")  %>'></asp:Label>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Imagem") %>'></asp:TextBox>
                         </EditItemTemplate>
                     </asp:TemplateField>
                 </Columns>
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
     

        <asp:Panel ID="description_HeaderPanel" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="Description_ToggleImage" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;
           Inserir novo Menu         
        </div>
    </asp:Panel>

        <asp:Panel id="description_ContentPanel" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="706px">
        <br />
	    <table style="width: 100%; height: 509px;">
            <tr>
                <td class="style17">
                    </td>
                <td class="style17">
                    <table style="width:100%; height: 197px;">
                        <tr>
                            <td class="style13">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style14">
                                Imagem
                                <asp:FileUpload ID="FileUpload1" runat="server" Height="19px" Width="212px" />
                            </td>
                            <td class="style15">
                                <asp:Label ID="Label7" runat="server" ForeColor="Red" 
                                    Text="É obrigatório visualizar uma imagem importada!"></asp:Label>
                                <asp:Panel ID="Panel1" runat="server" BorderStyle="Inset" Height="108px" 
                                    Width="143px">
                                    <asp:Image ID="ImageMenu" runat="server" Height="111px" 
                                        ImageUrl="~/Images/noimage.jpg" Width="144px" />
                                </asp:Panel>
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:ImageButton ID="ImageButtonVerImage" runat="server" 
                                    ImageUrl="~/Images/visualz.png" onclick="ImageButtonVerImage_Click" />
                            </td>
                            <td class="style15">
                                </td>
                        </tr>
                        <tr>
                            <td class="style13">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    &nbsp;
                    <br />
                    &nbsp;&nbsp; Nome
                    <asp:TextBox ID="TextBoxNome" runat="server" ValidationGroup="New" 
                        Width="282px"></asp:TextBox>
              
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBoxNome" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="New"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <br />
                    Detalhes
                    <asp:TextBox ID="TextBoxDetalhe" runat="server" Height="63px" 
                        TextMode="MultiLine" ValidationGroup="New" Width="283px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBoxDetalhe" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="New"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    &nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp; Preço
                    <asp:TextBox ID="TextBoxPreco" runat="server" ValidationGroup="New"></asp:TextBox>
                    &nbsp;€&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBoxPreco" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="New"></asp:RequiredFieldValidator>
                    &nbsp;<ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                        runat="server" FilterType="Numbers, Custom" TargetControlID="TextBoxPreco" 
                        ValidChars=",." />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="TextBoxPreco" ErrorMessage="Preço inválido!" ForeColor="Red" 
                        ValidationExpression="^\$?[0-9]+(.[0-9]{3})*(\,[0-9]{2})?$" 
                        ValidationGroup="New"></asp:RegularExpressionValidator>
                    &nbsp;<br />
                    <br />
                    <br />
                    <br />
                    Categoria:
                    <asp:Label ID="Label8" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    <br />
                    <asp:CheckBoxList ID="CheckBoxListCat" runat="server" 
                        DataSourceID="SqlDataSource3" DataTextField="NomeCategoria" 
                        DataValueField="idCategoria">
                    </asp:CheckBoxList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        
                        SelectCommand="SELECT [NomeCategoria], idCategoria FROM [Categoria] where nomeCategoria &lt;&gt;'O seu Pedido' and nomeCategoria &lt;&gt;'Menus'">
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                   <div align="center">
                    <asp:Panel ID="Panel3" runat="server" DefaultButton="ImageButtonInserir">
                        <asp:ImageButton ID="ImageButtonInserir" runat="server" 
                            ImageUrl="~/Images/inseriir.png" onclick="ImageButtonInserir_Click" 
                            ValidationGroup="New" />
                    </asp:Panel>
                    </div>
                    <br />
         
                </td>
                <td class="style17">
                    </td>
            </tr>
        </table>
        <br />
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














</asp:Content>

