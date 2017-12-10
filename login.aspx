<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<%@ MasterType VirtualPath="~/Site.master" %>

<%@ Register assembly="BotDetect" namespace="BotDetect.Web.UI" tagprefix="BotDetect" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <br/>
  <br />
<br />
<br />
<br />
<br />
  <fieldset style="border-color: #999999; width:600px; margin:0px; padding-left:25px">
<legend> Faça o login </legend>
        <div class="log" style="width: 653px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Login ID="Login1" runat="server" LoginButtonText="Login" 
                PasswordRecoveryText="Esqueceu-se da palavra-passe?" 
                RememberMeText="Memorizar-me." TitleText="" 
                UserNameLabelText="E-mail:" FailureText="" 
                onauthenticate="Login1_Authenticate" 
                PasswordRecoveryUrl="~/recuperarpass.aspx">
                <LayoutTemplate>
                    <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                        <tr>
                            <td>
                                <table cellpadding="0">
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">E-mail:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            </td>
                                        <td>
                                            </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                ControlToValidate="Password" ErrorMessage="Password is required." 
                                                ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:CheckBox ID="RememberMe" runat="server" Text="Memorizar-me" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color:Red;">
                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Panel ID="Panel1" runat="server" DefaultButton="LoginButton">

                                            <asp:ImageButton ID="LoginButton" runat="server" 
                                                ImageUrl="~/Images/logg.png" CommandName="Login" ValidationGroup="Login1"/>

                                            </asp:Panel>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <asp:HyperLink ID="PasswordRecoveryLink" runat="server" 
                                                NavigateUrl="~/recuperarpass.aspx">Esqueceu-se da palavra-passe?</asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:Login>
        </div>
  
   </fieldset>
  
   
   &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    &nbsp;&nbsp;&nbsp;<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
&nbsp;
  
    
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">


.prompt {
  padding: 0;
  margin: 0 0 3px 0;
}

.validationDiv {
  padding: 0px 0px 5px 0px;
  margin: 8px 0px 0px 0px;
}

.correct {
  color: Green;
  font-size: 0.8em;
  font-weight: bold;
}

.incorrect {
  color: Red;
  font-size: 0.8em;
  font-weight: bold;
}

</style>
</asp:Content>


