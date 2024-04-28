<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LoginUser.aspx.cs" Inherits="WebApplication1.Login3a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1>Hola!</h1>
    <p>Pudiste entrar aca porque se logueaste</p>
    <br /> 
    <asp:Button Text="Regresar" runat="server" id="btnRegresar" OnClick="btnRegresar_Click" CssClass="btn btn-primary"/>
</asp:Content>
