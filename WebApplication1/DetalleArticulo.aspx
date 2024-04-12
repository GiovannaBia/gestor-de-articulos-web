<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="WebApplication1.DetalleArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
              <div class="col-6">
                 <div class="mb-3">
                        <label for="colFormLabel" class="col-sm-2 col-form-label">Codigo</label>
                        <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control"></asp:TextBox>
                 </div>
              <div class="mb-3">
                   <label for="colFormLabel" class="col-sm-2 col-form-label">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
               </div>
             <div class="mb-3">
                   <label for="colFormLabel" class="col-sm-2 col-form-label">Descripcion</label>
                   <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
              <div class="mb-3">
                   <label for="colFormLabel" class="col-sm-2 col-form-label">Marca</label>
                   <asp:TextBox ID="txtMarca" runat="server" CssClass="form-control"></asp:TextBox>
              </div>
              <asp:Button ID="btnAtras" runat="server" Text="Atras" CssClass="btn btn-primary" OnClick="btnAtras_Click" />
             </div>  
             <div class="col-6">
                 <div class="mb-3">
                   <label for="colFormLabel" class="col-sm-2 col-form-label">Categoria</label>
                   <asp:TextBox ID="txtCategoria" runat="server" CssClass="form-control"></asp:TextBox>
                 </div>
                 <div class="mb-3">
                       <label for="colFormLabel" class="col-sm-2 col-form-label">Precio</label>
                       <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
                  </div>
                   <div class="rmb-5">
                       <asp:Image ID="txtImagen" runat="server"  CssClass="img-thumbnail" Width="60%"/>   
                   </div>
                </div>
              </div>
              
   

</asp:Content>
