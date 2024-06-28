using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppTp.Metodos
{
    public class Pesos
    {
        public float[,] matriz { get; set; }
        public float[,] matrizNormalizada { get; set; }
        public List<bool> max { get; set; }

        public List<float> pesos { get; set; }

        public void resolverEntropia()
        {
            normalizar(matriz.GetLength(0), matriz.GetLength(1));
            entropia();

        }

        public void normalizar(int filas, int columnas)
        {
            this.matrizNormalizada = new float[filas, columnas];
            float[] sumaColumnas = new float[columnas];
            // Iterar sobre cada columna
            for (int j = 0; j < columnas; j++)
            {
                float suma = 0;

                // Sumar los elementos de la columna actual
                for (int i = 0; i < matriz.GetLength(0); i++)
                {
                    //hay que llevar todo al mismo sentido de optimidad??
                    float res = verificar(matriz[i, j], max[j]);
                    this.matriz[i,j] = verificar(matriz[i, j], max[j]);
                    suma += res;
                }

                // Almacenar la suma en el array
                sumaColumnas[j] = suma;
            }

            //normalizar
            for (int i = 0; i < filas; i++)
            {
                for (int j = 0; j < columnas; j++)
                {
                    matrizNormalizada[i, j] = (matriz[i, j] / sumaColumnas[j]);
                }
            }
        }
        public void entropia()
        {
            pesos = new List<float>();
            float[] entropia = new float[matrizNormalizada.GetLength(1)];
            float k = 1/MathF.Log(matrizNormalizada.GetLength(0));
            for (int j = 0; j < matrizNormalizada.GetLength(1); j++)
            {
                float suma = 0;

                // Sumar los elementos de la columna actual
                for (int i = 0; i < matrizNormalizada.GetLength(0); i++)
                {
                    //hay que llevar todo al mismo sentido de optimidad??
                    float res = (matrizNormalizada[i, j]*MathF.Log(matrizNormalizada[i, j]));
                    suma += res;
                }

                // Almacenar la suma en el array
                entropia[j] = 1 - (-k*suma);
            }
            float acu = 0;
            foreach(float i in entropia)
            {
                acu = acu + i;
            }
            foreach (float i in entropia)
            {
                pesos.Add(i / acu);
            }
        }
        public  float verificar(float a, bool b)
        {
            if (b)
            {
                return a;
            }
            else if (a == 0)
            {
                return 0;
            }
            return (1 / a);
        }
    }
}
