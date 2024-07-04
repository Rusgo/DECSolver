using AppTp.Metodos;

namespace AppTp.Pantallas.Pasos;

public partial class MooraTabPage : TabbedPage
{
    MultiCriterio obj;
    public MooraTabPage(Moora moora)
    {
        InitializeComponent();
        Metodos.formatoTabla.CreateTable(moora.sinNormalizarExcel(), "Paso 1", GridMooraP1_Normalizar);
        Metodos.formatoTabla.CreateTable(moora.agregacionExcel(), "Paso 2", GridMooraP2_PondIdeal);
        resultado.mostrarResultados(obj.ordenarResultado(), obj.ordenarResultadoValores());
        this.obj = moora;
    }
    private async void OnGenerateExcelClicked(object sender, EventArgs e)
    {
        string nombreArchivo = await DisplayPromptAsync("Nombre del archivo", "Ingrese el nombre del archivo donde desea guardar la resolucion del problema");

        if (nombreArchivo != null || nombreArchivo != "")
        {
            obj.guardarExcel(nombreArchivo);
        }
        else 
        {
            await DisplayAlert("Error", "No se ingreso un nombre de archivo valido","OK");
        }

        
    }
}