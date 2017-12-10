using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Text;





public class BLL
{   

    public class Artigo
    {
        public static bool Eliminar_Antigos()
        {

            DataTable dt = new DataTable();
            dt = SQLHelper.ExecuteDataTable("SELECT idArtigo FROM Artigo WHERE (DataCriacao < GETDATE()) AND (NomeArtigo LIKE 'Pizzacriada%')", null );
          
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ArrayList ap = new ArrayList();
                ap.Add(SQLHelper.CreateParam("idArtigo", dt.Rows[i][0]));
                SQLHelper.ExecuteNonQuery("DELETE FROM Artigo WHERE idArtigo=@idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
       
            }

            return false;
       
        }



        public static bool InserirPizza(string NomeArtigo, string Imagem, string Detalhe, ArrayList ingrdlist)
        {
            

            ArrayList ap = new ArrayList();

           
             ap.Add(SQLHelper.CreateParam("idCategoria", 2));
            ap.Add(SQLHelper.CreateParam("NomeArtigo", NomeArtigo));
            ap.Add(SQLHelper.CreateParam("Imagem", Imagem));
            ap.Add(SQLHelper.CreateParam("Detalhe", Detalhe));
            ap.Add(SQLHelper.CreateParam("DataCriacao", DateTime.Now));
            
             SQLHelper.ExecuteNonQuery("INSERT INTO Artigo(idCategoria, NomeArtigo, Imagem, Detalhe, DataCriacao) VALUES (@idCategoria, @NomeArtigo, @Imagem, @Detalhe,@DataCriacao)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

            int idArtigo = BLL.Artigo.MostrarUltId();

            for (int i = 0; i < ingrdlist.Count; i++)
            {
                BLL.Ingrediente.CriarRlArt(Convert.ToInt32(ingrdlist[i]), idArtigo, "Não");
            }

            return true;
        }


        public static bool InserirProd(string NomeArtigo, string Imagem, string Detalhe, string Volume, double Preco, int idCategoria)
        {
                    

            ArrayList ap = new ArrayList();


            ap.Add(SQLHelper.CreateParam("idCategoria", idCategoria));
            ap.Add(SQLHelper.CreateParam("NomeArtigo", NomeArtigo));
            ap.Add(SQLHelper.CreateParam("Imagem", Imagem));
            ap.Add(SQLHelper.CreateParam("Detalhe", Detalhe));
            ap.Add(SQLHelper.CreateParam("Volume", Volume));
            ap.Add(SQLHelper.CreateParam("Preco", Preco));
            ap.Add(SQLHelper.CreateParam("DataCriacao", DateTime.Now));
         
            return SQLHelper.ExecuteNonQuery("INSERT INTO Artigo(idCategoria, NomeArtigo, Imagem, Detalhe, Volume, Preco, DataCriacao) VALUES (@idCategoria, @NomeArtigo, @Imagem, @Detalhe, @Volume, @Preco, @DataCriacao)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }


        public static bool InserirIngred(string NomeArtigo, string Tipo, double Preco )
        {
           


            ArrayList ap = new ArrayList();


            
            ap.Add(SQLHelper.CreateParam("NomeArtigo", NomeArtigo));
            ap.Add(SQLHelper.CreateParam("DataCriacao", DateTime.Now));
            ap.Add(SQLHelper.CreateParam("Tipo", Tipo));
            ap.Add(SQLHelper.CreateParam("Preco", Preco));
            return SQLHelper.ExecuteNonQuery("INSERT INTO Artigo(NomeArtigo, DataCriacao, Tipo, Preco) VALUES (@NomeArtigo, @DataCriacao, @Tipo, @Preco)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }


        ////public static bool Remover(int idArtigo)
        //{
        //    ArrayList ap = new ArrayList();

        //    ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));

        //    return SQLHelper.ExecuteNonQuery("DELETE FROM Artigo WHERE idArtigo=@idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        //}


        public static bool AlterarNome(int idArtigo)
        {

            ArrayList ap = new ArrayList();


            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
            ap.Add(SQLHelper.CreateParam("NomeArtigo", "Pizza criada"+idArtigo));

            return SQLHelper.ExecuteNonQuery("UPDATE Artigo SET  NomeArtigo =@NomeArtigo  WHERE idArtigo =@idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        }


      
        public static bool AlterarNome(int idArtigo, string NomeArtigo)
        {

            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("NomeArtigo", NomeArtigo));

            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
            return SQLHelper.ExecuteNonQuery("UPDATE Artigo SET NomeArtigo =@NomeArtigo WHERE idArtigo =@idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        }

        public static DataTable MostrarTudoUltArt()
        {
            int idArtigo = Convert.ToInt32(SQLHelper.ExecuteScalar("Select MAX(idArtigo) From Artigo", null));
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
            return  SQLHelper.ExecuteDataTable("Select * From Artigo where idArtigo=@idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
              
                         
        }

        public static bool CriarPizzaAux(string NomeArtigo)
        {
            

            ArrayList ap = new ArrayList();
                        
            ap.Add(SQLHelper.CreateParam("NomeArtigo", NomeArtigo));

            return SQLHelper.ExecuteNonQuery("INSERT INTO Artigo(NomeArtigo, DataCriacao) VALUES (@NomeArtigo, GETDATE())", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

       

        public static ArrayList MostrarTudo(int idArtigo)
        {
           
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
            return SQLHelper.ExecuteReader("Select * From Artigo where idArtigo=@idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
              
        }

        public static bool AlterarnVendas(int idArtigo, int nVendas)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
            ap.Add(SQLHelper.CreateParam("nVendas", nVendas));

            return SQLHelper.ExecuteNonQuery("UPDATE Artigo SET nVendas =@nVendas  WHERE idArtigo =@idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }


        public static DataTable MostrarPorCategoria(int idCategoria)
        {
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("idCategoria", idCategoria));
            return SQLHelper.ExecuteDataTable("Select * From Artigo where idCategoria=@idCategoria", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }
    
        public static int Mostrarid(String NomeArtigo)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("NomeArtigo", NomeArtigo));
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select idArtigo From Artigo where NomeArtigo= @NomeArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static int MostrarIdCategoria(int idArtigo)
        {
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
            try
            {
                return Convert.ToInt32(SQLHelper.ExecuteScalar("Select idCategoria From Artigo where idArtigo=@idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));
            }
            catch(Exception ex)
            {
                return -1;
            }
        }

        public static ArrayList MostrarRecentes()
        {
            ArrayList ap = new ArrayList();
            return SQLHelper.ExecuteReader("Select  Top 5 NomeArtigo, Preco, imagem From Artigo order by DataCriacao DESC)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        }

        public static String MostrarNome(int idArtigo)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select NomeArtigo From Artigo where idArtigo= @idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static String MostrarImagem(int idArtigo)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select Imagem From Artigo where idArtigo= @idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static String MostrarDetalhe(int idArtigo)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select Detalhe From Artigo where idArtigo= @idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static double MostrarPreco(int idArtigo)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
            return Convert.ToDouble (SQLHelper.ExecuteScalar("Select Preco From Artigo where idArtigo= @idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }     

       

        public static String MostrarDetalhePizza(int idArtigo)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select Detalhe From Artigo where idArtigo= @idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }              

        public static int MostrarUltId()
        {
           
            return Convert.ToInt32(SQLHelper.ExecuteScalar("SELECT MAX(idArtigo) FROM Artigo", null));

        }    

    }

    public class Categoria {

        public static Boolean ExisteCategoria(string NomeCategoria)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("NomeCategoria", NomeCategoria));
            int id = Convert.ToInt32(SQLHelper.ExecuteScalar("Select idCategoria From Categoria where NomeCategoria= @NomeCategoria", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

            if (id == 0)
                return false;
            else
                return true;
        }


        public static bool Inserir(string NomeCategoria, DateTime DataCriacao)
        {
            ArrayList app = new ArrayList();
            app.Add(SQLHelper.CreateParam("NomeCategoria", NomeCategoria));
            app.Add(SQLHelper.CreateParam("DataCriacao", DataCriacao));
            return SQLHelper.ExecuteNonQuery("INSERT INTO Categoria(NomeCategoria, DataCriacao) values(@NomeCategoria, @DataCriacao)", (SqlParameter[])app.ToArray(typeof(SqlParameter)));

        }

        public static bool Remover(int idCategoria)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idCategoria", idCategoria));

            return SQLHelper.ExecuteNonQuery("DELETE FROM Categoria WHERE idCategoria=@idCategoria", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        }

    
        public static String MostrarCat(int idCategoria)
        {

            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idCategoria", idCategoria));
            return (String)SQLHelper.ExecuteScalar("Select NomeCategoria From Categoria where idCategoria= @idCategoria", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        
        }

    }

    public class Ingrediente {

        public static bool CriarRlArt(int idIngrediente, int idArtigo, string Extra)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idIngrediente", idIngrediente));
            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
            ap.Add(SQLHelper.CreateParam("Extra", Extra));

            return SQLHelper.ExecuteNonQuery("INSERT INTO Ingrediente(idIngrediente, idArtigo, Extra) VALUES (@idIngrediente, @idArtigo, @Extra)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

       
        public static bool Remover(int idArtigo)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));

            return SQLHelper.ExecuteNonQuery("DELETE FROM Ingrediente WHERE idArtigo=@idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        }

        public static bool AlterarQnt( int idArtigo, string Quantidade)
        {

            ArrayList ap = new ArrayList();

           
            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
            ap.Add(SQLHelper.CreateParam("Quantidade", Quantidade));

            return SQLHelper.ExecuteNonQuery("UPDATE Ingrediente SET  Quantidade =@Quantidade  WHERE idArtigo =@idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        }
        
        public static bool VerificaExisteIngre(int idArtigo, String Ingrediente)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));

            DataTable dt = new DataTable();
            dt = SQLHelper.ExecuteDataTable("Select idIngrediente FROM Ingrediente WHERE idArtigo=@idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
            bool verif = false;


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ArrayList app = new ArrayList();
                app.Add(SQLHelper.CreateParam("idArtigo", dt.Rows[i][0]));
                String aux=Convert.ToString(SQLHelper.ExecuteScalar("Select NomeArtigo FROM Artigo WHERE idArtigo=@idArtigo", (SqlParameter[])app.ToArray(typeof(SqlParameter))));
                if (aux == Ingrediente)
                {
                    verif = true;
                    break;
                }

            }

            return verif;

           
        }

        public static DataTable MostrarTudoIngredientes(int idArtigo)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
            return SQLHelper.ExecuteDataTable("Select idIngrediente, Extra From Ingrediente where idArtigo= @idArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static String MostrarExtra(int idArtigo, int idIngrediente)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
            ap.Add(SQLHelper.CreateParam("idIngrediente", idIngrediente));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select Extra From Ingrediente where idArtigo= @idArtigo and idIngrediente=@idIngrediente ", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }      
    }

    public class Menu {

        public static bool Inserir(string NomeMenu, double Preco, String Detalhe, ArrayList idCategorias, string Imagem)
        {
            ArrayList app = new ArrayList();
            app.Add(SQLHelper.CreateParam("NomeMenu", NomeMenu));
            app.Add(SQLHelper.CreateParam("Preco", Preco));
            app.Add(SQLHelper.CreateParam("Detalhe", Detalhe));
            app.Add(SQLHelper.CreateParam("Imagem", Imagem));
            return SQLHelper.ExecuteNonQuery("INSERT INTO Menu(NomeMenu, Preco, Detalhe, Imagem) values(@NomeMenu,@Preco, @Detalhe, @Imagem)", (SqlParameter[])app.ToArray(typeof(SqlParameter)));
           int idMenu=Convert.ToInt32(SQLHelper.ExecuteScalar("Select max(idMenu) From Menu", null));

           BLL.Menu.CriarRelat(idMenu, idCategorias);
        }


        public static bool CriarRelat(int idMenu, ArrayList idCategorias)
        {
                for (int i=0;i<idCategorias.Count;i++)
                {
                    ArrayList app = new ArrayList();
                    app.Add(SQLHelper.CreateParam("idMenu", idMenu));
                    app.Add(SQLHelper.CreateParam("idCategoria", idCategorias[i]));
                    SQLHelper.ExecuteNonQuery("INSERT INTO MenuCategoria(idMenu, idCategoria) values(@idMenu,@idCategoria)", (SqlParameter[])app.ToArray(typeof(SqlParameter)));
                   
                }

                    return true;


           
        }


        public static bool Remover(int idMenu)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idMenu", idMenu));

            return SQLHelper.ExecuteNonQuery("DELETE FROM Menu WHERE idMenu=@idMenu", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        }
       

        public static bool AlterarnVendas(int idMenu, int nVendas)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idMenu", idMenu));
            ap.Add(SQLHelper.CreateParam("nVendas", nVendas));

            return SQLHelper.ExecuteNonQuery("UPDATE Menu SET nVendas =@nVendas  WHERE idMenu =@idMenu", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static DataTable MostrarTudo(int idMenu)
        {
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("idMenu", idMenu));
            return SQLHelper.ExecuteDataTable("Select * From Menu where idMenu=@idMenu", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static String MostrarNome(int idMenu)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idMenu", idMenu));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select NomeMenu From Menu where idMenu= @idMenu", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static String MostrarMassa(int idMenu)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idMenu", idMenu));
            int idMassa= Convert.ToInt32(SQLHelper.ExecuteScalar("Select idMassa From Menu where idMenu= @idMenu", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

            return BLL.Massa.MostrarNomeMassa(idMassa);
        }


        public static String MostrarTamanho(int idMenu)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idMenu", idMenu));
           int idTamanho= Convert.ToInt32 (SQLHelper.ExecuteScalar("Select idTamanho From Menu where idMenu= @idMenu", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));
           return BLL.Tamanho.MostrarNome(idTamanho);
        }

        public static double MostrarPreco(int idMenu)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idMenu", idMenu));
            return Convert.ToDouble(SQLHelper.ExecuteScalar("Select Preco From Menu where idMenu= @idMenu", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static String MostrarDetalhe(int idMenu)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idMenu", idMenu));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select Detalhe From Menu where idMenu= @idMenu", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static String MostrarImagem(int idMenu)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idMenu", idMenu));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select Imagem From Menu where idMenu= @idMenu", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

       

    }
        
    public class MenuPedidoTamanhoArtigo {

        public static bool Inserir(int idMenuPedido, int idTamArtigo)
        {

            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("idMenuPedido", idMenuPedido));
            ap.Add(SQLHelper.CreateParam("idTamArtigo", idTamArtigo));

            return SQLHelper.ExecuteNonQuery("INSERT INTO MenuPedidoTamanhoArtigo (idMenuPedido, idTamArtigo) VALUES (@idMenuPedido, @idTamArtigo)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        
    }

    public class MenuPedido
    {
        public static bool Inserir(int idMenu, int idPedido, int Quantidade, double Preco)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idMenu", idMenu));
            ap.Add(SQLHelper.CreateParam("idPedido", idPedido));
            ap.Add(SQLHelper.CreateParam("Quantidade", Quantidade));
            ap.Add(SQLHelper.CreateParam("Preco", Preco));
            return SQLHelper.ExecuteNonQuery("INSERT INTO MenuPedido(idMenu, idPedido, Quantidade, Preco) VALUES (@idMenu, @idPedido, @Quantidade, @Preco)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static int MostrarultimoidMenuPedido()
        {
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select max(idMenuPedido) From MenuPedido", null));
        }

    }

    public class Pedido {

      
        public static bool RemoverProd(int idArtigo, string NomeMenu)
        {
            int idPedido = Convert.ToInt32(SQLHelper.ExecuteScalar("Select Max(idPedido) From Pedido", null));


            if (idArtigo != 0)
            {
                ArrayList app = new ArrayList();
                app.Add(SQLHelper.CreateParam("idPedido", idPedido));
                DataTable dt = new DataTable();
                dt = SQLHelper.ExecuteDataTable("Select idTamArtigo From TamanhoArtigoPedido where idPedido=@idPedido", (SqlParameter[])app.ToArray(typeof(SqlParameter)));
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    ArrayList arraux = new ArrayList();
                    arraux.Add(SQLHelper.CreateParam("idTamArtigo", dt.Rows[i][0]));
                    arraux.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
                    SQLHelper.ExecuteNonQuery("DELETE FROM TamanhoArtigo WHERE idTamArtigo=@idTamArtigo and idArtigo=@idArtigo", (SqlParameter[])arraux.ToArray(typeof(SqlParameter)));
                }


            }

            else
            {

                ArrayList ap = new ArrayList();
                ap.Add(SQLHelper.CreateParam("NomeMenu", NomeMenu));

                int idMenu = Convert.ToInt32(SQLHelper.ExecuteScalar("Select idMenu From Menu where NomeMenu=@NomeMenu", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));


                ArrayList app = new ArrayList();
                app.Add(SQLHelper.CreateParam("idPedido", idPedido));
                DataTable dt = new DataTable();
                dt = SQLHelper.ExecuteDataTable("Select idMenuTamArtigo From MenuTamArtigoPedido where idPedido=@idPedido", (SqlParameter[])app.ToArray(typeof(SqlParameter)));
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    ArrayList arraux = new ArrayList();
                    arraux.Add(SQLHelper.CreateParam("idMenuTamArtigo", dt.Rows[i][0]));
                    arraux.Add(SQLHelper.CreateParam("idMenu", idMenu));
                    SQLHelper.ExecuteNonQuery("DELETE FROM MenuTamanhoArtigo WHERE idMenuTamArtigo=@idMenuTamArtigo and idMenu=@idMenu", (SqlParameter[])arraux.ToArray(typeof(SqlParameter)));
                }


            }
            return true;
            
        }

        public static int MostrarUltimodPedido()
        {
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select max(idPedido) From Pedido", null));
        }

        public static bool Remover(int idPedido)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idPedido", idPedido));

            return SQLHelper.ExecuteNonQuery("DELETE FROM Pedido WHERE idPedido=@idPedido", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        }

        public static bool Inserir(int idPromocao, int idUser, DateTime Data, String Morada, String Localidade, String CodPostal, string ModPag, string Troco, int idPontos)
        {
            if (Troco == "")
                Troco = "Não";

            
                if (idPromocao != 0 && idPontos == 0)
                {

                    ArrayList app = new ArrayList();

                    app.Add(SQLHelper.CreateParam("idUser", idUser));
                    app.Add(SQLHelper.CreateParam("Data", Data));
                    app.Add(SQLHelper.CreateParam("Morada", Morada));
                    app.Add(SQLHelper.CreateParam("Localidade", Localidade));
                    app.Add(SQLHelper.CreateParam("CodPostal", CodPostal));
                    app.Add(SQLHelper.CreateParam("idPromocao", idPromocao));
                    app.Add(SQLHelper.CreateParam("ModPag", ModPag));
                    app.Add(SQLHelper.CreateParam("Troco", Troco));
                    app.Add(SQLHelper.CreateParam("idPontos", idPontos));
                    return SQLHelper.ExecuteNonQuery("Insert into Pedido(idUser,Data,Morada,idPromocao,Localidade,CodPostal,ModPag,Troco) values ( @idUser,@Data,@Morada,@idPromocao, @Localidade,@CodPostal,@ModPag,@Troco)", (SqlParameter[])app.ToArray(typeof(SqlParameter)));
                }
                else
                    if (idPromocao == 0 && idPontos != 0)
                    {

                        ArrayList app = new ArrayList();

                        app.Add(SQLHelper.CreateParam("idUser", idUser));
                        app.Add(SQLHelper.CreateParam("Data", Data));
                        app.Add(SQLHelper.CreateParam("Morada", Morada));
                        app.Add(SQLHelper.CreateParam("Localidade", Localidade));
                        app.Add(SQLHelper.CreateParam("CodPostal", CodPostal));
                        app.Add(SQLHelper.CreateParam("idPromocao", idPromocao));
                        app.Add(SQLHelper.CreateParam("ModPag", ModPag));
                        app.Add(SQLHelper.CreateParam("Troco", Troco));
                        app.Add(SQLHelper.CreateParam("idPontos", idPontos));
                        return SQLHelper.ExecuteNonQuery("Insert into Pedido(idUser,Data,Morada,Localidade,CodPostal,ModPag,Troco, idPontos) values ( @idUser,@Data,@Morada, @Localidade,@CodPostal,@ModPag,@Troco,@idPontos)", (SqlParameter[])app.ToArray(typeof(SqlParameter)));
                    }
                    else
                        if (idPromocao == 0 && idPontos == 0)
                        {

                            ArrayList app = new ArrayList();

                            app.Add(SQLHelper.CreateParam("idUser", idUser));
                            app.Add(SQLHelper.CreateParam("Data", Data));
                            app.Add(SQLHelper.CreateParam("Morada", Morada));
                            app.Add(SQLHelper.CreateParam("Localidade", Localidade));
                            app.Add(SQLHelper.CreateParam("CodPostal", CodPostal));                           
                            app.Add(SQLHelper.CreateParam("ModPag", ModPag));
                            app.Add(SQLHelper.CreateParam("Troco", Troco));                        
                            return SQLHelper.ExecuteNonQuery("Insert into Pedido(idUser,Data,Morada,Localidade,CodPostal,ModPag,Troco) values ( @idUser,@Data,@Morada, @Localidade,@CodPostal,@ModPag,@Troco)", (SqlParameter[])app.ToArray(typeof(SqlParameter)));
                        }
                        else
                            return false;
            

       
        
        
        
        }


        public static bool AlterarProm(string NomePromocao)
        {
            int idPedido = Convert.ToInt32(SQLHelper.ExecuteScalar("Select max(idPedido) From Pedido", null));
            
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idPedido", idPedido));
            ap.Add(SQLHelper.CreateParam("NomePromocao", NomePromocao));

            return SQLHelper.ExecuteNonQuery("UPDATE Pedido SET NomePromocao =@NomePromocao  WHERE idPedido =@idPedido", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }



        public static bool AlterarEstado(int idPedido)
        {
            
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idPedido", idPedido));
            ap.Add(SQLHelper.CreateParam("Cancelado", "Sim"));

            return SQLHelper.ExecuteNonQuery("UPDATE Pedido SET Cancelado =@Cancelado  WHERE idPedido =@idPedido", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }



        public static bool AlterarMorada(int idPedido, string Morada)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idPedido", idPedido));
            ap.Add(SQLHelper.CreateParam("Morada", Morada));

            return SQLHelper.ExecuteNonQuery("UPDATE Pedido SET Morada =@Morada  WHERE idPedido =@idPedido", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static int nPedidoByUser(string email)
        {
            int idUser = BLL.Utilizador.MostrarId(email);

            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("idUser", idUser));
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select count(idPedido) From Pedido where idUser=@idUser", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));



        }



        public static string MostarIdPromoUser(int idUser)
        {
          
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("idUser", idUser));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select idPromocao From Pedido where idUser=@idUser", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));



        }

    }

    public class Promocao {

        public static bool Inserir(string NomePromocao, double Preco, string Imagem, string Detalhe, string DiaSemana, string PeriodoInicial, string PeriodoFinal, int Desconto, int nPizzasFixo, int nIngredFixo, int MaiorIgualNIngred, int MaiorIgualnPizzas, int nPedido, string NomeTamanhoPizzaOferta, Boolean VPrecoPizzaOfertaMaiorIgual, Boolean VPrecoPizzaOfertaMenorIgual, int nIngrdPizzaOfertaMaiorIgual, int IngredPizzaOfertaFixo, Boolean VnIngredPizzaOferta, int nPizzaPagar, ArrayList tamanho)
        {

            DateTime final = Convert.ToDateTime("1/1/1753 12:00:00");
            DateTime inicial = Convert.ToDateTime("1/1/1753 12:00:00");
            if (DiaSemana == "")
                DiaSemana = "NULL";

            if (PeriodoFinal != "")
               final = Convert.ToDateTime(PeriodoFinal);

            if (DiaSemana == "-")
                DiaSemana = "NULL";

            if (PeriodoInicial != "")
                inicial = Convert.ToDateTime(PeriodoInicial);

            if (NomeTamanhoPizzaOferta == "")
                NomeTamanhoPizzaOferta = "NULL";



            ArrayList app = new ArrayList();
            app.Add(SQLHelper.CreateParam("NomePromocao", NomePromocao));
            app.Add(SQLHelper.CreateParam("Preco", Preco));
            app.Add(SQLHelper.CreateParam("Imagem", Imagem));
            app.Add(SQLHelper.CreateParam("Detalhe", Detalhe));
            app.Add(SQLHelper.CreateParam("DiaSemana", DiaSemana));
            app.Add(SQLHelper.CreateParam("PeriodoInicial", inicial));
            app.Add(SQLHelper.CreateParam("PeriodoFinal", final));
            app.Add(SQLHelper.CreateParam("Desconto", Desconto));
            app.Add(SQLHelper.CreateParam("nPizzasFixo", nPizzasFixo));
            app.Add(SQLHelper.CreateParam("nIngredFixo", nIngredFixo));
            app.Add(SQLHelper.CreateParam("MaiorIgualNIngred", MaiorIgualNIngred));
            app.Add(SQLHelper.CreateParam("MaiorIgualnPizzas", MaiorIgualnPizzas));
            app.Add(SQLHelper.CreateParam("nPedido", nPedido));
            app.Add(SQLHelper.CreateParam("NomeTamanhoPizzaOferta", NomeTamanhoPizzaOferta));
            app.Add(SQLHelper.CreateParam("VPrecoPizzaOfertaMaiorIgual", VPrecoPizzaOfertaMaiorIgual));
            app.Add(SQLHelper.CreateParam("VPrecoPizzaOfertaMenorIgual", VPrecoPizzaOfertaMenorIgual));
            app.Add(SQLHelper.CreateParam("nIngrdPizzaOfertaMaiorIgual", nIngrdPizzaOfertaMaiorIgual));
            app.Add(SQLHelper.CreateParam("nIngredPizzaOfertaFixo", IngredPizzaOfertaFixo));
            app.Add(SQLHelper.CreateParam("VnIngredPizzaOferta", VnIngredPizzaOferta));
            app.Add(SQLHelper.CreateParam("nPizzaPagar", nPizzaPagar));

            return SQLHelper.ExecuteNonQuery("INSERT INTO Promocao(NomePromocao, Preco, Imagem, Detalhe, DiaSemana, PeriodoInicial, PeriodoFinal, Desconto, nPizzasFixo, nIngredFixo, MaiorIgualNIngred, MaiorIgualnPizzas, nPedido, NomeTamanhoPizzaOferta, VPrecoPizzaOfertaMaiorIgual, VPrecoPizzaOfertaMenorIgual, nIngrdPizzaOfertaMaiorIgual, nIngredPizzaOfertaFixo, VnIngredPizzaOferta, nPizzaPagar) values(@NomePromocao, @Preco, @Imagem, @Detalhe, @DiaSemana, @PeriodoInicial, @PeriodoFinal, @Desconto, @nPizzasFixo, @nIngredFixo, @MaiorIgualNIngred, @MaiorIgualnPizzas, @nPedido, @NomeTamanhoPizzaOferta, @VPrecoPizzaOfertaMaiorIgual, @VPrecoPizzaOfertaMenorIgual, @nIngrdPizzaOfertaMaiorIgual, @nIngredPizzaOfertaFixo, @VnIngredPizzaOferta, @nPizzaPagar)", (SqlParameter[])app.ToArray(typeof(SqlParameter)));

            int idPromocao = 0;
              idPromocao = Convert.ToInt32(SQLHelper.ExecuteScalar("Select MAX(idPromocao) From Promocao", null));

          for (int i = 0; i < tamanho.Count; i++)
              BLL.TamanhoPromocao.Inserir(idPromocao, BLL.Tamanho.Mostrarid(tamanho[i].ToString()));
          
        
        
        }

        public static bool Remover(int idPromocao)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idPromocao", idPromocao));

            return SQLHelper.ExecuteNonQuery("DELETE FROM Promocao WHERE idPromocao=@idPromocao", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        }
        
        public static int Mostrarid(string NomePromocao)
        {
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("NomePromocao", NomePromocao));
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select idPromocao From Promocao WHERE NomePromocao=@NomePromocao", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static string MostrarNome(int idPromocao)
        {
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("idPromocao", idPromocao));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select NomePromocao From Promocao WHERE idPromocao=@idPromocao", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }


        public static int MostrarCount()
        {     
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select count(*) From Promocao", null));
        }

        public static bool AlterarnVendas(int idPromocao, int nVendas)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("nVendas", nVendas));
            ap.Add(SQLHelper.CreateParam("idPromocao", idPromocao));
            return SQLHelper.ExecuteNonQuery("UPDATE Promocao SET nVendas =@nVendas WHERE idPromocao =@idPromocao", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static bool Alterar(int idPromocao, string NomePromocao, double Preco, String Imagem, String Detalhe, string Validade)
        {
         
            ArrayList app = new ArrayList();
            app.Add(SQLHelper.CreateParam("NomePromocao", NomePromocao));
            app.Add(SQLHelper.CreateParam("Preco", Preco));
            app.Add(SQLHelper.CreateParam("Imagem", Imagem));
            app.Add(SQLHelper.CreateParam("Detalhe", Detalhe));
            app.Add(SQLHelper.CreateParam("idPromocao", idPromocao));
            app.Add(SQLHelper.CreateParam("Validade", Validade));
            return SQLHelper.ExecuteNonQuery("UPDATE Promocao SET NomePromocao =@NomePromocao, Preco=@Preco, Imagem=@Imagem, Detalhe=@Detalhe, Validade=@Validade WHERE idPromocao =@idPromocao", (SqlParameter[])app.ToArray(typeof(SqlParameter)));

        }

        public static String MostrarEspecial()
        {

            return Convert.ToString(SQLHelper.ExecuteScalar("Select imagem From Promocao Order By NEWID()", null));

        }

        public static String MostrarImagem(int idPromocao)
        {
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("idPromocao", idPromocao));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select Imagem From Promocao where idPromocao=@idPromocao", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static DataTable MostrarTudo(int idPromocao)
        {
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("idPromocao", idPromocao));
            return SQLHelper.ExecuteDataTable("Select * From Promocao where idPromocao=@idPromocao", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

   
    }

    public class Tamanho {


        public static bool Inserir(string NomeTamanho, double Preco)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("NomeTamanho", NomeTamanho));
             ap.Add(SQLHelper.CreateParam("Preco", Preco));

            return SQLHelper.ExecuteNonQuery("INSERT INTO Tamanho(NomeTamanho, Preco) VALUES (@NomeTamanho, @Preco)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }


        public static bool Alterar(int idTamanho, double Preco, string NomeTamanho)
        {
            ArrayList ap = new ArrayList();

            ArrayList app = new ArrayList();
            app.Add(SQLHelper.CreateParam("Preco", Preco));
            app.Add(SQLHelper.CreateParam("idTamanho", idTamanho));
            app.Add(SQLHelper.CreateParam("NomeTamanho", NomeTamanho));
            return SQLHelper.ExecuteNonQuery("UPDATE Tamanho SET Preco =@Preco, NomeTamanho=@NomeTamanho WHERE idTamanho =@idTamanho", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static int Mostrarid(String NomeTamanho)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("NomeTamanho", NomeTamanho));
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select idTamanho From Tamanho where NomeTamanho= @NomeTamanho", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static double MostrarPreco(int idTamanho)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idTamanho", idTamanho));
            return Convert.ToDouble(SQLHelper.ExecuteScalar("Select Preco From Tamanho where idTamanho= @idTamanho", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static bool Remover(int idTamanho)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idTamanho", idTamanho));

            return SQLHelper.ExecuteNonQuery("DELETE FROM Tamanho WHERE idTamanho=@idTamanho", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        }

        public static string MostrarNome(int idTamanho)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idTamanho", idTamanho));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select NomeTamanho From Tamanho where idTamanho= @idTamanho", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

    }

    public class TamanhoArtigo {

        public static bool Inserir(int idTamanho, int idArtigo)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idTamanho", idTamanho));
            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
          
            return SQLHelper.ExecuteNonQuery("INSERT INTO TamanhoArtigo(idTamanho, idArtigo) VALUES (@idTamanho, @idArtigo)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static int MostrarUltimoIdTamArtigo()
        {

            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select MAX(idTamArtigo) From TamanhoArtigo", null));

        }

        public static bool Remover(int idTamArtigo)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idTamArtigo", idTamArtigo));

            return SQLHelper.ExecuteNonQuery("DELETE FROM TamanhoArtigo WHERE idTamArtigo=@idTamArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        }

        public static bool Alterar(int idTamArtigo, int idTamanho, int idArtigo)
        {

            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idTamanho", idTamanho));
            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));
            ap.Add(SQLHelper.CreateParam("idTamArtigo", idTamArtigo));

            return SQLHelper.ExecuteNonQuery("UPDATE TamanhoArtigo SET idTamanho =@idTamanho, idArtigo =@idArtigo  WHERE idTamArtigo =@idTamArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        }
    
    }

    public class TamanhoArtigoPedido {

        public static bool Inserir(int idTamArtigo, int idPedido, int Quantidade, double Preco)
        {
            
            ArrayList ap = new ArrayList();


            ap.Add(SQLHelper.CreateParam("idTamArtigo", idTamArtigo));
            ap.Add(SQLHelper.CreateParam("idPedido", idPedido));
            ap.Add(SQLHelper.CreateParam("Quantidade", Quantidade));
            ap.Add(SQLHelper.CreateParam("Preco", Preco));
            return SQLHelper.ExecuteNonQuery("INSERT INTO TamanhoArtigoPedido(idTamArtigo, idPedido, Quantidade, Preco) VALUES (@idTamArtigo, @idPedido, @Quantidade, @Preco)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static bool Remover(int idTamArtigo)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idTamArtigo", idTamArtigo));

            return SQLHelper.ExecuteNonQuery("DELETE FROM TamanhoArtigoPedido WHERE idTamArtigo=@idTamArtigo", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        }

        //public static bool Alterar(int idArtigo, string NomeArtigo, string Imagem, string Detalhe, double Volume, double Preco, DateTime DataCriacao, int SegCategoria, int PontosArtigo, string NomePomocao, string NomeCategoria)
        //{


        //    ArrayList app = new ArrayList();
        //    app.Add(SQLHelper.CreateParam("NomePomocao", NomePomocao));
        //    int idPromocao = (int)SQLHelper.ExecuteScalar("Select idPromocao From Promocao where NomePromocao=@NomePromocao", (SqlParameter[])app.ToArray(typeof(SqlParameter)));

        //    ArrayList appp = new ArrayList();
        //    appp.Add(SQLHelper.CreateParam("NomeCategoria", NomeCategoria));
        //    int idCategoria = (int)SQLHelper.ExecuteScalar("Select idCategoria From Categoria where NomeCategoria=@NomeCategoria", (SqlParameter[])appp.ToArray(typeof(SqlParameter)));



        //    ArrayList ap = new ArrayList();

        //    ap.Add(SQLHelper.CreateParam("idPromocao", idPromocao));
        //    ap.Add(SQLHelper.CreateParam("idCategoria", idCategoria));
        //    ap.Add(SQLHelper.CreateParam("NomeArtigo", NomeArtigo));
        //    ap.Add(SQLHelper.CreateParam("Imagem", Imagem));
        //    ap.Add(SQLHelper.CreateParam("Detalhe", Detalhe));
        //    ap.Add(SQLHelper.CreateParam("Volume", Volume));
        //    ap.Add(SQLHelper.CreateParam("Preco", Preco));
        //    ap.Add(SQLHelper.CreateParam("Detalhe", Detalhe));
        //    ap.Add(SQLHelper.CreateParam("SegCategoria", SegCategoria));




        //    return SQLHelper.ExecuteNonQuery("UPDATE Artigo SET idPromocao =?, idCategoria =?, Imagem =?, Detalhe=?, Volume=?, Preco=?, Detalhe=?, SegCategoria=?  WHERE idArtigo =?", (SqlParameter[])appp.ToArray(typeof(SqlParameter)));
        //}

        public static bool AlterarQuant(int Quantidade, int idPedido, int idArtigo, string NomeMenu)
        {

            if (idArtigo != 0)
            {
                ArrayList app = new ArrayList();
                app.Add(SQLHelper.CreateParam("idPedido", idPedido));
                DataTable dt = new DataTable();
                dt = SQLHelper.ExecuteDataTable("Select idTamArtigo From TamanhoArtigoPedido where idPedido=@idPedido", (SqlParameter[])app.ToArray(typeof(SqlParameter)));
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    ArrayList arraux = new ArrayList();
                    arraux.Add(SQLHelper.CreateParam("idTamArtigo", dt.Rows[i][0]));
                    arraux.Add(SQLHelper.CreateParam("idPedido", idPedido));
                    arraux.Add(SQLHelper.CreateParam("Quantidade", Quantidade));
                    SQLHelper.ExecuteNonQuery("UPDATE TamanhoArtigoPedido SET Quantidade=@Quantidadeo WHERE idTamArtigo=@idTamArtigo and idPedido=@idPedido", (SqlParameter[])arraux.ToArray(typeof(SqlParameter)));
                }


            }

            else
            {

                ArrayList ap = new ArrayList();
                ap.Add(SQLHelper.CreateParam("NomeMenu", NomeMenu));

                int idMenu = Convert.ToInt32(SQLHelper.ExecuteScalar("Select idMenu From Menu where NomeMenu=@NomeMenu", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));


                ArrayList app = new ArrayList();
                app.Add(SQLHelper.CreateParam("idPedido", idPedido));
                DataTable dt = new DataTable();
                dt = SQLHelper.ExecuteDataTable("Select idMenuTamArtigo From MenuTamArtigoPedido where idPedido=@idPedido", (SqlParameter[])app.ToArray(typeof(SqlParameter)));
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    ArrayList arraux = new ArrayList();
                    arraux.Add(SQLHelper.CreateParam("idMenuTamArtigo", dt.Rows[i][0]));
                    arraux.Add(SQLHelper.CreateParam("idPedido", idPedido));
                    arraux.Add(SQLHelper.CreateParam("Quantidade", Quantidade));
                    SQLHelper.ExecuteNonQuery("UPDATE MenuTamArtigoPedido SET Quantidade=@Quantidade WHERE idMenuTamArtigo=@idMenuTamArtigo and idPedido=@idPedido", (SqlParameter[])arraux.ToArray(typeof(SqlParameter)));
                }


            }
            return true;

        }
    
    }

    public class Utilizador {

        public static bool Inserir(string NomeUser, string Pass, string Morada, string Localidade, int Telemovel, int Telefone, string CodPostal, string Email, DateTime DataRegisto)
        {
            
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("NomeUser", NomeUser));
            ap.Add(SQLHelper.CreateParam("Pass", Pass));
            ap.Add(SQLHelper.CreateParam("Morada", Morada));
            ap.Add(SQLHelper.CreateParam("Localidade", Localidade));
            ap.Add(SQLHelper.CreateParam("Telemovel", Telemovel));
            ap.Add(SQLHelper.CreateParam("Telefone", Telefone));
            ap.Add(SQLHelper.CreateParam("CodPostal", CodPostal));
            ap.Add(SQLHelper.CreateParam("Email", Email));
            ap.Add(SQLHelper.CreateParam("DataRegisto", DataRegisto));

            return SQLHelper.ExecuteNonQuery("INSERT INTO Utilizador (NomeUser, Pass, Morada, Localidade, Telemovel, Telefone, CodPostal, Email, DataRegisto, nPontos) VALUES (@NomeUser, @Pass,@Morada, @Localidade, @Telemovel, @Telefone, @CodPostal, @Email, @DataRegisto, 0)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static bool Remover(int idUser)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idUser", idUser));

            return SQLHelper.ExecuteNonQuery("DELETE FROM Utilizador WHERE idUser=@idUser", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        
        }

        public static String MostrarMorada(int idUser)
        {

            ArrayList ap = new ArrayList();
                      
            ap.Add(SQLHelper.CreateParam("idUser", idUser));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select Morada From Utilizador where idUser=@idUser", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));
            
        }

        public static string MostrarPass(string Email)
        {

            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("Email", Email));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select Pass From Utilizador where Email=@Email", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static int MostrarCodVf(int idUser)
        {
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("idUser", idUser));
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select CodVerif From Utilizador where idUser=@idUser", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }


        public static int MostrarnPontos(int idUser)
        {
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("idUser", idUser));
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select nPontos From Utilizador where idUser=@idUser", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }



        public static bool AlterarCodVF(int idUser, int CodVerificacao)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("CodVerificacao", CodVerificacao));
            ap.Add(SQLHelper.CreateParam("idUser", idUser));

            return SQLHelper.ExecuteNonQuery("UPDATE Utilizador SET CodVerificacao =@CodVerificacao  WHERE idUser =@idUser", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static bool AlterarPontos(string Email, int nPontos)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("Email", Email));
            ap.Add(SQLHelper.CreateParam("nPontos", nPontos));

            return SQLHelper.ExecuteNonQuery("UPDATE Utilizador SET nPontos =@nPontos  WHERE Email =@Email", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static String MostrarMail(int idUser)
        {

            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idUser", idUser));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select Email From Utilizador where idUser=@idUser", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }
        
        public static bool Alterar(int idUser, string NomeUser, string Pass, string Morada, string Localidade, int Telemovel, int Telefone, string CodPostal, string Email)
        {

            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("NomeUser", NomeUser));
            ap.Add(SQLHelper.CreateParam("Pass", Pass));
            ap.Add(SQLHelper.CreateParam("Morada", Morada));
            ap.Add(SQLHelper.CreateParam("Localidade", Localidade));
            ap.Add(SQLHelper.CreateParam("Telemovel", Telemovel));
            ap.Add(SQLHelper.CreateParam("Telefone", Telefone));
            ap.Add(SQLHelper.CreateParam("CodPostal", CodPostal));
            ap.Add(SQLHelper.CreateParam("Email", Email));
            ap.Add(SQLHelper.CreateParam("idUser", idUser));
            return SQLHelper.ExecuteNonQuery("UPDATE Utilizador SET NomeUser =@NomeUser, Pass =@Pass, Morada=@Morada Localidade=@Localidade, Telemovel=@Telemovel, Telefone=@Telefone, CodPostal=@CodPostal, Email=@Email   WHERE idUser =@idUser", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));
        }

        public static int VerificaExisteUser(String Email)
        {
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("Email", Email));
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select idUser From Utilizador where Email=@Email", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));
              
        }

        public static String VerificarCod(int idUser)
        {
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("idUser", idUser));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select CodVerificacao From Utilizador where idUser=@idUser", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static String MostrarNome(String Email)
        {
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("Email", Email));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select NomeUser From Utilizador where Email=@Email", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));
              
        }

        public static bool AlterarnVendas(int idUser, int nVendas)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idUser", idUser));
            ap.Add(SQLHelper.CreateParam("nVendas", nVendas));

            return SQLHelper.ExecuteNonQuery("UPDATE Utilizador SET nVendas =@nVendas  WHERE idUser =@idUser", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static int MostrarId(String Email)
        {
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("Email", Email));
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select idUser From Utilizador where Email=@Email", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static bool AlterarPass(int idUser, String Pass)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("Pass", Pass));
            ap.Add(SQLHelper.CreateParam("idUser", idUser));

            return SQLHelper.ExecuteNonQuery("UPDATE Utilizador SET Pass =@Pass  WHERE idUser =@idUser", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static bool AlterarMail(int idUser, String Email)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("Pass", Email));
            ap.Add(SQLHelper.CreateParam("idUser", idUser));

            return SQLHelper.ExecuteNonQuery("UPDATE Utilizador SET Email =@Email  WHERE idUser =@idUser", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static DataTable MostrarTudo(String Email)
        {
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("Email", Email));
            return SQLHelper.ExecuteDataTable("Select * From Utilizador where Email=@Email", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }       


    
    }


    public class Massa
    {

        public static bool Inserir(string NomeMassa, string Imagem)
        {
           
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("NomeTamanho", NomeMassa));
            ap.Add(SQLHelper.CreateParam("Imagem", Imagem));

            return SQLHelper.ExecuteNonQuery("INSERT INTO Massa(NomeMassa, Imagem) VALUES (@NomeMassa, @Imagem)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }


        public static int MostraridMassa(String NomeMassa)
        {

            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("NomeMassa", NomeMassa));
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select idMassa From Massa where NomeMassa=@NomeMassa", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static String MostrarNomeMassa(int idMassa)
        {

            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idMassa", idMassa));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select NomeMassa From Massa where idMassa=@idMassa", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static String MostrarImagem(int idMassa)
        {

            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idMassa", idMassa));
            return Convert.ToString(SQLHelper.ExecuteScalar("Select Imagem From Massa where idMassa=@idMassa", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }
    }

    public class MassaArtigo
    {

        public static bool Inserir(int idMassa, int idArtigo)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idMassa", idMassa));
            ap.Add(SQLHelper.CreateParam("idArtigo", idArtigo));

            return SQLHelper.ExecuteNonQuery("INSERT INTO MassaArtigo(idMassa, idArtigo) VALUES (@idMassa, @idArtigo)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static int MostrarUltimoIdMassaArtigo()
        {

            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select MAX(idMassaArtigo) From MassaArtigo", null));

        }
              

    }


    public class MassaArtigoPedido
    {

        public static bool Inserir(int idMassaArtigo, int idPedido)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idMassaArtigo", idMassaArtigo));
            ap.Add(SQLHelper.CreateParam("idPedido", idPedido));

            return SQLHelper.ExecuteNonQuery("INSERT INTO MassaArtigoPedido(idMassaArtigo, idPedido) VALUES (@idMassaArtigo, @idPedido)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static int MostrarUltimoIdMassaArtigoPedido()
        {

            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select MAX(idMassaArtigo) From MassaArtigoPedido", null));

        }


    }

    public class MenuCategoria
    {
        public static bool Inserir(int idMenu, int idCategoria, int Quantity)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idMenu", idMenu));
            ap.Add(SQLHelper.CreateParam("idCategoria", idCategoria));
            ap.Add(SQLHelper.CreateParam("Quantity", Quantity));
            return SQLHelper.ExecuteNonQuery("INSERT INTO MenuCategoria(idMenu, idCategoria, Quantity) VALUES (@idMenu, @idCategoria, @Quantity)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static int CountCatIncluidas(int idMenu)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idMenu", idMenu));
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select count(idCategoria) From MenuCategoria where idMenu= @idMenu", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static ArrayList MostarCats(int idMenu)
        {

            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("idMenu", idMenu));
            return SQLHelper.ExecuteReader("Select idCategoria From MenuCategoria where idMenu=@idMenu", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));



        }

        public static int MostarQuantidadeCat(int idMenu)
        {
           
            ArrayList ap = new ArrayList();
            ap.Add(SQLHelper.CreateParam("idMenu", idMenu));
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select Count(idCategoria) From MenuCategoria where idMenu=@idMenu", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));



        }
    }

    public class TamanhoPromocao
    {
        public static DataTable idsTamanho(int idPromocao)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idPromocao", idPromocao));
            return SQLHelper.ExecuteDataTable("Select idTamanho From TamanhoPromocao where idPromocao= @idPromocao", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

        public static Boolean  Inserir(int idPromocao, int idTamanho)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idPromocao", idPromocao));
            ap.Add(SQLHelper.CreateParam("idTamanho", idTamanho));
            return SQLHelper.ExecuteNonQuery("Insert into TamanhoPromocao (idTamanho, idPromocao) values(@idTamanho, @idPromocao)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }




    }

    public class Pontos
    {
        //public static Boolean Inserir(int idPontos, int nPontos)
        //{
        //    ArrayList ap = new ArrayList();

        //    ap.Add(SQLHelper.CreateParam("idPromocao", idPromocao));
        //    ap.Add(SQLHelper.CreateParam("idTamanho", idTamanho));
        //    return SQLHelper.ExecuteNonQuery("Insert into TamanhoPromocao (idTamanho, idPromocao) values(@idTamanho, @idPromocao)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        //}


        public static int MostrarnPontos(int idPontos)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idPontos", idPontos));
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select nPontos From Pontos where idPontos= @idPontos", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }

        public static int MostrarnDescontos(int idPontos)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idPontos", idPontos));
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select nDesconto From Pontos where idPontos= @idPontos", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }



    }

    public class PontosUser
    {


        public static int MostrarPontosUser(int idUser)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idUser", idUser));
            return Convert.ToInt32(SQLHelper.ExecuteScalar("Select idPontos From PontosUser where idUser= @idUser", (SqlParameter[])ap.ToArray(typeof(SqlParameter))));

        }


        public static Boolean CriarRela(int idUser, int idPontos)
        {
            ArrayList ap = new ArrayList();

            ap.Add(SQLHelper.CreateParam("idUser", idUser));
            ap.Add(SQLHelper.CreateParam("idPontos", idPontos));
            return SQLHelper.ExecuteNonQuery("Insert into PontosUser (idUser, idPontos) values(@idUser, @idPontos)", (SqlParameter[])ap.ToArray(typeof(SqlParameter)));

        }

    }

}

