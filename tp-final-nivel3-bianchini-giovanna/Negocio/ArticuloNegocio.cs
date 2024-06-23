using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data.SqlClient;
using Negocio;

namespace Negocio
{
    public class ArticuloNegocio
    {
        
        public Articulo buscarPorId(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            Articulo art = new Articulo();
            art.Categoria = new Categoria();
            art.Marca = new Marca();

            try
            {
                datos.setearConsulta("SELECT A.Id, A.Codigo, A.Nombre, A.Descripcion, M.Descripcion as MarcaNombre, C.Descripcion as CategoriaNombre, A.ImagenUrl, A.Precio FROM ARTICULOS A INNER JOIN MARCAS M ON M.Id = A.IdMarca INNER JOIN CATEGORIAS C ON C.Id = A.IdCategoria WHERE A.Id = @id");
                datos.setearParametro("@id", id);

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    art.Id = int.Parse(datos.Lector["Id"].ToString());
                    art.Codigo = datos.Lector["Codigo"].ToString();
                    art.Nombre = datos.Lector["Nombre"].ToString();
                    art.Descripcion = datos.Lector["Descripcion"].ToString();
                    art.ImagenUrl = datos.Lector["ImagenUrl"].ToString();
                    art.Marca.Descripcion = datos.Lector["MarcaNombre"].ToString();
                    art.Categoria.Descripcion = datos.Lector["CategoriaNombre"].ToString();
                    art.Precio = decimal.Parse(datos.Lector["Precio"].ToString());
                    
                }
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
            return art;
        }

        

        public List<Articulo> Listar (string id = "")
        {
            List<Articulo> lista = new List<Articulo>();

            //declarar objetos y configurarlos para poder establecer conexión
            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            SqlDataReader lector;

            try
            {
                //configuro 
                conexion.ConnectionString = "workstation id=CATALOGO_WEB_DB23.mssql.somee.com;packet size=4096;user id=giovanna23_SQLLogin_4;pwd=hgr4dkw9uo;data source=CATALOGO_WEB_DB23.mssql.somee.com;persist security info=False;initial catalog=CATALOGO_WEB_DB23;TrustServerCertificate=True";
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "SELECT A.Id, A.Codigo, A.Nombre, A.Descripcion, A.IdMarca, M.Descripcion as Marca, A.IdCategoria, C.Descripcion as Categoria, A.ImagenUrl, A.Precio FROM ARTICULOS A, MARCAS M, CATEGORIAS C where M.Id = A.IdMarca and C.Id=A.IdCategoria ";
                if (id != "")
                {
                    comando.CommandText += " AND A.Id = " + id; //si entro para modificar lleva un id
                }

                //ejecuto ese comando en la conexion asignada
                comando.Connection = conexion;
                conexion.Open();
                lector = comando.ExecuteReader();
                while (lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)lector["Id"];
                    aux.Codigo = lector["Codigo"] != DBNull.Value ? (string)lector["Codigo"] : null;
                    aux.Nombre = lector["Nombre"] != DBNull.Value ? (string)lector["Nombre"] :null;
                    aux.Descripcion = lector["Descripcion"] != DBNull.Value ? (string)lector["Descripcion"] : null;
                    aux.Marca= new Marca();
                    aux.Marca.Id = (int)lector["IdMarca"];
                    aux.Marca.Descripcion = lector["Marca"] != DBNull.Value ? (string)lector["Marca"] : null;
                    aux.Categoria = new Categoria();
                    aux.Categoria.Id = (int)lector["IdCategoria"];
                    aux.Categoria.Descripcion = lector["Categoria"] != DBNull.Value ? (string)lector["Categoria"] : null;
                    aux.ImagenUrl = lector["ImagenUrl"] != DBNull.Value ? (string)lector["ImagenUrl"] : null;
                    aux.Precio = (decimal)lector["Precio"];

                    lista.Add(aux);
                }
                
                        conexion.Close();
                        return lista;
            }
                catch (Exception ex)
            {

                throw ex;
            }
        }

        public void agregar (Articulo nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("INSERT INTO ARTICULOS (Codigo, Nombre, Descripcion, IdMarca, IdCategoria, ImagenUrl, Precio) values (@Codigo, @Nombre, @Descripcion, @IdMarca, @IdCategoria, @ImagenUrl, @Precio)" );
                datos.setearParametro("@Codigo", nuevo.Codigo);
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Descripcion", nuevo.Descripcion);
                datos.setearParametro("@IdMarca", nuevo.Marca.Id);
                datos.setearParametro("@IdCategoria", nuevo.Categoria.Id);
                datos.setearParametro("@ImagenUrl", nuevo.ImagenUrl);
                datos.setearParametro("@Precio", nuevo.Precio);

                datos.ejecutarAccion();
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

        public void modificar (Articulo articulo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE ARTICULOS SET Codigo=@Codigo, Nombre=@Nombre, Descripcion=@Descripcion, IdMarca=@IdMarca, IdCategoria=@IdCategoria, ImagenUrl=@ImagenUrl, Precio=@Precio WHERE Id=@Id");
                datos.setearParametro("@Codigo", articulo.Codigo);
                datos.setearParametro("@Nombre", articulo.Nombre);
                datos.setearParametro("@Descripcion", articulo.Descripcion);
                datos.setearParametro("@IdMarca", articulo.Marca.Id);
                datos.setearParametro("@IdCategoria", articulo.Categoria.Id);
                datos.setearParametro("@ImagenUrl", articulo.ImagenUrl);
                datos.setearParametro("@Precio", articulo.Precio);
                datos.setearParametro("@Id", articulo.Id);

                datos.ejecutarAccion();
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

        public void eliminar (int id)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearConsulta("DELETE FROM ARTICULOS WHERE Id = @Id");
                datos.setearParametro("@Id", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public List<Articulo> filtrar(string campo, string criterio, string filtro)
        {
            List<Articulo> listaFiltrada = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = @"
            SELECT A.Id, A.Codigo, A.Nombre, A.Descripcion, A.IdMarca, M.Descripcion as Marca, A.IdCategoria, C.Descripcion as Categoria, A.ImagenUrl, A.Precio 
            FROM ARTICULOS A
            JOIN MARCAS M ON M.Id = A.IdMarca
            JOIN CATEGORIAS C ON C.Id = A.IdCategoria
            WHERE 1=1";  // Siempre verdadero para facilitar la concatenación de condiciones

                // Añado condiciones específicas según el campo y criterio
                switch (campo)
                {
                    case "Precio":
                        switch (criterio)
                        {
                            case "Mayor a ":
                                consulta += " AND A.Precio > @Precio";
                                datos.setearParametro("@Precio", decimal.Parse(filtro));
                                break;
                            case "Menor a ":
                                consulta += " AND A.Precio < @Precio";
                                datos.setearParametro("@Precio", decimal.Parse(filtro));
                                break;
                            case "Igual a ":
                                consulta += " AND A.Precio = @Precio";
                                datos.setearParametro("@Precio", decimal.Parse(filtro));
                                break;
                        }
                        break;

                    case "Nombre":
                        switch (criterio)
                        {
                            case "Comienza con ":
                                consulta += " AND Nombre like '" + filtro + "%'";
                                break;
                            case "Termina con ":
                                consulta += " AND Nombre like '%" + filtro + "'";
                                break;
                            case "Contiene ":
                                consulta += " AND Nombre like '%" + filtro + "%'";
                                break;
                        }
                        break;

                    default:
                        switch (criterio)
                        {
                            case "Comienza con ":
                                consulta += " AND M.Descripcion like '" + filtro + "%'";
                                break;
                            case "Termina con ":
                                consulta += " AND M.Descripcion like '%" + filtro + "'";
                                break;
                            case "Contiene ":
                                consulta += " AND M.Descripcion like '%" + filtro + "%'";
                                break;
                        }
                        break;
                }

                // Agregar línea de depuración
                Console.WriteLine("Consulta SQL: " + consulta);

                datos.setearConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)datos.Lector["Id"];
                    aux.Codigo = datos.Lector["Codigo"] != DBNull.Value ? (string)datos.Lector["Codigo"] : null;
                    aux.Nombre = datos.Lector["Nombre"] != DBNull.Value ? (string)datos.Lector["Nombre"] : null;
                    aux.Descripcion = datos.Lector["Descripcion"] != DBNull.Value ? (string)datos.Lector["Descripcion"] : null;
                    aux.Marca = new Marca();
                    aux.Marca.Id = (int)datos.Lector["IdMarca"];
                    aux.Marca.Descripcion = datos.Lector["Marca"] != DBNull.Value ? (string)datos.Lector["Marca"] : null;
                    aux.Categoria = new Categoria();
                    aux.Categoria.Id = (int)datos.Lector["IdCategoria"];
                    aux.Categoria.Descripcion = datos.Lector["Categoria"] != DBNull.Value ? (string)datos.Lector["Categoria"] : null;
                    aux.ImagenUrl = datos.Lector["ImagenUrl"] != DBNull.Value ? (string)datos.Lector["ImagenUrl"] : null;
                    aux.Precio = (decimal)datos.Lector["Precio"];

                    listaFiltrada.Add(aux);
                }

                return listaFiltrada;
            }
            catch (Exception ex)
            {
                throw new Exception("Error en la consulta SQL: " + ex.Message);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }




        public void limpiar()
        {
            
        }
    }
}
