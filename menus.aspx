<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="menus.aspx.cs" Inherits="menus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">


  <div>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT * FROM [Menu] ">
      
    </asp:SqlDataSource>
        <br />
        
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="idMenu"     
          GroupItemCount="3" DataSourceID="SqlDataSource2" >

          
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                            No data was returned.</td>
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
                       
                    
                        <asp:Label ID="idArtigoLabel" runat="server" Text='<%# Eval("NomeMenu") %>' ForeColor="#C04806" />
                        <br />  
                       <br />
                     
                      <asp:Image ID="ImageButton1" runat="server" ImageUrl='<%# "Imagem_Artigo/" + Eval("Imagem") %>' />
                       <br />
                   
                       <asp:Label ID="Label1" runat="server" Text='<%# Eval("Detalhe") %>' />
                       <br />
                       <br />
                      
               
                       <asp:Label ID="Label2" runat="server" Text='<%# string.Format("{0:c2}",Eval("Preco")) %>' /> 

                   
                       
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
        
     </div>
</asp:Content>

