using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppTp.Entidades
{
    public class Nodo
    {
        public String Nombre {  get; set; }
        public float X {  get; set; }
        public float Y { get; set; }

        public Nodo(string nombre, float x, float y)
        {
            this.Nombre = nombre;
            this.X = x;
            this.Y = y;
        }
    }
}
