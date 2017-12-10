<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="registo.aspx.cs" Inherits="regist" %>

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
<br/>
    <fieldset 
        style="border-color: #999999; width:600px; height: 765px;">
            <legend>Faça o registo aqui</legend>
<!-- your Rest HTML control goes here -->
            <div style="width: 616px">
                <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Nome:
                <asp:TextBox ID="TextBoxNome" runat="server" Width="209px" 
                MaxLength="15" ValidationGroup="Criarconta"></asp:TextBox>


                <ajaxToolkit:FilteredTextBoxExtender
                ID="FilteredTextBoxExtender3"
                runat="server" 
                TargetControlID="TextBoxNome"
                FilterType="LowercaseLetters, Custom, UppercaseLetters" /> 

            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBoxNome" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                <br />
                <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            E-mail:
                <asp:TextBox ID="TextBoxEmail" runat="server" Width="209px" 
                ValidationGroup="Criarconta"></asp:TextBox>
            &nbsp;<asp:Label ID="LabelAlerta" runat="server" ForeColor="Red" 
                    Text="Já existe um utilizador com esse email! Por favor indique outro."></asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBoxEmail" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="TextBoxEmail" ErrorMessage="Email inválido!" ForeColor="Red" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="Criarconta"></asp:RegularExpressionValidator>
                <br />
                <br />
                <asp:Label ID="LabelVal0" runat="server" ForeColor="Red" 
                
                
                    
                    Text="Atenção: A palavra-passe deverá estar entre 6 e 12 caracteres. Aconselhámos o uso de números e letras para maior segurança."></asp:Label>
                <br />
                <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          
          
         
            Palavra-passe:
                <asp:TextBox ID="TextBoxPass" runat="server" Width="209px" 
                TextMode="Password" ValidationGroup="Criarconta" MaxLength="12"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBoxPass" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                ControlToValidate="TextBoxPass" 
                ErrorMessage="Deverá estar entre 6 e 12 caracteres." ForeColor="Red" 
                ValidationExpression="^[\w]{6,}"></asp:RegularExpressionValidator>
                <br />
                <br />Confirmar a palavra-passe:
                <asp:TextBox ID="TextBoxConfPass" runat="server" Width="209px" 
                TextMode="Password" ValidationGroup="Criarconta" MaxLength="12"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="TextBoxConfPass" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="TextBoxPass" ControlToValidate="TextBoxConfPass" 
                ErrorMessage="A Palavra-passe e a Palavra-passe de confirmação devem ser iguais. " 
                ForeColor="Red" ValidationGroup="Criarconta"></asp:CompareValidator>
                <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Morada:  
                <asp:TextBox ID="TextBoxMorada" runat="server" Width="209px" 
                ValidationGroup="Criarconta"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="TextBoxMorada" ErrorMessage="*" ForeColor="Red" 
                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                <br />
                <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Código-Postal:           

                <asp:TextBox ID="TextBoxCodP" runat="server" Width="209px" 
                MaxLength="8" ValidationGroup="Criarconta"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxCodP" 
                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                ControlToValidate="TextBoxCodP" ErrorMessage="Código-Postal inválido!" 
                ForeColor="Red" ValidationExpression="^\d{4}-\d{3}$" 
                ValidationGroup="Criarconta"></asp:RegularExpressionValidator>
                <br />
                <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Localidade:&nbsp;

                <asp:TextBox ID="TextBoxLocal" runat="server" Width="209px" 
                ValidationGroup="Criarconta"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxLocal" 
                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                <br />
                <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Telefone:
                <asp:TextBox ID="TextBoxTelef" runat="server" Width="209px" 
                MaxLength="9" ValidationGroup="Criarconta"></asp:TextBox>
                <ajaxToolkit:FilteredTextBoxExtender
                    ID="FilteredTextBoxExtender1"
                    runat="server"
                    TargetControlID="TextBoxTelef"
                    FilterType="Numbers" />




            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxTelef" 
                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                <br />
                <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Telemóvel:
                <asp:TextBox ID="TextBoxTelem" runat="server" Width="209px" 
                MaxLength="9" ValidationGroup="Criarconta"></asp:TextBox>

                <ajaxToolkit:FilteredTextBoxExtender
                    ID="FilteredTextBoxExtender2"
                    runat="server"
                    TargetControlID="TextBoxTelem"
                    FilterType="Numbers" />



            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                ErrorMessage="*" ForeColor="Red" ControlToValidate="TextBoxTelem" 
                ValidationGroup="Criarconta"></asp:RequiredFieldValidator>
                <br />
                <br />
                    <asp:ScriptManager ID="ScriptManager1" runat="server" />
                <br />
                <br />
                <div>
                
                Digite os caracteres que vê na figura abaixo:
                    <br />
                    <BotDetect:Captcha ID="SampleCaptcha" runat="server" />
                    <asp:TextBox ID="CaptchaCodeTextBox" runat="server" 
                ValidationGroup="Criarconta"></asp:TextBox>
                   
                    <asp:Label ID="CaptchaCorrectLabel" runat="server" CssClass="correct"></asp:Label>
                    <asp:Label ID="CaptchaIncorrectLabel" runat="server" 
                CssClass="incorrect"></asp:Label>
                    <br />
                    <asp:Panel ID="Panel1" runat="server" DefaultButton="ImageButtonRegist">


                        <div align="center">
                        <br />
                        <br />
                    <asp:ImageButton ID="ImageButtonRegist" runat="server" 
                ImageUrl="~/Images/confirmar.png" ValidationGroup="Criarconta" 
                onclick="ImageButtonRegist_Click" />
                                        </div>

                    </asp:Panel>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
            </div>
        </fieldset><br />
    <br />
    <br />
    <br />
&nbsp;
</asp:Content>

