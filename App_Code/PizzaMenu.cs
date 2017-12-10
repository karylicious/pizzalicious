using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data;
namespace PizzaMenuExample
{
    /// <summary>
    /// Summary description for Pizza
    /// </summary>
    /// 
    [Serializable] 
    public class PizzaMenuExampleItem
    {
        private int id_ingred;   
        private int _id_pizza;       
        private string _massa;
        private string _nomePizza;
        private string _tamanho;
        private string _nome_ingred;
        private string extra;      
       



        public PizzaMenuExampleItem()
        {
        }
        public PizzaMenuExampleItem(int _id_ingred,int _idpizza, string _massa, string nomePizza, string tamanho, string _Nomeingrediente, string _extra)
        {
            id_ingred = _id_ingred;
            id_pizza = _idpizza;
           _tamanho = tamanho;
            _nome_ingred = _Nomeingrediente;
            extra = _extra;
            _nomePizza = nomePizza;

        }


        public int _id_ingred
        {
            get { return id_ingred; }
            set { id_ingred = value; }
        }


        public int id_pizza
        {
            get { return _id_pizza; }
            set { _id_pizza = value; }
        }
       

        public string massa
        {
            get { return _massa; }
            set { _massa = value; }
        }

        public string nomePizza
        {
            get { return _nomePizza; }
            set { _nomePizza = value; }
        }


        public string tamanho
        {
            get { return _tamanho; }
            set { _tamanho = value; }
        }

        public string nome_ingred
        {
            get { return _nome_ingred; }
            set { _nome_ingred = value; }
        }

        public string _extra
        {
            get { return extra; }
            set { extra = value; }
        }
              

    }
        [Serializable]
        public class PizzaMenus
        {
            private DateTime _dateCreated;
            private DateTime _lastUpdate;
            private List<PizzaMenuExampleItem> _items;


            public PizzaMenus()
            {
                if (this._items == null)
                {
                    this._items = new List<PizzaMenuExampleItem>();
                    this._dateCreated = DateTime.Now;
                }
            }

            public List<PizzaMenuExampleItem> Items
            {
                get { return _items; }
                set { _items = value; }
            }

            public void Insert(int _id_ingred, int _idpizza, string _massa, string _nomePizza, string _tamanho, string _Nomeingrediente, string extra)
            {
                
                PizzaMenuExampleItem NewItem = new PizzaMenuExampleItem();
                    NewItem.nomePizza = _nomePizza;
                    NewItem.id_pizza = _idpizza;
                    NewItem._id_ingred = _id_ingred;   
                    NewItem.massa = _massa;
                    NewItem.tamanho = _tamanho;
                    NewItem.nome_ingred = _Nomeingrediente;
                    NewItem._extra = extra;
                    _items.Add(NewItem);
                _lastUpdate = DateTime.Now;
            }

            public void Update(int RowID, int _id_ingred, int _idpizza, string _massa, string _nomePizza, string _tamanho, string _Nomeingrediente, string extra)
            {
                PizzaMenuExampleItem Item = _items[RowID];
                Item.nomePizza = _nomePizza;
                Item.id_pizza = _idpizza;
                Item._id_ingred = _id_ingred;  
                Item.massa = _massa;
                Item.tamanho = _tamanho;
                Item.nome_ingred = _Nomeingrediente;
                Item._extra  = extra;              
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
                foreach (PizzaMenuExampleItem item in _items)
                {
                    if (item.id_pizza  == ProductID)
                    {
                        return index;
                    }
                    index += 1;
                }
                return -1;
            }        

           
                       

        }
    
}
	
