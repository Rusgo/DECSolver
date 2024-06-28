namespace AppTp.Pantallas;

using Metodos;

public partial class Ahp : ContentPage
{
    int cantidadFilas;
    int criteriosG;
    int alternativasG;
    int numeroDeTablaG;
    List<bool> max;
    List<RadioButton> fila = new List<RadioButton>();
    List<List<RadioButton>> matriz = new List<List<RadioButton>>();
    List<AHP> tablasGlobal = new List<AHP>();
    public Ahp(List<AHP> tablas, int criterios, int alternativas, int numeroDeTabla, List<bool> max)
    {
        this.max = max;
        this.tablasGlobal = tablas;
        InitializeComponent();
        if (numeroDeTabla == 0)
        {
            cantidadFilas = (criterios * (criterios - 1)) / 2;
            numeroDeTablaG = numeroDeTabla + 1;
        }
        else
        {
            cantidadFilas = (alternativas * (alternativas - 1)) / 2;
            numeroDeTablaG = numeroDeTabla + 1;
        }
        criteriosG = criterios;
        alternativasG = alternativas;

        ToolbarItem nextToolbarItem = new ToolbarItem
        {
            Text = "Siguiente",
            Priority = 0, // Prioridad para la posición en la barra de herramientas
            Order = ToolbarItemOrder.Primary, // Orden primario en la barra de herramientas
        };
        nextToolbarItem.Clicked += OnNextClicked;

        ToolbarItems.Add(nextToolbarItem);


        // Crear un Grid
        Grid grid = new Grid();
        grid.ColumnDefinitions.Add(new ColumnDefinition { Width = new GridLength(0.1, GridUnitType.Star) }); // Columna 1
        grid.ColumnDefinitions.Add(new ColumnDefinition { Width = new GridLength(0.2, GridUnitType.Star) }); // Columna 2 y 3
        grid.ColumnDefinitions.Add(new ColumnDefinition { Width = new GridLength(0.1, GridUnitType.Star) }); // Columna 4
        grid.ColumnDefinitions.Add(new ColumnDefinition { Width = new GridLength(0.6, GridUnitType.Star) }); // Columna 5
        int aux = 1;
        int cont = 2;
        string c1 = "";
        string c2 = "";
        grid.RowDefinitions.Add(new RowDefinition { Height = new GridLength(50, GridUnitType.Absolute) }); // Agregar una fila

        //Método para crear un Frame con borde y contenido centrado

        Frame CreateCell(View contenido, Color colorFondo, Color colorBorde)
        {
            return new Frame
            {
                Content = contenido,
                BackgroundColor = colorFondo,
                BorderColor = colorBorde,
                CornerRadius = 2,
                Padding = new Thickness(2),
                HorizontalOptions = LayoutOptions.FillAndExpand,
                VerticalOptions = LayoutOptions.FillAndExpand,
                HasShadow = false,
                Margin = new Thickness(1, 1, 1, 1)
            };
        }

        grid.Add(CreateCell(new Label { Text = "N° de decisión", HorizontalOptions = LayoutOptions.Center, VerticalOptions = LayoutOptions.Center, TextColor = Colors.White }, Color.FromHex("#135D66"), Color.FromHex("#135D66")), 0, 0);
        grid.Add(CreateCell(new Label { Text = "¿Cuál prefiere A o B?", HorizontalOptions = LayoutOptions.Center, VerticalOptions = LayoutOptions.Center, TextColor = Colors.White }, Color.FromHex("#135D66"), Color.FromHex("#135D66")), 1, 0);
        grid.Add(CreateCell(new Label { Text = "Igual", HorizontalOptions = LayoutOptions.Center, VerticalOptions = LayoutOptions.Center, TextColor = Colors.White }, Color.FromHex("#135D66"), Color.FromHex("#135D66")), 2, 0);
        grid.Add(CreateCell(new Label { Text = "¿Cuánto más?", HorizontalOptions = LayoutOptions.Center, VerticalOptions = LayoutOptions.Center, TextColor = Colors.White }, Color.FromHex("#135D66"), Color.FromHex("#135D66")), 3, 0);

        // Agregar elementos a cada fila
        for (int i = 0; i < cantidadFilas; i++)
        {
            if (numeroDeTabla == 0)
            {
                if (cont <= criterios)
                {
                    c1 = "C-" + aux;
                    c2 = "C-" + cont;
                    cont = cont + 1;

                }
                else
                {
                    aux = aux + 1;
                    cont = aux + 1;
                    c1 = "C-" + aux;
                    c2 = "C-" + cont;
                    cont++;
                }
            }
            else
            {
                if (cont <= alternativas)
                {
                    c1 = "A-" + aux;
                    c2 = "A-" + cont;
                    cont = cont + 1;

                }
                else
                {
                    aux = aux + 1;
                    cont = aux + 1;
                    c1 = "A-" + aux;
                    c2 = "A-" + cont;
                    cont++;
                }
            }

            // Agregar una nueva fila
            grid.RowDefinitions.Add(new RowDefinition { Height = new GridLength(50, GridUnitType.Absolute) });

            // Crear los radioBtn para la fila actual
            var fila = new List<RadioButton>
            {
                new RadioButton { Content = c1, GroupName = "fila" + (i + 1), TextColor = Color.FromHex("#000000"), HorizontalOptions = LayoutOptions.FillAndExpand, VerticalOptions = LayoutOptions.Center },
                new RadioButton { Content = c2, GroupName = "fila" + (i + 1), TextColor = Color.FromHex("#000000"), HorizontalOptions = LayoutOptions.FillAndExpand, VerticalOptions = LayoutOptions.Center },
                new RadioButton { Content = "1", GroupName = "comparaciones" + (i + 1), TextColor = Color.FromHex("#000000"), HorizontalOptions = LayoutOptions.Center, VerticalOptions = LayoutOptions.Center }
            };

            // Crear stackLayout para los botones de ´¿Cuál Prefieres?'

            var stackLayoutCual = new StackLayout
            {
                Orientation = StackOrientation.Horizontal,
                HorizontalOptions = LayoutOptions.FillAndExpand,
                VerticalOptions = LayoutOptions.Center,
                Children = { fila[0], fila[1] }
            };

            // Agregar elementos a la fila

            grid.Add(CreateCell(new Label { Text = (i + 1).ToString(), TextColor = Colors.White, HorizontalOptions = LayoutOptions.Center, VerticalOptions = LayoutOptions.Center }, Color.FromHex("#135D66"), Color.FromHex("#135D66")), 0, i + 1);
            grid.Add(CreateCell(stackLayoutCual, Colors.White, Color.FromHex("#135D66")), 1, i + 1);
            grid.Add(CreateCell(fila[2], Colors.White, Color.FromHex("#135D66")), 2, i + 1);
            grid.Add(CreateCell(CreateFrameContent(i, fila), Colors.White, Color.FromHex("#135D66")), 3, i + 1);
        }

        // Ajustar el Grid
        grid.Margin = new Thickness(5, 5, 5, 0);

        // Agregar el Grid a tu página
        ScrollView sv = new ScrollView();
        sv.Orientation = ScrollOrientation.Vertical;
        sv.BackgroundColor = Color.FromHex("#E3FEF7");
        sv.Content = grid;
        Content = sv;


    }

    private void OnNextClicked(object sender, EventArgs e)
    {
        AHP ahp;
        if (numeroDeTablaG == 1)
        {
            ahp = new AHP(criteriosG, matriz);
        }
        else
        {
            ahp = new AHP(alternativasG, matriz);
        }

        if (ahp.comprobador())
        {
            tablasGlobal.Add(ahp);
        }
        if (tablasGlobal.Count < (criteriosG + 1))
        {
            if (ahp.comprobador())
            {

                Navigation.PushAsync(new Ahp(tablasGlobal, criteriosG, alternativasG, numeroDeTablaG, max));
            }
            else
            {
                DisplayAlert("Error", "Las decisiones no tienen concistencia", "OK");

            }

        }
        else
        {
            float[,] matriz = new float[alternativasG, criteriosG];
            int fila = 0;
            for (int i = 0; i < criteriosG; i++)
            {
                fila = 0;
                float[] promactual = tablasGlobal[i + 1].promedioFilas;
                while (fila < alternativasG)
                {
                    matriz[fila, i] = promactual[fila];
                    fila++;
                }

            }
            List<float> a = new List<float>(tablasGlobal[0].promedioFilas);
            Metodos.MultiCriterio pl = new Metodos.MultiCriterio(matriz, a, max, 0);
            pl.resolver();
            Navigation.PushAsync(new Pantallas.Pasos.AHP_TabbedPage(tablasGlobal, pl));
        }

    }

    View CreateFrameContent(int numero, List<RadioButton> fila)
    {
        // Crear un HorizontalStackLayout
        var stackLayout = new StackLayout { Orientation = StackOrientation.Horizontal, HorizontalOptions = LayoutOptions.FillAndExpand };

        // Agregar RadioButton al HorizontalStackLayout
        for (int i = 2; i <= 9; i++)
        {
            RadioButton rb = new RadioButton { Content = i.ToString(), GroupName = "comparaciones" + (numero + 1), TextColor = Color.FromHex("#000000"), HorizontalOptions = LayoutOptions.FillAndExpand };
            stackLayout.Children.Add(rb);
            fila.Add(rb);
        }
        matriz.Add(fila);
        fila = new List<RadioButton>();
        return stackLayout;
    }
    private void Peso2_CheckedChanged(object sender, CheckedChangedEventArgs e)
    {



    }

    protected override void OnAppearing()
    {
        base.OnAppearing();
#if ANDROID
        var activity = Platform.CurrentActivity;
        activity.RequestedOrientation = Android.Content.PM.ScreenOrientation.Landscape;
#endif
    }

    protected override void OnDisappearing()
    {
        base.OnDisappearing();
#if ANDROID
        var activity = Platform.CurrentActivity;
        activity.RequestedOrientation = Android.Content.PM.ScreenOrientation.Unspecified;
#endif
    }

    private void ContentPage_Appearing(object sender, EventArgs e)
    {

    }
    protected override bool OnBackButtonPressed()
    {
        if (Navigation.NavigationStack.Count > 1)
        {
            numeroDeTablaG = numeroDeTablaG - 1;
            if(tablasGlobal.Count > 0)
            {
                tablasGlobal.RemoveAt(tablasGlobal.Count - 1);
            }
        }

        return base.OnBackButtonPressed();
    }
}

// Acordarnos de sacar el ultimo elemento en la lista al volver a la pagina anterior
