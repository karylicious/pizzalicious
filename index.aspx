<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="Select  Top 5 NomeArtigo, Preco, idArtigo, imagem From Artigo order by DataCriacao ASC">
    </asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" 
        DataSourceID="SqlDataSource2" RepeatColumns="3" RepeatDirection="Horizontal" 
        Width="686px" style="margin-bottom: 166px" DataKeyField="idArtigo">
        <ItemTemplate>
        <br />
            
            <asp:Label ID="NomeArtigo" runat="server" Text='<%# Eval("NomeArtigo") %>' 
                ForeColor="#C04806"></asp:Label>
            <br />
            <asp:Image ID="imagemLabel" runat="server"  ImageUrl='<%# "Imagem_Artigo/" + Eval("Imagem") %>'></asp:Image>
            <br />
            <asp:Label ID="PrecoLabel" runat="server" Text='<%# string.Format("{0:c2}",Eval("Preco")) %>'></asp:Label>
           <br />
        </ItemTemplate>
    </asp:DataList>
    <br />
    <br />

</asp:Content>

