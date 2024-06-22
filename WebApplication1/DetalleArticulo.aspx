<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="WebApplication1.DetalleArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .img-thumbnail {
              width: 200px;
           height: 200px;
           object-fit: contain;
            transition: width 0.5s ease, height 0.5s ease;
        }
        .img-thumbnail:hover {
             width: 500px;
           height: 500px;
           object-fit: contain;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
              <div class="col-6">
                 <div class="mb-3">
                        <label for="colFormLabel" class="col-sm-2 col-form-label fw-bold">Codigo</label>
                        <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
                 </div>
              <div class="mb-3">
                   <label for="colFormLabel" class="col-sm-2 col-form-label fw-bold">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
               </div>
             <div class="mb-3">
                   <label for="colFormLabel" class="col-sm-2 col-form-label fw-bold">Descripcion</label>
                   <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
              <div class="mb-3">
                   <label for="colFormLabel" class="col-sm-2 col-form-label fw-bold">Marca</label>
                   <asp:TextBox ID="txtMarca" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
              <asp:Button ID="btnAtras" runat="server" Text="Volver" CssClass="btn btn-dark" OnClick="btnAtras_Click" />
             </div>  
             <div class="col-6">
                 <div class="mb-3">
                   <label for="colFormLabel" class="col-sm-2 col-form-label fw-bold">Categoria</label>
                   <asp:TextBox ID="txtCategoria" runat="server" CssClass="form-control"></asp:TextBox>
                 </div>
                 <div class="mb-3">
                       <label for="colFormLabel" class="col-sm-2 col-form-label fw-bold">Precio</label>
                       <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
                  </div>
                   <div class="rmb-5">
                       <asp:Image ID="txtImagen" runat="server"  CssClass="img-thumbnail" />   
                   </div>
                </div>
              </div>
              
   

</asp:Content>
