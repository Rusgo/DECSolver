using AppTp.Metodos;
using CommunityToolkit.Maui.Storage;
using DocumentFormat.OpenXml.Spreadsheet;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppTp.Entidades
{
    public class formatoAhp
    {
        public static string[,] juntarMatrices(List<string[,]> matrices, int filasMax, int colMax)
        {
            string[,] resultado = new string[(filasMax*matrices.Count) + 1, colMax];
            int cont = 0;
            foreach (string[,] mat in matrices)
            {
                for(int i = 0; i < mat.GetLength(0); i++)
                {
                    for (int j = 0; j < mat.GetLength(1); j++)
                    {

                        resultado[i + (filasMax * cont), j] = mat[i, j];
                    }
                }
                cont++;
            }

            return resultado;
        }
        public static string[,] AgregarColumna(string[,] matriz, List<float[]> agregados, List<string> letras)
        {
            int filasTotales = agregados.Count;

            string[,] matrizFormatoExcel = new string[matriz.GetLength(0), matriz.GetLength(1) + filasTotales];
            int filaAgregada = 0;
            for (int i = 0; i < matrizFormatoExcel.GetLength(0); i++)
            {
                for (int j = 0; j < matrizFormatoExcel.GetLength(1); j++)
                {
                    if (j < matriz.GetLength(1) && i < matriz.GetLength(0))
                    {
                        matrizFormatoExcel[i, j] = matriz[i, j];
                    }
                    if (j >= matriz.GetLength(1) && i == 0)
                    {
                        matrizFormatoExcel[i, j] = letras[i];
                    }
                    else if (j >= matriz.GetLength(1) && i > 0)
                    {
                        matrizFormatoExcel[i, j] = agregados[filaAgregada][i - 1].ToString();
                    }

                }
            }
            return matrizFormatoExcel;
        }

        //Agrega A1A2A3
        public static string[,] formatoExcel(float[,] matriz, bool alter, string criterio)
        {
            int filasTotales = matriz.GetLength(0);
            int columnasTotales = matriz.GetLength(1);

            string[,] matrizString = new string[matriz.GetLength(0), matriz.GetLength(1)];
            int filaAgregada = 0;
            int coluAgregada = 0;
            for (int i = 0; i < filasTotales; i++)
            {
                for (int j = 0; j < columnasTotales; j++)
                {
                    if (j < matriz.GetLength(1) && i < matriz.GetLength(0))
                    {
                        matrizString[i, j] = matriz[i, j].ToString();
                    }

                }
                if (i < matriz.GetLength(0))
                {
                    filaAgregada++;
                }
            }
            filaAgregada = 0;
            coluAgregada = 0;
            string[,] matrizFormatoExcel = new string[filasTotales + 1, columnasTotales + 1];
            for (int i = 0; i < filasTotales + 1; i++)
            {
                for (int j = 0; j < columnasTotales + 1; j++)
                {
                    //Agrego col de alter
                    if (j == 0 && i < matriz.GetLength(0) && alter)
                    {
                        matrizFormatoExcel[i + 1, j] = "A" + (filaAgregada + 1).ToString();
                    }
                    else if (j > 0 && i > 0 && j <= matriz.GetLength(1) && i <= matriz.GetLength(0))
                    {
                        matrizFormatoExcel[i, j] = matriz[i - 1, j - 1].ToString();
                    }
                    //Agrego fila de criterios
                    if (i == 0 && j < matrizString.GetLength(1) && !alter)
                    {
                        matrizFormatoExcel[i, j + 1] = "C" + (coluAgregada + 1).ToString();
                        coluAgregada++;
                    }
                    if (i == 0 && j < matrizString.GetLength(1) && alter)
                    {
                        matrizFormatoExcel[i, j + 1] = "A" + (coluAgregada + 1).ToString();
                        coluAgregada++;
                    }
                    if (j == 0 && i < matriz.GetLength(0) && !alter)
                    {
                        matrizFormatoExcel[i + 1, j] = "C" + (filaAgregada + 1).ToString();
                    }
                    if(i== 0 && j == 0)
                    {
                        matrizFormatoExcel[0, 0] = criterio;
                    }
                }
                if (i < matriz.GetLength(0))
                {
                    filaAgregada++;
                }
            }

            return matrizFormatoExcel;
        }
    }
}
