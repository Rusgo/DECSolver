using AppTp.Metodos;
using DocumentFormat.OpenXml.Office2010.PowerPoint;

namespace AppTp.Pantallas.Pasos;

public partial class TabPage : TabbedPage
{
    MultiCriterio obj;
    public TabPage(PonderacionLineal pl)
    { 
        InitializeComponent();
        Metodos.formatoTabla.CreateTable(pl.sinNormalizarExcel(), "Paso 1", GridPLP1_MismoSentOptim);
        Metodos.formatoTabla.CreateTable(pl.agregacionExcel(), "Paso 2", GridPLP2_NormAgregacion);
        resultado.mostrarResultados(pl.ordenarResultado());
        this.obj = pl;
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