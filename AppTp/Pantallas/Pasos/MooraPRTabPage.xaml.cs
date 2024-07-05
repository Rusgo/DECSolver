using AppTp.Metodos;

namespace AppTp.Pantallas.Pasos;

public partial class MooraPRTabPage : TabbedPage
{
    MultiCriterio obj;
    public MooraPRTabPage(MooraPuntoRef moora)
	{
		InitializeComponent();
        this.obj = moora;
        Metodos.formatoTabla.CreateTable(moora.sinNormalizarExcel(), "Paso 1", GridPR1_NormAgregacion);
        Metodos.formatoTabla.CreateTable(moora.mejorAlternativaExcel(), "Paso 2", GridMooraPR2_PondIdeal);
        Metodos.formatoTabla.CreateTable(moora.agregacionExcel(), "Paso 3", GridMooraPR3_Distancias);
        resultado.mostrarResultados(obj.ordenarResultado(), obj.ordenarResultadoValores());
        
    }
    private async void OnGenerateExcelClicked(object sender, EventArgs e)
    {
        string nombreArchivo = await DisplayPromptAsync("Nombre del archivo", "Ingrese el nombre del archivo donde desea guardar la resolucion del problema");

        if(nombreArchivo != null || nombreArchivo != "")
        {
            obj.guardarExcel(nombreArchivo);
        }
        else 
        {
            await DisplayAlert("Error", "No se ingreso un nombre de archivo valido", "OK");
        }
    }
}