<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="cesta.aspx.cs" Inherits="cesta" %>

<%@ Register src="CartControl.ascx" tagname="CartControl" tagprefix="uc1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

  <ajaxtoolkit:toolkitscriptmanager runat="server" ID="ScriptManager1" />
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>

        <div id="Tdcoisas" runat="server">
        <asp:Label ID="Label9" runat="server" ForeColor="Red" 
        Text="Atenção: Apenas pode aplicar Pontos ou Promoção!"></asp:Label>
        <br />
        <br />
       
        <asp:Panel ID="PanelLista" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButtonLista" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;
           Aplicar Promoção        
        </div>
    </asp:Panel>

        <asp:Panel id="PanelListaContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="1156px">
	        <br />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Promoções"></asp:Label>
            <br />
            <asp:Image ID="Image5" runat="server" Height="2px" ImageUrl="~/Images/line.png" 
                Width="500px" />
        <br />
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="idPromocao" 
                DataSourceID="SqlDataSource3" GroupItemCount="3" 
                onitemcommand="ListView1_ItemCommand">
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
                    <td runat="server" style="width:220px">
                        <br />
                        <asp:Label ID="NomePromocaoLabel" runat="server" Font-Bold="True" 
                            Text='<%# Eval("NomePromocao") %>' />
                        <br />
                        <br />
                        <asp:Image ID="ImagemLabel" runat="server" 
                            ImageUrl='<%# "Imagem_Artigo/" + Eval("Imagem") %>' />
                        <br />
                        <asp:Label ID="DetalheLabel" runat="server" Text='<%# Eval("Detalhe") %>' />
                        <br />
                        <br />
                        <asp:ImageButton ID="Image1" runat="server" 
                            CommandArgument='<%# Eval("idPromocao") %>' ImageUrl="~/Images/aplicarr.png" />
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
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [idPromocao], [NomePromocao], [Imagem], [Detalhe] FROM [Promocao]">
            </asp:SqlDataSource>
    </asp:Panel>
            
        
       
         <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderLista" runat="Server"
        TargetControlID="PanelListaContent"
        ExpandControlID="PanelLista"
        CollapseControlID="PanelLista"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="ImageButtonLista" /> 
            
        
       
        <br />

        <asp:Panel ID="description_HeaderPanel" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="Description_ToggleImage" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;
           Aplicar Pontos         
        </div>
    </asp:Panel>

        <asp:Panel id="description_ContentPanel" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="1173px">
            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Pontos"></asp:Label>
            <br />
            <asp:Image ID="Image7" runat="server" Height="2px" ImageUrl="~/Images/line.png" 
                Width="500px" />
        <br />
            <br />
            <asp:Label ID="Label8" runat="server" Font-Bold="False" ForeColor="Red" 
                
                Text="Para aplicar tem que iniciar sessão. Uma vez que conclua o pedido não será possível cancelar os pontos aplicados."></asp:Label>
            <br />
            <asp:ListView ID="ListView2" runat="server" DataKeyNames="idPontos" 
                DataSourceID="SqlDataSource4" GroupItemCount="3" 
                onitemcommand="ListView2_ItemCommand">
               
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
                    <td runat="server" align="center" class="style12" style="border-style: ridge; background-color: #FFC58A">                     
                   
                        <br />
                     Número de Pontos:
                        <asp:Label ID="nPontosLabel" runat="server" Text='<%# Eval("nPontos") %>' />
                        <br />
                     
                     Desconto:
                        <asp:Label ID="nDescontoLabel" runat="server" Text='<%# Eval("nDesconto") %>' />&nbsp;%
                        <br />
                        <br />
                        <asp:ImageButton ID="ImageButton6" runat="server" 
                            ImageUrl="~/Images/aplicarr.png" CommandArgument= '<%# Eval("idPontos") %>'/>
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
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [Pontos]"></asp:SqlDataSource>
    </asp:Panel>

       
        <ajaxToolkit:CollapsiblePanelExtender ID="cpeDesc" runat="Server"
        TargetControlID="description_ContentPanel"
        ExpandControlID="description_HeaderPanel"
        CollapseControlID="description_HeaderPanel"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="description_ToggleImage" /> 



         <br />

        <br />
    <table style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td align="left" style="font-weight: bold" id="TdAddPromo" runat="server">
                Aplicou com sucesso a Promoção:<br />
        <asp:Image ID="Image6" runat="server" Height="2px" ImageUrl="~/Images/line.png" 
            Width="500px" />
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Font-Bold="False" ForeColor="Red" 
                    Text="Se modificar o conteúdo do seu pedido, a promoção que aplicou será automáticamente removida. "></asp:Label>
                <br />
                &nbsp;<br />
                <asp:Label ID="LabelNomePromo" runat="server"></asp:Label>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Image ID="ImagePromocaoAplicada" runat="server" />
            &nbsp;&nbsp;<br />
                <br />
                <br />
                <asp:ImageButton ID="ImageButtonRemoverPromo" runat="server" 
                    ImageUrl="~/Images/removeer.png" onclick="ImageButtonRemoverPromo_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="font-weight: bold" id="TdAddPontos" runat="server">
                Aplicou com sucesso os seus Pontos<asp:Image ID="Image8" runat="server" 
                    Height="2px" ImageUrl="~/Images/line.png" 
            Width="500px" />
                <br />
                <br />
                <asp:Label ID="Label7" runat="server" Font-Bold="False" ForeColor="Red" 
                    Text="Uma vez que conclua o pedido não será possível cancelar os pontos aplicados."></asp:Label>
                <br />
                <br />
                Pontos aplicados:
                <asp:Label ID="LabelPontosAplicados" runat="server" Font-Bold="False"></asp:Label>
                <br />
                <br />
                Desconto aplicado:
                <asp:Label ID="LabelDescontoAplicado" runat="server" Font-Bold="False"></asp:Label>
                <br />
                <br />
                Os pontos que lhe restarão:
                <asp:Label ID="LabelPontosRestados" runat="server" Font-Bold="False"></asp:Label>
                <br />
                <br />
                <asp:ImageButton ID="ImageButtonRemovePontos" runat="server" 
                    ImageUrl="~/Images/removeer.png" onclick="ImageButtonRemovePontos_Click" />
                <br />
                <br />
                <br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />

        </div>
        <div align="center">
          <br /> <asp:Label ID="LabelErro" runat="server" ForeColor="Red" 
            
                Text="Atenção: Para concluir o seu pedido terá  que fazer um consumo mínimo de 5,00€"></asp:Label>
            <br />
            <asp:Label ID="LabelErroSess" runat="server" ForeColor="Red" 
                Text="*Para continuar tem que iniciar sessão!" Visible="False"></asp:Label>
       </div>
    <br />
&nbsp;<div id="divVerDet" align="center" runat="server" visible="True">
            <asp:HyperLink ID="HyperLink7" runat="server" Font-Bold="True" 
                Font-Underline="True" NavigateUrl="~/editarpizza.aspx">Ver os detalhes das suas pizzas</asp:HyperLink>
            <br />
            <br />
            <asp:HyperLink ID="HyperLinkVerMenuDet" runat="server" Font-Bold="True" 
                Font-Underline="True" NavigateUrl="~/editarmenu.aspx">Ver os detalhes dos seus menus</asp:HyperLink>
            <br />
            <br />
        </div>
        <br />
        <br />
        <div align="center">
            <uc1:CartControl ID="CartControl1" runat="server" />
        </div>
        <br />

        <br />
    </asp:Content>

