<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="artigos.aspx.cs" Inherits="artigos" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
            SelectCommand="SELECT [idArtigo], [NomeArtigo], [Imagem], [Detalhe], [Volume], [Preco], [idCategoria] FROM [Artigo] WHERE ([idCategoria] = @idCategoria)">
        <SelectParameters>
            <asp:QueryStringParameter Name="idCategoria" QueryStringField="cat" 
                Type="Int64" />
        </SelectParameters>
      
    </asp:SqlDataSource>
        <br />
        
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="idArtigo" 
            GroupItemCount="3" DataSourceID="SqlDataSource2" >

            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                        Não existem artigos nesta categoria.
                           </td>
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
                   <td id="Td2" runat="server" style="width:220px">
                       
                    
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
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Image" ShowFirstPageButton="True" 
                                        ShowNextPageButton="False" ShowPreviousPageButton="False" FirstPageImageUrl="Images/inicio.png" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Image" ShowLastPageButton="True" 
                                        ShowNextPageButton="False" ShowPreviousPageButton="False" LastPageImageUrl="Images/fim.png" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
          
            
          
        </asp:ListView>
        <br />
        
     </div>

</asp:Content>

