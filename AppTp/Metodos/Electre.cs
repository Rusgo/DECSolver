


using CommunityToolkit.Maui.Storage;

namespace AppTp.Metodos
{
    public class Electre : MultiCriterio
    {
        public float[,] matrizConcordancia {  get; set; }
        public float[,] matrizDiscordancia { get; set; }
        public float[,] matrizSuperacion { get; set; }
        public List<float[,]> listaDiscordancia { get; set; }
        public float[] maximos {  get; set; }
        public float[] min { get; set; }
        public float[] diferencias { get; set; }
        public List<float[]> ListaMaximosDeFilas { get; set; }
        public List<float[]>  ListaMaximosDeFilasDivD { get; set; }
        public float maxDif {  get; set; }
        public float ci { get; set; }
        public float di { get; set; }

        public Electre(float[,] matriz, List<float> pesos, List<bool> max, int metodo) : base(matriz, pesos, max, metodo)
        {

        }

        public override void resolver()
        {
            int columnas = matriz.GetLength(1);
            int filas = matriz.GetLength(0);
            this.matrizNormalizada = new float[filas, columnas];
            resultado = new float[filas];
            // Normalizar
            normalizar(filas, columnas);
            //Concordancia
            this.matrizConcordancia = indicesConcordancia(filas, columnas);
            //discordancia
            indicesDiscordancia(filas, columnas);
            //hago la matriz
            hacerMatrizDiscordancia(filas, columnas);
            //veo superadoras
        }
        public void hacerMatrizDiscordancia(int filas, int columnas)
        {
            matrizDiscordancia = new float[filas, filas];
            for(int i = 0; i < filas; i++)
            {
                int contador = 0;
                for (int j = 0; j < filas; j++)
                {
                    if (i != j)
                    {
                        matrizDiscordancia[i, j] = ListaMaximosDeFilasDivD[i][contador];
                        contador++;
                    }
                }
            }
        }
        public void indicesDiscordancia(int filas, int columnas)
        {
            this.maximos = new float[columnas];
            this.min = new float[columnas];

            for (int j = 0; j < columnas; j++)
            {
                min[j] = matrizNormalizada[0, j];
                maximos[j] = matrizNormalizada[0, j];
            }
            for (int i = 0; i < matriz.GetLength(0); i++)
            {
                for (int j = 0; j < columnas; j++)
                {
                    if (this.matrizNormalizada[i, j] < min[j] && this.max[j])
                    {
                        min[j] = this.matrizNormalizada[i, j];
                    }
                    else if (this.matrizNormalizada[i, j] > min[j] && !max[j])
                    {
                        min[j] = this.matrizNormalizada[i, j];
                    }

                    if (this.matrizNormalizada[i, j] > maximos[j] && max[j])
                    {
                        maximos[j] = this.matrizNormalizada[i, j];
                    }
                    else if (this.matrizNormalizada[i, j] < maximos[j] && !max[j])
                    {
                        maximos[j] = this.matrizNormalizada[i, j];
                    }

                }
            }
            diferencias = new float[columnas];
            for (int i = 0; i < columnas; i++)
            {
                diferencias[i] = Math.Abs(maximos[i] - min[i]);
                if (i == 0)
                {
                    maxDif = Math.Abs(maximos[i] - min[i]);
                    diferencias[i] = Math.Abs(maximos[i] - min[i]);
                }
                else if(maxDif < Math.Abs(maximos[i] - min[i]))
                {
                    maxDif = Math.Abs(maximos[i] - min[i]);
                    diferencias[i] = Math.Abs(maximos[i] - min[i]);
                }
                else
                {
                    diferencias[i] = Math.Abs(maximos[i] - min[i]);
                }
            }
            int contador = 0;
            listaDiscordancia = new List<float[,]>();
            this.ListaMaximosDeFilas = new List<float[]>();
            for (int alternativas = 0; alternativas < filas; alternativas++)
            {
                float[] MaximosDeFilas = new float[filas - 1];
                contador = 0;
                float[,] matrizAlternativas = new float[filas-1,columnas];
                for(int i = 0; i < filas; i++)
                {
                    bool bandera = true;
                    float maximoFila = 0;
                    if (i != alternativas)
                    {
                        for (int j = 0; j < columnas; j++)
                        {
                            //aca tambien ver si es maximo o minimo
                            float rta =  validar(alternativas, i, j);
                            if (bandera)
                            {
                                maximoFila = rta;
                                MaximosDeFilas[contador] = rta;
                                bandera = false;
                            }
                            else if(maximoFila < rta)
                            {
                                maximoFila = rta;
                                MaximosDeFilas[contador] = rta;
                            }
                            matrizAlternativas[contador, j] = rta;
                        }
                        contador++;
                       
                    }

                    
                }
                this.ListaMaximosDeFilas.Add(MaximosDeFilas);
                listaDiscordancia.Add(matrizAlternativas);
                

            }
            contador = 0;
            this.ListaMaximosDeFilasDivD = new List<float[]>();
            foreach (float[] maximoss in this.ListaMaximosDeFilas)
            {
                float[] MaximosDeFilasDivD = new float[filas - 1];
                for (int i = 0; i < maximoss.GetLength(0); i++)
                {
                    MaximosDeFilasDivD[i] = maximoss[i] / maxDif;
                }
                this.ListaMaximosDeFilasDivD.Add(MaximosDeFilasDivD);
                
            }
        }

        public float validar(int alternativaComparada, int fila, int col )
        {
            float res = 0;
            if (matrizNormalizada[alternativaComparada, col] < matrizNormalizada[fila, col] && max[col])
            {
                res = Math.Abs(matrizNormalizada[fila, col] - matrizNormalizada[alternativaComparada, col]);
            }
            else if (matrizNormalizada[alternativaComparada, col] > matrizNormalizada[fila, col] && !max[col])
            {
                res = Math.Abs(matrizNormalizada[alternativaComparada, col] - matrizNormalizada[fila, col]);
            }
            else
            {
                res = 0;
            }
            return res;
        }

        public float[,] indicesConcordancia(int alternativas, int criterios)
        {
            float[,] matrizConcordancias = new float[alternativas, alternativas];
           for(int alter=0; alter < alternativas; alter++)
            {
                for (int i = 0; i < alternativas; i++)
                {
                    if(alter==i)
                    {
                        matrizConcordancias[alter, i] = 0;

                    }
                    else
                    {
                        float acu = 0;
                        for (int j = 0; j < criterios; j++)
                        {

                            //cambiar en caso de min
                            if (this.matrizNormalizada[alter, j] > this.matrizNormalizada[i, j] && max[j])
                            {
                                acu += this.pesos[j];
                            }
                            else if (this.matrizNormalizada[alter, j] < this.matrizNormalizada[i, j] && !max[j])
                            {
                                acu += this.pesos[j];
                            }
                            else if(this.matrizNormalizada[alter, j] == this.matrizNormalizada[i, j])
                            {
                                acu += this.pesos[j];
                            }
                        }
                        matrizConcordancias[alter, i] = acu;
                    }
                }
            }
           /*
           for (int i = 0; i < alternativas; i++)
            {
                for(int j = 0;j < alternativas; j++)
                {
                    if (i == j)
                    {
                        matrizConcordancias[i, j] = 0;
                    }
                    else if(i < j)
                    {
                        matrizConcordancias[j, i] = 1 - matrizConcordancias[i, j];
                    }
                }
            }*/
           

            return matrizConcordancias;
        }

        public override void agregacion(int filas, int columnas)
        {
            this.matrizSuperacion = new float[filas, filas];
            for(int i = 0; i < filas; i++) 
            {
                for(int j=0; j < filas; j++)
                {
                    if(i != j)
                    {
                        if (matrizConcordancia[i, j] > ci && matrizDiscordancia[i, j] < di)
                        {
                            matrizSuperacion[i, j] = 1;
                        }
                        else
                        {
                            matrizSuperacion[i,j] = 0;
                        }
                    }
                }
            }
        }
        public string[,] formatoExcelP(float[,] matriz)
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
                        matrizFormatoExcel[i, j + 1] = "A" + (coluAgregada + 1).ToString();
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
        public string[,] formatoExcelDiscordancia(float[,] matriz, int actual, int cantTablas)
        {
            int filasTotales = matriz.GetLength(0);
            int columnasTotales = matriz.GetLength(1);

            string[,] matrizString = new string[matriz.GetLength(0), matriz.GetLength(1) + 1];
            int filaAgregada = 0;
            int coluAgregada = 0;
            for (int i = 0; i < filasTotales; i++)
            {
                for (int j = 0; j < columnasTotales; j++)
                {
                    if (j < matriz.GetLength(1) && i < matriz.GetLength(0))
                    {
                        matrizString[i, j + 1] = matriz[i, j].ToString();
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
                        matrizFormatoExcel[i + 1, j] = generarTextoFilas(actual + 1, cantTablas, i);
                    }
                    else if (j > 0 && i > 0 && j <= matriz.GetLength(1) && i <= matriz.GetLength(0))
                    {
                        matrizFormatoExcel[i, j] = matriz[i - 1, j - 1].ToString();
                    }
                    //Agrego fila de criterios
                    if (i == 0 && j < matrizString.GetLength(1))
                    {
                        matrizFormatoExcel[i, j] = " ";
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
        public string generarTextoFilas(int actual, int cant, int fila)
        {
            int cont = 0;
            List<int> list = new List<int>();
            for(int i = 0; i < cant; i++) { 
                if (actual != (i + 1)) {
                    list.Add(cont + 1);
                } 
                cont++;
                
            }
            return "A" + actual.ToString() + " y " + "A" + list[fila].ToString();
        }
        public override async void guardarExcel(string NombreArchivo)
        {
            string fileNameExport = NombreArchivo + ".xlsx";

            List<string> lista = new List<string>();
            List<string[,]> matrices = new List<string[,]>();
            List<string> textos = new List<string>();
            matrices.Add(formatoExcel(this.matrizNormalizada));
            lista.Add("matriz Normalizada");
            textos.Add("");
            matrices.Add((formatoExcelP(this.matrizConcordancia)));
            lista.Add("Matriz Concordancia");
            textos.Add("");
            List<string> fila = new List<string>() {
            "max",
            "min",
            "Dif"
            };
            List<float[]> filaF = new List<float[]>();
            filaF.Add(maximos);
            filaF.Add(min);
            filaF.Add(diferencias);
            matrices.Add(Agregarfila(formatoExcel(this.matrizNormalizada),filaF,fila));
            lista.Add("Tabla Diferencias");
            textos.Add("");
            int cont = 0;
            int discordanciaTablas = listaDiscordancia.Count;
            List<string> col = new List<string>() {
            "max",
            "max * 1/d",
            };
            foreach (float[,] tablaActual in listaDiscordancia)
            {
                lista.Add("Tabla " + (cont).ToString() + "- Discordancia");
                List<float[]> columna = new List<float[]>();
                columna.Add(ListaMaximosDeFilas[cont]);
                columna.Add(ListaMaximosDeFilasDivD[cont]);
                matrices.Add(AgregarColumna(formatoExcelDiscordancia(tablaActual, cont, discordanciaTablas), columna,col));
                textos.Add("");
                cont++;
            }
            matrices.Add((formatoExcelP(this.matrizDiscordancia)));
            textos.Add("");
            lista.Add("Matriz Discordancia");
            agregacion(matrizNormalizada.GetLength(0), matrizNormalizada.GetLength(1));
            matrices.Add((formatoExcelP(this.matrizSuperacion)));
            textos.Add("");
            lista.Add("Matriz Superacion");



            Entidades.ExcelExporter e = new Entidades.ExcelExporter();

            var folder = await FolderPicker.PickAsync(default);
            while (folder == null)
            {
                folder = await FolderPicker.PickAsync(default);
            }

            if (folder != null)
            {
                var FilePath = Path.Combine(folder.Folder.Path, fileNameExport);
                e.ExportToExcel(lista, matrices, FilePath, textos);
            }


        }
    }
}
