namespace AppTp.Pantallas.Pasos;
using AppTp.Metodos;
using System.Threading.Tasks;

public partial class Prometee_TabbedPage : TabbedPage
{
	MultiCriterio p;
	public Prometee_TabbedPage(PROMETHEE p)
	{
		InitializeComponent();
		this.p = p;
	}

    public async Task excelAsync()
    {
        string nombreArchivo = await DisplayPromptAsync("Nombre del archivo", "Ingrese el nombre del archivo donde desea guardar la resolucion del problema");
        if (nombreArchivo != null || nombreArchivo != "")
        {
            p.guardarExcel(nombreArchivo);
        }
        else
        {
            await DisplayAlert("Error", "No se ingreso un nombre de archivo valido", "OK");
        }
    }

    private void ToolbarItem_Clicked(object sender, EventArgs e)
    {
        excelAsync();
    }
}