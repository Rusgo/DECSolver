namespace AppTp.Pantallas;

public partial class NewPage2 : ContentPage
{
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
        ToolbarItem nextToolbarItem = new ToolbarItem
        {
            Text = "Siguiente",
            Priority = 0, // Prioridad para la posición en la barra de herramientas
            Order = ToolbarItemOrder.Primary, // Orden primario en la barra de herramientas
        };
        nextToolbarItem.Clicked += OnNextClicked;

        ToolbarItems.Add(nextToolbarItem);
        Grid grid = new Grid();
        grid.ColumnDefinitions.Add(new ColumnDefinition { Width = new GridLength(0.15, GridUnitType.Star) }); // Columna 2
        for (int j = 0; j < columns; j++)
        {
            grid.ColumnDefinitions.Add(new ColumnDefinition { Width = new GridLength(1, GridUnitType.Star) }); // Columna i

        }
        grid.RowDefinitions.Add(new RowDefinition { Height = new GridLength(0.15, GridUnitType.Star) }); // fila i
        for (int i = 0; i <= rows; i++)
        {
            grid.RowDefinitions.Add(new RowDefinition { Height = new GridLength(1, GridUnitType.Star) }); // fila i
            List<Entry> entryActual = new List<Entry>();
            for (int j = 0; j <= columns; j++)
            {
                if (j != 0 && i == 0)
                {
                    grid.Add(new Label { Text = "C" + (j).ToString(), VerticalOptions = LayoutOptions.Center, HorizontalOptions = LayoutOptions.Center, TextColor = Color.FromHex("#000000") }, j, 0);
                }
                else if (j == 0 && i != 0)
                {
                    grid.Add(new Label { Text = "A" + (i).ToString(), VerticalOptions = LayoutOptions.Center, HorizontalOptions = LayoutOptions.Center, TextColor = Color.FromHex("#000000") }, 0, i);
                }
                else if (i != 0)
                {
                    Entry nueva = new Entry { VerticalOptions = LayoutOptions.Fill, HorizontalOptions = LayoutOptions.Fill, BackgroundColor = Color.FromHex("#135D66"), TextColor = Color.FromHex("#E3FEF7"), FontSize = Device.GetNamedSize(NamedSize.Default, typeof(Entry)) * (Application.Current.MainPage.Width / 20) };
                    entryActual.Add(nueva);
                    grid.Add(nueva, j, i);
                }
            }
            if (i != 0) { entradas.Add(entryActual); }


        }
        // Agregar el Grid a tu página
        ScrollView sv = new ScrollView();
        sv.Orientation = ScrollOrientation.Vertical;
        sv.BackgroundColor = Color.FromHex("#E3FEF7");
        sv.Content = grid;
        Content = sv;
    }
    private async void OnNextClicked(object sender, EventArgs e)
    {
        try
        {
            float[,] matriz = new float[filas, columnas];
            int i = -1;
            foreach (List<Entry> Lentry in entradas)
            {
                i++;
                for (int j = 0; j < columnas; j++)
                {
                    matriz[i, j] = float.Parse(Lentry[j].Text);
                }
            }
            Metodos.PROMETHEE tp = new Metodos.PROMETHEE(matriz, pesos, maxmin, selectedIndex);
            List<Entidades.Funcion> lista = new List<Entidades.Funcion>();
            for (int j = 0; j < columnas; j++)
            {
                lista.Add(new Entidades.Funcion(q[j], p[j], o[j], (funciones[j])));
            }
            tp.resolver(lista);
            Navigation.PushAsync(new Resultados(tp));
        }
        catch
        {
            await DisplayAlert("Error en la carga de datos", "Solo se pueden ingresar numeros en las tablas", "OK");
        }
        
    }
}