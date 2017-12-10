<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="gerirmyperfil.aspx.cs" Inherits="gerirmyperfil" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">



    <div style="height: 492px"> 
        <br />
        <div align="center">
            <asp:LinkButton ID="LinkButton3" runat="server" Font-Underline="True" 
                PostBackUrl="~/gestao.aspx">Voltar para Administração</asp:LinkButton>
        </div>
        <br />
        <br />
            <div style="background-color: #FFFBD6; width: 668px;">
         
    
        <table style="width:100%; height:251px">
            <tr >
                <td  bgcolor="Maroon" colspan="4" 
                    style="font-weight: bold; color: #FFFFFF">
                    Alterar Palavra-passe</td>
            </tr>
            <tr >
                <td >
                    &nbsp;</td>
                <td  >
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" 
                        
                        
                        Text="Atenção: A palavra-passe deverá estar entre 6 e 12 caracteres. Aconselhámos o uso de números e letras para maior segurança."></asp:Label>
                    <br/>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Palavra-passe antiga
                    <asp:TextBox ID="TextBoxPassAnt" runat="server" MaxLength="12" 
                        TextMode="Password" ValidationGroup="pp" Width="209px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="TextBoxPassAnt" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="pp"></asp:RequiredFieldValidator>
                    &nbsp;<asp:Label ID="LabelAlerta" runat="server" ForeColor="Red" 
                        Text="A palavra-passe antiga está incorrecta!"></asp:Label>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Palavra-passe nova
                   
                         <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" 
                        runat="server" FilterType="LowercaseLetters, Custom, UppercaseLetters, Numbers" 
                        TargetControlID="TextBoxPassNew" />
                   
                    <asp:TextBox ID="TextBoxPassNew" runat="server" MaxLength="12" 
                        TextMode="Password" ValidationGroup="pp" Width="209px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="TextBoxPassNew" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="pp"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                ControlToValidate="TextBoxPassNew" 
                ErrorMessage="Deverá estar entre 6 e 12 caracteres." ForeColor="Red" 
                ValidationExpression="^[\w]{6,}" ValidationGroup="pp"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                    Confirme palavra-passe nova
                    <asp:TextBox ID="TextBoxConfPass" runat="server" MaxLength="12" 
                        TextMode="Password" ValidationGroup="pp" Width="209px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="TextBoxConfPass" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="pp"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                        ControlToCompare="TextBoxPassNew" ControlToValidate="TextBoxConfPass" 
                        ErrorMessage="A Palavra-passe nova  e a Palavra-passe de confirmação devem ser iguais. " 
                        ForeColor="Red" ValidationGroup="pp"></asp:CompareValidator>
                    <br />
                    <br />
                </td>
                <td >
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr >
                <td >
                    &nbsp;</td>
                <td align="center"  >
                    <asp:Panel ID="Panel1" runat="server" DefaultButton="ImageButtonPalavra">
                    <asp:ImageButton ID="ImageButtonPalavra" runat="server" 
                        ImageUrl="~/Images/guardaar.png" onclick="ImageButtonPalavra_Click" 
                        ValidationGroup="pp" />
                    </asp:Panel>
                </td>
                <td >
                    &nbsp;</td>
                <td >
                    &nbsp;</td>
            </tr>
            </table>
        
   
        </div>
        <br />
        <br />
        <br />
    
        <ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager1" />
    <br />
    <br />
    </div>
</asp:Content>

