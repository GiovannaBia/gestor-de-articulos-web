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
    public partial class FormularioArticulo : System.Web.UI.Page
    {
        public bool ConfirmarEliminacion {get; set;}
        protected void Page_Load(object sender, EventArgs e)
        {
            int id;
            try
            {
                ConfirmarEliminacion = false;
                // Configuracion inicial
                if (!IsPostBack)
                {
                    MarcaNegocio negoM = new MarcaNegocio();
                    List<Marca> marca = new List<Marca>();
                    ddlMarca.DataSource = negoM.listar();
                    ddlMarca.DataValueField = "Id";
                    ddlMarca.DataTextField = "Descripcion";
                    ddlMarca.DataBind();

                    CategoriaNegocio negoC = new CategoriaNegocio();
                    List<Categoria> categoria = new List<Categoria>();
                    ddlCategoria.DataSource = negoC.listar();
                    ddlCategoria.DataValueField = "Id";
                    ddlCategoria.DataTextField = "Descripcion";
                    ddlCategoria.DataBind();
                }

               
                //Configuracion para modificar pokemon

                if (Request.QueryString["id"] != null && !IsPostBack)
                {
                   
                    ArticuloNegocio negocio = new ArticuloNegocio();
                    List<Articulo> lista = negocio.Listar(Request.QueryString["id"].ToString());
                    Articulo seleccionado = lista[0];

                    // Precarga de campos
                    txtId.Text = (seleccionado.Id).ToString() ;
                    txtCodigo.Text = seleccionado.Codigo;
                    txtNombre.Text = seleccionado.Nombre;
                    txtDescripcion.Text = seleccionado.Descripcion;
                    txtUrl.Text = seleccionado.ImagenUrl;
                    ddlMarca.SelectedValue = seleccionado.Marca.Id.ToString();
                    ddlCategoria.SelectedValue = seleccionado.Categoria.Id.ToString();
                    txtPrecio.Text = seleccionado.Precio.ToString();
                    txtUrl_TextChanged(sender, e);
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                throw ex;
            }
        }

        protected void txtUrl_TextChanged(object sender, EventArgs e)
        {
            img.ImageUrl = txtUrl.Text;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Articulo nuevo = new Articulo();
                ArticuloNegocio negocio = new ArticuloNegocio();

                nuevo.Codigo = txtCodigo.Text;
                nuevo.Nombre = txtNombre.Text;
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.ImagenUrl = txtUrl.Text;
                nuevo.Precio = decimal.Parse(txtPrecio.Text);
                nuevo.Marca = new Marca();
                nuevo.Marca.Id = int.Parse(ddlMarca.SelectedValue);
                nuevo.Categoria = new Categoria();
                nuevo.Categoria.Id = int.Parse(ddlCategoria.SelectedValue);
          
                if (Request.QueryString["id"] != null )
                {
                    nuevo.Id = int.Parse(Request.QueryString["id"]);
                    negocio.modificar(nuevo);
                }
                else
                {
                    negocio.agregar(nuevo);

                }

                List<Articulo> lista = negocio.Listar();
                Session["listaArticulo"] = lista;
                

                Response.Redirect("ListaArticulo.aspx", false);

            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                throw;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmarEliminacion = true;
        }

        protected void btnConfirmaEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkConfirmaEliminacion.Checked)
                {
                    ArticuloNegocio negocio = new ArticuloNegocio();
                    negocio.eliminar(int.Parse(txtId.Text));
                    Response.Redirect("ListaArticulo.aspx");
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
    }
}