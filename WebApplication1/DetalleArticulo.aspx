<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetalleArticulo.aspx.cs" Inherits="WebApplication1.DetalleArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
  <div class="row mb-3">
        <label for="colFormLabel" class="col-sm-2 col-form-label">Codigo</label>
        <div class="col-sm-10">
             <asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox>
        </div>
   </div>
   <div class="row mb-3">
        <label for="colFormLabel" class="col-sm-2 col-form-label">Nombre</label>
        <div class="col-sm-10">
             <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
        </div>
   </div>
  <div class="row mb-3">
        <label for="colFormLabel" class="col-sm-2 col-form-label">Descripcion</label>
        <div class="col-sm-10">
             <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>
        </div>
   </div>
   <div class="row mb-3">
        <label for="colFormLabel" class="col-sm-2 col-form-label">Marca</label>
        <div class="col-sm-10">
              <asp:TextBox ID="txtMarca" runat="server"></asp:TextBox>
        </div>
   </div>
  <div class="row mb-3">
        <label for="colFormLabel" class="col-sm-2 col-form-label">Categoria</label>
        <div class="col-sm-10">
             <asp:TextBox ID="txtCategoria" runat="server"></asp:TextBox>
        </div>
   </div>
   <div class="row mb-3">
        <label for="colFormLabel" class="col-sm-2 col-form-label">Precio</label>
        <div class="col-sm-10">
             <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
        </div>
   </div>


    

</asp:Content>
