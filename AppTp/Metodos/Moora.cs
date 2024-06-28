using CommunityToolkit.Maui.Storage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppTp.Metodos
{
    public class Moora:MultiCriterio
    {
        public Moora(float[,] matriz, List<float> pesos, List<bool> max,int metodo) : base(matriz, pesos, max, metodo)
        {
        }

        public override void agregacion(int filas, int columnas)
        {
            float acu = 0;
            for (int i = 0; i < filas; i++)
            {
                for (int j = 0; j < columnas; j++)
                {
                    acu = acu + validar(matrizPonderada[i,j], max[j]);
                }
                resultado[i] = acu;
                acu = 0;
            }
        }
        public override float verificar(float a, bool b)
        {
            return a;
        }
        public float validar(float a, bool b)
        {
            if (b)
            {
                return a;
            }
            return (-a);
        }
        public virtual string[,] agregacionExcel()
        {
            List<string> Lresul = new List<string>
            {
                "S(Xi)"
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
        public override async void guardarExcel(string NombreArchivo)
        {
            string fileNameExport = NombreArchivo + ".xlsx";

            List<string> lista = new List<string>
            {
                "RaizDeSumatoria",
                "Normalizar",
                "Ponderar",
                "Agregacion"
            };
            

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
            List<string> textos = new List<string>
            {
                "Aplicamos el método moora calculando la suma de cuadrados de cada elemento de cada columna \n Este enfoque implica elevar al cuadrado cada valor en la matriz de decisión, correspondiente a las contribuciones de las alternativas respecto a cada criterio \n Luego, se suma el cuadrado de cada elemento en una columna específica, lo que proporciona una medida de la dispersión o variabilidad de los valores en esa columna.",
                "En este paso, empleamos el método de normalización por distancia euclidiana \n La distancia euclidiana se obtiene como la raíz cuadrada de la suma de los cuadrados de cada columna \n Una vez calculadas estas distancias, se normalizan los valores de la matriz dividiendo cada elemento por su respectiva distancia euclidiana",
                "En esta fase, procedemos a ponderar la matriz normalizada \n Para llevar a cabo esta tarea, multiplicamos cada valor de la matriz normalizada por su correspondiente peso asignado a cada criterio \n La multiplicación de los valores normalizados por los pesos asegura que los criterios más importantes tengan un mayor impacto en la evaluación final de las alternativas",
                "En esta fase del proceso aplicamos la función de agregación para determinar la preferencia global de cada alternativa \n Sumamos los valores de cada criterio a maximizar y le restamos los valores de cada criterio a minimizar con respecto a una alternativa"
            };
            if (folder != null)
            {
                var FilePath = Path.Combine(folder.Folder.Path, fileNameExport);
                e.ExportToExcel(lista, matrices, FilePath, textos);
            }
        }
    }
}
