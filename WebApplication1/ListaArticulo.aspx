<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ListaArticulo.aspx.cs" Inherits="WebApplication1.ListaArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        
        <h1>Lista de articulos</h1>
        <asp:GridView ID="dgvArticulos" runat="server" AutoGenerateColumns="false" CssClass="table" DataKeyNames="Id"
             OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" 
               OnPageIndexChanging="dgvArticulos_PageIndexChanging"
             AllowPaging="true" PageSize="5"> 
            <Columns>
                <asp:BoundField HeaderText="Codigo" DataField="Codigo" />
                <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
                <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                <asp:BoundField HeaderText="Marca" DataField="Marca.Descripcion" />
                <asp:BoundField HeaderText="Categoria" DataField="Categoria.Descripcion" />
                <asp:CommandField HeaderText="Editar"  ShowSelectButton="true" SelectText="✍️" />
            </Columns>
        </asp:GridView>
        <asp:Button runat="server" ID="btnAgregar" OnClick="btnAgregar_Click" Text="Agregar" CssClass="btn-dark" />
    </div>
</asp:Content>
