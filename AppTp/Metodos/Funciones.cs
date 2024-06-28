using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppTp.Metodos
{
    public abstract class Funciones
    {
        public static float[] suma(float[,] matriz)
        {
            int columnas = matriz.GetLength(1); // Obtener el número de columnas
            int filas = matriz.GetLength(0); // Obtener el número de filas
            float[] sumaColumnas = new float[columnas]; // Array para almacenar la suma de cada columna

            // Iterar sobre cada columna
            for (int j = 0; j < columnas; j++)
            {
                float suma = 0;

                // Sumar los elementos de la columna actual
                for (int i = 0; i < matriz.GetLength(0); i++)
                {
                    suma += matriz[i, j];
                }

                // Almacenar la suma en el array
                sumaColumnas[j] = suma;
            }
            return sumaColumnas;
        }
        public static float[,] normalizar(float[,] matriz, float[] sumaColumnas)
        {
            int columnas = matriz.GetLength(1); // Obtener el número de columnas
            int filas = matriz.GetLength(0); // Obtener el número de filas
            float[,] matrizNormalizada = new float[filas,columnas] ;
            for (int i = 0; i < filas; i++)
            {
                for (int j = 0; j < columnas; j++)
                {
                    matrizNormalizada[i, j] = matriz[i, j] / sumaColumnas[j];
                }
            }
            return matrizNormalizada;
        }

        public static float[] PromedioFilas(float[,] matrizNormalizada)
        {
            int columnas = matrizNormalizada.GetLength(1); // Obtener el número de columnas
            int filas = matrizNormalizada.GetLength(0); // Obtener el número de filas
            float[] sumaFilas = new float[filas]; // Array para almacenar la suma de cada columna

            for (int j = 0; j < filas; j++)
            {
                float suma = 0;

                // Sumar los elementos de la columna actual
                for (int i = 0; i < columnas; i++)
                {
                    suma += matrizNormalizada[j, i];
                }

                // Almacenar la suma en el array
                sumaFilas[j] = suma / columnas;
            }
            return sumaFilas;

        }

        public static float[] multiplicarMatriz(float[,] matrizA, float[] pesos)
        {
            int columnas = matrizA.GetLength(1); // Obtener el número de columnas
            int filas = matrizA.GetLength(0); // Obtener el número de filas
            float[] aporw = new float[filas];
            float multiplicador = 0;

            for (int i = 0; i < filas; i++)
            {
                multiplicador = 0;
                for (int j = 0; j < columnas; j++)
                {
                    multiplicador = multiplicador + (matrizA[i, j] * pesos[j]);
                }
                aporw[i] = multiplicador;
            }
            return aporw;
        }

        

    }
}
