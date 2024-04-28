<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="WebApplication1.Login3b" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1>Hola!</h1>
    <p>Tenes que ser admin, sino no podes entrar acap>
    <br /> 
    <asp:Button Text="Regresar" runat="server" id="btnRegresar" OnClick="btnRegresar_Click" CssClass="btn btn-primary"/>
</asp:Content>
