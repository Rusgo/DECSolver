
using AppTp.Metodos;
using AppTp.Pantallas.Pasos;
using DevExpress.Maui.Core.Internal;
using DocumentFormat.OpenXml.Math;
namespace AppTp.Pantallas;

public partial class NewPage1 : ContentPage
{
    private readonly Color backgroundColor = Color.FromHex("#77B0AA");
    private readonly Color labelColor = Color.FromHex("#003C43");
    int filas;
    int columnas;
    string metodo;
    List<float> pesos;
    List<bool> maxmin;
    int selectedIndex;

    public NewPage1(int rows, int columns, List<bool> maxmin, List<float> pesos, string metodo, int selectedIndex)
    {
        InitializeComponent();
        this.filas = rows;
        this.selectedIndex = selectedIndex;
        this.columnas = columns;
        this.metodo = metodo;
        this.maxmin = maxmin;
        this.pesos = pesos; 
        CreateTable(rows, columns, metodo.Trim());

        
    }
    public void CreateTable(int cantAlternativas, int cantCriterios, string metodo)
    {
        int filas = cantAlternativas + 1;
        int columnas = cantCriterios + 1;
        for (int fila = 0; fila < filas; fila++)
        {
            GridCargaTabla.RowDefinitions.Add(new RowDefinition { Height = GridLength.Auto });

        }
        for (int columna = 0; columna < columnas; columna++)
        {
            GridCargaTabla.ColumnDefinitions.Add(new ColumnDefinition { Width = GridLength.Auto });

        }
        for (int fila = 0; fila < filas; fila++)
        {
            for (int columna = 0; columna < columnas; columna++)
            {
                View cellView;
                if (columna == 0 && fila == 0)
                {
                    cellView = new Frame
                    {
                        Content = new Label
                        {
                            Text = metodo,
                            VerticalOptions = LayoutOptions.Center,
                            HorizontalOptions = LayoutOptions.Center,
                            FontAttributes = FontAttributes.Bold,
                            Margin = 5,
                            WidthRequest = 100,
                            HorizontalTextAlignment = TextAlignment.Center,
                            TextColor = labelColor,
                            BackgroundColor = backgroundColor,
                        },
                        BorderColor = labelColor,
                        Padding = new Thickness(2),
                        CornerRadius = 0,
                        BackgroundColor = backgroundColor,
                    };
                }
                else if (columna == 0 && fila != 0)
                {
                    cellView = new Frame
                    {
                        Content = new Label
                        {
                            Text = $"A{fila}",
                            VerticalOptions = LayoutOptions.Center,
                            HorizontalOptions = LayoutOptions.Center,
                            FontAttributes = FontAttributes.Bold,
                            TextColor = labelColor,
                            BackgroundColor = backgroundColor,
                        },
                        BorderColor = labelColor,
                        CornerRadius = 0,
                        Padding = new Thickness(2),
                        BackgroundColor = backgroundColor,
                    };
                }
                else if (fila == 0 && columna != 0)
                {
                    cellView = new Frame
                    {
                        Content = new Label
                        {
                            Text = $"C{columna}",
                            VerticalOptions = LayoutOptions.Center,
                            HorizontalOptions = LayoutOptions.Center,
                            Margin = 2,
                            FontAttributes = FontAttributes.Bold,
                            TextColor = labelColor,
                            BackgroundColor = backgroundColor,
                        },
                        BorderColor = labelColor,
                        Padding = new Thickness(2),
                        CornerRadius = 0,
                        BackgroundColor = backgroundColor,
                    };
                }
                else
                {
                    var entryEvaluacion = new Entry
                    {
                        VerticalOptions = LayoutOptions.Center,
                        HorizontalOptions = LayoutOptions.Center,
                        Keyboard = Keyboard.Numeric,
                        Margin = 2,
                        WidthRequest = 80,
                        TextColor = Colors.Black,
                        BackgroundColor = Colors.Transparent,
                    };


                    cellView = new Frame
                    {
                        Content = entryEvaluacion,
                        BorderColor = labelColor,
                        Padding = new Thickness(2),
                        CornerRadius = 0,
                        BackgroundColor = Colors.White
                    };
                }

                GridCargaTabla.Add(cellView, columna, fila);

            }
        }
    }
    private async void btnResolverClicked(object sender, EventArgs e)
    {
        int cantAlt = GridCargaTabla.RowDefinitions.Count - 1;
        int cantCrit = GridCargaTabla.ColumnDefinitions.Count - 1;
        float[,] matriz = new float[cantAlt, cantCrit];
        bool isValid = true;

        foreach (var child in GridCargaTabla.Children)
        {
            if (child is Frame frame && frame.Content is Entry entry)
            {
                if (!float.TryParse(entry.Text, out _))
                {
                    isValid = false;
                }
            }
        }

        
        if (!isValid)
        {
            DisplayAlert("Advertencia", "Por favor, ingrese solo valores numéricos.", "OK");
        }
        else
        {
            foreach (var child in GridCargaTabla.Children)
            {
                if (child is Frame frame && frame.Content is Entry entry)
                {
                    int row = GridCargaTabla.GetRow(frame);
                    int col = GridCargaTabla.GetColumn(frame);
                    if (row != 0 && col != 0)
                    {
                        matriz[row - 1, col - 1] = float.Parse(entry.Text);
                    }

                }
            }
            for (int i = 0; i < matriz.GetLength(0); i++) 
            {
                for (int j = 0; j < matriz.GetLength(1); j++)
                {
                    if (matriz[i, j] == 0)
                    {
                        for(int k = 0; k < matriz.GetLength(0); k++)
                        {
                            matriz[k, j] = matriz[k, j] + 1;
                        }
                    }
                }
            }


        }
        if (pesos.Count == 0)
        {
            Pesos entropia = new Pesos();
            entropia.matriz = matriz;
            entropia.max = maxmin;
            entropia.resolverEntropia();
            pesos = entropia.pesos;
        }
        bool existeNumeroDistintoCero = matriz.Cast<float>().Any(x => x > 0);
        if (metodo == "  Ponderación Lineal" && existeNumeroDistintoCero)
        {
            Metodos.PonderacionLineal pl = new Metodos.PonderacionLineal(matriz, pesos, maxmin, selectedIndex);
            pl.resolver();
            Navigation.PushAsync(new TabPage(pl));
        }
        else if (metodo == "Método MOORA" && existeNumeroDistintoCero)
        {
            Metodos.Moora moora = new Metodos.Moora(matriz, pesos, maxmin, 1);
            moora.resolver();
            Navigation.PushAsync(new MooraTabPage(moora));
        }
        if (metodo == "          MOORA Punto de Referencia" && existeNumeroDistintoCero)
        {
            Metodos.MooraPuntoRef moora = new Metodos.MooraPuntoRef(matriz, pesos, maxmin, 1);
            moora.resolver();
            Navigation.PushAsync(new MooraPRTabPage(moora));
        }
        if (metodo == "Método PROMETHEE" && existeNumeroDistintoCero)
        {
            Metodos.PROMETHEE tp = new Metodos.PROMETHEE(matriz, pesos, maxmin, selectedIndex);
            Entidades.Funcion fun1 = new Entidades.Funcion(0, 0, 0, 1);
            Entidades.Funcion fun2 = new Entidades.Funcion(0, 2, 0, 3);
            Entidades.Funcion fun3 = new Entidades.Funcion(500, 1000, 0, 5);
            List<Entidades.Funcion> lista = new List<Entidades.Funcion>
            {
                fun1,fun2,fun3
            };
            tp.resolver(lista);
            Navigation.PushAsync(new Resultados(tp));
        }
        if (metodo == "Método TOPSIS" && existeNumeroDistintoCero)
        {
            Metodos.Topsis tp = new Metodos.Topsis(matriz, pesos, maxmin, selectedIndex);
            tp.resolver();
            Navigation.PushAsync(new TOPSISTabPage(tp));
        }
        if (metodo == "    Método ELECTRE" && existeNumeroDistintoCero)
        {
            try
            {
                Metodos.Electre electre = new Metodos.Electre(matriz, pesos, maxmin, selectedIndex);
                electre.resolver();
                Navigation.PushAsync(new ElectrePage(electre));
            }
            catch (Exception ex)
            {

            }
            
        }


    }
}