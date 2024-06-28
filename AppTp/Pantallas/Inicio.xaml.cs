

namespace AppTp.Pantallas;

public partial class Inicio : ContentPage
{
	public Inicio()
	{
		InitializeComponent();
	}
    public async void BtnInfo_Clicked(object sender, EventArgs e)
    {
        await DisplayAlert("Manual de usuario", "", "OK");
    }

    public async void BtnPreg_Clicked(object sender, EventArgs e)
    {
        string mensaje = "Hola, somos una grupo de estudiantes de la carrera Ingeniería en Sistemas de la Universidad Tecnológica Nacional FRC";
        await DisplayAlert("¿Quienes somos?", mensaje, "Volver");
    }

    private void Button_Clicked(object sender, EventArgs e)
    {
        Button button = (Button)sender;
        string buttonText = button.Text;
        if (buttonText == "Método PROMETHEE")
        {
           
            Navigation.PushAsync(new pantallaMenuPromethe(buttonText));
        }
        else
        {
            Navigation.PushAsync(new pantallaMenu(buttonText));
        }

        
    }
}