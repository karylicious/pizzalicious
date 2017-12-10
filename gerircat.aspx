<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="gerircat.aspx.cs" Inherits="gerircat" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style13
        {
            width: 360px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">




 <ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager1" />
   
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        DeleteCommand="DELETE FROM [Categoria] WHERE [idCategoria] = @idCategoria" 
        InsertCommand="INSERT INTO [Categoria] ([NomeCategoria], [DataCriacao]) VALUES (@NomeCategoria, @DataCriacao)" 
        SelectCommand="SELECT idCategoria, NomeCategoria, DataCriacao FROM Categoria WHERE (idCategoria &lt;&gt; 1) AND (idCategoria &lt;&gt; 2) AND (idCategoria &lt;&gt; 7)" 
        
        UpdateCommand="UPDATE [Categoria] SET [NomeCategoria] = @NomeCategoria, [DataCriacao] = @DataCriacao WHERE [idCategoria] = @idCategoria">
          <DeleteParameters>
              <asp:Parameter Name="idCategoria" Type="Int64" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="NomeCategoria" Type="String" />
              <asp:Parameter Name="DataCriacao" Type="DateTime" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="NomeCategoria" Type="String" />
              <asp:Parameter Name="DataCriacao" Type="DateTime" />
              <asp:Parameter Name="idCategoria" Type="Int64" />
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
           Lista de Categorias         
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
            DataSourceID="SqlDataSource2" Width="432px" DataKeyNames="idCategoria" 
                    BackColor="#E3C7AA" Height="224px">
                 <Columns>
                     <asp:TemplateField ShowHeader="False">
                         <EditItemTemplate>
                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                 CommandName="Update" Text="Actualizar"></asp:LinkButton>
                             &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                 CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                 CommandName="Edit" Text="Editar"></asp:LinkButton>
                             &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                 CommandName="Delete" Text="Eliminar"></asp:LinkButton>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:BoundField DataField="idCategoria" HeaderText="Id da Categoria" InsertVisible="False" 
                         ReadOnly="True" SortExpression="idCategoria" />
                     <asp:BoundField DataField="NomeCategoria" HeaderText="Nome da Categoria" 
                         SortExpression="NomeCategoria" />
                     <asp:BoundField DataField="DataCriacao" HeaderText="Data de Criação" 
                         SortExpression="DataCriacao" ReadOnly="True" />
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
     

        <asp:Panel ID="description_HeaderPanel" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="Description_ToggleImage" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;
           Inserir nova Categoria         
        </div>
    </asp:Panel>

        <asp:Panel id="description_ContentPanel" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="85px">
        <br />
	    <table style="width: 100%; height: 11px;">
            <tr>
                <td>
                </td>
                <td align="right" class="style13">
                    Nome
                    <asp:TextBox ID="TextBoxNome" runat="server" Width="202px"></asp:TextBox>
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" 
                        runat="server" FilterType="LowercaseLetters, Custom, UppercaseLetters" 
                        TargetControlID="TextBoxNome" />
                </td>
                <td align="left">
                    <asp:Panel ID="Panel1" runat="server" DefaultButton="ImageButtonInserir">
                    <asp:ImageButton ID="ImageButtonInserir" runat="server" 
                        ImageUrl="~/Images/inseriir.png" onclick="ImageButtonInserir_Click" />
                    </asp:Panel>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center" colspan="2">
                    <asp:Label ID="LabelAlerta" runat="server" ForeColor="Red" 
                        Text="Já existe uma categoria com esse nome! Por favor indique outro nome."></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
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

