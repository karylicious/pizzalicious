<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CartControl.ascx.cs" Inherits="CartControl" %>
<style type="text/css">
body   
{       
    font-size: .80em;
    font-family: "Helvetica Neue", "Lucida Grande", "Segoe UI", Arial, Helvetica, Verdana, sans-serif;
    
}
div.cesta{ text-align:center;}
</style>
<asp:GridView ID="grdCart" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="ProductID" OnRowCancelingEdit="grdCart_RowCancelingEdit" 
    OnRowDeleting="grdCart_RowDeleting" OnRowEditing="grdCart_RowEditing" 
    OnRowUpdating="grdCart_RowUpdating" 
    BackColor="#E1C5A8">
    <Columns>
        <asp:TemplateField>
            <FooterTemplate>
                <p>
                    &nbsp;</p>
            </FooterTemplate>
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageUrl", "~/Imagem_Artigo/{0}") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="ProductName" HeaderText="Produtos" ReadOnly="True" />
        <asp:TemplateField HeaderText="Quantidade">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Quantity") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Price" DataFormatString="{0:c}" HeaderText="SubTotal" 
            ReadOnly="True" />
        <asp:BoundField DataField="SubTotal" DataFormatString="{0:c}" HeaderText="Total"
            ReadOnly="True" />
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Actualizar" ></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                    CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Editar"></asp:LinkButton>
                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Eliminar" OnClientClick = "return confirm ('Tem a certeza que pretende excluir do seu pedido?');" ></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
 

  
    <EmptyDataTemplate>
        Ainda não adicionou nada ao seu pedido. Comece por 
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/pedido.aspx">aqui</asp:HyperLink>!

    </EmptyDataTemplate>
</asp:GridView>
<div id="cesta" runat="server" class="cesta" >
    <br />
    <br />
    <asp:Label ID="TotalLabel" runat="server"></asp:Label>
    
    <br />
    <br />
    &nbsp;
    <asp:ImageButton ID="ImageButtonFinishShop" runat="server" 
                        ImageUrl="~/Images/concluirppedido.png" 
        onclick="ImageButtonFinishShop_Click" />
       
</div>




