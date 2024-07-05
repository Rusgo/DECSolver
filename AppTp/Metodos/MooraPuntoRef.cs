using CommunityToolkit.Maui.Storage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppTp.Metodos
{
    public class MooraPuntoRef : MultiCriterio
    {
        public MooraPuntoRef(float[,] matriz, List<float> pesos, List<bool> max, int metodo) : base(matriz, pesos, max, 1)
        {
        }

        public float[,] MatrizPR { get; set; }
        public float distancia { get; set; }
        public float[] rj { get; set; }




        public override void agregacion(int filas, int columnas)
        {
            this.rj = new float[columnas];
            this.MatrizPR = new float[filas, columnas];

            for (int j = 0; j < columnas; j++)
            {
                rj[j] = matrizPonderada[0, j];
            }
            for (int j = 0; j < columnas; j++)
            {
                for (int i = 0; i < filas; i++)
                {
                    if (matrizPonderada[i, j] < rj[j] && !max[j])
                    {
                       rj[j] = matrizPonderada[i, j];
                    }
                    if (matrizPonderada[i, j] > rj[j] && max[j])
                    {
                        rj[j] = matrizPonderada[i, j];
                    }

                }
            }
            
            for (int i = 0; i < filas; i++)
            {
                for (int j = 0; j < columnas; j++)
                {
                    if (max[j])
                    {
                        distancia = rj[j] - matrizPonderada[i, j];
                    }
                    else
                    {
                        distancia = matrizPonderada[i, j] - rj[j];
                    }
                    MatrizPR[i, j] = distancia;
                }
            }

            for (int i = 0; i < filas; i++)
            {
                float max = 0;
                for (int j = 0; j < columnas; j++)
                {
                    if (MatrizPR[i, j] > max)
                    {
                        max = MatrizPR[i, j];
                    }
                }
                resultado[i] = max;
            }

        }
        public virtual string[,] mejorAlternativaExcel()
        {

            List<string> listaLetras = new List<string>
            {
                "rj",
            };

            List<float[]> matrizSumyPeso = new List<float[]>
            {
                this.rj
            };


            return Agregarfila(formatoExcel(this.matrizPonderada), matrizSumyPeso, listaLetras);
        }
        public override string[,] agregacionExcel()
        {
            List<string> Lresul = new List<string>
            {
                "Distancia"
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
            return AgregarColumna(formatoExcel(this.MatrizPR), agrega, Lresul);
        }
        public override async void guardarExcel(string NombreArchivo)
        {
            string fileNameExport = NombreArchivo + ".xlsx";

            List<string> lista = new List<string>
            {
                "RaizDeSumatoria",
                "Normalizar",
                "Ponderar",
                "Sacar el mejor",
                "Agregacion"
            };
            List<float[]> lista2 = new List<float[]>();
            List<string[,]> matrices = new List<string[,]>
            {
                sinNormalizarExcel(),
                normalizarExcel(),
                ponderarExcel(),
                mejorAlternativaExcel(),
                agregacionExcel()
            };
            Entidades.ExcelExporter e = new Entidades.ExcelExporter();

            var folder = await FolderPicker.PickAsync(default);
            while (folder == null)
            {
                folder = await FolderPicker.PickAsync(default);
            }
            List<string> textos = new List<string>
            {
                "Aplicamos el método de ponderación lineal calculando la suma de cuadrados de cada elemento de cada columna \n Este enfoque implica elevar al cuadrado cada valor en la matriz de decisión, correspondiente a las contribuciones de las alternativas respecto a cada criterio \n Luego, se suma el cuadrado de cada elemento en una columna específica, lo que proporciona una medida de la dispersión o variabilidad de los valores en esa columna.",
                "En este paso, empleamos el método de normalización por distancia euclidiana \n La distancia euclidiana se obtiene como la raíz cuadrada de la suma de los cuadrados de cada columna \n Una vez calculadas estas distancias, se normalizan los valores de la matriz dividiendo cada elemento por su respectiva distancia euclidiana",
                "En esta fase, procedemos a ponderar la matriz normalizada \n Para llevar a cabo esta tarea, multiplicamos cada valor de la matriz normalizada por su correspondiente peso asignado a cada criterio \n La multiplicación de los valores normalizados por los pesos asegura que los criterios más importantes tengan un mayor impacto en la evaluación final de las alternativas",
                "A continuacion lo que se hace es establecer el punto de referencia, representado por la mejor alternativa posible a cada uno de los criterios considerados",
                "Calculamos la distancia Tchebycheff que representa la distancia que existe entre cada alternativa y el punto de referencia establecido para cada uno de los criterios \n Luego procedemos a seleccionar la mayor de estas distancias por alternativa \n por ultimo se debe ordenar de mayor a menor estos valores dandonos el orden de seleccion en base a los criterios y a la importancia de los mismos expresada por el decisor"
            };
            if (folder != null)
            {
                var FilePath = Path.Combine(folder.Folder.Path, fileNameExport);
                e.ExportToExcel(lista, matrices, FilePath, textos);
            }


        }
        public override string[] ordenarResultado()
        {
            int cantidad = this.resultado.Length;

            string[] alternativas = new string[cantidad];
            float[] resultados = this.resultado;
            var indexedNumbers = resultados
            .Select((value, index) => (value, index))
            .ToArray();

            Array.Sort(indexedNumbers, (x, y) => x.value.CompareTo(y.value));

            int cont = 0;
            foreach (var (value, index) in indexedNumbers)
            {
                alternativas[cont] = "A" + (index + 1).ToString();
                cont++;
            }
            return alternativas;
        }
        public override string[] ordenarResultadoValores()
        {
            int cantidad = this.resultado.Length;

            string[] alternativas = new string[cantidad];
            float[] resultados = this.resultado;
            var indexedNumbers = resultados
            .Select((value, index) => (value, index))
            .ToArray();

            Array.Sort(indexedNumbers, (x, y) => x.value.CompareTo(y.value));

            int cont = 0;
            foreach (var (value, index) in indexedNumbers)
            {
                alternativas[cont] = "Alternativa" + (index + 1).ToString() + ": " + value.ToString();
                cont++;
            }
            return alternativas;
        }
    }
}
