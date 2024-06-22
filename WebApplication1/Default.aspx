<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card-img-top {
           width: 500px;
           height: 500px;
           object-fit: contain;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <h1>Bienvenidos a ART.1</h1>
            <p>Web de gestión de articulos</p>

            <div class="row row-cols-1 row-cols-md-3 g-4">
                <asp:Repeater runat="server" ID="repRepetidor">
                    <ItemTemplate>
                        <div class="col">
                            <div class="card">
                                <img src=" <%#Eval("ImagenUrl")%> " class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title"> <%#Eval("Nombre")%> </h5>
                                    <p class="card-text"> <%#Eval("Descripcion" )%> </p>
                                    <a href="DetalleArticulo.aspx?id=<%#Eval("Id")%>" class="btn btn-outline-secondary">Ver detalles</a>
                                    <%if (Negocio.Seguridad.SesionActiva(Session["trainee"]))
                                        { %>                                             
                                            <asp:Button text="Agregar a favoritos ❤️" CssClass="btn btn-outline-danger" runat="server" Id="btnFavoritos" CommandArgument='<%#Eval("Id")%>' CommandName="ArticuloId" OnClick="btnFavoritos_Click"/>                                               
                                       <%} %>
                                      
                                    
                                </div>
                            </div>
                        </div>  
                    </ItemTemplate>
                </asp:Repeater>
               
                </div>
</asp:Content>
