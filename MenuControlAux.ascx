<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuControlAux.ascx.cs" Inherits="MenuControlAux" %>
<asp:GridView ID="grdMenu" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="ProductID" 
    OnRowDeleting="grdMenu_RowDeleting" 
    BackColor="#E3C7AA">
    <Columns>
       
        
         <asp:BoundField DataField="MenuName" HeaderText="Menu" ReadOnly="True" />
        <asp:BoundField DataField="ProductName" HeaderText="Produtos" ReadOnly="True" />       
        <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="Preço do Menu" 
            ReadOnly="True" />       
        <asp:CommandField ShowDeleteButton="True" DeleteText="Eliminar" />
    </Columns>
 

  
    <EmptyDataTemplate>    

    </EmptyDataTemplate>
</asp:GridView>

