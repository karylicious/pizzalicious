<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="gerirusers.aspx.cs" Inherits="gerirusers" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css">


.correct {
  color: Green;
  font-size: 0.8em;
  font-weight: bold;
}

.incorrect {
  color: Red;
  font-size: 0.8em;
  font-weight: bold;
}

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
  
     <ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager1" />
   
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
         ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
         DeleteCommand="DELETE FROM [Utilizador] WHERE [idUser] = @idUser" 
         InsertCommand="INSERT INTO [Utilizador] ([NomeUser], [Pass], [Morada], [Localidade], [Telemovel], [Telefone], [CodPostal], [Email], [CodVerificacao], [nPontos], [DataRegisto]) VALUES (@NomeUser, @Pass, @Morada, @Localidade, @Telemovel, @Telefone, @CodPostal, @Email, @CodVerificacao, @nPontos, @DataRegisto)" 
         SelectCommand="SELECT * FROM [Utilizador] where NomeUser&lt;&gt;'admin' ORDER BY [DataRegisto] DESC " 
         
         UpdateCommand="UPDATE [Utilizador] SET [NomeUser] = @NomeUser, [Pass] = @Pass, [Morada] = @Morada, [Localidade] = @Localidade, [Telemovel] = @Telemovel, [Telefone] = @Telefone, [CodPostal] = @CodPostal, [Email] = @Email, [CodVerificacao] = @CodVerificacao, [nPontos] = @nPontos, [DataRegisto] = @DataRegisto WHERE [idUser] = @idUser">
            <DeleteParameters>
                <asp:Parameter Name="idUser" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="NomeUser" Type="String" />
                <asp:Parameter Name="Pass" Type="String" />
                <asp:Parameter Name="Morada" Type="String" />
                <asp:Parameter Name="Localidade" Type="String" />
                <asp:Parameter Name="Telemovel" Type="String" />
                <asp:Parameter Name="Telefone" Type="String" />
                <asp:Parameter Name="CodPostal" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="CodVerificacao" Type="String" />
                <asp:Parameter Name="nPontos" Type="Int32" />
                <asp:Parameter Name="DataRegisto" Type="DateTime" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="NomeUser" Type="String" />
                <asp:Parameter Name="Pass" Type="String" />
                <asp:Parameter Name="Morada" Type="String" />
                <asp:Parameter Name="Localidade" Type="String" />
                <asp:Parameter Name="Telemovel" Type="String" />
                <asp:Parameter Name="Telefone" Type="String" />
                <asp:Parameter Name="CodPostal" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="CodVerificacao" Type="String" />
                <asp:Parameter Name="nPontos" Type="Int32" />
                <asp:Parameter Name="DataRegisto" Type="DateTime" />
                <asp:Parameter Name="idUser" Type="Int64" />
            </UpdateParameters>
     </asp:SqlDataSource>
       <div align="center">
           <asp:LinkButton ID="LinkButton3" runat="server" Font-Underline="True" 
               PostBackUrl="~/gestao.aspx">Voltar para Administração</asp:LinkButton>
     </div>
     <br />
       <br />

        <asp:Panel ID="PanelLista" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButtonLista" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;
           Lista de Utilizadores         
        </div>
    </asp:Panel>

        <asp:Panel id="PanelListaContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="349px">
	    <table style="width: 100%; height: 339px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                
            <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto" Width="638px" 
                Height="305px">
           
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource2" DataKeyNames="idUser" BackColor="#D3A77A" 
                    Height="296px" Width="877px">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Editar"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Text="Eliminar" OnClientClick = "return confirm ('Tem a certeza que pretende removê-lo?');"></asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="idUser" HeaderText="Id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="idUser" />
                        <asp:BoundField DataField="NomeUser" HeaderText="Nome" 
                            SortExpression="NomeUser" />
                        <asp:BoundField DataField="Pass" HeaderText="Palavra-passe" 
                            SortExpression="Pass" />
                        <asp:BoundField DataField="Morada" HeaderText="Morada" 
                            SortExpression="Morada" />
                        <asp:BoundField DataField="Localidade" HeaderText="Localidade" 
                            SortExpression="Localidade" />
                        <asp:BoundField DataField="Telemovel" HeaderText="Telemóvel" 
                            SortExpression="Telemovel" />
                        <asp:BoundField DataField="Telefone" HeaderText="Telefone" 
                            SortExpression="Telefone" />
                        <asp:BoundField DataField="CodPostal" HeaderText="Código-Postal" 
                            SortExpression="CodPostal" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" 
                            ReadOnly="True" />
                        <asp:BoundField DataField="CodVerificacao" HeaderText="Código de Verificação" 
                            SortExpression="CodVerificacao" ReadOnly="True" />
                        <asp:BoundField DataField="nPontos" HeaderText="Pontos" 
                            SortExpression="nPontos" ReadOnly="True" />
                        <asp:BoundField DataField="DataRegisto" HeaderText="Data de Registo" 
                            SortExpression="DataRegisto" ReadOnly="True" />
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
           Inserir novo Utilizador         
        </div>
    </asp:Panel>

        <asp:Panel id="description_ContentPanel" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="545px">
	    <table style="width: 100%; height: 11px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                 <br />
                       
  
                             <ajaxToolkit:FilteredTextBoxExtender
                                    ID="FilteredTextBoxExtender6"
                                    runat="server"
                                    TargetControlID="TextBoxTelem"
                                    FilterType="Numbers" />

                          
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" 
                                runat="server" FilterType="Numbers" TargetControlID="TextBoxTelef" />
                            <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" 
                                runat="server" FilterType="LowercaseLetters, Custom, UppercaseLetters" 
                                TargetControlID="TextBoxNome" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; Nome:

            <asp:TextBox ID="TextBoxNome" runat="server" Height="18px" Width="209px" 
                MaxLength="15" ValidationGroup="Criarconta"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                ControlToValidate="TextBoxNome" ErrorMessage="*" ForeColor="Red" 
                                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; E-mail:
                            <asp:TextBox ID="TextBoxEmail" runat="server" Height="18px" 
                                ValidationGroup="Criarconta" Width="209px"></asp:TextBox>
                            &nbsp;<asp:Label ID="LabelAlerta" runat="server" ForeColor="Red" 
                                Text="Já existe um utilizador com esse email! Por favor indique outro."></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                ControlToValidate="TextBoxEmail" ErrorMessage="*" ForeColor="Red" 
                                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="TextBoxEmail" ErrorMessage="Email inválido!" ForeColor="Red" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                ValidationGroup="Criarconta"></asp:RegularExpressionValidator>
                            <br />
                            <br />
                            <asp:Label ID="Label1" runat="server" ForeColor="Red" 
                                Text="Atenção: Deverá estar entre 6 e 12 caracteres. Aconselhamos o uso de números e letras para maior segurança."></asp:Label>
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Palavra-passe:
                            <asp:TextBox ID="TextBoxPass" runat="server" Height="18px" MaxLength="12" 
                                TextMode="Password" ValidationGroup="Criarconta" Width="209px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                ControlToValidate="TextBoxPass" ErrorMessage="*" ForeColor="Red" 
                                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                ControlToValidate="TextBoxPass" 
                                ErrorMessage="Deverá estar entre 6 e 12 caracteres." ForeColor="Red" 
                                ValidationExpression="^[\w]{6,}"></asp:RegularExpressionValidator>
                            <br />
                            <br />
                            Confirmar a palavra-passe:
                            <asp:TextBox ID="TextBoxConfPass" runat="server" Height="18px" MaxLength="12" 
                                TextMode="Password" ValidationGroup="Criarconta" Width="209px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                ControlToValidate="TextBoxConfPass" ErrorMessage="*" ForeColor="Red" 
                                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                ControlToCompare="TextBoxPass" ControlToValidate="TextBoxConfPass" 
                                ErrorMessage="A Palavra-passe e a Palavra-passe de confirmação devem ser iguais. " 
                                ForeColor="Red" ValidationGroup="Criarconta"></asp:CompareValidator>
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Morada:
                            <asp:TextBox ID="TextBoxMorada" runat="server" Height="18px" 
                                ValidationGroup="Criarconta" Width="209px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                ControlToValidate="TextBoxMorada" ErrorMessage="*" ForeColor="Red" 
                                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Código-Postal:
                            <asp:TextBox ID="TextBoxCodP" runat="server" Height="17px" MaxLength="8" 
                                ValidationGroup="Criarconta" Width="209px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                ControlToValidate="TextBoxCodP" ErrorMessage="*" ForeColor="Red" 
                                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                ControlToValidate="TextBoxCodP" ErrorMessage="Código-Postal inválido!" 
                                ForeColor="Red" ValidationExpression="^\d{4}-\d{3}$" 
                                ValidationGroup="Criarconta"></asp:RegularExpressionValidator>
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Localidade:&nbsp;
                            <asp:TextBox ID="TextBoxLocal" runat="server" Height="18px" 
                                ValidationGroup="Criarconta" Width="205px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                ControlToValidate="TextBoxLocal" ErrorMessage="*" ForeColor="Red" 
                                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Telefone:
                            <asp:TextBox ID="TextBoxTelef" runat="server" Height="18px" MaxLength="9" 
                                ValidationGroup="Criarconta" Width="209px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                ControlToValidate="TextBoxTelef" ErrorMessage="*" ForeColor="Red" 
                                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Telemóvel:
                            <asp:TextBox ID="TextBoxTelem" runat="server" Height="18px" MaxLength="9" 
                                ValidationGroup="Criarconta" Width="209px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxTelem" 
                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
            <br />
            <br />
         
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <asp:Panel ID="Panel1" runat="server" DefaultButton="ImageButtonInserir">

                    <asp:ImageButton ID="ImageButtonInserir" runat="server" 
                         ImageUrl="~/Images/inseriir.png" onclick="ImageButtonInserir_Click" 
                         ValidationGroup="Criarconta" />

                    </asp:Panel>
                   
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

