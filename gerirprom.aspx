<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="gerirprom.aspx.cs" Inherits="gerirprom" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style14
        {
            width: 305px;
        }
        .style15
        {
            width: 209px;
        }
        .style16
        {
            width: 240px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT * FROM [Promocao]" 
                DeleteCommand="DELETE FROM [Promocao] WHERE [idPromocao] = @original_idPromocao" 
                InsertCommand="INSERT INTO [Promocao] ([NomePromocao], [Preco], [Imagem], [Detalhe], [DiaSemana], [PeriodoInicial], [PeriodoFinal], [Desconto], [nPizzasFixo], [nIngredFixo], [MaiorIgualNIngred], [MaiorIgualnPizzas], [nPedido], [NomeTamanhoPizzaOferta], [PrecoPizzaOfertaMaiorIgual], [PrecoPizzaOfertaMenorIgual], [nIngrdPizzaOfertaMaiorIgual], [nIngredPizzaOfertaFixo], [TamanhoPizzaOferta], [PrecoPizzaOferta], [nIngredPizzaOferta], [nPizzaPagar]) VALUES (@NomePromocao, @Preco, @Imagem, @Detalhe, @DiaSemana, @PeriodoInicial, @PeriodoFinal, @Desconto, @nPizzasFixo, @nIngredFixo, @MaiorIgualNIngred, @MaiorIgualnPizzas, @nPedido, @NomeTamanhoPizzaOferta, @PrecoPizzaOfertaMaiorIgual, @PrecoPizzaOfertaMenorIgual, @nIngrdPizzaOfertaMaiorIgual, @nIngredPizzaOfertaFixo, @TamanhoPizzaOferta, @PrecoPizzaOferta, @nIngredPizzaOferta, @nPizzaPagar)" 
                OldValuesParameterFormatString="original_{0}" 
                
                UpdateCommand="UPDATE [Promocao] SET [NomePromocao] = @NomePromocao, [Preco] = @Preco, [Imagem] = @Imagem, [Detalhe] = @Detalhe, [DiaSemana] = @DiaSemana, [PeriodoInicial] = @PeriodoInicial, [PeriodoFinal] = @PeriodoFinal, [Desconto] = @Desconto, [nPizzasFixo] = @nPizzasFixo, [nIngredFixo] = @nIngredFixo, [MaiorIgualNIngred] = @MaiorIgualNIngred, [MaiorIgualnPizzas] = @MaiorIgualnPizzas, [nPedido] = @nPedido, [NomeTamanhoPizzaOferta] = @NomeTamanhoPizzaOferta, [PrecoPizzaOfertaMaiorIgual] = @PrecoPizzaOfertaMaiorIgual, [PrecoPizzaOfertaMenorIgual] = @PrecoPizzaOfertaMenorIgual, [nIngrdPizzaOfertaMaiorIgual] = @nIngrdPizzaOfertaMaiorIgual, [nIngredPizzaOfertaFixo] = @nIngredPizzaOfertaFixo, [TamanhoPizzaOferta] = @TamanhoPizzaOferta, [PrecoPizzaOferta] = @PrecoPizzaOferta, [nIngredPizzaOferta] = @nIngredPizzaOferta, [nPizzaPagar] = @nPizzaPagar WHERE [idPromocao] = @original_idPromocao">
                <DeleteParameters>
                    <asp:Parameter Name="original_idPromocao" Type="Int64" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="NomePromocao" Type="String" />
                    <asp:Parameter Name="Preco" Type="Decimal" />
                    <asp:Parameter Name="Imagem" Type="String" />
                    <asp:Parameter Name="Detalhe" Type="String" />
                    <asp:Parameter Name="DiaSemana" Type="String" />
                    <asp:Parameter DbType="Date" Name="PeriodoInicial" />
                    <asp:Parameter DbType="Date" Name="PeriodoFinal" />
                    <asp:Parameter Name="Desconto" Type="Int32" />
                    <asp:Parameter Name="nPizzasFixo" Type="Int32" />
                    <asp:Parameter Name="nIngredFixo" Type="Int32" />
                    <asp:Parameter Name="MaiorIgualNIngred" Type="Int32" />
                    <asp:Parameter Name="MaiorIgualnPizzas" Type="Int32" />
                    <asp:Parameter Name="nPedido" Type="Int32" />
                    <asp:Parameter Name="NomeTamanhoPizzaOferta" Type="String" />
                    <asp:Parameter Name="PrecoPizzaOfertaMaiorIgual" Type="String" />
                    <asp:Parameter Name="PrecoPizzaOfertaMenorIgual" Type="String" />
                    <asp:Parameter Name="nIngrdPizzaOfertaMaiorIgual" Type="String" />
                    <asp:Parameter Name="nIngredPizzaOfertaFixo" Type="Int32" />
                    <asp:Parameter Name="TamanhoPizzaOferta" Type="String" />
                    <asp:Parameter Name="PrecoPizzaOferta" Type="String" />
                    <asp:Parameter Name="nIngredPizzaOferta" Type="String" />
                    <asp:Parameter Name="nPizzaPagar" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NomePromocao" Type="String" />
                    <asp:Parameter Name="Preco" Type="Decimal" />
                    <asp:Parameter Name="Imagem" Type="String" />
                    <asp:Parameter Name="Detalhe" Type="String" />
                    <asp:Parameter Name="DiaSemana" Type="String" />
                    <asp:Parameter Name="PeriodoInicial" DbType="Date" />
                    <asp:Parameter Name="PeriodoFinal" DbType="Date" />
                    <asp:Parameter Name="Desconto" Type="Int32" />
                    <asp:Parameter Name="nPizzasFixo" Type="Int32" />
                    <asp:Parameter Name="nIngredFixo" Type="Int32" />
                    <asp:Parameter Name="MaiorIgualNIngred" Type="Int32" />
                    <asp:Parameter Name="MaiorIgualnPizzas" Type="Int32" />
                    <asp:Parameter Name="nPedido" Type="Int32" />
                    <asp:Parameter Name="NomeTamanhoPizzaOferta" Type="String" />
                    <asp:Parameter Name="PrecoPizzaOfertaMaiorIgual" Type="String" />
                    <asp:Parameter Name="PrecoPizzaOfertaMenorIgual" Type="String" />
                    <asp:Parameter Name="nIngrdPizzaOfertaMaiorIgual" Type="String" />
                    <asp:Parameter Name="nIngredPizzaOfertaFixo" Type="Int32" />
                    <asp:Parameter Name="TamanhoPizzaOferta" Type="String" />
                    <asp:Parameter Name="PrecoPizzaOferta" Type="String" />
                    <asp:Parameter Name="nIngredPizzaOferta" Type="String" />
                    <asp:Parameter Name="nPizzaPagar" Type="Int32" />
                    <asp:Parameter Name="original_idPromocao" Type="Int64" />
                </UpdateParameters>
            </asp:SqlDataSource>


            <div align="center">
                <asp:LinkButton ID="LinkButton5" runat="server" Font-Underline="True" 
                    PostBackUrl="~/gestao.aspx">Voltar para Administração</asp:LinkButton>
            </div>
            <br />


         <br />

        <asp:Panel ID="PanelLista" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButtonLista" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;
           Lista de Promoções        
        </div>
    </asp:Panel>

      <asp:Panel id="PanelListaContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="478px">
        <br />
            <table style="width: 100%; height: 307px;">
                <tr>
                    <td>
                        &nbsp;</td>
                    <td align="center">
                        <asp:Panel ID="Panel3" runat="server" Height="287px" ScrollBars="Auto" 
                            Width="650px">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                BackColor="#D3A77A" DataKeyNames="idPromocao" DataSourceID="SqlDataSource3" 
                                Height="301px" Width="783px">
                                <Columns>
                                    <asp:CommandField SelectText="Seleccionar" ShowSelectButton="True" />
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                                CommandName="Edit" Text="Editar"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                                CommandName="Delete" Text="Eliminar" OnClientClick = "return confirm ('Tem a certeza que pretende removê-la?');"></asp:LinkButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="True" 
                                                CommandName="Update" Text="Actualizar"></asp:LinkButton>
                                            &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" 
                                                CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="idPromocao" HeaderText="Id" InsertVisible="False" 
                                        ReadOnly="True" SortExpression="idPromocao" />
                                    <asp:BoundField DataField="NomePromocao" HeaderText="Nome" 
                                        SortExpression="NomePromocao" />
                                    <asp:TemplateField HeaderText="Preço" SortExpression="Preco">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" 
                                                Text='<%# string.Format("{0:c2}",Eval("Preco")) %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Preco") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Imagem" SortExpression="Imagem">
                                        <ItemTemplate>
                                            <asp:Image ID="Label2" runat="server" 
                                                ImageUrl='<%# "Imagem_Artigo/" + Eval("Imagem") %>' />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Imagem") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Detalhe" HeaderText="Detalhes" 
                                        SortExpression="Detalhe" />
                                    <asp:BoundField DataField="DiaSemana" HeaderText="Dia de Semana" 
                                        ReadOnly="True" SortExpression="DiaSemana" />
                                    <asp:BoundField DataField="PeriodoInicial" HeaderText="Periodo Inicial" 
                                        ReadOnly="True" SortExpression="PeriodoInicial" />
                                    <asp:BoundField DataField="PeriodoFinal" HeaderText="Periodo Final" 
                                        ReadOnly="True" SortExpression="PeriodoFinal" />
                                    <asp:BoundField DataField="Desconto" HeaderText="Desconto" ReadOnly="True" 
                                        SortExpression="Desconto" />
                                    <asp:BoundField DataField="nPizzasFixo" 
                                        HeaderText="Número Total de Pizzas a  encomendar" ReadOnly="True" 
                                        SortExpression="nPizzasFixo" />
                                    <asp:BoundField DataField="nIngredFixo" 
                                        HeaderText="Número Total  de ingredientes da Pizza a pagar" ReadOnly="True" 
                                        SortExpression="nIngredFixo" />
                                    <asp:BoundField DataField="MaiorIgualNIngred" 
                                        HeaderText="Número Mínimo de ingredientes da Pizza a pagar" ReadOnly="True" 
                                        SortExpression="MaiorIgualNIngred" />
                                    <asp:BoundField DataField="MaiorIgualnPizzas" 
                                        HeaderText="Número Mínimo de Pizza a encomendar" ReadOnly="True" 
                                        SortExpression="MaiorIgualnPizzas" />
                                    <asp:BoundField DataField="nPedido" HeaderText="Número de Pedidos" 
                                        ReadOnly="True" SortExpression="nPedido" />
                                    <asp:BoundField DataField="NomeTamanhoPizzaOferta" 
                                        HeaderText="Tamanho da Pizza Oferta" ReadOnly="True" 
                                        SortExpression="NomeTamanhoPizzaOferta" />
                                    <asp:BoundField DataField="nIngredPizzaOfertaFixo" 
                                        HeaderText="Número Total de ingredientes da Pizza Oferta" ReadOnly="True" 
                                        SortExpression="nIngredPizzaOfertaFixo" />
                                    <asp:BoundField DataField="nPizzaPagar" HeaderText="Número de Pizza a pagar" 
                                        ReadOnly="True" SortExpression="nPizzaPagar" />
                                </Columns>
                                <SelectedRowStyle BackColor="#FFFBD6" />
                            </asp:GridView>
                        </asp:Panel>
                       
                    </td>
                    <td>
                        
                    </td>
                </tr>
                 
                
                <tr>
                    <td>
                        &nbsp;</td>
                    <td align="left">
                        <br />
                        Seleccione uma promoção para ver o(s) tamanho(s) correspondente(s).<br />
                        <br />
                        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource5" 
                            DataTextField="NomeTamanho" DataValueField="NomeTamanho"></asp:ListBox>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT Tamanho.NomeTamanho FROM Tamanho INNER JOIN TamanhoPromocao ON Tamanho.idTamanho = TamanhoPromocao.idTamanho INNER JOIN Promocao ON TamanhoPromocao.idPromocao = Promocao.idPromocao WHERE (TamanhoPromocao.idPromocao = @idpromocao)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridView1" Name="idpromocao" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                 
                
          </table>
    </asp:Panel>


        <br />

           <asp:Panel ID="description_HeaderPanel" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="Description_ToggleImage" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp; Inserir nova 
            Promoção        
        </div>
    </asp:Panel>

       <asp:Panel id="description_ContentPanel" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="2507px">
	       <table style="width:100%;">
               <tr>
                   <td class="style13">
                       &nbsp;</td>
                   <td class="style14">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
               <tr>
                   <td class="style14">
                       Imagem
                       <asp:FileUpload ID="FileUpload1" runat="server" Height="19px" Width="212px" />
                   </td>
                   <td class="style14">
                       <asp:Label ID="Label6" runat="server" ForeColor="Red" 
                           Text="É obrigatório visualizar uma imagem importada!"></asp:Label>
                       <asp:Panel ID="Panel4" runat="server" BorderStyle="Inset" Height="108px" 
                           Width="143px">
                           <asp:Image ID="ImageProm" runat="server" Height="111px" 
                               ImageUrl="~/Images/noimage.jpg" Width="144px" />
                       </asp:Panel>
                       <br />
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:ImageButton ID="ImageButtonVisualizar" runat="server" 
                           ImageUrl="~/Images/visualz.png" onclick="ImageButtonVisualizar_Click" />
                   </td>
                   <td class="style15">
                   </td>
               </tr>
               <tr>
                   <td class="style13">
                       &nbsp;</td>
                   <td class="style14">
                       &nbsp;</td>
                   <td>
                       &nbsp;</td>
               </tr>
           </table>
           &nbsp;<br />
           <br />
           &nbsp;&nbsp;&nbsp;&nbsp;
           <br />
           &nbsp;&nbsp;&nbsp;&nbsp; Nome
           <asp:TextBox ID="TextBoxNome" runat="server" Height="23px" 
               ValidationGroup="New" Width="277px"></asp:TextBox>

                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" 
                        runat="server" FilterType="LowercaseLetters, Custom, UppercaseLetters" 
                        TargetControlID="TextBoxNome" />

&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
               ControlToValidate="TextBoxNome" ErrorMessage="*" ForeColor="Red" 
               ValidationGroup="New"></asp:RequiredFieldValidator>
           <br />
           <br />
           &nbsp;Detalhes
           <asp:TextBox ID="TextBoxDetalhe" runat="server" Height="63px" 
               TextMode="MultiLine" ValidationGroup="new" Width="283px"></asp:TextBox>
           &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
               ControlToValidate="TextBoxDetalhe" ErrorMessage="*" ForeColor="Red" 
               ValidationGroup="New"></asp:RequiredFieldValidator>
           <br />
           <br />
           <br />
           &nbsp;Validade
           <asp:Label ID="LabelValidationDropDownSemana" runat="server" ForeColor="Red" 
               Text="*"></asp:Label>
           <br />
           <br />
           <asp:RadioButtonList ID="RadioButtonListValidade" runat="server" 
               AutoPostBack="True" 
               onselectedindexchanged="RadioButtonListValidade_SelectedIndexChanged">
               <asp:ListItem>Dia da semana</asp:ListItem>
               <asp:ListItem>Período</asp:ListItem>
           </asp:RadioButtonList>
           <br />
           <table style="width:100%;">
               <tr>
                   <td ID="TDSemana" runat="server">
                       <asp:DropDownList ID="DropDownListSemana" runat="server">
                           <asp:ListItem>-</asp:ListItem>
                           <asp:ListItem>Segunda-Feira</asp:ListItem>
                           <asp:ListItem>Terça-Feira</asp:ListItem>
                           <asp:ListItem>Quarta-Feira</asp:ListItem>
                           <asp:ListItem>Quinta-Feira</asp:ListItem>
                           <asp:ListItem>Sexta-Feira</asp:ListItem>
                           <asp:ListItem>Sábado</asp:ListItem>
                           <asp:ListItem>Domingo</asp:ListItem>
                       </asp:DropDownList>
                       &nbsp;<asp:Label ID="LabelValidationTextBoxPeriInicial0" runat="server" 
                           ForeColor="Red" Text="*"></asp:Label>
                       &nbsp;</td>
               </tr>
               <tr>
                   <td ID="TDPeriodo" runat="server">
                       <table style="width:100%; height: 50px;">
                           <tr>
                               <td class="style16">
                                   Desde
                                   <asp:TextBox ID="TextBoxPeriInicial" runat="server" MaxLength="10" 
                                       Enabled="False" />

                                   <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender10"  runat="server" FilterType="Numbers, Custom" TargetControlID="TextBoxPeriInicial" ValidChars="-" />
                     

                                   <ajaxToolkit:CalendarExtender ID="calendarButtonExtender" runat="server"  
                                       PopupButtonID="Image1" TargetControlID="TextBoxPeriInicial">
                                   </ajaxToolkit:CalendarExtender>
                                   <asp:ImageButton ID="Image1" runat="Server" 
                                       AlternateText="Click to show calendar" 
                                       ImageUrl="~/Images/Calendar_scheduleHS.png" />
&nbsp;<asp:Label ID="LabelValidationTextBoxPeriInicial" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               </td>
                               <td class="style14">
                                   &nbsp;Até
                                   <asp:TextBox ID="TextBoxPeriFinal" runat="server" MaxLength="10" 
                                       Enabled="False"></asp:TextBox>

                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender14"  runat="server" FilterType="Numbers, Custom" TargetControlID="TextBoxPeriFinal" ValidChars="-" />

                                   <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" 
                                       PopupButtonID="Image8" TargetControlID="TextBoxPeriFinal">
                                   </ajaxToolkit:CalendarExtender>
                                   <asp:ImageButton ID="Image8" runat="Server" 
                                       AlternateText="Click to show calendar" 
                                       ImageUrl="~/Images/Calendar_scheduleHS.png" />
                                   &nbsp;<asp:Label ID="LabelValidationTextBoxPeriFinal" runat="server" ForeColor="Red" 
                                       Text="*"></asp:Label>
                               </td>
                           </tr>
                       </table>
                   </td>
               </tr>
           </table>
           <br />
           <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="Server" 
               EnableScriptGlobalization="true" EnableScriptLocalization="true" />
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <br />
           &nbsp;Tipo de Promoção<br />
           <br />
           <ajaxToolkit:Accordion ID="MyAccordion" runat="server" AutoSize="None" 
               ContentCssClass="accordionContent" FadeTransitions="true" FramesPerSecond="40" 
               HeaderCssClass="accordionHeader" 
               HeaderSelectedCssClass="accordionHeaderSelected" RequireOpenedPane="false"  SuppressHeaderPostbacks="true" TransitionDuration="250" >
               <Panes>
                   <ajaxToolkit:AccordionPane ID="AccordionPane0" runat="server">
                       <Header>
                           <asp:Label ID="Label3" runat="server" Text="Desconto" ForeColor="White" Font-Bold="true"></asp:Label>
                       </Header>
                       <Content>
                                 
                                &nbsp;Desconto
                               <asp:TextBox ID="TextBoxDesconto0" runat="server" MaxLength="3"></asp:TextBox>

                               <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" 
                                runat="server" FilterType="Numbers" TargetControlID="TextBoxDesconto0"  />

                               &nbsp;% 
                           <asp:Label ID="LabelRequiredFieldValidatorTextBoxDesconto0" runat="server" Text="*" ForeColor="red"></asp:Label>
                       </Content>
                   </ajaxToolkit:AccordionPane>
                              
                   <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server">
                       <Header>
                            <asp:Label ID="Label5" runat="server" Text="Desconto e Número de Pizzas" ForeColor="White" Font-Bold="true"></asp:Label>
                       </Header>
                       <Content>

                           &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Desconto
                               <asp:TextBox ID="TextBoxDesconto2" runat="server" MaxLength="3"></asp:TextBox>   &nbsp;% <asp:Label ID="LabelRequiredFieldValidatorTextBoxDesconto2" runat="server" Text="*" ForeColor="red"></asp:Label>

                               <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender11" 
                                runat="server" FilterType="Numbers" TargetControlID="TextBoxDesconto2"  />

                             

                                                         <br/>


                                                                        <br />
                                        &nbsp;Número de pizzas a pagar&nbsp;<asp:TextBox 
                                            ID="TextBoxNPizzasPagar2" runat="server" MaxLength="2" Width="39px"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" 
                                            runat="server" FilterType="Numbers" TargetControlID="TextBoxNPizzasPagar2" />
                                        &nbsp;<asp:Label ID="LabelRequiredFieldValidatorTextBoxNPizzasPagar2" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                        &nbsp;
                                        <br />
                                       
                                       


                       </Content>
                   </ajaxToolkit:AccordionPane>

                   <ajaxToolkit:AccordionPane ID="AccordionPane3" runat="server">
                       <Header>
                            <asp:Label ID="Label7" runat="server" Text="Desconto e Número de Pedidos" ForeColor="White" Font-Bold="true"></asp:Label>
                       </Header>
                       <Content>

                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Desconto
                               <asp:TextBox ID="TextBoxDesconto3" runat="server" MaxLength="3"></asp:TextBox>   &nbsp;% <asp:Label ID="LabelRequiredFieldValidatorTextBoxDesconto3" runat="server" Text="*" ForeColor="red"></asp:Label>

                               <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender12" 
                                runat="server" FilterType="Numbers" TargetControlID="TextBoxDesconto3"  />

                             

                       <br/>

                                 &nbsp;Número de pedidos
                       <asp:TextBox ID="TextBoxPedidos3" runat="server"></asp:TextBox> <asp:Label ID="LabelRequiredFieldValidatorTextBoxPedidos3" runat="server" Text="*" ForeColor="red"></asp:Label>

                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" 
                        runat="server" FilterType="Numbers" TargetControlID="TextBoxPedidos3"  />

                       </Content>
                   </ajaxToolkit:AccordionPane>

                   <ajaxToolkit:AccordionPane ID="AccordionPane4" runat="server">
                       <Header>
                            <asp:Label ID="Label8" runat="server" Text="Preço" ForeColor="White" Font-Bold="true"></asp:Label>
                       </Header>
                       <Content>


                               &nbsp;Preço
                       <asp:TextBox ID="TextBoxPreco4" runat="server"></asp:TextBox> &nbsp;€ <asp:Label ID="LabelRequiredFieldValidatorTextBoxPreco4" runat="server" Text="*" ForeColor="red"></asp:Label>
                      

                        
                    &nbsp;<ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                        runat="server" FilterType="Numbers, Custom" TargetControlID="TextBoxPreco4" ValidChars="," />

                       <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                           ControlToValidate="TextBoxPreco4" ErrorMessage="Preço inválido!" ForeColor="Red" 
                           ValidationExpression="^\$?[0-9]+(.[0-9]{3})*(\,[0-9]{2})?$" ValidationGroup="New"></asp:RegularExpressionValidator>
                      
                      
                       </Content>
                   </ajaxToolkit:AccordionPane>

                    <ajaxToolkit:AccordionPane ID="AccordionPane5" runat="server">
                       <Header>
                            <asp:Label ID="Label9" runat="server" Text="Preço e Número de Pizzas" ForeColor="White" Font-Bold="true"></asp:Label>
                       </Header>
                       <Content>
                            
                            
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Preço
                       <asp:TextBox ID="TextBoxPreco5" runat="server"></asp:TextBox>  &nbsp;€ <asp:Label ID="LabelRequiredFieldValidatorTextBoxPreco5" runat="server" Text="*" ForeColor="red"></asp:Label>
                     

                     
                    &nbsp;<ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender13" 
                        runat="server" FilterType="Numbers, Custom" TargetControlID="TextBoxPreco5" ValidChars="," />

                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                           ControlToValidate="TextBoxPreco5" ErrorMessage="Preço inválido!" ForeColor="Red" 
                           ValidationExpression="^\$?[0-9]+(.[0-9]{3})*(\,[0-9]{2})?$" ValidationGroup="New"></asp:RegularExpressionValidator>
                      

                                           <br /> <br />

                      
                                              

                                              
                                       &nbsp;Número mínimo de pizzas a pedir
                                   
                                       &nbsp;<asp:DropDownList ID="DropDownListxMinimoNPizzasPedir5" runat="server">
                                           <asp:ListItem>=</asp:ListItem>
                                           <asp:ListItem>&gt;=</asp:ListItem>
                                       </asp:DropDownList>
                                             &nbsp;
                                       <asp:TextBox ID="TextBoxMinimoNPizzasPedir5" runat="server" MaxLength="2" 
                                           Width="39px"></asp:TextBox> <asp:Label ID="Label4" runat="server" Text="*" ForeColor="red"></asp:Label>

                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" 
                                        runat="server" FilterType="Numbers" TargetControlID="TextBoxMinimoNPizzasPedir5"  /> <br />


                       </Content>
                   </ajaxToolkit:AccordionPane>

                    <ajaxToolkit:AccordionPane ID="AccordionPane6" runat="server">
                       <Header>
                            <asp:Label ID="Label10" runat="server" Text="Preço e Número de Pedidos" ForeColor="White" Font-Bold="true"></asp:Label>
                       </Header>
                       <Content>
                             
                             
                       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Preço
                       <asp:TextBox ID="TextBoxPreco6" runat="server" ValidationGroup="New"></asp:TextBox>&nbsp;€ <asp:Label ID="LabelRequiredFieldValidatorTextBoxPreco6" runat="server" Text="*" ForeColor="red"></asp:Label>
                       

                      
                    &nbsp;<ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender15" 
                        runat="server" FilterType="Numbers, Custom" TargetControlID="TextBoxPreco6" ValidChars="," />

                       <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                           ControlToValidate="TextBoxPreco6" ErrorMessage="Preço inválido!" ForeColor="Red" 
                           ValidationExpression="^\$?[0-9]+(.[0-9]{3})*(\,[0-9]{2})?$" ValidationGroup="New"></asp:RegularExpressionValidator>
                      

                      <br />

                        &nbsp; Número de pedidos
                       <asp:TextBox ID="TextBoxPedidos6" runat="server"></asp:TextBox> <asp:Label ID="LabelRequiredFieldValidatorTextBoxPedidos6" runat="server" Text="*" ForeColor="red"></asp:Label>

                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender16" 
                        runat="server" FilterType="Numbers" TargetControlID="TextBoxPedidos6"  />


                       </Content>
                   </ajaxToolkit:AccordionPane>

                    <ajaxToolkit:AccordionPane ID="AccordionPane7" runat="server">
                       <Header>
                            <asp:Label ID="Label11" runat="server" Text="Número de Pizzas" ForeColor="White" Font-Bold="true"></asp:Label>
                       </Header>
                       <Content>
                             
                           
                                     
                                       &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Número mínimo de pizzas a pedir
                                   
                                       &nbsp;<asp:DropDownList ID="DropDownListnMinimoPizza7" runat="server">
                                           <asp:ListItem>=</asp:ListItem>
                                           <asp:ListItem>&gt;=</asp:ListItem>
                                       </asp:DropDownList>
                                             &nbsp;
                                       <asp:TextBox ID="TextBoxMinimoNPizzasPedir7" runat="server" MaxLength="2" 
                                           Width="39px"></asp:TextBox> <asp:Label ID="LabelRequiredFieldValidatorTextBoxMinimoNPizzasPedir7" runat="server" Text="*" ForeColor="red"></asp:Label>

                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender17" 
                                        runat="server" FilterType="Numbers" TargetControlID="TextBoxMinimoNPizzasPedir7"  /> <br /> <br />




                                                                    
                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Número de pizzas a pagar&nbsp;<asp:TextBox 
                                            ID="TextBoxNPizzasPagar7" runat="server" MaxLength="2" Width="39px"></asp:TextBox>
                                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender22" 
                                            runat="server" FilterType="Numbers" TargetControlID="TextBoxNPizzasPagar7" />
                                        &nbsp;<asp:Label ID="LabelRequiredFieldValidatorTextBoxNPizzasPagar7" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                        &nbsp;
                                        <br />
                                       <br />
                       
                       <table ID="TableEditarIngred7" runat="server" 
                           style="width:100%; height: 99px;">
                           <tr>
                               <td>
                                   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  Número de ingredientes da pizza oferta
                                   &nbsp;<asp:DropDownList ID="DropDownListNIngredPizzaOferta7" runat="server">
                                       <asp:ListItem>=</asp:ListItem>
                                       <asp:ListItem>&gt;=</asp:ListItem>
                                   </asp:DropDownList>
                                   &nbsp;&nbsp;
                                   <asp:TextBox ID="TextBoxNumIngredPizzaOferta7" runat="server" MaxLength="2" Width="38px"></asp:TextBox> 
                                       
                                   <asp:Label ID="LabelRequiredFieldValidatorTextBoxNumIngredPizzaOferta7" runat="server" Text="*" ForeColor="red"></asp:Label>
                                   <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender6" 
                                       runat="server" FilterType="Numbers" 
                                       TargetControlID="TextBoxNumIngredPizzaOferta7" />
                                   &nbsp;
                                   <br />
                                   <br />
                                    Preço da pizza oferta em relação a pizza a pagar 
                                  
                                   &nbsp;<asp:DropDownList ID="DropDownEditarIngredRela7" runat="server"> 
                                       <asp:ListItem>&gt;=</asp:ListItem>
                                       <asp:ListItem>&lt;=</asp:ListItem>
                                   </asp:DropDownList> &nbsp;  <asp:Label ID="LabelRequiredFieldValidatorDropDownEditarIngredRela7" runat="server" Text="*" ForeColor="red"></asp:Label>
                                   <br />
                                   <br />
                                    Tamanho da pizza oferta  <asp:Label ID="LabelRequiredFieldValidatorRadioButtonListTamanhoPOferta7" runat="server" Text="*" ForeColor="red"></asp:Label>  <br />
                                   <br />
                                   <asp:RadioButtonList ID="RadioButtonListTamanhoPOferta7" runat="server" 
                                       AppendDataBoundItems="True" DataSourceID="SqlDataSource4" 
                                       DataTextField="NomeTamanho" DataValueField="idTamanho">
                                       <asp:ListItem>Qualquer Tamanho</asp:ListItem>
                                   </asp:RadioButtonList>
                               </td>
                           </tr>
                       </table>
                  
                                        



                       </Content>
                   </ajaxToolkit:AccordionPane>

                    <ajaxToolkit:AccordionPane ID="AccordionPane8" runat="server">
                       <Header>
                            <asp:Label ID="Label12" runat="server" Text="Número de Pizzas e Número de Pedidos" ForeColor="White" Font-Bold="true"></asp:Label>
                       </Header>
                       <Content>
                          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Número de pedidos
                       <asp:TextBox ID="TextBoxPedidos8" runat="server"></asp:TextBox> <asp:Label ID="LabelRequiredFieldValidatorTextBoxPedidos8" runat="server" Text="*" ForeColor="red"></asp:Label>

                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender19" 
                        runat="server" FilterType="Numbers" TargetControlID="TextBoxPedidos8"  />

                                   <br />
                                   <br />
                                    
                         
                                  &nbsp; &nbsp; &nbsp;&nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Número mínimo de pizzas a pedir
                                      
                                       &nbsp;<asp:DropDownList ID="DropDownListnMinimoPizza8" runat="server">
                                           <asp:ListItem>=</asp:ListItem>
                                           <asp:ListItem>&gt;=</asp:ListItem>
                                       </asp:DropDownList>
                                             &nbsp;
                                       <asp:TextBox ID="TextBoxnMinimoPizza8" runat="server" MaxLength="2" 
                                           Width="39px"></asp:TextBox> <asp:Label ID="LabelRequiredFieldValidatorTextBoxnMinimoPizza8" runat="server" Text="*" ForeColor="red"></asp:Label>

                                                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender18" 
                                        runat="server" FilterType="Numbers" TargetControlID="TextBoxnMinimoPizza8"  />

                                       <br />
                                   <br />

                        
                    &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Número de pizzas a pagar&nbsp;&nbsp;<asp:TextBox 
                            ID="TextBoxNPizzasPagar8" runat="server" MaxLength="2" Width="39px"></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender24" 
                            runat="server" FilterType="Numbers" TargetControlID="TextBoxNPizzasPagar8" />
                        &nbsp;<asp:Label ID="LabelRequiredFieldValidatorTextBoxNPizzasPagar8" runat="server" ForeColor="Red" Text="*"></asp:Label>
                        &nbsp;
                        <br />
                       
                     <br />                   
                       
                       <table ID="TableIngredPizzaOferta" runat="server" 
                           style="width:100%; height: 99px;">
                           <tr>
                               <td>
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Número de ingredientes da pizza oferta
                                
                                   &nbsp;<asp:DropDownList ID="DropDownListNIngrdPizzaOferta8" runat="server">
                                       <asp:ListItem>=</asp:ListItem>
                                       <asp:ListItem>&gt;=</asp:ListItem>
                                   </asp:DropDownList>
                                   &nbsp;&nbsp;
                                   <asp:TextBox ID="TextBoxNIngrdPizzaOferta8" runat="server" MaxLength="2" 
                                       Width="38px"></asp:TextBox>  <asp:Label ID="LabelRequiredFieldValidatorTextBoxNIngrdPizzaOferta8" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                   <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" 
                                       runat="server" FilterType="Numbers" 
                                       TargetControlID="TextBoxNIngrdPizzaOferta8" />
                                   &nbsp;
                                   <br />
                                   <br />
                                    &nbsp;Preço da pizza oferta em relação a pizza a pagar 
                                 
                                   &nbsp;<asp:DropDownList ID="DropDownListPrecoPizzaOfertaRelat8" runat="server">
                                       <asp:ListItem>&gt;=</asp:ListItem>
                                       <asp:ListItem>&lt;=</asp:ListItem>
                                   </asp:DropDownList> &nbsp;  <asp:Label ID="LabelRequiredFieldValidatorDropDownListPrecoPizzaOfertaRelat8" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                   <br />
                                   <br />
                                    Tamanho da pizza oferta <asp:Label ID="LabelRequiredFieldValidatorRadioButtonListTamanhoPizzaOferta8" runat="server" ForeColor="Red" Text="*"></asp:Label>  <br />
                                   <br />
                                   <asp:RadioButtonList ID="RadioButtonListTamanhoPizzaOferta8" runat="server" 
                                       AppendDataBoundItems="True" DataSourceID="SqlDataSource4" 
                                       DataTextField="NomeTamanho" DataValueField="idTamanho">
                                       <asp:ListItem>Qualquer Tamanho</asp:ListItem>
                                   </asp:RadioButtonList>
                               </td>
                           </tr>
                       </table>
                       
                        </Content>
                   </ajaxToolkit:AccordionPane>

               </Panes>
           </ajaxToolkit:Accordion>           
       

           <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
               ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
               
               SelectCommand="SELECT [NomeTamanho], [idTamanho] FROM [Tamanho] where nometamanho&lt;&gt;'nenhum'">
           </asp:SqlDataSource>


            <br />


            &nbsp; Tamanho(s) da pizza a pagar
           <asp:Label ID="LabelValidationTamPizzPagar" runat="server" ForeColor="Red" 
               Text="*"></asp:Label>
                        <br />
                        <asp:CheckBoxList ID="CheckBoxListTamanhoPizzaPagar" runat="server" 
               DataSourceID="SqlDataSource4" DataTextField="NomeTamanho" 
               DataValueField="idTamanho">
           </asp:CheckBoxList>
           <br />
           &nbsp; Número de ingredientes da pizza a pagar &nbsp;&nbsp;<asp:DropDownList 
               ID="DropDownListNIngredPizzaPagar" runat="server">
                            <asp:ListItem>=</asp:ListItem>
                            <asp:ListItem>&gt;=</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;
                        <asp:TextBox ID="TextBoxNIngredPizzaPagar" runat="server" MaxLength="2" 
                            Width="40px" ValidationGroup="New"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
               runat="server" ControlToValidate="TextBoxNIngredPizzaPagar" ErrorMessage="*" 
               ForeColor="Red" ValidationGroup="New"></asp:RequiredFieldValidator>

               <ajaxToolkit:FilteredTextBoxExtender
           ID="FilteredTextBoxExtender8"
           runat="server"
           TargetControlID="TextBoxNIngredPizzaPagar"
           FilterType="Numbers" />
          
          
&nbsp;<br />
           <br />
           <asp:Panel ID="Panel5" runat="server" DefaultButton="ImageButtonInserir" >
                            <div align="center">
                                                        <asp:ImageButton ID="ImageButtonInserir" runat="server" 
                   ImageUrl="~/Images/inseriir.png" onclick="ImageButtonInserir_Click" 
                   ValidationGroup="New" />
           
           
                            </div>
           
           </asp:Panel>
           <br />
    </asp:Panel>

    <br />

    </div>


     <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtenderLista" runat="Server"
        TargetControlID="PanelListaContent"
        ExpandControlID="PanelLista"
        CollapseControlID="PanelLista"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="ImageButtonLista" /> 

          <ajaxToolkit:CollapsiblePanelExtender ID="cpeDesc" runat="Server"
        TargetControlID="description_ContentPanel"
        ExpandControlID="description_HeaderPanel"
        CollapseControlID="description_HeaderPanel"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="description_ToggleImage" /> 




</asp:Content>

