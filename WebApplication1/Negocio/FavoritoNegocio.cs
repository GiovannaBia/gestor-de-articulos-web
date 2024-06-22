using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
        public class FavoritoNegocio
        {
            public int InsertarNuevo(Favorito fav)
            {
                AccesoDatos datos = new AccesoDatos();
                try
                {
                    datos.setearConsulta("INSERT INTO FAVORITOS (IdUser, IdArticulo) OUTPUT INSERTED.Id VALUES (@IdUser, @IdArticulo)");
                    datos.setearParametro("@IdUser", fav.IdUser);
                    datos.setearParametro("@IdArticulo", fav.IdArticulo);

                    return datos.ejecutarAccionScalar();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    datos.cerrarConexion();
                }
            }

            public List<Favorito> Listar(int idUser)
            {
                List<Favorito> lista = new List<Favorito>();
                AccesoDatos datos = new AccesoDatos();

                try
                {
                    datos.setearConsulta("SELECT Id, IdUser, IdArticulo FROM FAVORITOS WHERE IdUser = @IdUser");
                    datos.setearParametro("@IdUser", idUser);
                    datos.ejecutarLectura();

                    while (datos.Lector.Read())
                    {
                        Favorito fav = new Favorito
                        {
                            Id = (int)datos.Lector["Id"],
                            IdUser = (int)datos.Lector["IdUser"],
                            IdArticulo = (int)datos.Lector["IdArticulo"]
                        };
                        lista.Add(fav);
                    }

                    return lista;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    datos.cerrarConexion();
                }
            }
        }
    }


