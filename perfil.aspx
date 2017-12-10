<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="perfil.aspx.cs" Inherits="perfil" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <br />


<ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager1" />


 <asp:Panel ID="description_HeaderPanel" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="Description_ToggleImage" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;
            Dados pessoais          
        </div>
    </asp:Panel>

    <asp:Panel id="description_ContentPanel" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="397px">
	    <table style="width: 100%; height: 11px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nome
                    <asp:TextBox ID="TextBoxNome" runat="server" MaxLength="15" 
                        ValidationGroup="cv" Width="209px"></asp:TextBox>
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" 
                        runat="server" FilterType="LowercaseLetters, Custom, UppercaseLetters" 
                        TargetControlID="TextBoxNome" />
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                        ControlToValidate="TextBoxNome" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="cv"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; E-mail
                    <asp:TextBox ID="TextBoxEmail" runat="server" ValidationGroup="cv" 
                        Width="209px"></asp:TextBox>
                    &nbsp;<asp:Label ID="LabelAlertaMail" runat="server" ForeColor="Red" 
                        Text="Já existe um utilizador com esse email! Por favor indique outro."></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                        ControlToValidate="TextBoxEmail" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="cv"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" 
                        ControlToValidate="TextBoxEmail" ErrorMessage="Email inválido!" ForeColor="Red" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        ValidationGroup="cv"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Morada
                    <asp:TextBox ID="TextBoxMorada" runat="server" ValidationGroup="cv" 
                        Width="209px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="TextBoxMorada" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="cv"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Código-Postal
                    <asp:TextBox ID="TextBoxCodPost" runat="server" MaxLength="8" 
                        ValidationGroup="cv" Width="209px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="TextBoxCodPost" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="cv"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                        ControlToValidate="TextBoxCodPost" ErrorMessage="Código-Postal inválido!" 
                        ForeColor="Red" ValidationExpression="^\d{4}-\d{3}$" ValidationGroup="cv"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Localidade
                    <asp:TextBox ID="TextBoxLocal" runat="server" ValidationGroup="cv" 
                        Width="209px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                        ControlToValidate="TextBoxLocal" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="cv"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Telefone
                    <asp:TextBox ID="TextBoxTelef" runat="server" MaxLength="9" 
                        ValidationGroup="cv" Width="209px"></asp:TextBox>
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                        runat="server" FilterType="Numbers" TargetControlID="TextBoxTelef" />
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="TextBoxTelef" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="cv"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Telemóvel
                    <asp:TextBox ID="TextBoxTelem" runat="server" MaxLength="9" 
                        ValidationGroup="cv" Width="209px"></asp:TextBox>
                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" 
                        runat="server" FilterType="Numbers" TargetControlID="TextBoxTelem" />
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="TextBoxTelem" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="cv"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                    <br />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <asp:ImageButton ID="ImageButtonDados" runat="server" 
                        ImageUrl="~/Images/guardaar.png" onclick="ImageButtonDados_Click" 
                        ValidationGroup="cv" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    </asp:Panel>
    
            <br />




    <asp:Panel ID="properties_HeaderPanel" runat="server" 
        style="cursor: pointer;" Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="Properties_ToggleImage" runat="server" ImageUrl="~/images/expand.jpg" AlternateText="expand" />&nbsp;
            Alterar Palavra-passe
        </div>
    </asp:Panel>

     

    <asp:Panel id="properties_ContentPanel" runat="server" 
        style="overflow:hidden; background-color:#FFFBD6;"  Width= "683px" 
        Height="246px">
         
    
        <table style="width:100%; height:251px" >
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label1" runat="server" ForeColor="Red" 
                        
                        Text="Atenção: A palavra-passe deverá estar entre 6 e 12 caracteres. Aconselhámos o uso de números e letras para maior segurança."></asp:Label>
                    <br />
                    <br />

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Palavra-passe antiga
                    <asp:TextBox ID="TextBoxPassAnt" runat="server" MaxLength="12" 
                        TextMode="Password" ValidationGroup="pp" Width="209px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TextBoxPassAnt" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="pp"></asp:RequiredFieldValidator>
                    &nbsp;<asp:Label ID="LabelAlerta" runat="server" ForeColor="Red" 
                        Text="A palavra-passe antiga está incorrecta!"></asp:Label>
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Palavra-passe nova
                    
                       <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" 
                        runat="server" FilterType="LowercaseLetters, Custom, UppercaseLetters, Numbers" 
                        TargetControlID="TextBoxPassNew" />
                    
                    <asp:TextBox ID="TextBoxPassNew" runat="server" MaxLength="12" 
                        TextMode="Password" ValidationGroup="pp" Width="209px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="TextBoxPassNew" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="pp"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" 
                        ControlToValidate="TextBoxPassNew" 
                        ErrorMessage="Deverá estar entre 6 e 12 caracteres." ForeColor="Red" 
                        ValidationExpression="^[\w]{6,}" ValidationGroup="pp"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                    Confirme palavra-passe nova
                    <asp:TextBox ID="TextBoxConfPass" runat="server" MaxLength="12" 
                        TextMode="Password" ValidationGroup="pp" Width="209px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="TextBoxConfPass" ErrorMessage="*" ForeColor="Red" 
                        ValidationGroup="pp"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="TextBoxPassNew" ControlToValidate="TextBoxConfPass" 
                        ErrorMessage="A Palavra-passe e a Palavra-passe de confirmação devem ser iguais. " 
                        ForeColor="Red" ValidationGroup="pp"></asp:CompareValidator>
                    <br />
                    <br />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <asp:ImageButton ID="ImageButtonPalavra" runat="server" 
                        ImageUrl="~/Images/guardaar.png" onclick="ImageButtonPalavra_Click" 
                        ValidationGroup="pp" />
                    <br />
                </td>
                <td>
                    <br />
                </td>
            </tr>
        </table>
        
   
    </asp:Panel>

    <br />
    
    
    <asp:Panel ID="PanelPontos" runat="server" 
        style="cursor: pointer;" Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButtonPontos" runat="server" ImageUrl="~/images/expand.jpg" AlternateText="expand" />&nbsp;
            Pontos Pizzalicious
        </div>
    </asp:Panel>



      <asp:Panel id="PanelContentPontos" runat="server" 
        style="overflow:hidden; background-color:#FFFBD6;"  Width= "683px" 
        Height="267px">
         
          <table style="width: 100%;">
              <tr>
                  <td>
                      &nbsp;
                  </td>
                  <td>
                      &nbsp;
                      <br />
                      Neste momento tem
                      <asp:Label ID="LabelPontos" runat="server" Font-Bold="True"></asp:Label>
                      &nbsp;pontos.<br />
                      <br />
                      <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Lista de Pontos"></asp:Label>
                      <br />
                      <asp:Image ID="Image5" runat="server" Height="2px" ImageUrl="~/Images/line.png" 
                          Width="550px" />
                      <br />
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <asp:DataList ID="DataList1" runat="server" BackColor="#E3C7AA" 
                          DataSourceID="SqlDataSource3" Font-Bold="False" Font-Italic="False" 
                          Font-Overline="False" Font-Strikeout="False" Font-Underline="False" 
                          GridLines="Both" HorizontalAlign="Left" RepeatColumns="2" 
                          RepeatDirection="Horizontal" ShowFooter="False" Width="304px">
                          <ItemTemplate>
                              nPontos:
                              <asp:Label ID="nPontosLabel" runat="server" Text='<%# Eval("nPontos") %>' />
                              <br />
                              nDesconto:
                              <asp:Label ID="nDescontoLabel" runat="server" Text='<%# Eval("nDesconto")+"%" %>' />
                              <br />
                              <br />
                          </ItemTemplate>
                      </asp:DataList>
                      <br />
                      <br />
                      <br />
                      <br />
                      <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                          SelectCommand="SELECT [nPontos], [nDesconto] FROM [Pontos]">
                      </asp:SqlDataSource>
                  </td>
                  <td>
                      &nbsp;
                  </td>
              </tr>
          </table>
    </asp:Panel>

    <br />


     <asp:Panel ID="PanelPedidos" runat="server" 
        style="cursor: pointer;" Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButtonPedidos" runat="server" ImageUrl="~/images/expand.jpg" AlternateText="expand" />&nbsp;
            Os seus Pedidos
        </div>
    </asp:Panel>


     <asp:Panel id="PanelPedidosContent" runat="server" 
        style="overflow:hidden; background-color:#FFFBD6;"  Width= "683px" 
        Height="359px">
         
          <table style="width: 100%; height: 177px;">
              <tr>
                  <td>
                      &nbsp;</td>
                  <td id="tdPAnelComPromo" runat="server" >
                  <br />
                      <asp:Panel ID="Panel2" runat="server" BorderStyle="Ridge" Height="114px" 
                          ScrollBars="Auto" Width="659px">
                          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                              BackColor="#E3C7AA" DataSourceID="SqlDataSource1" 
                              EmptyDataText="Ainda não efectuou nenhum pedido!" Height="101px" Width="660px">
                              <Columns>
                                  <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" />
                                  <asp:BoundField DataField="Morada" HeaderText="Morada" 
                                      SortExpression="Morada" />
                                  <asp:BoundField DataField="NomePromocao" HeaderText="Promoção" 
                                      SortExpression="NomePromocao" />
                                  <asp:TemplateField HeaderText="Imagem" SortExpression="Imagem">
                                      <ItemTemplate>
                                          <asp:Image ID="imagemLabel" runat="server" 
                                              ImageUrl='<%# "Imagem_Artigo/" + Eval("Imagem") %>' />
                                      </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:BoundField DataField="Localidade" HeaderText="Localidade" 
                                      SortExpression="Localidade" />
                                  <asp:BoundField DataField="CodPostal" HeaderText="Código-Postal" 
                                      SortExpression="CodPostal" />
                                  <asp:BoundField DataField="ModPag" HeaderText="Modo de Pagamento" 
                                      SortExpression="ModPag" />
                                  <asp:BoundField DataField="Troco" HeaderText="Troco" SortExpression="Troco" />
                              </Columns>
                          </asp:GridView>
                      </asp:Panel>
                  </td>
                  <td>
                      &nbsp;</td>
              </tr>
              <tr>
                  <td>
                      &nbsp;
                  </td>
                  <td id="tdSemPromo" runat="server" >
                      &nbsp;
                      <br />
                      
                      <asp:Panel ID="Panel1" runat="server" BorderStyle="Ridge" Height="114px" 
                          ScrollBars="Auto" Width="659px">
                          <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                              BackColor="#E3C7AA" DataSourceID="SqlDataSource4" 
                              EmptyDataText="Ainda não efectuou nenhum pedido!" Height="101px" Width="660px">
                              <Columns>
                                  <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" />
                                  <asp:BoundField DataField="Morada" HeaderText="Morada" 
                                      SortExpression="Morada" />
                                  <asp:BoundField DataField="Localidade" HeaderText="Localidade" 
                                      SortExpression="Localidade" />
                                  <asp:BoundField DataField="CodPostal" HeaderText="Código-Postal" 
                                      SortExpression="CodPostal" />
                                  <asp:BoundField DataField="ModPag" HeaderText="Modo de Pagamento" 
                                      SortExpression="ModPag" />
                                  <asp:BoundField DataField="Troco" HeaderText="Troco" SortExpression="Troco" />
                              </Columns>
                          </asp:GridView>
                      </asp:Panel>
                      <br />
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                          SelectCommand="SELECT Pedido.Data, Pedido.Morada, Pedido.Localidade, Pedido.CodPostal, Pedido.ModPag, Pedido.Troco, Promocao.NomePromocao, Promocao.Imagem FROM Promocao INNER JOIN Pedido ON Promocao.idPromocao = Pedido.idPromocao where idUser=@idUser">
                          <SelectParameters>
                              <asp:SessionParameter Name="idUser" SessionField="idUser" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                      <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                          ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                          SelectCommand="SELECT Pedido.Data, Pedido.Morada, Pedido.Localidade, Pedido.CodPostal, Pedido.ModPag, Pedido.Troco From Pedido where idUser=@idUser">
                          <SelectParameters>
                              <asp:SessionParameter Name="idUser" SessionField="idUser" />
                          </SelectParameters>
                      </asp:SqlDataSource>
                      <br />
                  </td>
                  <td>
                      &nbsp;
                  </td>
              </tr>
          </table>
    </asp:Panel>

    <br/>


  <ajaxToolkit:CollapsiblePanelExtender ID="cpeDesc" runat="Server"
        TargetControlID="description_ContentPanel"
        ExpandControlID="description_HeaderPanel"
        CollapseControlID="description_HeaderPanel"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="description_ToggleImage" /> 


    <ajaxToolkit:CollapsiblePanelExtender ID="cpeProperties" runat="Server"
        TargetControlID="properties_ContentPanel"
        ExpandControlID="properties_HeaderPanel"
        CollapseControlID="properties_HeaderPanel"
        Collapsed="True"        
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="properties_ToggleImage" />


        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderPontos" runat="Server"
        TargetControlID="PanelContentPontos"
        ExpandControlID="PanelPontos"
        CollapseControlID="PanelPontos"
        Collapsed="True"        
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="ImageButtonPontos" />

        <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderPedidos" runat="Server"
        TargetControlID="PanelPedidosContent"
        ExpandControlID="PanelPedidos"
        CollapseControlID="PanelPedidos"
        Collapsed="True"        
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="ImageButtonPedidos" />

 </asp:Content>

