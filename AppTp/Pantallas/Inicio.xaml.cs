

using System.Reflection;

namespace AppTp.Pantallas;

public partial class Inicio : ContentPage
{
	public Inicio()
	{
		InitializeComponent();
	}
    public async void BtnInfo_Clicked(object sender, EventArgs e)
    {
        // Abre el archivo PDF desde el paquete de la aplicaci�n
        using var stream = await FileSystem.OpenAppPackageFileAsync("ManualUsuario.pdf");
        var tempFile = Path.Combine(FileSystem.CacheDirectory, "ManualUsuario.pdf");

        using (var fileStream = File.Create(tempFile))
        {
            stream.CopyTo(fileStream);
        }

        // Abre el archivo PDF en una aplicaci�n externa
        await Launcher.Default.OpenAsync(new OpenFileRequest
        {
            File = new ReadOnlyFile(tempFile)
        });
    }

    public async void BtnPreg_Clicked(object sender, EventArgs e)
    {
        string mensaje = "Hola, somos un grupo de estudiantes de la carrera Ingenier�a en Sistemas de la Universidad Tecnol�gica Nacional FRC, y desarrollamos esta aplicaci�n con fines educativos de apoyo a la materia Decisiones en Escenarios Complejos.";
        await DisplayAlert("�Qui�nes somos?", mensaje, "Volver");
    }

    private void Button_Clicked(object sender, EventArgs e)
    {
        Button button = (Button)sender;
        string buttonText = button.Text;
        if (buttonText == "M�todo PROMETHEE")
        {
           
            Navigation.PushAsync(new pantallaMenuPromethe(buttonText));
        }
        else
        {
            Navigation.PushAsync(new pantallaMenu(buttonText));
        }

        
    }
}