<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="contactos.aspx.cs" Inherits="contactos" %>


<asp:Content ID="Content4" runat="server" contentplaceholderid="HeadContent">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="height: 491px">
        <div>
            <div align="left" dir="rtl" style= "margin-left:55px">
                <asp:Image ID="Image6" 
                runat="server" ImageUrl="~/Images/number.png" Width="384px" />
            </div>
        </div>
        <br />
        <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
        Email:
        <asp:TextBox ID="TextBoxEmail" runat="server" Width="326px"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="TextBoxEmail" ForeColor="Red">O campo &quot;Email&quot; não pode fica vazio</asp:RequiredFieldValidator>
        <br />
        <br />&nbsp;&nbsp;&nbsp;&nbsp; 
        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"></asp:Label>
        Assunto:
        <asp:TextBox ID="TextBoxAssunto" runat="server" Width="326px" 
            style="text-align: left"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
            ControlToValidate="TextBoxAssunto" ForeColor="Red">O campo &quot;Assunto&quot; não pode fica vazio</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label8" runat="server" ForeColor="Red" Text="*"></asp:Label>
    Mensagem: 
        <asp:TextBox ID="TextBoxMess" runat="server" Height="73px" 
             TextMode="MultiLine" Width="326px" EnableTheming="True"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
            ControlToValidate="TextBoxMess" ForeColor="Red">O campo &quot;Mensagem&quot; não pode ficar vazio</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Panel ID="Panel1" runat="server" DefaultButton="ImageButtonEnviar">

        <div align="center">
            <asp:ImageButton ID="ImageButtonEnviar" runat="server" 
            ImageUrl="~/Images/enviaar.png" 
                onclick="ImageButtonEnviar_Click" />
        </div>

        </asp:Panel>
    </div>
</asp:Content>


