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
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (! (Page is Login || Page is Default || Page is Registrarse || Page is Error))
            {
                if (!Seguridad.SesionActiva(Session["trainee"]))
                    Response.Redirect("Login.aspx", false);

                if (Seguridad.SesionActiva(Session["trainee"]))
                {
                    Trainee user = new Trainee();
                    user = (Trainee)Session["trainee"];
                    imagenAvatar.ImageUrl = "~/Imagenes/" + user.ImagenPerfil;
                    lblUser.Text = user.Email;
                }
                else
                {
                    imagenAvatar.ImageUrl = "https://www.palomacornejo.com/wp-content/uploads/2021/08/no-image.jpg";
                }

            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx", false);
        }
    }
}