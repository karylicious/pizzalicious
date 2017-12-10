using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;
using System.Data;
namespace PizzaExampleAux
{
    /// <summary>
    /// Summary description for Pizza
    /// </summary>
    /// 
    [Serializable] 
    public class PizzaIngrdienteAux
    {

        private int _id_pizza;
        private int _idPzzExistente;
        private int _id_ingred;
        private string _massa;
        private string _nomePizza;
        private string _tamanho;
        private string _nome_ingred;
        private string extra;
        private double _precoIngred;
        private double _precoPorTam;
        private double _precoTotal;
        private string _Origem;



        public PizzaIngrdienteAux()
        {
        }
        public PizzaIngrdienteAux(int _idpizza, int _idingred, int idPzzExistente, string _massa, string nomePizza, string tamanho, string _Nomeingrediente, string _extra, double precoIngred, double precoPorTam, double precoT, string Origem)
        {
            id_pizza = _idpizza;
            _id_ingred = _idingred;
            _tamanho = tamanho;
            _nomePizza = nomePizza;
            _nome_ingred = _Nomeingrediente;
            extra = _extra;
            _precoTotal = precoT;
            _precoIngred = precoIngred;
            _precoPorTam = precoPorTam;
            _Origem = Origem;
            _idPzzExistente = idPzzExistente;

        }
        public int id_pizza
        {
            get { return _id_pizza; }
            set { _id_pizza = value; }
        }

        public int idPzzExistente
        {
            get { return _idPzzExistente; }
            set { _idPzzExistente = value; }
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

        public string Origem
        {
            get { return _Origem ; }
            set { _Origem = value; }
        }

        public string _extra
        {
            get { return extra; }
            set { extra = value; }
        }

        public int id_ingred
        {
            get { return _id_ingred; }
            set { _id_ingred = value; }
        }

        public double precoTotal
        {
            get { return _precoTotal; }
            set { _precoTotal = value; }
        }
        public double precoIngred
        {
            get { return _precoIngred; }
            set { _precoIngred = value; }
        }


        public double precoPorTam
        {
            get { return _precoPorTam; }
            set { _precoPorTam = value; }
        }

    }
        [Serializable]
        public class PizzaAux
        {
            private DateTime _dateCreated;
            private DateTime _lastUpdate;
            private List<PizzaIngrdienteAux> _items;


            public PizzaAux()
            {
                if (this._items == null)
                {
                    this._items = new List<PizzaIngrdienteAux>();
                    this._dateCreated = DateTime.Now;
                }
            }

            public List<PizzaIngrdienteAux> Items
            {
                get { return _items; }
                set { _items = value; }
            }

            public void Insert(string _nomePizza, int _idpizza, int _idingred, int idPzzExistente, string _massa, string tamanhoo, string _Nomeingrediente, string extra, double precoPrTam, double precoIngr, double precoT, string Origem)
            {
                
                PizzaIngrdienteAux NewItem = new PizzaIngrdienteAux();
                    NewItem.nomePizza = _nomePizza;
                    NewItem.id_pizza = _idpizza;
                    NewItem.id_ingred = _idingred;
                    NewItem.idPzzExistente = idPzzExistente;
                    NewItem.massa = _massa;
                    NewItem.tamanho = tamanhoo;
                    NewItem.nome_ingred = _Nomeingrediente;
                    NewItem._extra = extra;
                    NewItem.precoTotal = precoT;
                    NewItem.precoIngred = precoIngr;
                    NewItem.precoPorTam = precoPrTam;
                    NewItem.Origem = Origem;
                    _items.Add(NewItem);

                _lastUpdate = DateTime.Now;
            }

            public void Update(int RowID, string _nomePizza, int _idpizza, int _idingred, int idPzzExistente, string _massa, string tamanhoo, string _Nomeingrediente, string extra, double precoPrTam, double precoIngr, double precoT, string Origem)
            {
                PizzaIngrdienteAux Item = _items[RowID];
                Item.nomePizza = _nomePizza;
                Item.id_pizza = _idpizza;
                Item.id_ingred = _idingred;
               Item.idPzzExistente = idPzzExistente;
                Item.massa = _massa;
                Item.tamanho = tamanhoo;
                Item.nome_ingred = _Nomeingrediente;
                Item._extra  = extra;
                Item.precoTotal = precoT;
                Item.precoIngred = precoIngr;
                Item.precoPorTam = precoPrTam;
                Item.Origem = Origem;
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
                foreach (PizzaIngrdienteAux item in _items)
                {
                    if (item.id_pizza  == ProductID)
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

                    foreach (PizzaIngrdienteAux Item in _items)
                    {
                        t = Item.precoTotal;
                        break;
                    }
                    
                    return t;
                }
            }

            public string Tamanho
            {
                get
                {
                    string t = "";

                    foreach (PizzaIngrdienteAux Item in _items)
                    {
                        t = Item.tamanho;
                        break;
                    }

                    return t;
                }
            }
                       

        }
    
}
	
