<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="gerirvendas.aspx.cs" Inherits="gerirvendas" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

<ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager1" />
    <div align="center">
        <asp:LinkButton ID="LinkButton3" runat="server" Font-Underline="True" 
            PostBackUrl="~/gestao.aspx">Voltar para Administração</asp:LinkButton>
    </div>
    <br />
    <br />
     

        <asp:Panel ID="PanelEstatisticas" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="Description_ToggleImage" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;
           Estatísticas das Vendas        
        </div>
    </asp:Panel>

        <asp:Panel id="PanelEstatisticasContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="947px">
        <br />
	    <table style="width: 100%; height: 11px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <div align="center" style="font-weight: bold">
                        Seleccione o ano que pretende<br />
                        <br />
                        <asp:DropDownList ID="DropDownListAno" runat="server" AutoPostBack="True">
                            <asp:ListItem>2011</asp:ListItem>
                            <asp:ListItem>2012</asp:ListItem>
                            <asp:ListItem>2013</asp:ListItem>
                            <asp:ListItem>2014</asp:ListItem>
                            <asp:ListItem>2015</asp:ListItem>
                            <asp:ListItem>2016</asp:ListItem>
                            <asp:ListItem>2017</asp:ListItem>
                            <asp:ListItem>2018</asp:ListItem>
                            <asp:ListItem>2019</asp:ListItem>
                            <asp:ListItem>2020</asp:ListItem>
                            <asp:ListItem>2021</asp:ListItem>
                            <asp:ListItem>2022</asp:ListItem>
                            <asp:ListItem>2023</asp:ListItem>
                            <asp:ListItem>2024</asp:ListItem>
                            <asp:ListItem>2025</asp:ListItem>
                            <asp:ListItem>2026</asp:ListItem>
                            <asp:ListItem>2027</asp:ListItem>
                            <asp:ListItem>2028</asp:ListItem>
                            <asp:ListItem>2029</asp:ListItem>
                            <asp:ListItem>2030</asp:ListItem>
                            <asp:ListItem>2031</asp:ListItem>
                            <asp:ListItem>2032</asp:ListItem>
                            <asp:ListItem>2033</asp:ListItem>
                            <asp:ListItem>2034</asp:ListItem>
                            <asp:ListItem>2035</asp:ListItem>
                            <asp:ListItem>2036</asp:ListItem>
                            <asp:ListItem>2037</asp:ListItem>
                            <asp:ListItem>2038</asp:ListItem>
                            <asp:ListItem>2039</asp:ListItem>
                            <asp:ListItem>2040</asp:ListItem>
                            <asp:ListItem>2041</asp:ListItem>
                            <asp:ListItem>2042</asp:ListItem>
                            <asp:ListItem>2043</asp:ListItem>
                            <asp:ListItem>2044</asp:ListItem>
                            <asp:ListItem>2045</asp:ListItem>
                            <asp:ListItem>2046</asp:ListItem>
                            <asp:ListItem>2047</asp:ListItem>
                            <asp:ListItem>2048</asp:ListItem>
                            <asp:ListItem>2049</asp:ListItem>
                            <asp:ListItem>2050</asp:ListItem>
                            <asp:ListItem>2051</asp:ListItem>
                            <asp:ListItem>2052</asp:ListItem>
                            <asp:ListItem>2053</asp:ListItem>
                            <asp:ListItem>2054</asp:ListItem>
                            <asp:ListItem>2055</asp:ListItem>
                            <asp:ListItem>2056</asp:ListItem>
                            <asp:ListItem>2057</asp:ListItem>
                            <asp:ListItem>2058</asp:ListItem>
                            <asp:ListItem>2059</asp:ListItem>
                            <asp:ListItem>2060</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT        DATENAME(month, DATEADD(dd, - DATEDIFF(dd, Data, 1), 1)) AS Mês, COUNT(*) AS [Nº Pedido]
FROM            Pedido
WHERE        (DATENAME(year, DATEADD(dd, - DATEDIFF(dd, Data, 1), 1)) = @data)
GROUP BY DATENAME(month, DATEADD(dd, - DATEDIFF(dd, Data, 1), 1))
ORDER BY [Nº Pedido]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownListAno" Name="data" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <br />
                        <asp:Panel ID="Panel3" runat="server" BorderStyle="Ridge" BorderWidth="5px" 
                            Width="299px">
                            <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" 
                                Palette="Chocolate">
                                <Series>
                                    <asp:Series Name="Series1" XValueMember="Mês" YValueMembers="Nº Pedido" 
                                        YValuesPerPoint="2">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                        <AxisY Title="Nº Pedidos">
                                        </AxisY>
                                        <AxisX Title="Mês">
                                        </AxisX>
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </asp:Panel>
                    </div>
                </td>
                <td>
                    &nbsp;</td>
                    <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <div align="center" style="font-weight: bold; height: 421px;">
                        Seleccione o mês que pretende
                        <br />
                        <br />
                        <asp:DropDownList ID="DropDownMes" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="January">Janeiro</asp:ListItem>
                            <asp:ListItem Value="February">Fevereiro</asp:ListItem>
                            <asp:ListItem Value="March">Março</asp:ListItem>
                            <asp:ListItem Value="April">Abril</asp:ListItem>
                            <asp:ListItem Value="May">Maio</asp:ListItem>
                            <asp:ListItem Value="June">Junho</asp:ListItem>
                            <asp:ListItem Value="July">Julho</asp:ListItem>
                            <asp:ListItem Value="August">Agosto</asp:ListItem>
                            <asp:ListItem Value="September">Setembro</asp:ListItem>
                            <asp:ListItem Value="October">Outubro</asp:ListItem>
                            <asp:ListItem Value="November">Novembro</asp:ListItem>
                            <asp:ListItem Value="December">Dezembro</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT        DATENAME(weekday, DATEADD(dd, - DATEDIFF(dd, Data, 1), 1)) AS Semana, COUNT(*) AS [Nº Pedido]
FROM            Pedido
WHERE        (DATENAME(month, DATEADD(dd, - DATEDIFF(dd, Data, 1), 1)) = @data)
GROUP BY DATENAME(weekday, DATEADD(dd, - DATEDIFF(dd, Data, 1), 1))
ORDER BY [Nº Pedido]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownMes" Name="data" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <asp:Panel ID="Panel4" runat="server" BorderStyle="Ridge" BorderWidth="5px" 
                            Width="299px">
                            <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource5" 
                                Palette="Chocolate">
                                <Series>
                                    <asp:Series Name="Series1" XValueMember="Semana" YValueMembers="Nº Pedido" 
                                        YValuesPerPoint="2">
                                    </asp:Series>
                                </Series>
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                        <AxisY Title="Nº Pedidos">
                                        </AxisY>
                                        <AxisX Title="Mês">
                                        </AxisX>
                                    </asp:ChartArea>
                                </ChartAreas>
                            </asp:Chart>
                        </asp:Panel>
                    </div>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </asp:Panel>
       
      
         <br />
     

        <asp:Panel ID="PanelClientes" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButton1" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;
           Classificação de Clientes        
        </div>
    </asp:Panel>

        <asp:Panel id="PanelClientesContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="369px">
        <br />
	    <table style="width: 100%; height: 11px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
    <asp:SqlDataSource ID="SqlDataSourceUser" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="
SELECT DENSE_RANK() OVER (ORDER BY  [Nº Pedidos]
 DESC) AS [Posição], idUser,   [Nº Pedidos]


FROM (SELECT idUser, COUNT(*) AS [Nº Pedidos]

FROM Pedido Group BY idUser) AS Cust"></asp:SqlDataSource>
    <asp:GridView ID="GridViewUser" runat="server" BackColor="#D3A77A" 
        DataSourceID="SqlDataSourceUser" AutoGenerateColumns="False" 
        DataKeyNames="idUser" 
        onselectedindexchanged="GridViewUser_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" Text="Ver Informação"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Posição" HeaderText="Posição" ReadOnly="True" 
                SortExpression="Posição" />
            <asp:BoundField DataField="idUser" HeaderText="Id do Utilizador" 
                SortExpression="idUser" />
            <asp:BoundField DataField="Nº Pedidos" HeaderText="Nº Pedidos" ReadOnly="True" 
                SortExpression="Nº Pedidos" />
        </Columns>
        <SelectedRowStyle BackColor="#FFFBD6" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT idUser, NomeUser, Morada, Localidade, Telemovel, Telefone, CodPostal, Email, nPontos, DataRegisto FROM Utilizador WHERE (idUser = @iduser)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewUser" Name="idUser" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <div id="divRankingClientes" runat="server">
    <asp:Panel ID="Panel2" runat="server" BorderStyle="Ridge" Height="110px" 
        ScrollBars="Auto" Width="639px">
        <asp:ListView ID="ListView1" runat="server" 
    DataKeyNames="idUser" DataSourceID="SqlDataSource4">
                      <EmptyDataTemplate>
               
            </EmptyDataTemplate>       
            <ItemTemplate>
                <tr style="border-style: ridge; border-color: #F0F0F0; background-color: #FFFBD6; color: #333333;">
                   
                    <td>
                        <asp:Label ID="NomeUserLabel0" runat="server" 
                    Text='<%# Eval("NomeUser") %>' />
                    </td>
                    <td>
                        <asp:Label ID="MoradaLabel0" runat="server" 
                    Text='<%# Eval("Morada") %>' />
                    </td>
                    <td>
                        <asp:Label ID="LocalidadeLabel0" runat="server" 
                    Text='<%# Eval("Localidade") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TelemovelLabel0" runat="server" 
                    Text='<%# Eval("Telemovel") %>' />
                    </td>
                    <td>
                        <asp:Label ID="TelefoneLabel0" runat="server" 
                    Text='<%# Eval("Telefone") %>' />
                    </td>
                    <td>
                        <asp:Label ID="CodPostalLabel0" runat="server" 
                    Text='<%# Eval("CodPostal") %>' />
                    </td>
                    <td>
                        <asp:Label ID="EmailLabel0" runat="server" 
                    Text='<%# Eval("Email") %>' />
                    </td>
                    <td>
                        <asp:Label ID="nPontosLabel0" runat="server" 
                    Text='<%# Eval("nPontos") %>' />
                    </td>
                    <td>
                        <asp:Label ID="DataRegistoLabel0" runat="server" 
                    Text='<%# Eval("DataRegisto") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table id="Table1" runat="server">
                    <tr id="Tr1" runat="server">
                        <td id="Td1" runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" 
                        border="1" 
                        
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="Tr2" runat="server" 
                            style="background-color: #FFFBD6;color: #333333;">
                                    
                                    <th id="Th1" runat="server">
                                        Nome</th>
                                    <th id="Th2" runat="server">
                                        Morada</th>
                                    <th id="Th3" runat="server">
                                        Localidade</th>
                                    <th id="Th4" runat="server">
                                        Telemóvel</th>
                                    <th id="Th5" runat="server">
                                        Telefone</th>
                                    <th id="Th6" runat="server">
                                        Código-Postal</th>
                                    <th id="Th7" runat="server">
                                        Email</th>
                                    <th id="Th8" runat="server">
                                        Nº de Pontos</th>
                                    <th id="Th9" runat="server">
                                        Data de Registo</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="Tr3" runat="server">
                        <td id="Td2" runat="server" 
                    
                            style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>           
        </asp:ListView>
    </asp:Panel>
    </div>
    <br /></td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </asp:Panel>
       

         <br />
     

        <asp:Panel ID="PanelPromo" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButton2" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;
           Classificação de Promoções      
        </div>
    </asp:Panel>

        <asp:Panel id="PanelPromoContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="379px">
        <br />
	    <table style="width: 100%; height: 11px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                       <br />
    <asp:SqlDataSource ID="SqlDataSourceProm" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT DENSE_RANK() OVER (ORDER BY [Nº Pedidos] DESC) AS [Posição], idPromocao, [Nº Pedidos] FROM (SELECT idPromocao, COUNT(*) AS [Nº Pedidos] FROM Pedido WHERE idPromocao IS NOT NULL GROUP BY idPromocao) AS Cust"></asp:SqlDataSource>
    <asp:GridView ID="GridViewProm" runat="server" BackColor="#D3A77A" 
        DataSourceID="SqlDataSourceProm" AutoGenerateColumns="False" 
        DataKeyNames="idPromocao" onselectedindexchanged="GridViewProm_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" Text="Ver detalhes"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Posição" HeaderText="Posição" ReadOnly="True" 
                SortExpression="Posição" />
            <asp:BoundField DataField="idPromocao" HeaderText="Id da Promoção" 
                SortExpression="idPromocao" />
            <asp:BoundField DataField="Nº Pedidos" HeaderText="Nº Pedidos" ReadOnly="True" 
                SortExpression="Nº Pedidos" />
        </Columns>
        <SelectedRowStyle BackColor="#FFFBD6" />
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        SelectCommand="SELECT NomePromocao, Imagem, Detalhe FROM Promocao where idPromocao=@idPromocao">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewProm" Name="idPromocao" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div id="divRankingPromo" runat="server">
    <asp:Panel ID="Panel5" runat="server" BorderStyle="Ridge" Height="97px" 
        ScrollBars="Auto" Width="407px">
        <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource6">
                                           
                      <EmptyDataTemplate>
                          <table id="Table2" runat="server" 
                              style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                              <tr>
                                  <td>
                                      No data was returned.</td>
                              </tr>
                          </table>
                      </EmptyDataTemplate>
                      
                      <ItemTemplate>
                          <tr style="background-color: #FFFBD6; color: #333333;">
                              <td>
                                  <asp:Label ID="NomePromocaoLabel" runat="server" 
                                      Text='<%# Eval("NomePromocao") %>' />
                              </td>
                              <td>
                                 <asp:Image ID="imagemLabel" runat="server"  ImageUrl='<%# "Imagem_Artigo/" + Eval("Imagem") %>'></asp:Image>
                              </td>
                              <td>
                                  <asp:Label ID="DetalheLabel" runat="server" Text='<%# Eval("Detalhe") %>' />
                              </td>
                          </tr>
                      </ItemTemplate>
                      <LayoutTemplate>
                          <table id="Table3" runat="server">
                              <tr id="Tr4" runat="server">
                                  <td id="Td3" runat="server">
                                      <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                          style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                          <tr id="Tr5" runat="server" style="background-color: #FFFBD6;color: #333333;">
                                              <th id="Th10" runat="server">
                                                  Nome</th>
                                              <th id="Th11" runat="server">
                                                  Imagem</th>
                                              <th id="Th12" runat="server">
                                                  Detalhes</th>
                                          </tr>
                                          <tr ID="itemPlaceholder" runat="server">
                                          </tr>
                                      </table>
                                  </td>
                              </tr>
                              <tr id="Tr6" runat="server">
                                  <td id="Td4" runat="server" 
                                      style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                  </td>
                              </tr>
                          </table>
                      </LayoutTemplate>
                     
        </asp:ListView>
    </asp:Panel>
    </div>
    <br />
    
    </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </asp:Panel>
       
          <br />
     

        <asp:Panel ID="PanelProd" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButton3" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;
           Classificação de Produtos       
        </div>
    </asp:Panel>

        <asp:Panel id="PanelProdContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="393px">
        <br />
	    <table style="width: 100%; height: 11px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                   
    <asp:SqlDataSource ID="SqlDataSourceProd" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT DENSE_RANK() OVER (ORDER BY [Nº Pedidos] DESC) AS [Posição], idTamArtigo, [Nº Pedidos] FROM (SELECT idTamArtigo, COUNT(*) AS [Nº Pedidos] FROM TamanhoArtigoPedido GROUP BY idTamArtigo) AS Cust"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridViewProd" runat="server" BackColor="#D3A77A" 
        DataSourceID="SqlDataSourceProd" AutoGenerateColumns="False" 
        DataKeyNames="idTamArtigo" onselectedindexchanged="GridViewProd_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" Text="Ver detalhes"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Posição" HeaderText="Posição" ReadOnly="True" 
                SortExpression="Posição" />
            <asp:BoundField DataField="idTamArtigo" HeaderText="Id do Produto" 
                SortExpression="idTamArtigo" />
            <asp:BoundField DataField="Nº Pedidos" HeaderText="Nº Pedidos" ReadOnly="True" 
                SortExpression="Nº Pedidos" />
        </Columns>
        <SelectedRowStyle BackColor="#FFFBD6" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        
        
        SelectCommand="SELECT Artigo.NomeArtigo, Artigo.Imagem, Artigo.Detalhe FROM Artigo INNER JOIN TamanhoArtigo ON Artigo.idArtigo = TamanhoArtigo.idArtigo WHERE (TamanhoArtigo.idTamArtigo = @idTamArtigo)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewProd" Name="idTamArtigo" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <div id="divRankingProd" runat="server">
    <asp:Panel ID="Panel7" runat="server" BorderStyle="Ridge" Height="97px" 
        ScrollBars="Auto" Width="407px">
        <asp:ListView ID="ListView4" runat="server" DataSourceID="SqlDataSource8">
                     
                      <ItemTemplate>
                          <tr style="background-color: #FFFBD6; color: #333333;">
                              <td>
                                  <asp:Label ID="NomeArtigoLabel" runat="server" 
                                      Text='<%# Eval("NomeArtigo") %>' />
                              </td>
                              <td>
                                   <asp:Image ID="imagemLabel" runat="server"  ImageUrl='<%# "Imagem_Artigo/" + Eval("Imagem") %>'></asp:Image>
                              </td>
                              <td>
                                  <asp:Label ID="DetalheLabel" runat="server" Text='<%# Eval("Detalhe") %>' />
                              </td>
                          </tr>
                      </ItemTemplate>
                      <LayoutTemplate>
                          <table id="Table4" runat="server">
                              <tr id="Tr7" runat="server">
                                  <td id="Td5" runat="server">
                                      <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                          style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                          <tr id="Tr8" runat="server" style="background-color: #FFFBD6;color: #333333;">
                                              <th id="Th13" runat="server">
                                                  Nome</th>
                                              <th id="Th14" runat="server">
                                                  Imagem</th>
                                              <th id="Th15" runat="server">
                                                  Detalhes</th>
                                          </tr>
                                          <tr ID="itemPlaceholder" runat="server">
                                          </tr>
                                      </table>
                                  </td>
                              </tr>
                              <tr id="Tr9" runat="server">
                                  <td id="Td6" runat="server" 
                                      style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                  </td>
                              </tr>
                          </table>
                      </LayoutTemplate>
                     
        </asp:ListView>
    </asp:Panel>
    </div>
    <br /></td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </asp:Panel>
       
         <br />
     

        <asp:Panel ID="PanelMenu" runat="server" style="cursor: pointer;" 
        Width="683px">
        <div style="font-weight: bold; background-color: Maroon; color: #FFFFFF;">
            <asp:ImageButton ID="ImageButton4" runat="server" 
                ImageUrl="~/Images/expand.jpg" AlternateText="expand" />&nbsp;
           Classificação de Menu       
        </div>
    </asp:Panel>

        <asp:Panel id="PanelMenuContent" runat="server" 
        style="overflow:hidden;  background-color:#FFFBD6;" Width="683px" 
        Height="349px">
        <br />
	    <table style="width: 100%; height: 11px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td align="center">
                    <asp:SqlDataSource ID="SqlDataSourceMenu" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT DENSE_RANK() OVER (ORDER BY [Nº Pedidos] DESC) AS [Posição], idMenu, [Nº Pedidos] FROM (SELECT idMenu, COUNT(*) AS [Nº Pedidos] FROM MenuPedido GROUP BY idMenu) AS Cust">
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridViewMenu" runat="server" AutoGenerateColumns="False" 
                        BackColor="#D3A77A" DataKeyNames="idMenu" DataSourceID="SqlDataSourceMenu" 
                        onselectedindexchanged="GridViewMenu_SelectedIndexChanged">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                        CommandName="Select" Text="Ver detalhes"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Posição" HeaderText="Posição" ReadOnly="True" 
                                SortExpression="Posição" />
                            <asp:BoundField DataField="idMenu" HeaderText="Id do Menu" 
                                SortExpression="idMenu" />
                            <asp:BoundField DataField="Nº Pedidos" HeaderText="Nº Pedidos" ReadOnly="True" 
                                SortExpression="Nº Pedidos" />
                        </Columns>
                        <SelectedRowStyle BackColor="#FFFBD6" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT NomeMenu, Preco, Detalhe, Imagem FROM Menu where idMenu=@idMenu">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="GridViewMenu" Name="idMenu" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <div ID="divRankingMenu" runat="server">
                        <asp:Panel ID="Panel6" runat="server" BorderStyle="Ridge" Height="97px" 
                            ScrollBars="Auto" Width="407px">
                            <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource7">
                                                      
                                <ItemTemplate>
                                    <tr style="background-color: #FFFBD6; color: #333333;">
                                        <td>
                                            <asp:Label ID="NomeMenuLabel" runat="server" Text='<%# Eval("NomeMenu") %>' />
                                        </td>
                                        <td>
                                           <asp:Label ID="Label2" runat="server" Text='<%#  string.Format("{0:c2}",Eval("Preco"))  %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="DetalheLabel" runat="server" Text='<%# Eval("Detalhe") %>' />
                                        </td>
                                        <td>
                                              <asp:Image ID="imagemLabel" runat="server"  ImageUrl='<%# "Imagem_Artigo/" + Eval("Imagem") %>'></asp:Image>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <LayoutTemplate>
                                    <table runat="server">
                                        <tr runat="server">
                                            <td runat="server">
                                                <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                                    <tr runat="server" style="background-color: #FFFBD6;color: #333333;">
                                                        <th runat="server">
                                                            Nome</th>
                                                        <th runat="server">
                                                            Preço</th>
                                                        <th runat="server">
                                                            Detalhes</th>
                                                        <th runat="server">
                                                            Imagem</th>
                                                    </tr>
                                                    <tr ID="itemPlaceholder" runat="server">
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr runat="server">
                                            <td runat="server" 
                                                style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
                                            </td>
                                        </tr>
                                    </table>
                                </LayoutTemplate>
                                
                            </asp:ListView>
                        </asp:Panel>
                    </div>
                    <br />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </asp:Panel>
       
         <br />






          <ajaxToolkit:CollapsiblePanelExtender ID="cpeDesc" runat="Server"
        TargetControlID="PanelEstatisticasContent"
        ExpandControlID="PanelEstatisticas"
        CollapseControlID="PanelEstatisticas"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="description_ToggleImage" /> 

          <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="Server"
        TargetControlID="PanelClientesContent"
        ExpandControlID="PanelClientes"
        CollapseControlID="PanelClientes"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="description_ToggleImage" />

          <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender2" runat="Server"
        TargetControlID="PanelProdContent"
        ExpandControlID="PanelProd"
        CollapseControlID="PanelProd"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="description_ToggleImage" />


          <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender3" runat="Server"
        TargetControlID="PanelPromoContent"
        ExpandControlID="PanelPromo"
        CollapseControlID="PanelPromo"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="description_ToggleImage" />

          <ajaxToolkit:CollapsiblePanelExtender ID="CollapsiblePanelExtender4" runat="Server"
        TargetControlID="PanelMenuContent"
        ExpandControlID="PanelMenu"
        CollapseControlID="PanelMenu"
        Collapsed="True"
         ExpandedImage="~/images/collapse.jpg"
        CollapsedImage="~/images/expand.jpg"
        ImageControlID="description_ToggleImage" />




    </asp:Content>

