<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ListaArticulo.aspx.cs" Inherits="WebApplication1.ListaArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <h1>Lista de articulos</h1>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="row">
                      <div class="col-6">
                          <div class="mb-3">
                              <asp:Label runat="server" text="Filtrar" ></asp:Label>
                              <asp:TextBox runat="server" ID="txtFiltro" AutoPostBack="true" CssClass="form-control" OnTextChanged="txtFiltro_TextChanged"/>
                          </div>
                      </div>
                  </div>
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
                          <asp:BoundField HeaderText="Precio" DataField="Precio" />
                          <asp:CommandField HeaderText="Editar"  ShowSelectButton="true" SelectText="✍️" />
                      </Columns>
                  </asp:GridView>
                <asp:Button runat="server" ID="btnAgregar" OnClick="btnAgregar_Click" Text="Agregar" CssClass="btn-dark" />
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
</asp:Content>
