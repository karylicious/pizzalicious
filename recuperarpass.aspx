<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="recuperarpass.aspx.cs" Inherits="recuperarpass" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style14
        {
            height: 17px;
        }
        .style15
        {
            height: 10px;
        }
        .style16
        {
            width: 638px;
            height: 10px;
        }



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
    <div style="height: 490px">
        <br />
        <br />
            <div style="background-color: #FFFBD6; width: 686px; height: 330px;">
         
    
        <table style="width:100%; height:119px">
            <tr >
                <td  bgcolor="Maroon" colspan="3" 
                    style="font-weight: bold; color: #FFFFFF" class="style14">
                    Insira o seu endereço de email para lhe enviarmos a sua palavra-passe</td>
            </tr>
            <tr >
                <td class="style15" >
                    &nbsp;</td>
                <td align="center" class="style16"  >
                    &nbsp;</td>
                <td class="style15" >
                    &nbsp;</td>
            </tr>
            <tr >
                <td class="style15" >
                    </td>
                <td align="left" class="style16"  >
                    Email
        <asp:TextBox ID="TextBoxMail" runat="server" Width="202px"></asp:TextBox>
        &nbsp;
                    <asp:Label ID="LabelAlerta" runat="server" ForeColor="Red" 
                        Text="Lamentámos mas o email introduzido não se encontra registado no site!"></asp:Label>
                    <br />
                    <br />
                </td>
                <td class="style15" >
                    </td>
            </tr>
            <tr >
                <td class="style15" >
                    &nbsp;</td>
                <td class="style16"  >
                <div>
                
                Digite os caracteres que vê na figura abaixo:
                    <br />
                    <BotDetect:Captcha ID="SampleCaptcha" runat="server" />
                    <br />
                    <asp:TextBox ID="CaptchaCodeTextBox" runat="server" 
                ValidationGroup="Criarconta"></asp:TextBox>
                   
                    <asp:Label ID="CaptchaCorrectLabel" runat="server" CssClass="correct"></asp:Label>
                    <asp:Label ID="CaptchaIncorrectLabel" runat="server" 
                CssClass="incorrect"></asp:Label>
                    <br />
                </div>
                </td>
                <td class="style15" >
                    &nbsp;</td>
            </tr>
            <tr >
                <td class="style15" >
                    &nbsp;</td>
                <td align="center" class="style16"  >
                    <br />
                    <asp:Panel ID="Panel1" runat="server" DefaultButton="ImageButtonRecuperar">

                     <asp:ImageButton ID="ImageButtonRecuperar" runat="server" 
        ImageUrl="~/Images/recuperaar.png" onclick="ImageButtonRecuperar_Click" />

                    </asp:Panel>
                </td>
                <td class="style15" >
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
    </div>
</asp:Content>

