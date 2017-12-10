using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;

public partial class gerirmenu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Context.User.Identity.IsAuthenticated && this.Context.User.Identity.Name == "Admin")

        Session["subTitle"] = "Gestão de Menus";
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
        using (System.IO.FileStream fs = System.IO.File.Create(Server.MapPath(PathFinal) + timestamp+".png"))
        {
            // Add some information to the file.
            fs.Write(imageContent, 0, imageContent.Length);
        }







    }

    public bool ThumbnailCallback()
    {
        return true;
    }



    protected void ImageButtonInserir_Click(object sender, ImageClickEventArgs e)
    {
        if (CheckBoxListCat.Items.Count != 0)
        {
            ArrayList listacat = new ArrayList();

            for (int i = 0; i < CheckBoxListCat.Items.Count; i++)
            {
                if (CheckBoxListCat.Items[i].Selected == true)
                    listacat.Add(CheckBoxListCat.Items[i].Value);
            }

            BLL.Menu.Inserir(TextBoxNome.Text, Convert.ToDouble(TextBoxPreco.Text), TextBoxDetalhe.Text, listacat, Path.GetFileName(ImageMenu.ImageUrl));

            Session["inseriu"] = true;
            string ImagePath1 = "TemporaryFiles/";
            string ImagePath2 = "Imagem_Artigo/";

            try
            {
                GerarThumbnail(ImageMenu.ImageUrl, Server.MapPath(ImagePath1) + Path.GetFileName(ImageMenu.ImageUrl), Server.MapPath(ImagePath2));
                //File.Move(Server.MapPath(ImagePath1) + Path.GetFileName(ImageMenu.ImageUrl), Server.MapPath(ImagePath2) + Path.GetFileName(ImageMenu.ImageUrl));
                Server.Transfer("~/gerirmenu.aspx");
            }
            catch
            {
            }
        }
    }






    protected void ImageButtonVerImage_Click(object sender, ImageClickEventArgs e)
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

            ImageMenu.ImageUrl = "~/TemporaryFiles/" + fileFullname;
        }
    }
    
}