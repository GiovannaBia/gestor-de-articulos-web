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
    public partial class Registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                Trainee user = new Trainee();
                TraineeNegocio negocio = new TraineeNegocio();
                user.Email = txtEmail.Text;
                user.Pass = txtPass.Text;
                if (negocio.validarUser(user.Email))
                {
                    lblError.Text = "El email ya está registrado.";
                    lblError.Visible = true;
                }
                else
                {
                    user.Id = negocio.InsertarNuevo(user);
                    Session.Add("trainee", user); // Mantener la sesión abierta, para ir de página en página
                    Response.Redirect("Default.aspx", false);
                }

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx", false);
            }
        }
    }
}