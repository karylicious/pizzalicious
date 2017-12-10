<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="gestao.aspx.cs" Inherits="gestao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div style="color: #000000">
        <div class="gestao">
            <asp:Image ID="Image13" runat="server" Height="233px" 
            ImageUrl="~/Images/gestao.png" Width="395px" /> </div>
        
        <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/seta_1.png" />
&nbsp;
        <asp:HyperLink ID="HyperLinkProd"  runat="server" 
            NavigateUrl="~/gerirprod.aspx">Produtos</asp:HyperLink>
        <br />
        <br />
        <asp:Image ID="Image14" runat="server" ImageUrl="~/Images/seta_1.png" />
&nbsp;
        <asp:HyperLink ID="HyperLinkMenu"  runat="server" 
            NavigateUrl="~/gerirmenu.aspx">Menu</asp:HyperLink>
        <br />
        <br />
        <asp:Image ID="Image15" runat="server" ImageUrl="~/Images/seta_1.png" />
&nbsp;
        <asp:HyperLink ID="HyperLinkVendas"  runat="server" 
            NavigateUrl="~/gerirvendas.aspx">Vendas</asp:HyperLink>
        <br />
        <br />
        <asp:Image ID="Image7" runat="server" ImageUrl="~/Images/seta_1.png" />
&nbsp;
        <asp:HyperLink ID="HyperLinkCat" runat="server" NavigateUrl="~/gerircat.aspx">Categorias</asp:HyperLink>
        <br />
        <br />
        <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/seta_1.png" />
&nbsp;
        <asp:HyperLink ID="HyperLinkProm" runat="server" NavigateUrl="~/gerirprom.aspx">Promoções</asp:HyperLink>
        <br />
        <br />
        <asp:Image ID="Image10" runat="server" ImageUrl="~/Images/seta_1.png" />
&nbsp;
        <asp:HyperLink ID="HyperLinkPed" runat="server" 
            NavigateUrl="~/gerirpedidos.aspx">Pedidos</asp:HyperLink>
        <br />
        <br />
        <asp:Image ID="Image11" runat="server" ImageUrl="~/Images/seta_1.png" />
&nbsp;
        <asp:HyperLink ID="HyperLinkUser" runat="server" 
            NavigateUrl="~/gerirusers.aspx">Utilizadores</asp:HyperLink>
        <br />
        <br />
        <asp:Image ID="Image12" runat="server" ImageUrl="~/Images/seta_1.png" />
&nbsp;
        <asp:HyperLink ID="HyperLinkMyperfil" runat="server" 
            NavigateUrl="~/gerirmyperfil.aspx">O meu perfil</asp:HyperLink>
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
</asp:Content>

