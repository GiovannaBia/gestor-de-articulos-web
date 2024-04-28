<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="WebApplication1.Login2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Te logueaste correctamente</h1>
    <br />
    <div class="row">
        <div class="col-6">
            <asp:Button Text="Pagina 1" runat="server" id="btnPagina1" OnClick="btnPagina1_Click" CssClass="btn btn-primary"/>
        </div>
        <div class="col-6">
       <!--Aca pregunto, si usuario es distinto de null, y si lo guardado en la sesion com usuario, convertido a objeto uuario, su tipo usuario es igual a admin: muestro este boton, sino no  -->
            <% if (Session["usuario"] != null && ((Dominio.Usuario)Session["usuario"]).TipoUsuario == Dominio.TipoUsuario.ADMIN) { %>
            <asp:Button Text="Pagina 2" runat="server" id="btnPagina2" OnClick="btnPagina2_Click" CssClass="btn btn-primary"/>
            <h5>Tenes que ser admin</h5>
            <% } %>
        </div>
    </div>
</asp:Content>
