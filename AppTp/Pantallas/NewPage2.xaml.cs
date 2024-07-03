using DocumentFormat.OpenXml.Office2010.PowerPoint;
using AppTp.Metodos;

namespace AppTp.Pantallas;

public partial class NewPage2 : ContentPage
{
    private readonly Color backgroundColor = Color.FromHex("#77B0AA");
    private readonly Color labelColor = Color.FromHex("#003C43");
    private List<List<Entry>> entradas = new List<List<Entry>>();
    int filas;
    int columnas;
    string metodo;
    List<float> pesos;
    List<bool> maxmin;
    List<int> funciones;
    List<float> p;
    List<float> q;
    List<float> o;
    int selectedIndex;
    public NewPage2(int rows, int columns, List<bool> maxmin, List<float> pesos, string metodo, List<int> funcs, List<float> p, List<float>q,List<float>o, int selectedIndex)
	{
		InitializeComponent();
        
        this.filas = rows;
        this.selectedIndex = selectedIndex;
        this.columnas = columns;
        this.metodo = metodo;
        this.maxmin = maxmin;
        this.pesos = pesos;
        this.funciones = funcs;
        this.p = p;
        this.q = q;
        this.o = o;
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
                        for (int k = 0; k < matriz.GetLength(0); k++)
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
        if (existeNumeroDistintoCero)
        {
            try
            {

                Metodos.PROMETHEE tp = new Metodos.PROMETHEE(matriz, pesos, maxmin, selectedIndex);
                List<Entidades.Funcion> lista = new List<Entidades.Funcion>();
                for (int j = 0; j < columnas; j++)
                {
                    lista.Add(new Entidades.Funcion(q[j], p[j], o[j], (funciones[j])));
                }
                tp.resolver(lista);
                Navigation.PushAsync(new Pasos.Prometee_TabbedPage(tp));
            }
            catch
            {
                await DisplayAlert("Error en la carga de datos", "Solo se pueden ingresar numeros en las tablas", "OK");
            }
        }
        
        
    }
}