<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="editarmenu.aspx.cs" Inherits="_Default" %><%@ Register src="MenuControl.ascx" tagname="MenuControl" tagprefix="uc1" %>

<%@ Register src="PizzaMenuControl.ascx" tagname="PizzaMenuControl" tagprefix="uc2" %>

<%@ Register src="PizzaControl.ascx" tagname="PizzaControl" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div align="center">
         <br />
         <asp:HyperLink ID="HyperLink7" runat="server" Font-Underline="True" 
             NavigateUrl="~/cesta.aspx">Voltar à lista do seu pedido</asp:HyperLink>
         <br />
         <br />
        <uc1:MenuControl ID="MenuControl1" runat="server" />
         <br />
         <br />
         <table style="width: 100%;">
             <tr>
                 <td ID="tdOutros" runat="server" align="center">
                    
                                        <br />
                                        <br />
                                        <asp:DropDownList ID="DropDownListArtigosMenu" runat="server" AutoPostBack="True" 
                                            DataSourceID="SqlDataSource4" DataTextField="NomeArtigo" 
                                            DataValueField="idArtigo" 
                                            OnSelectedIndexChanged="DropDownListArtigosMenu_SelectedIndexChanged" 
                                            AppendDataBoundItems="True">
                                            <asp:ListItem>-</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <br />
                                        <div ID="divitensAMostrarMenu" runat="server">
                                            <asp:Image ID="ImageDetMenu" runat="server" />
                                            <br />
                                            <br />
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                                
                                                SelectCommand="SELECT [Imagem], [Detalhe], [NomeArtigo], idArtigo FROM [Artigo] WHERE ([idCategoria] = @idCategoria)">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="idCategoria" SessionField="CatProd" 
                                                        Type="Int64" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                            <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Underline="False" 
                                                Text="Detalhes:"></asp:Label>
                                            <br />
                                            <asp:Label ID="LabelDetMenu" runat="server"></asp:Label>
                                            <br />
                                            <br />
                                            <div align="center">
                                                <asp:ImageButton ID="ImageButtonAlterar" runat="server" 
                                                    ImageUrl="~/Images/alterar.png" 
                                                    OnClick="ImageButtonAlterar_Click" />
                                                &nbsp;</div>
                                        </div></td>
             </tr>
             <tr>
                 <td ID="tdPizzas" runat="server" align="left">
                    
                                        <br />
                                        <br />
                                        <br />
                                        <uc2:PizzaMenuControl ID="PizzaMenuControl1" runat="server" />
                                        <br />
                                        <br />
                                        <br />
                                        <br />
                 </td>
             </tr>
             <tr>
                 <td>
                     &nbsp;</td>
             </tr>
         </table>
        <br />
        <br />
        


    </div>
</asp:Content>

