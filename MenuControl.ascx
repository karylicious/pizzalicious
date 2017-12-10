<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuControl.ascx.cs" Inherits="MenuControl" %>
<asp:GridView ID="grdMenu" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="ProductID" 
    BackColor="#E3C7AA" onselectedindexchanged="grdMenu_SelectedIndexChanged">
    <Columns>
       
        
         <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />      
        
         <asp:BoundField DataField="MenuName" HeaderText="Menu" ReadOnly="True" />
         <asp:TemplateField HeaderText="Imagem">
             <EditItemTemplate>
                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Image") %>'></asp:TextBox>
             </EditItemTemplate>
             <ItemTemplate>
                 <asp:Image ID="ImageButton1" runat="server" ImageUrl='<%# "Imagem_Artigo/" + Eval("Image") %>' />
             </ItemTemplate>
         </asp:TemplateField>
        <asp:BoundField DataField="ProductName" HeaderText="Produtos" ReadOnly="True" />       
        <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Preço do Menu" 
            ReadOnly="True" />       
    </Columns>
 

  
    <EmptyDataTemplate>    

    </EmptyDataTemplate>
    <SelectedRowStyle BackColor="#FFFBD6" />
</asp:GridView>

<p>
    &nbsp;</p>


