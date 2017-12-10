using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace ShoppingCartExampleAux
{
    /// <summary>
    /// Summary description for ShoppingCartAux
    /// </summary>
    [Serializable] 
    public class CartItemAux
    {
        private int _productID;
        private string _productName;
        private string _imageUrl;
        private int _quantity;
        private double _price;
        private double _subTotal;

        public CartItemAux()
        { 
        }
        public CartItemAux(int ProductID, string ProductName, string ImageUrl, int Quantity, double Price)
        {
            _productID = ProductID;
            _productName = ProductName;
            _imageUrl = ImageUrl;
            _quantity = Quantity;
            _price = Price;
            _subTotal = Quantity * Price;

        }
        public int ProductID
        {
            get
            {
                return _productID;
            }
            set
            {
                _productID = value;
            }
        }

         public string ProductName
         {
            get { return _productName; }
            set { _productName = value; }
         }

         public string ImageUrl
         {
             get { return _imageUrl; }
             set { _imageUrl = value; }
         }

         public int Quantity
         {
             get { return _quantity; }
             set { _quantity = value; }
         }

         public double Price
         {
             get { return _price; }
             set { _price = value; }
         }

         public double SubTotal
         {
             get { return _quantity * _price; }
            
         }
     
    }
    [Serializable]
    public class CartAux
    {
        private DateTime _dateCreated;
        private DateTime _lastUpdate;
        private List<CartItemAux> _items;


        public CartAux()
        {
            if (this._items == null)
            {
                this._items = new List<CartItemAux>();
                this._dateCreated = DateTime.Now;
            }
        }

        public List<CartItemAux> Items
        {
 		get { return _items;}
		set { _items = value;}
	    }

        public void Insert(int ProductID, double Price, int Quantity, string ProductName, string ImageUrl)
        {
            int ItemIndex = ItemIndexOfID(ProductID);
            if (ItemIndex == -1)
            {
                CartItemAux NewItem = new CartItemAux();
                NewItem.ProductID = ProductID;
                NewItem.Quantity = Quantity;
                NewItem.Price = Price;
                NewItem.ProductName = ProductName;
                NewItem.ImageUrl = ImageUrl;
                _items.Add(NewItem);
                
            }
            else
            {
                _items[ItemIndex].Quantity += 1;
            }
            _lastUpdate = DateTime.Now;
        }

        public void Update(int RowID, int ProductID, int Quantity, double Price)
        {
            CartItemAux Item = _items[RowID];
            Item.ProductID = ProductID;
            Item.Quantity = Quantity;
            Item.Price = Price;
            _lastUpdate = DateTime.Now;
        }

        public void DeleteItem(int rowID)
        {
            _items.RemoveAt(rowID);
            _lastUpdate = DateTime.Now;
           
        }

        private int ItemIndexOfID(int ProductID)
        {
            int index = 0;
            foreach (CartItemAux item in _items)
            {
                if (item.ProductID == ProductID)
                {
                    return index;
                }
                index += 1;
            }
            return -1;
        }

        public double Total
        {
            get
            {
                double t = 0;
                if (_items == null)
                {
                    return 0;
                }
                foreach (CartItemAux Item in _items)
                {
                    t += Item.SubTotal;
                }
                return t;
            }
        }

       
    }
}
