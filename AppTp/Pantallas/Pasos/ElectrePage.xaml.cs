using AppTp.Entidades;
using AppTp.Metodos;
using System.Runtime.CompilerServices;

namespace AppTp.Pantallas.Pasos;

public partial class ElectrePage : TabbedPage
{
    Electre electre;
    int count = 0;
    private List<Nodo> nodos = new List<Nodo>();
    private List<Arista> aristas = new List<Arista>();
    public ElectrePage(Electre electre)
	{
		InitializeComponent();
        this.electre = electre;
        var grid = new Grid();
        grid.Margin = 10;
        Metodos.formatoTabla.CreateTable(electre.normalizarExcel(), "Paso 1", grid);
        var grid2 = new Grid();
        grid2.Margin = 10;
        Metodos.formatoTabla.CreateTable(Entidades.formatoAhp.formatoExcel(electre.matrizConcordancia, true, ""), "IndiceConcor", grid2);
        var grid3 = new Grid();
        grid3.Margin = 10;
        Metodos.formatoTabla.CreateTable(Entidades.formatoAhp.formatoExcel(electre.matrizDiscordancia, true, ""), "IndiceDiscor", grid3);
        PantallaPaso1.Children.Add(grid);
        PantallaPaso2.Children.Add(grid2);
        PantallaPaso2.Children.Add(grid3);
    }

    private void Button_Clicked(object sender, EventArgs e)
    {

        electre.ci = float.Parse(c1.Text);
        electre.di = float.Parse(d1.Text);
        electre.agregacion(electre.matrizNormalizada.GetLength(0), electre.matrizNormalizada.GetLength(1));
        Metodos.formatoTabla.CreateTable(Entidades.formatoAhp.formatoExcel(electre.matrizSuperacion, true, ""), "Supera", GridSupe);
        float ultimonodoparx = 0;
        float ultimonodopary = 0;
        float ultimonodoimparx = 0;
        float ultimonodoimpary = 0;

        float[,] matriz = electre.matrizSuperacion;

        // Crear una instancia de Random para generar números aleatorios
        Random random = new Random();

        

        for (int i = 0; i < matriz.GetLength(0); i++)
        {

            if (i == 0)
            {
                Nodo nodo = new Nodo("A" + (i + 1), 30, 30);
                nodos.Add(nodo);
                ultimonodoparx = nodo.X;
                ultimonodopary = nodo.Y;

            }

            if (i % 2 == 0 && i > 1)
            {
                Nodo nodo = new Nodo("A" + (i + 1), ultimonodoparx + 100, ultimonodopary);
                nodos.Add(nodo);
                ultimonodoparx = nodo.X;
                ultimonodopary = nodo.Y;
            }
            if (i % 2 != 0 && i > 1)
            {
                Nodo nodo = new Nodo("A" + (i + 1), ultimonodoimparx + 100, ultimonodoimpary);
                nodos.Add(nodo);
                ultimonodoimparx = nodo.X;
                ultimonodoimpary = nodo.Y;
            }
            if (i == 1)
            {
                Nodo nodo = new Nodo("A" + (i + 1), ultimonodoparx, ultimonodopary + 200);
                nodos.Add(nodo);
                ultimonodoimparx = nodo.X;
                ultimonodoimpary = nodo.Y;
            }



        }

        for (int i = 0; i < matriz.GetLength(0); i++)
        {
            for (int j = 0; j < matriz.GetLength(1); j++)
            {
                if (matriz[i, j] == 1)
                {
                    Arista arista = new Arista(nodos[i], nodos[j]);
                    aristas.Add(arista);
                }
            }
        }
        var drawable = new GrafoDrawable(nodos, aristas);
        graphView.Drawable = drawable;
        graphView.Invalidate();
    }

    private async void ToolbarItem_Clicked(object sender, EventArgs e)
    {
        string nombreArchivo = await DisplayPromptAsync("Nombre del archivo", "Ingrese el nombre del archivo donde desea guardar la resolucion del problema");

        if(nombreArchivo != null || nombreArchivo != "")
        {
            electre.guardarExcel(nombreArchivo);
        }
        else
        {
            await DisplayAlert("Error", "No se ingreso un nombre de archivo valido", "OK");
        }

        
    }
}