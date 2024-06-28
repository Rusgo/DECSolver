using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppTp.Entidades
{
    public class Arista
    {
        public Nodo NodoOrigen {  get; set; }
        public Nodo NodoDestino { get; set; }

        public Arista(Nodo nodoOrigen, Nodo nodoDestino)
        {
            NodoOrigen = nodoOrigen;
            NodoDestino = nodoDestino;
        }
    }
}
