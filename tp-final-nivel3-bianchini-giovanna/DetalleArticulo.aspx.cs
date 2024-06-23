using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Dominio;

namespace WebApplication1
{
    public partial class DetalleArticulo : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = int.Parse(Request.QueryString["id"]);

                ArticuloNegocio negocio = new ArticuloNegocio();
                Articulo art = negocio.buscarPorId(id);

                // Asegúrate de que art no sea null antes de intentar asignar valores
                if (art != null)
                {
                    txtCodigo.Text = art.Codigo;
                    txtNombre.Text = art.Nombre;
                    txtDescripcion.Text = art.Descripcion;
                    txtMarca.Text = art.Marca != null ? art.Marca.ToString() : string.Empty;
                    txtCategoria.Text = art.Categoria != null ? art.Categoria.ToString() : string.Empty;
                    txtPrecio.Text = art.Precio.ToString();
                    txtImagen.ImageUrl = art.ImagenUrl;
                }
            }
        }

        protected void btnAtras_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}