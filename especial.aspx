<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="especial.aspx.cs" Inherits="especial" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
            SelectCommand="SELECT [NomePromocao], [Preco], [Imagem], [Detalhe] FROM [Promocao]"></asp:SqlDataSource>
             <br />
    <table style="width: 93%;">
        <tr>
            <td>
                
        <asp:ListView ID="ListView1" runat="server"  DataSourceID="SqlDataSource2" >
               

        
            <EmptyDataTemplate>
                <span>De momento não há promoções disponíveis.</span>
            </EmptyDataTemplate>
            
            <ItemTemplate>
                
                <div>
                
                <asp:Label ID="Label2" runat="server"    Text='<%# Eval("NomePromocao") %>' Font-Bold="True" />
                <br />  
                 <br />                        
              <div class="detalhepizza">
                <asp:Image ID="ImagemLabel" runat="server" ImageUrl='<%# "Imagem_Artigo/" + Eval("Imagem") %>' />
               </div>
                <br />
           
                <div class="tablepizza">
                <asp:Label ID="DetalheLabel" runat="server" Text='<%# Eval("Detalhe") %>' />
               </div>

               <br /> 

                <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/Separador.png" Width="670px" />
                </div>
                
            </ItemTemplate>

            <LayoutTemplate>
                <div ID="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                    <asp:DataPager ID="DataPager1" runat="server">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Image" ShowFirstPageButton="True" 
                                ShowNextPageButton="False" ShowPreviousPageButton="False" FirstPageImageUrl="Images/inicio.png" />
                            <asp:NumericPagerField />
                            <asp:NextPreviousPagerField ButtonType="Image" ShowLastPageButton="True" 
                                ShowNextPageButton="False" ShowPreviousPageButton="False" LastPageImageUrl="Images/fim.png" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>
          
        </asp:ListView>
                
            </td>
        </tr>
        
    </table>
    <br />
    
</asp:Content>

