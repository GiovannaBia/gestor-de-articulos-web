using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace WebApplication1
{
    public partial class Favoritos : System.Web.UI.Page
    {
        public List<Articulo> ListaFavoritos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                if (Seguridad.SesionActiva(Session["trainee"]))
                {

                    FavoritoNegocio favoritoNegocio = new FavoritoNegocio();
                    Trainee user = new Trainee();
                    user = (Trainee)Session["trainee"];

                    var favoritos = favoritoNegocio.Listar(user.Id);
                    ArticuloNegocio articuloNegocio = new ArticuloNegocio();
                    ListaFavoritos = new List<Articulo>();

                    foreach (var fav in favoritos)
                    {
                        Articulo art = articuloNegocio.buscarPorId(fav.IdArticulo);
                        if (art != null)
                        {
                            ListaFavoritos.Add(art);
                        }
                    }

                    repFavoritos.DataSource = ListaFavoritos;
                    repFavoritos.DataBind();
                }
                else
                {
                    Response.Redirect("LoginPagina.aspx", false);
                }
            }
        }
    }
    
}