namespace AppTp.Pantallas.Pasos;

using AppTp.Entidades;
using AppTp.Metodos;
using System.Threading.Tasks;

public partial class Prometee_TabbedPage : TabbedPage
{
    PROMETHEE p;
	public Prometee_TabbedPage(PROMETHEE p)
	{
		InitializeComponent();
		this.p = p;
        var grid = new Grid();
        int cont = 1;
        foreach (float[,] matriz in p.tablasPrimeraParte)
        {
            grid = new Grid()
            {
                Margin = new Thickness(5)
            };
            Metodos.formatoTabla.CreateTable(formatoAhp.formatoExcel(matriz, true, "Criterio"), "C" + cont.ToString(), grid);
            pantallaPaso1.Children.Add(grid);
            cont++;
        }
        cont = 1;
        foreach (float[,] matriz in p.tablasSegundaParte)
        {
            grid = new Grid()
            {
                Margin = new Thickness(5)
            };
            Metodos.formatoTabla.CreateTable(formatoAhp.formatoExcel(matriz, true, "Criterio"), "C" + cont.ToString(), grid);
            pantallaPaso2.Children.Add(grid);
            cont++;
        }
        cont = 1;
        foreach (float[,] matriz in p.matricesPonderadas)
        {
            grid = new Grid()
            {
                Margin = new Thickness(5)
            };
            Metodos.formatoTabla.CreateTable(formatoAhp.formatoExcel(matriz, true, "Criterio"), "C" + cont.ToString(), grid);
            pantallaPaso3.Children.Add(grid);
            cont++;
        }
        grid = new Grid() { Margin = new Thickness(5) };
        List<string> fila = new List<string>() {
            "Flujo negativo"
            };
        List<string> colu = new List<string>() {
            "Flujo positivo"
            };
        List<float[]> flujop = new List<float[]> {
            p.flujoPositivo
            };
        List<float[]> flujon = new List<float[]> {
            p.flujoNegativo
            };
        Metodos.formatoTabla.CreateTable(p.Agregarfila(p.AgregarColumna(p.formatoExcelP(p.matrizPonderada), flujop, colu), flujon, fila), "Paso 4", grid);
        pantallaPaso4.Children.Add(grid);
        resultado.mostrarResultados(p.ordenarResultado());
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