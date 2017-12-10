<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="verifica.aspx.cs" Inherits="verifica" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style13
        {
            height: 19px;
        }
        .style14
        {
            height: 19px;
            width: 326px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="height: 490px">
        <br />
        Foi-lhe enviado um código de verificação para o seu email. Terá de 
        inserí-lo 
        para poder concluir o seu pedido!<br />
        <br />
        <br />
        <table style="width:100%;">
            <tr>
                <td align="right" class="style14">
                    Código de verificação
        
        <asp:TextBox ID="TextBoxVerf" runat="server" Width="174px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;</td>
                <td class="style13">
        <asp:ImageButton ID="ImageButtonOK" runat="server" ImageUrl="~/Images/ook.png" 
            onclick="ImageButtonOK_Click" />
       
                </td>
                <td class="style13">
                </td>
            </tr>
        </table>
        <br />
        <br />
        <div align="center">
            <asp:Label ID="LabelVerf" runat="server" ForeColor="Red" 
            Text="O código que inseriu está incorrecto. Por favor verifique novamente!" 
            Visible="False"></asp:Label>

        </div>

       
    </div>
</asp:Content>

