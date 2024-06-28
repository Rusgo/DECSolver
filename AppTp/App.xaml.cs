using Microsoft.Maui.ApplicationModel;

namespace AppTp
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
            Application.Current.UserAppTheme = AppTheme.Light;
            // Crear la página de navegación con un color de fondo específico para la barra de navegación
            var navigationPage = new NavigationPage(new Pantallas.Inicio())
            {
                BarBackgroundColor = Color.FromHex("#003C43"), // Cambia 'Aqua' por el color que desees
                BarTextColor = Colors.White // Opcional: Cambia el color del texto de la barra de navegación
            };

            MainPage = navigationPage;

        }
    }
}
