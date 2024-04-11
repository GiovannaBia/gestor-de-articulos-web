<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioArticulo.aspx.cs" Inherits="WebApplication1.FormularioArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                    <asp:Label ID="Label1" runat="server" Text="Código"></asp:Label>
                    <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                    <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                    <asp:Label ID="Label3" runat="server" Text="Descripcion"></asp:Label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"  TextMode="MultiLine" ></asp:TextBox>
            </div>
            <div class="mb-3">
                    <asp:Label ID="Label4" runat="server" Text="Marca"></asp:Label>
                    <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
            <div class="mb-3">
                    <asp:Label ID="Label5" runat="server" Text="Categoría"></asp:Label>
                    <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select"></asp:DropDownList>
            </div>
             <div class="mb-3">
                    <asp:Label ID="Label6" runat="server" Text="Precio"></asp:Label>
                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn-outline-success" />
                <a href="Default.aspx">Cancelar</a>
            </div>
        </div>
    </div>




</asp:Content>
