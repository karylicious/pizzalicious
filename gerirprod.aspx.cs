using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;

public partial class gerirprod : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Context.User.Identity.IsAuthenticated && this.Context.User.Identity.Name == "Admin")
        {
            Session["subTitle"] = "Gestão de Produtos";
            if (Convert.ToBoolean(Session["inseriu"]) == true)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Produto inserido com sucesso!');</script>");
                Session["inseriu"] = false;

            }
                      
                       
        }
        else
            Response.Redirect("~/login.aspx");
        
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

    protected void ImageButtonVerImageProd_Click(object sender, ImageClickEventArgs e)
    {
        if (FileUploadProd.HasFile == true)
        {
            string fileFullname = this.FileUploadProd.PostedFile.FileName;

            string sPath = "";

            string fileName = fileFullname.Substring(fileFullname.LastIndexOf("\\") + 1);
            string type = fileFullname.Substring(fileFullname.LastIndexOf(".") + 1);
            if (FileUploadProd.PostedFile.ContentType.ToUpper().IndexOf("IMAGE") > -1)
            {
                System.Drawing.Image img = System.Drawing.Image.FromStream(FileUploadProd.PostedFile.InputStream);

                if (type == "jpg" || type == "gif" || type == "bmp" || type == "JPG" || type == "GIF" || type=="png"|| type=="PNG"|| type=="BMP")
                {

                        string ImagePath = "TemporaryFiles/";

                        sPath = Server.MapPath(ImagePath) + fileFullname;
                        this.FileUploadProd.PostedFile.SaveAs(sPath);
                 }

            }


            ImageProd.ImageUrl = "~/TemporaryFiles/" + fileFullname;
        }
     
    }


    protected void ImageButtonVerImagePizza_Click(object sender, ImageClickEventArgs e)
    {
        if (FileUploadPizza.HasFile == true)
        {
            string fileFullname = this.FileUploadPizza.PostedFile.FileName;

            string sPath = "";

            string fileName = fileFullname.Substring(fileFullname.LastIndexOf("\\") + 1);
            string type = fileFullname.Substring(fileFullname.LastIndexOf(".") + 1);
            if (FileUploadPizza.PostedFile.ContentType.ToUpper().IndexOf("IMAGE") > -1)
            {
                System.Drawing.Image img = System.Drawing.Image.FromStream(FileUploadPizza.PostedFile.InputStream);

                if (type == "jpg" || type == "gif" || type == "bmp" || type == "JPG" || type == "GIF" || type == "png" || type == "PNG" || type == "BMP")
                {

                    string ImagePath = "TemporaryFiles/";

                    sPath = Server.MapPath(ImagePath) + fileFullname;
                    this.FileUploadPizza.PostedFile.SaveAs(sPath);
                }

            }


            ImagePizza.ImageUrl = "~/TemporaryFiles/" + fileFullname;
        }

    }


    protected void ImageButtonInserirProd_Click(object sender, ImageClickEventArgs e)
    {
        Session["inseriu"] = true;
        string ImagePath1 = "TemporaryFiles/";
        string ImagePath2 = "Imagem_Artigo/";

        try
        {
            GerarThumbnail(ImageProd.ImageUrl, Server.MapPath(ImagePath1) + Path.GetFileName(ImageProd.ImageUrl), Server.MapPath(ImagePath2));
            //File.Move(Server.MapPath(ImagePath1) + Path.GetFileName(ImageProd.ImageUrl), Server.MapPath(ImagePath2) + Path.GetFileName(ImageProd.ImageUrl));
            Server.Transfer("~/gerirprod.aspx");
        }
        catch
        {
        }

        BLL.Artigo.InserirProd(TextBoxNomeProd.Text, Path.GetFileName(ImageProd.ImageUrl), TextBoxDetalheProd.Text, TextBoxVolume.Text, Convert.ToDouble(TextBoxPrecoProd.Text), Convert.ToInt32(RadioButtonListCat.SelectedValue));


    }

    protected void ImageButtonInserirPizza_Click(object sender, ImageClickEventArgs e)
    {
        Session["inseriu"] = true;
        string ImagePath1 = "TemporaryFiles/";
        string ImagePath2 = "Imagem_Artigo/";
        ArrayList ingrdlist = new ArrayList();
        for (int i = 0; i < CheckBoxList2.Items.Count; i++)
        {
            if (CheckBoxList2.Items[i].Selected == true)
            {
                        ingrdlist.Add(Convert.ToInt32(CheckBoxList2.Items[i].Value));
            }
        }


            try
            {
                GerarThumbnail(ImagePizza.ImageUrl, Server.MapPath(ImagePath1) + Path.GetFileName(ImagePizza.ImageUrl), Server.MapPath(ImagePath2));
                //File.Move(Server.MapPath(ImagePath1) + Path.GetFileName(ImageProd.ImageUrl), Server.MapPath(ImagePath2) + Path.GetFileName(ImageProd.ImageUrl));
                Server.Transfer("~/gerirprod.aspx");
            }
            catch
            {
            }
            BLL.Artigo.InserirPizza(TextBoxNomePizza.Text, Path.GetFileName(ImagePizza.ImageUrl), TextBoxDetalhePizza.Text, ingrdlist);
    }

    protected void ImageButtonInserirIngred_Click(object sender, ImageClickEventArgs e)
    {
        string tipo="";
        if(RadioButtonListTipoIngred.SelectedItem.Text=="Outro")
            tipo="Ingrediente";
        else
            tipo=RadioButtonListTipoIngred.SelectedItem.Text;
        BLL.Artigo.InserirIngred(TextBoxNomeIngrediente.Text, tipo, Convert.ToDouble(TextBoxPrecoIngred.Text));
        Server.Transfer("~/gerirprod.aspx");
    }

  
    protected void ImageButtonInserirTamanho_Click(object sender, ImageClickEventArgs e)
    {
        BLL.Tamanho.Inserir(TextBoxNomeTamanho.Text, Convert.ToDouble(TextBoxPrecoTamanho.Text));
    }

    protected void ImageButtonInserirMassa_Click(object sender, ImageClickEventArgs e)
    {
        if (ImageButtonInserirMassa.ImageUrl != "~/Images/noimage.jpg")
            BLL.Massa.Inserir(TextBoxNomeMassa.Text, ImageButtonInserirMassa.ImageUrl);
        else
        {
            BLL.Massa.Inserir(TextBoxNomeMassa.Text, "");
        }
    }

    protected void ImageButtonVerImageMassa_Click(object sender, ImageClickEventArgs e)
    {
        if (FileUploadMassa.HasFile == true)
        {
            string fileFullname = this.FileUploadMassa.PostedFile.FileName;

            string sPath = "";

            string fileName = fileFullname.Substring(fileFullname.LastIndexOf("\\") + 1);
            string type = fileFullname.Substring(fileFullname.LastIndexOf(".") + 1);
            if (FileUploadMassa.PostedFile.ContentType.ToUpper().IndexOf("IMAGE") > -1)
            {
                System.Drawing.Image img = System.Drawing.Image.FromStream(FileUploadMassa.PostedFile.InputStream);

                if (type == "jpg" || type == "gif" || type == "bmp" || type == "JPG" || type == "GIF" || type == "png" || type == "PNG" || type == "BMP")
                {

                    string ImagePath = "TemporaryFiles/";

                    sPath = Server.MapPath(ImagePath) + fileFullname;
                    this.FileUploadMassa.PostedFile.SaveAs(sPath);
                }

            }


            ImageMassa.ImageUrl = "~/TemporaryFiles/" + fileFullname;
        }
    }
}