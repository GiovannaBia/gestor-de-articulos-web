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

                <div class="col-6">
                   <div class="mb-3">
                       <asp:CheckBox Text="Filtro avanzado" runat="server"  AutoPostBack="true" ID="chkAvanzado" OnCheckedChanged="chkAvanzado_CheckedChanged"/>
                   </div>
                </div>

                <asp:Panel ID="pnlFiltroAvanzado" runat="server" Visible="false">
                        
                        <div class="row">
                            <div class="col-3">
                                <div class="mb-3">
                                    <asp:Label Text="Campo" runat="server" />
                                    <asp:DropDownList runat="server" ID="ddlCampo" AutoPostBack="true" OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" CssClass="form-control">
                                        <asp:ListItem Text="Nombre" />
                                        <asp:ListItem Text="Marca" />
                                        <asp:ListItem Text="Precio" />
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="mb-3">
                                    <asp:Label Text="Criterio" runat="server" />
                                    <asp:DropDownList runat="server"  ID="ddlCriterio" CssClass="form-control">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="mb-3">
                                    <asp:Label Text="Filtro" runat="server" />
                                    <asp:TextBox runat="server" CssClass="form-control" ID="txtFiltroAvanzado" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-3">
                                <asp:Button Text="Buscar" runat="server" CssClass="btn btn-primary" id="btnBuscar" OnClick="btnBuscar_Click" />
                            </div>
                            <div class="col-3">
                                <asp:Button Text="Limpiar" runat="server" CssClass="btn btn-warning" ID="btnLimpiar" OnClick="btnLimpiar_Click" />
                            </div>
                        </div>
                        <br />
                </asp:Panel>

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
                <asp:Button runat="server" ID="btnAgregar" OnClick="btnAgregar_Click" Text="Agregar" CssClass="btn btn-outline-secondary" />
            </ContentTemplate>
        </asp:UpdatePanel>
        
    </div>
</asp:Content>
