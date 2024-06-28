using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace AppTp.Metodos
{
    public class AHP
    {
        public List<List<RadioButton>> evaluaciones { get; set; }
        public float[,] matriz { get; set; }
        public float[] suma { get; set; }
        public float[,] matrizNormalizada { get; set; }
        public float[] promedioFilas { get; set; }

        public float[] matrizAporW { get; set; }

        public float ic {  get; set; }
        public float rc { get; set; }

        public float lambda { get; set; }

        public AHP(int cantidadElementos, List<List<RadioButton>> ev)
        {
            //No es el numero de comparaciones, es el tamaño de la matriz
            int contador = 0;
            int contador2 = 0;
            int seleccionado = 0;
            int comparaciones = cantidadElementos;
            int auxiliar = 0;
            matriz = new float[cantidadElementos, cantidadElementos];
            foreach (List<RadioButton> lista in ev)
            {
                if (contador < comparaciones - 1)
                {
                    auxiliar = 0;
                    foreach (RadioButton rb in lista)
                    {
                        if (rb.IsChecked && auxiliar == 0)
                        {
                            seleccionado = 1;
                        }
                        if (rb.IsChecked && auxiliar == 1)
                        {
                            seleccionado = 2;
                        }
                        if (rb.IsChecked && auxiliar != 0 && auxiliar != 1 && seleccionado == 1)
                        {
                            matriz[contador2, contador + 1] = float.Parse(rb.Content.ToString());
                        }
                        else if (rb.IsChecked && auxiliar != 0 && auxiliar != 1 && seleccionado == 2)
                        {
                            matriz[contador2, contador + 1] = 1 / float.Parse(rb.Content.ToString());
                        }
                        auxiliar++;

                    }
                    contador++;

                }
                else
                {
                    auxiliar = 0;
                    contador--;
                    contador2++;
                    foreach (RadioButton rb in lista)
                    {
                        if (rb.IsChecked && auxiliar == 0)
                        {
                            seleccionado = 1;
                        }
                        if (rb.IsChecked && auxiliar == 1)
                        {
                            seleccionado = 2;
                        }
                        if (rb.IsChecked && auxiliar != 0 && auxiliar != 1 && seleccionado == 1)
                        {
                            matriz[contador2, contador + 1] = float.Parse(rb.Content.ToString());
                        }
                        else if (rb.IsChecked && auxiliar != 0 && auxiliar != 1 && seleccionado == 2)
                        {
                            matriz[contador2, contador + 1] = 1 / float.Parse(rb.Content.ToString());
                        }
                        auxiliar++;

                    }
                }

            }
            contador = 0;
            // Agregar filas al DataTable y asignar valores
            for (int i = 0; i < cantidadElementos; i++)
            {
                for (int j = 0; j < cantidadElementos; j++)
                {
                    //Se hacen n(n-1)/2 comparaciones (3*2)/2 se hacen 3 comparaciones

                    if (j == i)
                    {
                        matriz[i, j] = 1;
                        break;
                    }
                }
                if (i != 0)
                {
                    for (int k = i - 1; k >= 0; k--)
                    {
                        matriz[i, k] = 1 / matriz[k, i];
                    }
                }

            }


        }

        public bool comprobador()
        {
            this.suma = Funciones.suma(matriz);
            this.matrizNormalizada = Funciones.normalizar(matriz, this.suma);
            this.promedioFilas = Funciones.PromedioFilas(this.matrizNormalizada);
            this.matrizAporW = Funciones.multiplicarMatriz(this.matriz, this.promedioFilas);
            float acumulador = 0;
            int contador = 0;
            foreach (float aw in matrizAporW)
            {
                acumulador = acumulador + aw / promedioFilas[contador];
                contador++;
            }
            this.lambda = acumulador / contador;
            this.ic = (lambda - contador) / (contador - 1);

            double[] tabla = [0.52, 0.89, 1.11, 1.25, 1.35, 1.40, 1.45, 1.49];

            if (contador >= 3)
            {
                this.rc = ic / (float)tabla[contador - 3];
                if (rc < 0.10)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return true;
            }
        }
    }
}
