<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="editarpizza.aspx.cs" Inherits="Default2" %><%@ Register src="PizzaControl.ascx" tagname="PizzaControl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div Align="center">
<br />

  <br />
         &nbsp;<asp:HyperLink ID="HyperLink7" runat="server" Font-Underline="True" 
             NavigateUrl="~/cesta.aspx">Voltar à lista do seu pedido</asp:HyperLink>
                 <br />
                     <br />
   </div>
    
    <uc1:PizzaControl ID="PizzaControl1" runat="server" />

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
   
</asp:Content>

