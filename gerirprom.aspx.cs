using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;

public partial class gerirprom : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Context.User.Identity.IsAuthenticated && this.Context.User.Identity.Name == "Admin")
        {
            Session["subTitle"] = "Gestão de Promoções";

            TDSemana.Visible = false;
            TDPeriodo.Visible = false;

            if (Convert.ToBoolean(Session["inseriu"]) == true)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Promoção inserida com sucesso!');</script>");
                Session["inseriu"] = false;

            }
        }
        else
            Response.Redirect("~/login.aspx");
    }

  
    protected void RadioButtonListValidade_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonListValidade.SelectedIndex == 0)
        {
            TDSemana.Visible = true;
            TextBoxPeriFinal.Text = "";
            TextBoxPeriInicial.Text = "";
            TDPeriodo.Visible = false;
        }
        else
        {
            TDSemana.Visible = false;
            TDPeriodo.Visible = true;
        }
    }


    public void GerarThumbnail(string filename, string sPath, string PathFinal)
    {
        // get the file name -- fall800.jpg

        // create an image object, using the filename we just retrieved
        System.Drawing.Image image = System.Drawing.Image.FromFile(sPath);

        // create the actual thumbnail image
        System.Drawing.Image thumbnailImage = image.GetThumbnailImage(100, 100, new System.Drawing.Image.GetThumbnailImageAbort(ThumbnailCallback), IntPtr.Zero);

        // make a memory stream to work with the image bytes
        MemoryStream imageStream = new MemoryStream();

        // put the image into the memory stream
        thumbnailImage.Save(imageStream, System.Drawing.Imaging.ImageFormat.Jpeg);

        // make byte array the same size as the image
        byte[] imageContent = new Byte[imageStream.Length];

        // rewind the memory stream
        imageStream.Position = 0;

        // load the byte array with the image
        imageStream.Read(imageContent, 0, (int)imageStream.Length);

        // return byte array to caller with image type
        //Response.ContentType = "image/png";

        // Create the file.

        string timestamp = Convert.ToString(DateTime.Now.Hour) + Convert.ToString(DateTime.Now.Hour) + Convert.ToString(DateTime.Now.Minute) + Convert.ToString(DateTime.Now.Second) + Convert.ToString(DateTime.Now.Day) + Convert.ToString(DateTime.Now.Month) + Convert.ToString(DateTime.Now.Year);
        using (System.IO.FileStream fs = System.IO.File.Create(Server.MapPath(PathFinal) + timestamp + ".png"))
        {
            // Add some information to the file.
            fs.Write(imageContent, 0, imageContent.Length);
        }







    }

    public bool ThumbnailCallback()
    {
        return true;
    }


    protected void ImageButtonVisualizar_Click(object sender, ImageClickEventArgs e)
    {
        if (FileUpload1.HasFile == true)
        {
            string fileFullname = this.FileUpload1.PostedFile.FileName;

            string sPath = "";

            string fileName = fileFullname.Substring(fileFullname.LastIndexOf("\\") + 1);
            string type = fileFullname.Substring(fileFullname.LastIndexOf(".") + 1);
            if (FileUpload1.PostedFile.ContentType.ToUpper().IndexOf("IMAGE") > -1)
            {
                System.Drawing.Image img = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);

                if (type == "jpg" || type == "gif" || type == "bmp" || type == "JPG" || type == "GIF" || type == "png" || type == "PNG" || type == "BMP")
                {

                    string ImagePath = "TemporaryFiles/";

                    sPath = Server.MapPath(ImagePath) + fileFullname;
                    this.FileUpload1.PostedFile.SaveAs(sPath);
                }

            }


            ImageProm.ImageUrl = "~/TemporaryFiles/" + fileFullname;
        }
    }

    protected void ImageButtonInserir_Click(object sender, ImageClickEventArgs e)
    {
        if (MyAccordion.SelectedIndex != -1 && ImageProm.ImageUrl != "" && ImageProm.ImageUrl != "~/Images/noimage.jpg" && DropDownListNIngredPizzaPagar.SelectedIndex != -1 && CheckBoxListTamanhoPizzaPagar.SelectedIndex != -1 && RadioButtonListValidade.SelectedIndex !=-1)
        {
            if (RadioButtonListValidade.SelectedIndex == 0)//dia semana
            {
                if (TextBoxPeriFinal.Text != "")
                    TextBoxPeriFinal.Text = "";

                if (TextBoxPeriInicial.Text != "")
                    TextBoxPeriInicial.Text = "";
            }
            else
            {
                if (TextBoxDetalhe.Text != "")
                    TextBoxDetalhe.Text = "";
            }
            
            switch (MyAccordion.SelectedIndex)
            {
                case 0:
                    {
                        
                        //desconto

                        if (TextBoxDesconto0.Text != "")
                        {
                            ArrayList tamanho = new ArrayList();

                            for (int i = 0; i < CheckBoxListTamanhoPizzaPagar.Items.Count; i++)
                            {
                                if (CheckBoxListTamanhoPizzaPagar.Items[i].Selected==true)
                                   tamanho.Add(CheckBoxListTamanhoPizzaPagar.Items[i].Text);

                            }

                            if(DropDownListNIngredPizzaPagar.SelectedIndex==0)
                                //=
                                BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, Convert.ToInt32(TextBoxDesconto0.Text), 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, 0,"", false, false, 0, 0, false, 0, tamanho);
                            else
                                //>=
                                BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, Convert.ToInt32(TextBoxDesconto0.Text), 0, 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, "", false, false, 0, 0, false, 0, tamanho);
                                                       
                        }
                        
                        
                        
                        break;
                    }

               

                case 1:
                    {
                        //descontos e numero de pizzas

                        if (TextBoxDesconto2.Text != "" && TextBoxNPizzasPagar2.Text != "")
                        {
                            ArrayList tamanho = new ArrayList();

                            for (int i = 0; i < CheckBoxListTamanhoPizzaPagar.Items.Count; i++)
                            {
                                if (CheckBoxListTamanhoPizzaPagar.Items[i].Selected == true)
                                    tamanho.Add(CheckBoxListTamanhoPizzaPagar.Items[i].Text);

                            }

                            if (DropDownListNIngredPizzaPagar.SelectedIndex == 0)
                                //=
                                BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, Convert.ToInt32(TextBoxDesconto0.Text), Convert.ToInt32(TextBoxNPizzasPagar2.Text), Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, 0, "", false, false, 0, 0, false, 0, tamanho);
                            else
                                //>=
                                BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, Convert.ToInt32(TextBoxDesconto0.Text), Convert.ToInt32(TextBoxNPizzasPagar2.Text), 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, "", false, false, 0, 0, false, 0, tamanho);
                        }


                        break;
                    }

                case 2:
                    {
                        //descontos e numero de pedidos

                        if (TextBoxDesconto3.Text != "" && TextBoxPedidos3.Text != "")
                        {
                           
                            
                                ArrayList tamanho = new ArrayList();

                                for (int i = 0; i < CheckBoxListTamanhoPizzaPagar.Items.Count; i++)
                                {
                                    if (CheckBoxListTamanhoPizzaPagar.Items[i].Selected == true)
                                        tamanho.Add(CheckBoxListTamanhoPizzaPagar.Items[i].Text);

                                }

                                if (DropDownListNIngredPizzaPagar.SelectedIndex == 0)
                                    //=
                                    BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, Convert.ToInt32(TextBoxDesconto0.Text), 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, Convert.ToInt32(TextBoxPedidos3.Text), "", false, false, 0, 0, false, 0, tamanho);
                                else
                                    //>=
                                    BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, Convert.ToInt32(TextBoxDesconto0.Text), 0, 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, Convert.ToInt32(TextBoxPedidos3.Text), "", false, false, 0, 0, false, 0, tamanho);

                            
                        }

                        break;
                    }


                case 3:
                    {
                        //preco

                        if (TextBoxPreco4.Text != "")
                        {

                            ArrayList tamanho = new ArrayList();

                            for (int i = 0; i < CheckBoxListTamanhoPizzaPagar.Items.Count; i++)
                            {
                                if (CheckBoxListTamanhoPizzaPagar.Items[i].Selected == true)
                                    tamanho.Add(CheckBoxListTamanhoPizzaPagar.Items[i].Text);

                            }

                            if (DropDownListNIngredPizzaPagar.SelectedIndex == 0)
                                //=
                                BLL.Promocao.Inserir(TextBoxNome.Text, Convert.ToDouble(TextBoxPreco4.Text), Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text,0, 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, 0, "", false, false, 0, 0, false, 0, tamanho);
                            else
                                //>=
                                BLL.Promocao.Inserir(TextBoxNome.Text, Convert.ToDouble(TextBoxPreco4.Text), Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, 0, 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, "", false, false, 0, 0, false, 0, tamanho);

                        }

                        break;
                    }


                case 4:
                    {
                        //preco e numero de pizzas
                        if (TextBoxPreco5.Text != "" && TextBoxMinimoNPizzasPedir5.Text != "")
                        {
                            ArrayList tamanho = new ArrayList();

                            for (int i = 0; i < CheckBoxListTamanhoPizzaPagar.Items.Count; i++)
                            {
                                if (CheckBoxListTamanhoPizzaPagar.Items[i].Selected == true)
                                    tamanho.Add(CheckBoxListTamanhoPizzaPagar.Items[i].Text);

                            }



                            if (DropDownListxMinimoNPizzasPedir5.SelectedIndex == 0)//=
                            {
                                if (DropDownListNIngredPizzaPagar.SelectedIndex == 0)
                                    //=
                                    BLL.Promocao.Inserir(TextBoxNome.Text, Convert.ToDouble(TextBoxPreco5.Text), Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0,Convert.ToInt32(TextBoxMinimoNPizzasPedir5.Text), Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, 0, "", false, false, 0, 0, false, 0, tamanho);
                                else
                                    //>=
                                    BLL.Promocao.Inserir(TextBoxNome.Text, Convert.ToDouble(TextBoxPreco5.Text), Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, Convert.ToInt32(TextBoxMinimoNPizzasPedir5.Text), 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, "", false, false, 0, 0, false, 0, tamanho);

                            }
                            else
                            {
                                if (DropDownListNIngredPizzaPagar.SelectedIndex == 0)//>=
                                    //=
                                    BLL.Promocao.Inserir(TextBoxNome.Text, Convert.ToDouble(TextBoxPreco5.Text), Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0,Convert.ToInt32(TextBoxMinimoNPizzasPedir5.Text), 0, "", false, false, 0, 0,  false, 0, tamanho);
                                else
                                    //>=
                                    BLL.Promocao.Inserir(TextBoxNome.Text, Convert.ToDouble(TextBoxPreco5.Text), Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, 0, 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text),Convert.ToInt32(TextBoxMinimoNPizzasPedir5.Text), 0, "", false, false, 0, 0, false, 0, tamanho);

                            }




                          
                        }

                        break;
                    }

                case 5:
                    {
                        //preco e numero de pedidos
                        if (TextBoxPreco6.Text != "" && TextBoxPedidos6.Text != "")
                        {
                            
                                ArrayList tamanho = new ArrayList();

                                for (int i = 0; i < CheckBoxListTamanhoPizzaPagar.Items.Count; i++)
                                {
                                    if (CheckBoxListTamanhoPizzaPagar.Items[i].Selected == true)
                                        tamanho.Add(CheckBoxListTamanhoPizzaPagar.Items[i].Text);

                                }

                                if (DropDownListNIngredPizzaPagar.SelectedIndex == 0)
                                    //=
                                    BLL.Promocao.Inserir(TextBoxNome.Text, Convert.ToDouble(TextBoxPreco6.Text), Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, Convert.ToInt32(TextBoxPedidos6.Text), "",  false, false, 0, 0, false,  0, tamanho);
                                else
                                    //>=
                                    BLL.Promocao.Inserir(TextBoxNome.Text, Convert.ToDouble(TextBoxPreco6.Text), Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, 0, 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, Convert.ToInt32(TextBoxPedidos6.Text), "", false, false, 0, 0,  false, 0, tamanho);

                           
                        }

                        break;
                    }

                case 6:
                    {
                        //numero de pizzas
                        if (TextBoxNPizzasPagar7.Text != "" && TextBoxMinimoNPizzasPedir7.Text != "" && TextBoxNumIngredPizzaOferta7.Text != "" && DropDownEditarIngredRela7.SelectedIndex != -1 && RadioButtonListTamanhoPOferta7.SelectedIndex != -1 && TextBoxNPizzasPagar7.Text!="")
                        {

                            ArrayList tamanho = new ArrayList();

                            for (int i = 0; i < CheckBoxListTamanhoPizzaPagar.Items.Count; i++)
                            {
                                if (CheckBoxListTamanhoPizzaPagar.Items[i].Selected == true)
                                    tamanho.Add(CheckBoxListTamanhoPizzaPagar.Items[i].Text);

                            }

                            Boolean maiorigual=false;
                            Boolean menorigual=false;
                            if (DropDownEditarIngredRela7.SelectedIndex == 0)
                                maiorigual = true;
                            else
                                menorigual = true;



                            if (DropDownListnMinimoPizza7.SelectedIndex == 0)//=
                            {

                                if (DropDownListNIngredPizzaOferta7.SelectedIndex == 0)
                                {

                                    if (DropDownListNIngredPizzaPagar.SelectedIndex == 0)
                                        //=

                                        BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, Convert.ToInt32(TextBoxMinimoNPizzasPedir7.Text), Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, 0, RadioButtonListTamanhoPOferta7.SelectedItem.Text, maiorigual, menorigual, Convert.ToInt32(TextBoxNumIngredPizzaOferta7.Text), Convert.ToInt32(TextBoxNumIngredPizzaOferta7.Text), true, Convert.ToInt32(TextBoxNPizzasPagar7.Text), tamanho);
                                    else
                                        //>=
                                        BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, Convert.ToInt32(TextBoxMinimoNPizzasPedir7.Text), 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, RadioButtonListTamanhoPOferta7.SelectedItem.Text, maiorigual, menorigual, Convert.ToInt32(TextBoxNumIngredPizzaOferta7.Text), Convert.ToInt32(TextBoxNumIngredPizzaOferta7.Text), true, Convert.ToInt32(TextBoxNPizzasPagar7.Text), tamanho);


                                }

                                else
                                {

                                    if (DropDownListNIngredPizzaPagar.SelectedIndex == 0)
                                        //=
                                        BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, Convert.ToInt32(TextBoxMinimoNPizzasPedir7.Text), Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, 0, RadioButtonListTamanhoPOferta7.SelectedItem.Text, maiorigual, menorigual, Convert.ToInt32(TextBoxNumIngredPizzaOferta7.Text), Convert.ToInt32(TextBoxNumIngredPizzaOferta7.Text), true, Convert.ToInt32(TextBoxNPizzasPagar7.Text), tamanho);
                                    else
                                        //>=
                                        BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, Convert.ToInt32(TextBoxMinimoNPizzasPedir7.Text), 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, RadioButtonListTamanhoPOferta7.SelectedItem.Text, maiorigual, menorigual, Convert.ToInt32(TextBoxNumIngredPizzaOferta7.Text), Convert.ToInt32(TextBoxNumIngredPizzaOferta7.Text), true, Convert.ToInt32(TextBoxNPizzasPagar7.Text), tamanho);

                                }




                               
                            }
                            else
                            {
                                if (DropDownListNIngredPizzaOferta7.SelectedIndex == 0)
                                {

                                    if (DropDownListNIngredPizzaPagar.SelectedIndex == 0)
                                        //=
                                        BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, Convert.ToInt32(TextBoxMinimoNPizzasPedir7.Text), 0, "", maiorigual, menorigual, Convert.ToInt32(TextBoxNumIngredPizzaOferta7.Text), Convert.ToInt32(TextBoxNumIngredPizzaOferta7.Text), true, Convert.ToInt32(TextBoxNPizzasPagar7.Text), tamanho);
                                    else
                                        //>=
                                        BLL.Promocao.Inserir(TextBoxNome.Text,0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, 0, 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), Convert.ToInt32(TextBoxMinimoNPizzasPedir7.Text), 0, "", maiorigual, menorigual, Convert.ToInt32(TextBoxNumIngredPizzaOferta7.Text), Convert.ToInt32(TextBoxNumIngredPizzaOferta7.Text), true, Convert.ToInt32(TextBoxNPizzasPagar7.Text), tamanho);


                                }

                                else
                                {

                                    if (DropDownListNIngredPizzaPagar.SelectedIndex == 0)
                                        //=
                                        BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, Convert.ToInt32(TextBoxMinimoNPizzasPedir7.Text), Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, 0, "", maiorigual, menorigual, Convert.ToInt32(TextBoxNumIngredPizzaOferta7.Text), Convert.ToInt32(TextBoxNumIngredPizzaOferta7.Text), true, Convert.ToInt32(TextBoxNPizzasPagar7.Text), tamanho);
                                    else
                                        //>=
                                        BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, Convert.ToInt32(TextBoxMinimoNPizzasPedir7.Text), 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, "", maiorigual, menorigual, Convert.ToInt32(TextBoxNumIngredPizzaOferta7.Text), Convert.ToInt32(TextBoxNumIngredPizzaOferta7.Text), true, Convert.ToInt32(TextBoxNPizzasPagar7.Text), tamanho);
                                    

                                }
                            }



                           
                        }

                        break;
                    }

                case 7:
                    {
                        //numero de pizzas e numero de pedidos
                        if (TextBoxNPizzasPagar8.Text != "" && TextBoxPedidos8.Text != "")
                        {
                             ArrayList tamanho = new ArrayList();

                            for (int i = 0; i < CheckBoxListTamanhoPizzaPagar.Items.Count; i++)
                            {
                                if (CheckBoxListTamanhoPizzaPagar.Items[i].Selected == true)
                                    tamanho.Add(CheckBoxListTamanhoPizzaPagar.Items[i].Text);

                            }

                            Boolean maiorigual=false;
                            Boolean menorigual=false;
                            if (DropDownListPrecoPizzaOfertaRelat8.SelectedIndex == 0)
                                maiorigual = true;
                            else
                                menorigual = true;

                            if (DropDownListnMinimoPizza8.SelectedIndex == 0)//=
                            {

                                if (DropDownListNIngrdPizzaOferta8.SelectedIndex == 0)
                                {

                                    if (DropDownListNIngredPizzaPagar.SelectedIndex == 0)
                                        //=

                                        BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, Convert.ToInt32(TextBoxnMinimoPizza8.Text), Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, Convert.ToInt32(TextBoxPedidos8.Text), RadioButtonListTamanhoPizzaOferta8.SelectedItem.Text, maiorigual, menorigual, Convert.ToInt32(TextBoxNIngrdPizzaOferta8.Text), Convert.ToInt32(TextBoxNIngrdPizzaOferta8.Text), true, Convert.ToInt32(TextBoxNPizzasPagar8.Text), tamanho);
                                    else
                                        //>=
                                        BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, Convert.ToInt32(TextBoxnMinimoPizza8.Text), 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, Convert.ToInt32(TextBoxPedidos8.Text), RadioButtonListTamanhoPizzaOferta8.SelectedItem.Text, maiorigual, menorigual, Convert.ToInt32(TextBoxNIngrdPizzaOferta8.Text), Convert.ToInt32(TextBoxNIngrdPizzaOferta8.Text), true, Convert.ToInt32(TextBoxNPizzasPagar8.Text), tamanho);


                                }

                                else
                                {

                                    if (DropDownListNIngredPizzaPagar.SelectedIndex == 0)
                                        //=
                                        BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, Convert.ToInt32(TextBoxnMinimoPizza8.Text), Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, Convert.ToInt32(TextBoxPedidos8.Text), RadioButtonListTamanhoPizzaOferta8.SelectedItem.Text, maiorigual, menorigual, Convert.ToInt32(TextBoxNIngrdPizzaOferta8.Text), Convert.ToInt32(TextBoxNIngrdPizzaOferta8.Text), true, Convert.ToInt32(TextBoxNPizzasPagar8.Text), tamanho);
                                    else
                                        //>=
                                        BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, Convert.ToInt32(TextBoxnMinimoPizza8.Text), 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, Convert.ToInt32(TextBoxPedidos8.Text), RadioButtonListTamanhoPizzaOferta8.SelectedItem.Text, maiorigual, menorigual, Convert.ToInt32(TextBoxNIngrdPizzaOferta8.Text), Convert.ToInt32(TextBoxNIngrdPizzaOferta8.Text), true, Convert.ToInt32(TextBoxNPizzasPagar8.Text), tamanho);

                                }





                            }
                            else
                            {
                                if (DropDownListNIngrdPizzaOferta8.SelectedIndex == 0)
                                {

                                    if (DropDownListNIngredPizzaPagar.SelectedIndex == 0)
                                        //=
                                        BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, Convert.ToInt32(TextBoxnMinimoPizza8.Text), Convert.ToInt32(TextBoxPedidos8.Text), "", maiorigual, menorigual, Convert.ToInt32(TextBoxNIngrdPizzaOferta8.Text), Convert.ToInt32(TextBoxNIngrdPizzaOferta8.Text), true, Convert.ToInt32(TextBoxNPizzasPagar8.Text), tamanho);
                                    else
                                        //>=
                                        BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, 0, 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), Convert.ToInt32(TextBoxnMinimoPizza8.Text), Convert.ToInt32(TextBoxPedidos8.Text), "", maiorigual, menorigual, Convert.ToInt32(TextBoxNIngrdPizzaOferta8.Text), Convert.ToInt32(TextBoxNIngrdPizzaOferta8.Text), true, Convert.ToInt32(TextBoxNPizzasPagar8.Text), tamanho);


                                }

                                else
                                {

                                    if (DropDownListNIngredPizzaPagar.SelectedIndex == 0)
                                        //=
                                        BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, Convert.ToInt32(TextBoxnMinimoPizza8.Text), Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, 0, Convert.ToInt32(TextBoxPedidos8.Text), "", maiorigual, menorigual, Convert.ToInt32(TextBoxNIngrdPizzaOferta8.Text), Convert.ToInt32(TextBoxNIngrdPizzaOferta8.Text), true, Convert.ToInt32(TextBoxNPizzasPagar8.Text), tamanho);
                                    else
                                        //>=
                                        BLL.Promocao.Inserir(TextBoxNome.Text, 0, Path.GetFileName(ImageProm.ImageUrl), TextBoxDetalhe.Text, DropDownListSemana.SelectedItem.Text, TextBoxPeriInicial.Text, TextBoxPeriFinal.Text, 0, Convert.ToInt32(TextBoxnMinimoPizza8.Text), 0, Convert.ToInt32(TextBoxNIngredPizzaPagar.Text), 0, Convert.ToInt32(TextBoxPedidos8.Text), "", maiorigual, menorigual, Convert.ToInt32(TextBoxNIngrdPizzaOferta8.Text), Convert.ToInt32(TextBoxNIngrdPizzaOferta8.Text), true, Convert.ToInt32(TextBoxNPizzasPagar8.Text), tamanho);


                                }
                            }




                           
                        }

                        break;
                     }
                default: break;

                       
                    }


                


            }
            Session["inseriu"] = true;
            string ImagePath1 = "TemporaryFiles/";
            string ImagePath2 = "Imagem_Artigo/";

            try
            {
                GerarThumbnail(ImageProm.ImageUrl, Server.MapPath(ImagePath1) + Path.GetFileName(ImageProm.ImageUrl), Server.MapPath(ImagePath2));
                //File.Move(Server.MapPath(ImagePath1) + Path.GetFileName(ImageProm.ImageUrl), Server.MapPath(ImagePath2) + Path.GetFileName(ImageProm.ImageUrl));
                Server.Transfer("~/gerirprom.aspx");
            }
            catch
            {
            }

        }
        
        
}