<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <h1>Bienvenidos a ART.1</h1>
            <p>Web de gestión de articulos</p>

            <div class="row row-cols-1 row-cols-md-3 g-4">
                
                <%
                    foreach (Dominio.Articulo art in ListaArticulos)
                    {
                %>

                    <div class="col">
                         <div class="card">
                            <img src=" <%: art.ImagenUrl %> " class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title"> <%: art.Nombre %> </h5>
                                <p class="card-text"> <%: art.Descripcion %> </p>
                                <a href="DetalleArticulo.aspx?id=<%: art.Id %> ">Ver detalles</a>
                             </div>
                        </div>
                    </div>
               
                <% } %>
   
                </div>
</asp:Content>
