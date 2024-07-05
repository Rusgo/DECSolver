

using AppTp.Metodos;

namespace AppTp.Pantallas.Pasos;

public partial class Moora_Resultados : ContentPage
{
    MultiCriterio obj;
    public Moora_Resultados()
    {
        InitializeComponent();
    }
    Color labelColor = Color.FromHex("#003C43");
    public void mostrarResultados(string[] resultados, string[] resultadosConValores)
    {
        List<string> alternativas = new List<string>();
        foreach (string alter in resultados)
        {
            alternativas.Add(alter);
        }
        // Asignar las primeras tres alternativas al podio
        Alternativa1Label.Text = alternativas.Count > 0 ? alternativas[0] : string.Empty;
        Alternativa2Label.Text = alternativas.Count > 1 ? alternativas[1] : string.Empty;
        Alternativa3Label.Text = alternativas.Count > 2 ? alternativas[2] : string.Empty;

        // Limpiar cualquier contenido previo en el StackLayout
        MedallasStackLayout.Children.Clear();
        
        // Crear las vistas para las medallas restantes
        for (int i = 3; i < alternativas.Count; i++)
        {
            var alternativaLabel = new Label
            {
                Text = alternativas[i],
                FontSize = 18,
                TextColor = labelColor,
                HorizontalOptions = LayoutOptions.Center,
                FontFamily = "Monserrat.ttf"
            };

            var medallaImage = new Image
            {
                Source = $"medalla{i + 1}.png", // imágenes existan con estos nombres
                WidthRequest = 50,
                HeightRequest = 50,
                HorizontalOptions = LayoutOptions.Center
            };

            var stack = new VerticalStackLayout
            {
                HorizontalOptions = LayoutOptions.Center,
                Children = { alternativaLabel, medallaImage }
            };

            MedallasStackLayout.Children.Add(stack);
        }





        mainLayout.Children.Clear();
        // Crear el Grid
        var resultadosGrid = new Grid
        {
            ColumnDefinitions =
                {
                    new ColumnDefinition { Width = GridLength.Star }
                }
        };

        
        var encabezadoLabel = new Label
        {
            Text = "Resultados",
            TextColor = Colors.White,
            HorizontalOptions = LayoutOptions.Center,
            VerticalOptions = LayoutOptions.Center,
            FontAttributes = FontAttributes.Bold,
        };
        var encabezadoFrame = new Frame
        {
            Content = encabezadoLabel,
            BackgroundColor = Color.FromHex("#003C43"), 
            BorderColor = Color.FromHex("#003C43"),
            Padding = new Thickness(5),
            HasShadow = false,
            Margin = 0
        };
        resultadosGrid.RowDefinitions.Add(new RowDefinition { Height = GridLength.Auto });
        resultadosGrid.Add(encabezadoFrame, 0, 0);

        
        for (int i = 0; i < resultadosConValores.Length; i++)
        {
            var label = new Label
            {
                Text = resultadosConValores[i],
                TextColor = Color.FromHex("#003C43"),
                HorizontalOptions = LayoutOptions.FillAndExpand,
                VerticalOptions = LayoutOptions.Center
            };
            var frame = new Frame
            {
                Content = label,
                BackgroundColor = Colors.White, // Fondo verde agua
                BorderColor = Color.FromHex("#003C43"),
                Padding = new Thickness(5),
                HasShadow = false,
                Margin = 0
            };
            resultadosGrid.RowDefinitions.Add(new RowDefinition { Height = GridLength.Auto });
            resultadosGrid.Add(frame, 0, i + 1); // Añadir en la fila correspondiente
        }

        // Añadir el Grid al VerticalStackLayout
        mainLayout.Children.Add(resultadosGrid);
    }

}



