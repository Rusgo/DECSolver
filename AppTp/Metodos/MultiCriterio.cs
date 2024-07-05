using AppTp.Metodos;
using CommunityToolkit.Maui.Storage;
using DevExpress.XtraEditors;
using DocumentFormat.OpenXml.Office2013.Drawing.Chart;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace AppTp.Metodos
{
    public class MultiCriterio
    {
        public float[,] matriz { get; set; }
        public float[,] matrizNormalizada { get; set; }
        public float[,] matrizPonderada { get; set; }
        public List<float> pesos { get; set; }
        public float[] resultado { get; set; }
        public float[] sumaFinal { get; set; }
        //verdadero es suma
        public int metodo { get; set; }
        public List<bool> max { get; set; }
        public MultiCriterio(float[,] matriz, List<float> pesos, List<bool> max, int metodo)
        {
            this.matriz = matriz;
            this.pesos = pesos;
            this.max = max;
            this.metodo = metodo;
        }
        public virtual void resolver()
        {
            int columnas = matriz.GetLength(1);
            int filas = matriz.GetLength(0);
            this.matrizNormalizada = new float[filas, columnas];
            this.matrizPonderada = new float[filas, columnas];
            resultado = new float[filas];
            // Normalizar
            normalizar(filas, columnas);
            //Ponderar
            ponderar(filas, columnas);
            //Agregacion
            agregacion(filas, columnas);
        }
        public float obtenerRango(int j)
        {
            int filas = matriz.GetLength (0);
            // Inicializar los mínimos y máximos con el primer elemento de cada columna
            float max = matriz[0, j];
            float min = matriz[0, j];
            
            for (int i = 0; i < filas; i++) 
                {
                if(matriz[i, j] > max)
                {
                    max = matriz[i, j];
                }
                if (matriz[i, j] < min)
                {
                    min = matriz[i, j];
                }
                }

            return max - min; 
        }
        public virtual void normalizar(int filas, int columnas)
        {
            float[] sumaColumnas = new float[columnas];
            // Iterar sobre cada columna
            for (int j = 0; j < columnas; j++)
            {
                float suma = 0;

                // Sumar los elementos de la columna actual
                for (int i = 0; i < matriz.GetLength(0); i++)
                {
                    float res = verificar((this.metodo == 0) ? matriz[i, j] : ((float)Math.Pow(matriz[i, j], 2)), max[j]);
                    if(metodo==1)
                    {
                        matriz[i, j] = MathF.Sqrt(res);
                    }
                    else if (metodo==0)
                        {
                        matriz[i, j] = res;
                        }

                    
                    suma += res;
                }
                if(metodo == 2)
                {
                    float rango = obtenerRango(j);
                    sumaColumnas[j] = rango;
                }
                else
                {
                    // Almacenar la suma en el array
                    sumaColumnas[j] = (this.metodo == 0) ? suma : (float)Math.Sqrt(suma);
                }
                
            }
            this.sumaFinal = sumaColumnas;

            //normalizar
            for (int i = 0; i < filas; i++)
            {
                for (int j = 0; j < columnas; j++)
                {
                    matrizNormalizada[i, j] = (matriz[i, j] / sumaColumnas[j]);
                }
            }
        }
        //este metodo tiene como finalidad definir si es columna de maximo y minimo para aplicar los cambios necesarios
        public virtual float verificar(float a, bool b)
        {
            return a;
        }
        //pondero cada de la matriz normalizada por su peso
        public virtual void ponderar(int filas, int columnas)
        {
            for (int i = 0; i < filas; i++)
            {
                for (int j = 0; j < columnas; j++)
                {
                    matrizPonderada[i, j] = (matrizNormalizada[i, j] * pesos[j]);
                }
            }
        }
        //resuelve genericamente, se va a sobreescribir en los demas
        public virtual void agregacion(int filas, int columnas)
        {
            float acu = 0;
            for (int i = 0; i < filas; i++)
            {
                for (int j = 0; j < columnas; j++)
                {
                    acu = acu + (matrizPonderada[i, j]);
                }
                resultado[i] = acu;
                acu = 0;
            }
        }
        //Agrega A1A2A3
        public string[,] formatoExcel(float[,] matriz)
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
                    if (j == 0 && i < matriz.GetLength(0))
                    {
                        matrizFormatoExcel[i + 1, j] = "A" + (filaAgregada + 1).ToString();
                    }
                    else if (j > 0 && i > 0 && j <= matriz.GetLength(1) && i <= matriz.GetLength(0))
                    {
                        matrizFormatoExcel[i, j] = matriz[i - 1, j - 1].ToString();
                    }
                    //Agrego fila de criterios
                    if (i == 0 && j < matrizString.GetLength(1))
                    {
                        matrizFormatoExcel[i, j + 1] = "C" + (coluAgregada + 1).ToString();
                        coluAgregada++;
                    }
                }
                if (i < matriz.GetLength(0))
                {
                    filaAgregada++;
                }
            }

            return matrizFormatoExcel;
        }
        //AGREGAR FILA A MATRIZ
        public string[,] Agregarfila(string[,] matriz, List<float[]> agregados, List<string> letras)
        {
            int filasTotales = agregados.Count;

            string[,] matrizFormatoExcel = new string[matriz.GetLength(0) + filasTotales, matriz.GetLength(1)];
            int filaAgregada = 0;
            for (int i = 0; i < matrizFormatoExcel.GetLength(0); i++)
            {
                for (int j = 0; j < matrizFormatoExcel.GetLength(1); j++)
                {
                    if (j < matriz.GetLength(1) && i < matriz.GetLength(0))
                    {
                        matrizFormatoExcel[i, j] = matriz[i, j];
                    }
                    if (j == 0 && i >= matriz.GetLength(0))
                    {
                        matrizFormatoExcel[i, j] = letras[filaAgregada];
                    }
                    else if (i >= matriz.GetLength(0) && j > 0 && agregados[filaAgregada].Count() >= j)
                    {
                        matrizFormatoExcel[i, j] = agregados[filaAgregada][j - 1].ToString();
                    }

                }
                if (i >= matriz.GetLength(0))
                {
                    filaAgregada++;
                }
            }
            return matrizFormatoExcel;
        }
        //AGREGAR columna A MATRIZ
        public string[,] AgregarColumna(string[,] matriz, List<float[]> agregados, List<string> letras)
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

        public string[,] sinNormalizarExcel()
        {
            List<string> listaLetras = new List<string>
            {
                "Raiz de Cuadrados",
                "Pesos"
            };
            if (this.metodo == 0)
            {
                listaLetras = new List<string>
            {
                "Suma",
                "Pesos"
            };
            }
            else if (this.metodo == 2)
            {
                listaLetras = new List<string>
            {
                "Rango",
                "Pesos"
            };
            }
            float[] peso = new float[this.pesos.Count()];
            int cont = 0;
            foreach (float f in pesos)
            {
                peso[cont] = f;
                cont++;
            }
            List<float[]> matrizSumyPeso = new List<float[]>
            {
                this.sumaFinal,
                peso

            };


            return Agregarfila(formatoExcel(this.matriz), matrizSumyPeso, listaLetras);
        }
        public string[,] normalizarExcel()
        {
            List<string> listaLetras = new List<string>
            {
                "Raiz de Cuadrados",
                "Pesos"
            };
            if (this.metodo == 0)
            {
                listaLetras = new List<string>
            {
                "Suma",
                "Pesos"
            };
            }
            else if (this.metodo == 2)
            {
                listaLetras = new List<string>
            {
                "Rango",
                "Pesos"
            };
            }

                float[] peso = new float[this.pesos.Count()];
            int cont = 0;
            foreach (float f in pesos)
            {
                peso[cont] = f;
                cont++;
            }
            List<float[]> matrizSumyPeso = new List<float[]>
            {
                this.sumaFinal,
                peso

            };


            return Agregarfila(formatoExcel(this.matrizNormalizada), matrizSumyPeso, listaLetras);
        }
        public virtual string[,] ponderarExcel()
        {
            List<string> listaLetras = new List<string>
            {
                "Raiz de Cuadrados",
                "Pesos"
            };
            if (this.metodo == 0)
            {
                listaLetras = new List<string>
                {
                    "Suma",
                    "Pesos"
                };
            }
            else if (this.metodo == 2)
            {
                listaLetras = new List<string>
                {
                    "Rango",
                    "Pesos"
                };
            }

            float[] peso = new float[this.pesos.Count()];
            int cont = 0;
            foreach (float f in pesos)
            {
                peso[cont] = f;
                cont++;
            }
            List<float[]> matrizSumyPeso = new List<float[]>
            {
                this.sumaFinal,
                peso

            };


            return Agregarfila(formatoExcel(this.matrizPonderada), matrizSumyPeso, listaLetras);
        }
        
        public virtual string[,] agregacionExcel()
        {
            List<string> Lresul = new List<string>
            {
                "Resultado"
            };
            float[] res = new float[this.resultado.Count()];
            int cont = 0;
            foreach (float f in resultado)
            {
                res[cont] = f;
                cont++;
            }
            cont = 0;

            List<float[]> agrega = new List<float[]>
            {
                res

            };

            return AgregarColumna(formatoExcel(this.matrizPonderada), agrega, Lresul);
        }
        public virtual async void guardarExcel(string nombreArchivo)
        {
            string fileNameExport = nombreArchivo + ".xlsx";

            List<string> lista = new List<string>
            {
                "RaizDeSumatoria",
                "Normalizar",
                "Ponderar",
                "Agregacion"
            };
            List<string> textos = new List<string>
            {
                //Diferencia Euclidiana
                "Aplicamos el método de ponderación lineal calculando la suma de cuadrados de cada elemento de cada columna \n Este enfoque implica elevar al cuadrado cada valor en la matriz de decisión, correspondiente a las contribuciones de las alternativas respecto a cada criterio \n Luego, se suma el cuadrado de cada elemento en una columna específica, lo que proporciona una medida de la dispersión o variabilidad de los valores en esa columna.",
                "En este paso, empleamos el método de normalización por distancia euclidiana \n La distancia euclidiana se obtiene como la raíz cuadrada de la suma de los cuadrados de cada columna \n Una vez calculadas estas distancias, se normalizan los valores de la matriz dividiendo cada elemento por su respectiva distancia euclidiana",
                "En esta fase, procedemos a ponderar la matriz normalizada \n Para llevar a cabo esta tarea, multiplicamos cada valor de la matriz normalizada por su correspondiente peso asignado a cada criterio \n La multiplicación de los valores normalizados por los pesos asegura que los criterios más importantes tengan un mayor impacto en la evaluación final de las alternativas",
                "En esta etapa aplicamos la función de agregación a la matriz ponderada \n La función de agregación es la encargada de combinar las contribuciones ponderadas de cada alternativa respecto a todos los criterios, generando así una medida global de preferencia para cada alternativa \n En nuestro caso utilizaremos la suma ponderada por lo que sumamos los valores ponderados de cada alternativa en todas las columnas de la matriz. "
            };
            if (this.metodo == 0)
            {
                lista = new List<string>
            {
                "Sumatoria",
                "Normalizar",
                "Ponderar",
                "Agregacion"
            };
                textos = new List<string>
            {
                "Aplicamos el método de ponderación lineal calculando la suma de cuadrados de cada elemento de cada columna \n Este enfoque implica elevar al cuadrado cada valor en la matriz de decisión, correspondiente a las contribuciones de las alternativas respecto a cada criterio \n Luego, se suma el cuadrado de cada elemento en una columna específica, lo que proporciona una medida de la dispersión o variabilidad de los valores en esa columna.",
                "En este paso, nos enfocamos en normalizar la matriz de valores originales utilizando el método de normalización por la suma \n Para lograr esto, dividimos cada valor en la matriz por la suma de todos los valores en la misma columna.",
                "En esta fase, procedemos a ponderar la matriz normalizada \n Para llevar a cabo esta tarea, multiplicamos cada valor de la matriz normalizada por su correspondiente peso asignado a cada criterio \n La multiplicación de los valores normalizados por los pesos asegura que los criterios más importantes tengan un mayor impacto en la evaluación final de las alternativas",
                "En esta etapa aplicamos la función de agregación a la matriz ponderada \\n La función de agregación es la encargada de combinar las contribuciones ponderadas de cada alternativa respecto a todos los criterios, generando así una medida global de preferencia para cada alternativa \\n En nuestro caso utilizaremos la suma ponderada por lo que sumamos los valores ponderados de cada alternativa en todas las columnas de la matriz"
            };
            }
            else if (this.metodo == 2)
            {
                lista = new List<string>
            {
                "Rango",
                "Normalizar",
                "Ponderar",
                "Agregacion"
            };
                textos = new List<string>
            {
                "Aplicamos el método de ponderación lineal calculando el Rango entre el maximo y minimo de cada criterio para luego dividir por eso a cada uno de los valores para normalizar la tabla",
                "En este paso, nos enfocamos en normalizar la matriz de valores originales utilizando el método de normalización por el rango \n Para lograr esto, dividimos cada valor en la matriz por el rango de los valores en la misma columna.",
                "En esta fase, procedemos a ponderar la matriz normalizada \n Para llevar a cabo esta tarea, multiplicamos cada valor de la matriz normalizada por su correspondiente peso asignado a cada criterio \n La multiplicación de los valores normalizados por los pesos asegura que los criterios más importantes tengan un mayor impacto en la evaluación final de las alternativas",
                "En esta etapa aplicamos la función de agregación a la matriz ponderada \\n La función de agregación es la encargada de combinar las contribuciones ponderadas de cada alternativa respecto a todos los criterios, generando así una medida global de preferencia para cada alternativa \\n En nuestro caso utilizaremos la suma ponderada por lo que sumamos los valores ponderados de cada alternativa en todas las columnas de la matriz"
            };
            }
            
            List<float[]> lista2 = new List<float[]>();
            List<string[,]> matrices = new List<string[,]>
            {
                sinNormalizarExcel(),
                normalizarExcel(),
                ponderarExcel(),
                agregacionExcel()
            };
            Entidades.ExcelExporter e = new Entidades.ExcelExporter();

            var folder = await FolderPicker.PickAsync(default);
            while (folder == null)
            {
                folder = await FolderPicker.PickAsync(default);
            }
            
            if (folder != null)
            {
                var FilePath = Path.Combine(folder.Folder.Path, fileNameExport);
                e.ExportToExcel(lista, matrices, FilePath,textos);
            }


        }

        public virtual string[] ordenarResultado()
        {
            int cantidad = this.resultado.Length;

            string[] alternativas = new string[cantidad];
            float[] resultados = this.resultado;
            var indexedNumbers = resultados
            .Select((value, index) => (value, index))
            .ToArray();

            Array.Sort(indexedNumbers, (x, y) => y.value.CompareTo(x.value));

            int cont = 0;
            foreach (var (value, index) in indexedNumbers)
            {
                alternativas[cont] = "A" + (index+1).ToString();
                cont++;
            }
            return alternativas;
        }

        public virtual string[] ordenarResultadoValores()
        {
            int cantidad = this.resultado.Length;

            string[] alternativas = new string[cantidad];
            float[] resultados = this.resultado;
            var indexedNumbers = resultados
            .Select((value, index) => (value, index))
            .ToArray();

            Array.Sort(indexedNumbers, (x, y) => y.value.CompareTo(x.value));

            int cont = 0;
            foreach (var (value, index) in indexedNumbers)
            {
                alternativas[cont] = "Alternativa " + (index + 1).ToString() + ": " + value.ToString();
                cont++;
            }
            return alternativas;
        }
    }
}
