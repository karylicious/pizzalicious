using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MenuExampleAux
{
    /// <summary>
    /// Summary description for Menu
    /// </summary>
    [Serializable]
    public class MenuItemAux
    {
        private int _MenuID;
        private int _productID;
        private string _productName;      
        private string _MenuName;      
        private double _price;
        private string _Image; 
       

        public MenuItemAux()
        {
        }
        public MenuItemAux(string MenuName, int MenuID, int ProductID, string ProductName, double Price, string Image)
        {
            _MenuName = MenuName;         
            _MenuID = MenuID;
            _productID = ProductID;
            _productName = ProductName;           
            _price = Price;
            _Image = Image;

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

        public string Image
        {
            get { return _Image; }
            set { _Image = value; }
        }


        public string MenuName
        {
            get { return _MenuName; }
            set { _MenuName = value; }
        }

     

        public int MenuID
        {
            get { return _MenuID; }
            set { _MenuID = value; }
        }

        public double Price
        {
            get { return _price; }
            set { _price = value; }
        }

      
    }
    [Serializable]
    public class MenuAux
    {
        private DateTime _dateCreated;
        private DateTime _lastUpdate;
        private List<MenuItemAux> _items;


        public MenuAux()
        {
            if (this._items == null)
            {
                this._items = new List<MenuItemAux>();
                this._dateCreated = DateTime.Now;
            }
        }

        public List<MenuItemAux> Items
        {
            get { return _items; }
            set { _items = value; }
        }

        public void Insert(string MenuName, int MenuID, int ProductID, string ProductName, double Price, string Image)
        {
            int ItemIndex = ItemIndexOfID(ProductID);
            if (ItemIndex == -1)
            {
                MenuItemAux NewItem = new MenuItemAux();
                NewItem.MenuID = MenuID;
                NewItem.ProductID = ProductID;
                NewItem.MenuName = MenuName;
                NewItem.Price = Price;
                NewItem.ProductName = ProductName;
                NewItem.Image = Image;
                _items.Add(NewItem);

            }
                    
            _lastUpdate = DateTime.Now;
        }

        public void Update(int RowID, string MenuName, int MenuID, int ProductID, string ProductName, double Price, string Image)
        {
            MenuItemAux Item = _items[RowID];
            Item.MenuID = MenuID;
            Item.ProductID = ProductID;
            Item.MenuName = MenuName;     
            Item.Price = Price;
            Item.Image = Image;
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
            foreach (MenuItemAux item in _items)
            {
                if (item.ProductID == ProductID)
                {
                    return index;
                }
                index += 1;
            }
            return -1;
        }          

    }
}