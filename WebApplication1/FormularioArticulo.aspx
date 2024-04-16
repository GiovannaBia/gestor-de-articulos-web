<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FormularioArticulo.aspx.cs" Inherits="WebApplication1.FormularioArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>

    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                    <asp:TextBox ID="txtId" runat="server" CssClass="form-control" Visible="false"></asp:TextBox>
            </div>
            <div class="mb-3">
                    <asp:Label ID="Label1" runat="server" Text="Código"></asp:Label>
                    <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="mb-3">
                    <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
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
                <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn btn-primary"  OnClick="btnAceptar_Click"/>
                <a href="Default.aspx">Cancelar</a>
            </div>
        </div>
        <div class="col-6">
            <div class="mb-3">
                <asp:Label ID="Label3" runat="server" Text="Descripcion"></asp:Label>
                <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"  TextMode="MultiLine" ></asp:TextBox>
            </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <asp:Label ID="UrlImagen" runat="server" Text="Descripcion">Url Imagen</asp:Label>
                        <asp:TextBox ID="txtUrl" runat="server" CssClass="form-control" AutoPostBack="true"  OnTextChanged="txtUrl_TextChanged"></asp:TextBox>
                    </div>
                    <asp:Image Width="60%" ID="img" runat="server"  ImageUrl="https://fotografias.correryfitness.com/clipping/cmsimages01/2019/05/29/9B89AC82-4176-4127-89A2-F38F13E0A84E/58.jpg"/>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="row">
        <div class="col-6">
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <div class="mb-3">
                        <asp:Button text="Eliminar" runat="server" ID="btnEliminar" cssclass="btn btn-primary" OnClick="btnEliminar_Click"></asp:button>
                    </div>
                    <% if (ConfirmarEliminacion)
                           { %>
                                <div class="mb-3">
                                    <asp:CheckBox Text="Confirmar eliminación" ID="chkConfirmaEliminacion" runat="server" />
                                    <asp:Button text="Eliminar" runat="server" ID="btnConfirmaEliminar" cssclass="btn btn-outline-danger" OnClick="btnConfirmaEliminar_Click"></asp:button>
                                </div>
                       <% } %>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>


</asp:Content>
