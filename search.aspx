<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="trocar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <!-- Disclaimer -->
    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
     ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
        SelectCommand="SELECT * FROM [Artigo] WHERE ([NomeArtigo] LIKE @NomeArtigo)">
        <SelectParameters>
            <asp:QueryStringParameter Name="NomeArtigo" QueryStringField="ref" 
                Type="String" />
        </SelectParameters>
        </asp:SqlDataSource>
    <br />

	<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource3" 
        DataKeyNames="idArtigo" GroupItemCount="3">
            <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/cd.gif" />   Não há resultados para a sua pesquisa! </td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr ID="itemPlaceholderContainer" runat="server">
                <td ID="itemPlaceholder" runat="server">
                </td>
            </tr>
        </GroupTemplate>
       
        <ItemTemplate>
            <td runat="server" style="width:220px;">
            
                   
                 
                        <asp:Label ID="idArtigoLabel" runat="server" Text='<%# Eval("NomeArtigo") %>' ForeColor="#C04806" />
                        <br />  
                       <br />
                     
                      <asp:Image ID="ImagemLabel" runat="server" ImageUrl='<%# "Imagem_Artigo/" + Eval("Imagem") %>' />
                       <br />
                   
                       <asp:Label ID="DetalheLabel" runat="server" Text='<%# Eval("Detalhe") %>' />
                       <br />
                   
                       <asp:Label ID="VolumeLabel" runat="server" Text='<%# Eval("Volume") %>' />
                       <br />
                       <br /> 
               
                       <asp:Label ID="PrecoLabel" runat="server" Text='<%# string.Format("{0:c2}",Eval("Preco")) %>' /> 

                   
                       
                           <br />
                          <br /> 
                            <br />
                          <br /> 
          
            </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr ID="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        
    </asp:ListView>

	<br />
    <br />
    <br />

	



</asp:Content>

