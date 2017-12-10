<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="gerirprod.aspx.cs" Inherits="gerirprod" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style15
        {
            height: 153px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">


  <ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager1" />
   
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            
            SelectCommand="SELECT [idArtigo], [NomeArtigo], [Imagem], [Detalhe], [Volume], [Preco], [DataCriacao], [Tipo] FROM [Artigo]" 
            OldValuesParameterFormatString="original_{0}" 
        DeleteCommand="DELETE FROM [Artigo] WHERE [idArtigo] = @original_idArtigo" 
        InsertCommand="INSERT INTO [Artigo] ([NomeArtigo], [Imagem], [Detalhe], [Volume], [Preco], [DataCriacao], [Tipo]) VALUES (@NomeArtigo, @Imagem, @Detalhe, @Volume, @Preco, @DataCriacao, @Tipo)" 
        UpdateCommand="UPDATE [Artigo] SET [NomeArtigo] = @NomeArtigo, [Imagem] = @Imagem, [Detalhe] = @Detalhe, [Volume] = @Volume, [Preco] = @Preco, [DataCriacao] = @DataCriacao, [Tipo] = @Tipo WHERE [idArtigo] = @original_idArtigo">
            <DeleteParameters>
                <asp:Parameter Name="original_idArtigo" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NomeArtigo" Type="String" />
                <asp:Parameter Name="Imagem" Type="String" />
                <asp:Parameter Name="Detalhe" Type="String" />
                <asp:Parameter Name="Volume" Type="String" />
                <asp:Parameter Name="Preco" Type="Decimal" />
                <asp:Parameter Name="DataCriacao" Type="DateTime" />
                <asp:Parameter Name="Tipo" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NomeArtigo" Type="String" />
                <asp:Parameter Name="Imagem" Type="String" />
                <asp:Parameter Name="Detalhe" Type="String" />
                <asp:Parameter Name="Volume" Type="String" />
                <asp:Parameter Name="Preco" Type="Decimal" />
                <asp:Parameter Name="DataCriacao" Type="DateTime" />
                <asp:Parameter Name="Tipo" Type="String" />
                <asp:Parameter Name="original_idArtigo" Type="Int64" />
            </UpdateParameters>
        </asp:SqlDataSource>
       <div align="center">
           <asp:LinkButton ID="LinkButton11" runat="server" Font-Underline="True" 
               PostBackUrl="~/gestao.aspx">Voltar para Administração</asp:LinkButton>
    </div>
       <br />

        <asp:Panel ID="PanelLista" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButtonLista" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;
           Lista de Produtos        
        </div>
    </asp:Panel>

        <asp:Panel id="PanelListaContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="349px">
        <br />
            <table style="width: 100%; height: 339px;">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td align="center">
                        <div align="center">
                            <asp:Panel ID="Panel1" runat="server" Height="300px" ScrollBars="Auto" 
                                Width="662px">
                                
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                                    BackColor="#D3A77A" DataKeyNames="idArtigo" DataSourceID="SqlDataSource2" 
                                    Height="346px" Width="663px">
                                    <Columns>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton9" runat="server" CausesValidation="False" 
                                                    CommandName="Edit" Text="Editar"></asp:LinkButton>
                                                &nbsp;<asp:LinkButton ID="LinkButton10" runat="server" CausesValidation="False" 
                                                    CommandName="Delete" 
                                                    OnClientClick="return confirm ('Tem a certeza que pretende removê-lo?');" 
                                                    Text="Eliminar"></asp:LinkButton>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="True" 
                                                    CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                                &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" 
                                                    CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="idArtigo" HeaderText="Id" InsertVisible="False" 
                                            ReadOnly="True" SortExpression="idArtigo" />
                                        <asp:BoundField DataField="NomeArtigo" HeaderText="Nome" 
                                            SortExpression="NomeArtigo" />
                                        <asp:TemplateField HeaderText="Imagem">
                                            <ItemTemplate>
                                                <asp:Image ID="Image1" runat="server" 
                                                    ImageUrl='<%# "Imagem_Artigo/" +  Eval("Imagem") %>' />
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Eval("Imagem") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="Detalhe" HeaderText="Detalhes" 
                                            SortExpression="Detalhe" />
                                        <asp:BoundField DataField="Volume" HeaderText="Volume" 
                                            SortExpression="Volume" />
                                        <asp:TemplateField HeaderText="Preço" SortExpression="Preco">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" 
                                                    Text='<%# string.Format("{0:c2}",Eval("Preco"))  %>'></asp:Label>
                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Preco") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="DataCriacao" HeaderText="Data de Criação" 
                                            ReadOnly="True" SortExpression="DataCriacao" />
                                        <asp:BoundField DataField="Tipo" HeaderText="Tipo" ReadOnly="True" 
                                            SortExpression="Tipo" />
                                    </Columns>
                                </asp:GridView>
                                
                            </asp:Panel>
                        </div>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
    </asp:Panel>

        
        <br />
        

        <asp:Panel ID="description_HeaderPanel" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="Description_ToggleImage" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp; Inserir novo 
            Produto         
        </div>
    </asp:Panel>

        <asp:Panel id="description_ContentPanel" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="1471px">
	       <ajaxToolkit:Accordion ID="MyAccordion" runat="server" AutoSize="None" 
               ContentCssClass="accordionContent" FadeTransitions="true" FramesPerSecond="40" 
               HeaderCssClass="accordionHeader" 
               HeaderSelectedCssClass="accordionHeaderSelected" RequireOpenedPane="false"  
                                    SuppressHeaderPostbacks="true" 
                TransitionDuration="250" Width="682px" 
                                    Height="1441px" style="margin-right: 0px" >
               <Panes>
                   <ajaxToolkit:AccordionPane ID="AccordionPane0" runat="server">
                       <Header>
                           <asp:Label ID="LabelPizza" runat="server" Text="Inserir Pizza" ForeColor="White" Font-Bold="true"></asp:Label>
                       </Header>
                       <Content>
                           <table style="width: 100%;">
                               <tr>
                                  
                                   <td align="center">

                                      <asp:Label ID="Label6" runat="server" ForeColor="Red" 
                                    Text="É obrigatório importar e visualizar uma imagem!"></asp:Label>
<asp:Panel ID="Panel2" runat="server" BorderStyle="Inset" Height="108px" 
                                    Width="143px">
<asp:Image ID="ImagePizza" runat="server" Height="111px" 
                                        ImageUrl="~/Images/noimage.jpg" Width="144px" />
                                </asp:Panel>

                                   </td>
                               </tr>
                               <tr>
                                   
                                   <td align="center">
                                       &nbsp;&nbsp;&nbsp;Importar&nbsp;&nbsp;<asp:FileUpload ID="FileUploadPizza" runat="server" 
                                    Height="19px" Width="212px" />
                                   
                                      &nbsp;&nbsp;<asp:ImageButton ID="ImageButtonVerImagePizza" runat="server" 
                                    ImageUrl="~/Images/visualz.png" onclick="ImageButtonVerImagePizza_Click" />&nbsp;<asp:Label
                                        ID="Label2" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                   </td>
                               </tr>
                              
                           </table>

                                    
                                <br />
                              


                                    <div align="left">
                                    <br />


                                    &nbsp;&nbsp;&nbsp;Nome
                    <asp:TextBox ID="TextBoxNomePizza" runat="server" ValidationGroup="NewPizza" 
                        Width="282px"></asp:TextBox> &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="TextBoxNomePizza" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="NewPizza"></asp:RequiredFieldValidator>
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" 
                        runat="server" FilterType="LowercaseLetters, Custom, UppercaseLetters" 
                        TargetControlID="TextBoxNomePizza" />

                         <br />
                                <br />
                    Detalhes
                    <asp:TextBox ID="TextBoxDetalhePizza" runat="server" Height="63px" 
                        TextMode="MultiLine" ValidationGroup="NewProd" Width="283px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="TextBoxDetalhePizza" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="NewPizza"></asp:RequiredFieldValidator>
                   

                   
                    <br /> <br />

                                         Indique os Ingredientes: &nbsp;<asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                       <br />
                                        <asp:CheckBoxList ID="CheckBoxList2" runat="server" 
                                            DataSourceID="SqlDataSource6" DataTextField="NomeArtigo" 
                                            DataValueField="idArtigo">
                                        </asp:CheckBoxList>
                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                            SelectCommand="SELECT idArtigo, NomeArtigo FROM Artigo WHERE (Tipo = 'Ingrediente') order by NomeArtigo Asc">
                                        </asp:SqlDataSource>
                                       </div>

                         <div align="center">
                                    <asp:ImageButton ID="ImageButtonInserirPizza" runat="server" 
                                        ImageUrl="~/Images/inseriir.png" onclick="ImageButtonInserirPizza_Click" 
                                        ValidationGroup="NewPizza" />
                              
                               </div>
                       </Content>
                   </ajaxToolkit:AccordionPane>
                              
                   <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server">
                       <Header>
                            <asp:Label ID="LabelIngrd" runat="server" Text="Inserir Ingrediente" ForeColor="White" Font-Bold="true"></asp:Label>
                       </Header>
                       <Content>
                                 <br />
                                   Nome
                    <asp:TextBox ID="TextBoxNomeIngrediente" runat="server" ValidationGroup="NewIngrd" 
                        Width="282px"></asp:TextBox>
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" 
                        runat="server" FilterType="LowercaseLetters, Custom, UppercaseLetters" 
                        TargetControlID="TextBoxNomeIngrediente" />
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="TextBoxNomeIngrediente" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="NewIngrd"></asp:RequiredFieldValidator>
                    <br />
                    <br />                                

                      Preço
                    <asp:TextBox ID="TextBoxPrecoIngred" runat="server" ValidationGroup="NewIngrd"></asp:TextBox>
                    &nbsp;€ &nbsp;<ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                        runat="server" FilterType="Numbers, Custom" TargetControlID="TextBoxPrecoIngred" ValidChars=",." />

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        ControlToValidate="TextBoxPrecoIngred" ErrorMessage="Preço inválido!" ForeColor="Red" 
                        ValidationExpression="^\$?[0-9]+(.[0-9]{3})*(\,[0-9]{2})?$" 
                        ValidationGroup="NewIngrd"></asp:RegularExpressionValidator>
                    <br />
                    <br />


                     Tipo de Ingrediente:
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="RadioButtonListTipoIngred" ErrorMessage="*" ForeColor="Red" 
                                    ValidationGroup="NewProd"></asp:RequiredFieldValidator>
                                <br />
                                <asp:RadioButtonList ID="RadioButtonListTipoIngred" runat="server" 
                                    ValidationGroup="NewIngrd">
                                    <asp:ListItem>Molho</asp:ListItem>
                                    <asp:ListItem>Queijo</asp:ListItem>
                                    <asp:ListItem>Outro</asp:ListItem>
                                </asp:RadioButtonList>

                                <div align="center">

                                    <asp:ImageButton ID="ImageButtonInserirIngred" runat="server" 
                                        ImageUrl="~/Images/inseriir.png" onclick="ImageButtonInserirIngred_Click" 
                                        ValidationGroup="NewIngrd" />
                               </div>

                       </Content>
                   </ajaxToolkit:AccordionPane>

                   <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server">
                       <Header>
                            <asp:Label ID="LabelProd" runat="server" Text="Inserir Produto" ForeColor="White" Font-Bold="true"></asp:Label>
                       </Header>
                       <Content>



                             <table style="width: 100%;">
                               <tr>
                                  
                                   <td align="center">

                                      <asp:Label ID="Label1" runat="server" ForeColor="Red" 
                                    Text="É obrigatório importar e visualizar uma imagem!"></asp:Label>
<asp:Panel ID="Panel3" runat="server" BorderStyle="Inset" Height="108px" 
                                    Width="143px">
<asp:Image ID="ImageProd" runat="server" Height="111px" 
                                        ImageUrl="~/Images/noimage.jpg" Width="144px" />
                                </asp:Panel>

                                   </td>
                               </tr>
                               <tr>
                                   
                                   <td align="center">
                                       &nbsp;&nbsp;&nbsp;Importar&nbsp;&nbsp;<asp:FileUpload ID="FileUploadProd" runat="server" 
                                    Height="19px" Width="212px" />
                                   
                                      &nbsp;&nbsp;<asp:ImageButton ID="ImageButtonVerImageProd" runat="server" 
                                    ImageUrl="~/Images/visualz.png" onclick="ImageButtonVerImageProd_Click" />&nbsp;<asp:Label
                                        ID="Label4" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                   </td>
                               </tr>
                              
                           </table>

                                    
                                <br />
                                    <br />
                                  
                                 Nome
                    &nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBoxNomeProd" runat="server" ValidationGroup="NewProd" 
                        Width="282px"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBoxNomeProd" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="NewProd"></asp:RequiredFieldValidator>
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" 
                        runat="server" FilterType="LowercaseLetters, Custom, UppercaseLetters" 
                        TargetControlID="TextBoxNomeProd" />
                   
                    <br />
                    <br />                                

                      Preço
                   &nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBoxPrecoProd" runat="server" ValidationGroup="NewProd"></asp:TextBox>
                    &nbsp;€ &nbsp;<ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender8" 
                        runat="server" FilterType="Numbers, Custom" TargetControlID="TextBoxPrecoProd" ValidChars=",." />

                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="TextBoxPrecoProd" ErrorMessage="Preço inválido!" ForeColor="Red" 
                        ValidationExpression="^\$?[0-9]+(.[0-9]{3})*(\,[0-9]{2})?$" 
                        ValidationGroup="NewProd"></asp:RegularExpressionValidator>
                    &nbsp;<br />
                    <br />


                          <br />
                    Detalhes
                    <asp:TextBox ID="TextBoxDetalheProd" runat="server" Height="63px" 
                        TextMode="MultiLine" ValidationGroup="NewProd" Width="283px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TextBoxDetalheProd" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="NewProd"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <br />
                    <br />
                    &nbsp; Volume

                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" 
                        runat="server" FilterType="Numbers, Custom, LowercaseLetters" TargetControlID="TextBoxVolume" ValidChars="," />

               
               
               
               
                <asp:TextBox ID="TextBoxVolume" runat="server"></asp:TextBox>
                    <br />
                     <br />
                            &nbsp;&nbsp;Categoria:
                            
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="RadioButtonListCat" ErrorMessage="*" ForeColor="Red" 
                                    ValidationGroup="NewProd"></asp:RequiredFieldValidator>
                                <br />

                                <asp:RadioButtonList ID="RadioButtonListCat" runat="server" 
                                    DataSourceID="SqlDataSource3" DataTextField="NomeCategoria" 
                                    DataValueField="NomeCategoria" ValidationGroup="NewProd">
                                </asp:RadioButtonList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT [NomeCategoria] FROM [Categoria] where nomeCategoria &lt;&gt;'O seu Pedido' and nomeCategoria &lt;&gt;'Menus'">
                                </asp:SqlDataSource>
                                 <div align="center">

                                    <asp:ImageButton ID="ImageButtonInserirProd" runat="server" 
                                        ImageUrl="~/Images/inseriir.png" onclick="ImageButtonInserirProd_Click" 
                                        ValidationGroup="NewProd" />
                               </div>
                            

                       </Content>
                   </ajaxToolkit:AccordionPane>

                  

               </Panes>
           </ajaxToolkit:Accordion>
        <br />
    </asp:Panel>
   
  <br />

        <asp:Panel ID="PanelGestao" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButton1" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;
           Gerir outros        
        </div>
    </asp:Panel>

        <asp:Panel id="PanelGestaoContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="1137px">
        <br />
            <table style="width: 100%; height: 339px;">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td align="left">
                    <div style="border-style: ridge" align="left">
                        &nbsp;
                        <br />
&nbsp;
                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Tamanho"></asp:Label>
                        <br />
                        &nbsp;<asp:Image ID="Image15" runat="server" Height="3px" 
                            ImageUrl="~/Images/line.png" Width="368px" />
                        <br />
                        <br />
                        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                            BackColor="#D3A77A" DataKeyNames="idTamanho" DataSourceID="SqlDataSource4" 
                            Width="314px">
                            <Columns>
                                <asp:TemplateField ShowHeader="False">
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="True" 
                                            CommandName="Update" Text="Update"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton6" runat="server" CausesValidation="False" 
                                            CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton7" runat="server" CausesValidation="False" 
                                            CommandName="Edit" Text="Edit"></asp:LinkButton>
                                        &nbsp;<asp:LinkButton ID="LinkButton8" runat="server" CausesValidation="False" 
                                            CommandName="Delete" Text="Delete"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="idTamanho" HeaderText="idTamanho" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="idTamanho" />
                                <asp:BoundField DataField="NomeTamanho" HeaderText="NomeTamanho" 
                                    SortExpression="NomeTamanho" />
                                <asp:TemplateField HeaderText="Preco" SortExpression="Preco">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Preco") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                          <asp:Label ID="PrecoLabel" runat="server" Text='<%# string.Format("{0:c2}",Eval("Preco")) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [Tamanho]"></asp:SqlDataSource>
                        <br />
                        Nome
                        <asp:TextBox ID="TextBoxNomeTamanho" runat="server" ValidationGroup="NewTam"></asp:TextBox>



                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" 
                        runat="server" FilterType="LowercaseLetters, Custom, UppercaseLetters" 
                        TargetControlID="TextBoxNomeTamanho" />
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBoxNomeTamanho" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="NewTam"></asp:RequiredFieldValidator>






                        <br />
                        <br />
                        Preço
                        <asp:TextBox ID="TextBoxPrecoTamanho" runat="server" ValidationGroup="NewTam"></asp:TextBox>
                        &nbsp;€&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                            runat="server" ControlToValidate="TextBoxPrecoTamanho" ErrorMessage="*" 
                            ForeColor="Red" ValidationGroup="NewTam"></asp:RequiredFieldValidator>
                        &nbsp;<ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" 
                            runat="server" FilterType="Numbers, Custom" 
                            TargetControlID="TextBoxPrecoTamanho" ValidChars=",." />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="TextBoxPrecoTamanho" ErrorMessage="Preço inválido!" 
                            ForeColor="Red" ValidationExpression="^\$?[0-9]+(.[0-9]{3})*(\,[0-9]{2})?$" 
                            ValidationGroup="NewTam"></asp:RegularExpressionValidator>
                        &nbsp;<br />
                        
                        
                        <br />
                        <br />
                        <br />
                        <div align="center">

                          <asp:ImageButton ID="ImageButtonInserirTamanho" runat="server" 
                                ImageUrl="~/Images/inseriir.png" onclick="ImageButtonInserirTamanho_Click" 
                                ValidationGroup="NewTam" />
                            
                        </div>
                            </div>
                            <br />
                        <br />
                        <div style="border-style: ridge">
                            <br />
                            <table style="width:100%;">
                                <tr>
                                    <td class="style15">
                                        <br />
                                        <asp:Label ID="Label11" runat="server" Font-Bold="True" Text="Massa"></asp:Label>
                                        <br />
                                        <asp:Image ID="Image16" runat="server" Height="3px" 
                                            ImageUrl="~/Images/line.png" Width="368px" />
                                        <br />
                                        <br />
                                        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                                            BackColor="#D3A77A" DataKeyNames="idMassa" DataSourceID="SqlDataSource5">
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
                                                <asp:BoundField DataField="idMassa" HeaderText="idMassa" InsertVisible="False" 
                                                    ReadOnly="True" SortExpression="idMassa" />
                                                <asp:BoundField DataField="NomeMassa" HeaderText="NomeMassa" 
                                                    SortExpression="NomeMassa" />
                                                <asp:TemplateField HeaderText="Imagem" SortExpression="Imagem">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Imagem") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Image ID="imagemLabel" runat="server"  ImageUrl='<%# "Imagem_Artigo/" + Eval("Imagem") %>'></asp:Image>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                            SelectCommand="SELECT * FROM [Massa]"></asp:SqlDataSource>  
                                        
                                        <br />
                                        <br />
                                        Nome
                                        <asp:TextBox ID="TextBoxNomeMassa" runat="server" ValidationGroup="NewMassa"></asp:TextBox>



                                        
                                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" 
                                            runat="server" FilterType="LowercaseLetters, Custom, UppercaseLetters" 
                                            TargetControlID="TextBoxNomeMassa" />
                                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="TextBoxNomeMassa" ErrorMessage="*" ForeColor="Red" 
                                            ValidationGroup="NewMassa"></asp:RequiredFieldValidator>





                                        <br />
                                        <br />
                                    </td>
                                    <td class="style15">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" class="style15">
                                        <br />
                                        <asp:Label ID="Label9" runat="server" ForeColor="Red" 
                                            Text="Se importar imagem terá que visualizá-la."></asp:Label>
                                        &nbsp;&nbsp;<br />&nbsp;
                                        <asp:Panel ID="Panel4" runat="server" BorderStyle="Inset" Height="108px" 
                                            Width="143px">
                                            <asp:Image ID="ImageMassa" runat="server" Height="111px" 
                                                ImageUrl="~/Images/noimage.jpg" Width="144px" />
                                        </asp:Panel>
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Importar
                                        <asp:FileUpload ID="FileUploadMassa" runat="server" Height="19px" 
                                            Width="212px" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:ImageButton ID="ImageButtonVerImageMassa" runat="server" 
                                            ImageUrl="~/Images/visualz.png" onclick="ImageButtonVerImageMassa_Click" />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                                        <div align="center">
                                            <asp:ImageButton ID="ImageButtonInserirMassa" runat="server" 
                                                ImageUrl="~/Images/inseriir.png" onclick="ImageButtonInserirMassa_Click" 
                                                ValidationGroup="NewMassa" />
                                        </div>
                                        <br />
                                    </td>
                                    <td class="style15">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                            <br />
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


         <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server"
        TargetControlID="PanelGestaoContent"
        ExpandControlID="PanelGestao"
        CollapseControlID="PanelGestao"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="ImageButtonLista" /> 



         </asp:Content>

