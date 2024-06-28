using AppTp.Metodos;
using DevExpress.Maui.Core.Internal;

namespace AppTp.Pantallas;

public partial class Resultados : ContentPage
{
    MultiCriterio obj;

    public Resultados(MultiCriterio obj)
	{
        
		InitializeComponent();
        this.obj = obj;
        MostrarResultados(obj.ordenarResultado());
    }

    private string GenerateHexColor()
    {
        Random random = new Random();
        byte red = (byte)random.Next(256);
        byte green = (byte)random.Next(256);
        byte blue = (byte)random.Next(256);

        // Formatear el color hexadecimal
        string colorHex = $"#{red:X2}{green:X2}{blue:X2}";
        return colorHex;
    }
        

    
    private void MostrarResultados(string[] resultados)
    {
        // Usando LINQ para generar la salida formateada
        var resultadoFormateado = resultados
            .Select((valor, indice) => $"Puesto{indice + 1} : {valor}");
        // Asignar los resultados al ListView
        listViewResultados.ItemsSource = resultadoFormateado;
    }

    private void Button_Clicked(object sender, EventArgs e)
    {
        //obj.guardarExcel();
    }
}