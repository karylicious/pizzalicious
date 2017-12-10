<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="concluirpedido.aspx.cs" Inherits="finishcompras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <br />
    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Confirmar morada"></asp:Label>
    <br />
    <asp:Image ID="Image6" runat="server" Height="2px" ImageUrl="~/Images/line.png" 
        Width="200px" />
    <br />
    Morada actual:
    <asp:Label ID="LabelMorada" runat="server"></asp:Label>
    <br />
    Localidade actual:
    <asp:Label ID="LabelLocal" runat="server"></asp:Label>
    <br />
    Código-postal:
    <asp:Label ID="LabelCodP" runat="server"></asp:Label>
    <br />
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Font-Bold="True" 
        Text="Alterar a morada de entrega"></asp:Label>
    <br />
    <asp:Image ID="Image7" runat="server" Height="2px" ImageUrl="~/Images/line.png" 
        Width="200px" />
    <br />
    <asp:RadioButtonList ID="RadioButtonListAltMor" runat="server" 
        onselectedindexchanged="RadioButtonListAltMor_SelectedIndexChanged" 
        AutoPostBack="True">
        <asp:ListItem>Sim</asp:ListItem>
        <asp:ListItem>Não</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <div id="coisas" runat="server">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Morada:
    <asp:TextBox ID="TextBoxMorada" runat="server" Width="209px"></asp:TextBox>
&nbsp;<asp:Label ID="Label7" runat="server" ForeColor="Red" Text="*"></asp:Label>
            <br />
        &nbsp;&nbsp;&nbsp;&nbsp;
        Localidade: 
        <asp:TextBox ID="TextBoxLocal" runat="server" Width="209px"></asp:TextBox>
&nbsp;<asp:Label ID="Label8" runat="server" ForeColor="Red" Text="*"></asp:Label>
            <br />
        Código-Postal: 
        <asp:TextBox ID="TextBoxCodP" runat="server" MaxLength="8" Width="209px"></asp:TextBox>
&nbsp;<asp:Label ID="Label9" runat="server" ForeColor="Red" Text="*"></asp:Label>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                ControlToValidate="TextBoxCodP" ErrorMessage="Código-Postal inválido!" 
                ForeColor="Red" ValidationExpression="^\d{4}-\d{3}$"></asp:RegularExpressionValidator>
         <br />
        <br />
         </div>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Font-Bold="True" 
        Text="Modo de pagamentos"></asp:Label>
    <br />
    <asp:Image ID="Image8" runat="server" Height="2px" ImageUrl="~/Images/line.png" 
        Width="200px" />
    <br />
    <asp:RadioButtonList ID="RadioButtonListModPag" runat="server" 
        onselectedindexchanged="RadioButtonListModPag_SelectedIndexChanged" 
        AutoPostBack="True">
        <asp:ListItem>Com cartão de multibanco</asp:ListItem>
        <asp:ListItem>A dinheiro</asp:ListItem>
    </asp:RadioButtonList>
    <br />
    <div id="DivTroco" runat="server">
    <asp:Label ID="Label6" runat="server" Font-Bold="True" 
        Text="Troco"></asp:Label>
        <br />
    <asp:Image ID="Image9" runat="server" Height="2px" ImageUrl="~/Images/line.png" 
        Width="200px" />
        <br />
        Vai precisar de troco?
      
             <br />
    <asp:RadioButtonList ID="RadioButtonListTroco" runat="server">
        <asp:ListItem>Sim</asp:ListItem>
        <asp:ListItem>Não</asp:ListItem>
    </asp:RadioButtonList>
    </div>
    <br />
    <br />
    <div align="center">
        <asp:ImageButton ID="ImageButtonConcluir" runat="server" 
            ImageUrl="~/Images/concluiir.png" onclick="ImageButtonConcluir_Click" 
            ValidationGroup="conf" />
    </div>
    <br />
    <br />
</asp:Content>

