using AppTp.Metodos;
using System.Collections.ObjectModel;
using AppTp.Entidades;
using static AppTp.Entidades.Alternativa;
using System.Runtime.CompilerServices;
using System.Globalization;
namespace AppTp.Pantallas;

public partial class pantallaMenu : ContentPage
{
    string metodo;
    bool otro;
	public pantallaMenu(string metodo)
	{
		InitializeComponent();
        //para que se use solo punto
        CultureInfo.DefaultThreadCurrentCulture = new CultureInfo("en-US");
        CultureInfo.DefaultThreadCurrentUICulture = new CultureInfo("en-US");
        this.metodo = metodo;
        c3.IsVisible = false;
        c4.IsVisible = false;
        c5.IsVisible = false;
        c6.IsVisible = false;
        c7.IsVisible = false;
        Alternativas.Text = "2";
        criterios.Text = "2";
        List<String> metodos = new List<String> { "Suma","Distancia euclidiana","Rango"};
        List<String> funciones = new List<String> { "Verdadero Criterio", "Cuasi Criterio", "Seudo Criterio con Preferencia Lineal", "Level Criterio", "Criterio con preferencia lineal y area de indiferencia", "Criterio Gaussiano" };
        
        normalizarmetodos.ItemsSource = metodos;
        if (metodo == "Método MOORA" || metodo == "          MOORA Punto de Referencia" || metodo == "Método AHP")
        {
            normalizarmetodos.IsVisible = false;
            lblMetodosNormalizacion.IsVisible = false;
        }
        if (metodo == "Método AHP")
        {
            c1.IsVisible = false; c2.IsVisible = false;
            otro = false;
            pesosManuales.IsVisible = false;
            pesosEntropia.IsVisible = false;
        }
        else
        {
            otro = true;
        }
    }
    private void cambioCriterio(object sender, EventArgs e)
    {

    }
    private void btnMenosAlter(object sender, EventArgs e)
    {
        if(int.Parse(Alternativas.Text) <= 15 && int.Parse(Alternativas.Text) > 2) 
        {
            int num = int.Parse(Alternativas.Text) - 1;
            Alternativas.Text = num.ToString();
        }

    }
    private void btnMasAlter(object sender, EventArgs e)
    {
        if (int.Parse(Alternativas.Text) < 15 && int.Parse(Alternativas.Text) >= 2)
        {
            int num = int.Parse(Alternativas.Text) + 1;
            Alternativas.Text = num.ToString();
        }

    }
    private void btnMenosCri(object sender, EventArgs e)
    {
        if (int.Parse(criterios.Text) <= 7 && int.Parse(criterios.Text) > 2)
        {
            int num = int.Parse(criterios.Text) - 1;
            criterios.Text = num.ToString();
        }

    }
    private void btnMasCri(object sender, EventArgs e)
    {
        if (int.Parse(criterios.Text) < 7 && int.Parse(criterios.Text) >= 2)
        {
            int num = int.Parse(criterios.Text) + 1;
            criterios.Text = num.ToString();
        }

    }

    private bool isNumeric(string cadena)
    {
        return float.TryParse(cadena, out _);
    }
    private async void ToolbarItem_Clicked(object sender, EventArgs e)
    {
        if(normalizarmetodos.SelectedItem == null && metodo != "Método MOORA" && metodo != "Método AHP" && metodo != "          MOORA Punto de Referencia")
        {
            DisplayAlert("Error en la seleccion del metodo de normalizacion", "Debe seleccionar un metodo de normalizacion", "OK");
        }
        else
        {
            ObservableCollection<alternativa> alternativas = new ObservableCollection<alternativa>();
            for (int i = 0; i < int.Parse(Alternativas.Text); i++)
            {
                alternativas.Add(new alternativa(i + 1));
            }
            List<bool> maxmin = new List<bool> { maxc1.IsChecked, maxc2.IsChecked, maxc3.IsChecked, maxc4.IsChecked, maxc5.IsChecked, maxc6.IsChecked, maxc7.IsChecked };
            if (peso1.Text == "")
            {
                peso1.Text = "0";
            }
            if (peso2.Text == "")
            {
                peso2.Text = "0";
            }
            if (peso3.Text == "")
            {
                peso3.Text = "0";
            }
            if (peso4.Text == "")
            {
                peso4.Text = "0";
            }
            if (peso5.Text == "")
            {
                peso5.Text = "0";
            }
            if (peso6.Text == "")
            {
                peso6.Text = "0";
            }
            if (peso7.Text == "")
            {
                peso7.Text = "0";
            }
            if (isNumeric(peso1.Text ?? "0") && isNumeric(peso2.Text ?? "0") && isNumeric(peso3.Text ?? "0") && isNumeric(peso4.Text ?? "0") && isNumeric(peso5.Text ?? "0") && isNumeric(peso6.Text ?? "0") && isNumeric(peso7.Text ?? "0"))
            {
                List<float> peso = new List<float> { float.Parse((peso1.Text ?? "0").Replace(',', '.')), float.Parse((peso2.Text ?? "0").Replace(',', '.')), float.Parse((peso3.Text ?? "0").Replace(',', '.')), float.Parse((peso4.Text ?? "0").Replace(',', '.')), float.Parse((peso5.Text ?? "0").Replace(',', '.')), float.Parse((peso6.Text ?? "0").Replace(',', '.')), float.Parse((peso7.Text ?? "0").Replace(',', '.')) };
                peso = normalizarPesos(peso);
                bool validacionPesos = verificarSuma(peso);
                if (validacionPesos || metodo == "Método AHP" || pesosEntropia.IsChecked)
                {
                    if (metodo == "Método AHP")
                    {
                        List<AHP> tablasGlobal = new List<AHP>();
                        Navigation.PushAsync(new Ahp(tablasGlobal, int.Parse(criterios.Text), alternativas.Count, 0, maxmin));
                    }
                    else
                    {
                        if (pesosEntropia.IsChecked)
                        {
                            List<float> pesosVacio = new List<float>();
                            Navigation.PushAsync(new NewPage1(alternativas.Count, int.Parse(criterios.Text), maxmin, pesosVacio, metodo, normalizarmetodos.SelectedIndex));
                        }
                        else
                        {
                            Navigation.PushAsync(new NewPage1(alternativas.Count, int.Parse(criterios.Text), maxmin, peso, metodo, normalizarmetodos.SelectedIndex));
                        }


                    }
                }
                else
                {
                    await DisplayAlert("Error en el valor de los pesos", "La sumatoria de los pesos debe ser igual a 1 / suma: " + sumarPesos(peso), "OK");
                }
            }
            else
            {
                await DisplayAlert("Error en la carga de datos", "Todos los pesos deben estar representados con numeros", "OK");
            }
        }
        
        
        




    }

    private void criterios_TextChanged(object sender, TextChangedEventArgs e)
    {
        if (otro)
        {
            if (criterios.Text == "7")
            {
                c1.IsVisible = true;
                c2.IsVisible = true;
                c3.IsVisible = true;
                c4.IsVisible = true;
                c5.IsVisible = true;
                c6.IsVisible = true;
                c7.IsVisible = true;
            }
            else if (criterios.Text == "6")
            {
                c1.IsVisible = true;
                c2.IsVisible = true;
                c3.IsVisible = true;
                c4.IsVisible = true;
                c5.IsVisible = true;
                c6.IsVisible = true;
                c7.IsVisible = false;
            }
            else if (criterios.Text == "5")
            {
                c1.IsVisible = true;
                c2.IsVisible = true;
                c3.IsVisible = true;
                c4.IsVisible = true;
                c5.IsVisible = true;
                c7.IsVisible = false;
                c6.IsVisible = false;
            }
            else if (criterios.Text == "4")
            {
                c1.IsVisible = true;
                c2.IsVisible = true;
                c3.IsVisible = true;
                c4.IsVisible = true;
                c7.IsVisible = false;
                c6.IsVisible = false;
                c5.IsVisible = false;
            }
            else if (criterios.Text == "3")
            {
                c1.IsVisible = true;
                c2.IsVisible = true;
                c3.IsVisible = true;
                c7.IsVisible = false;
                c6.IsVisible = false;
                c5.IsVisible = false;
                c4.IsVisible = false;
            }
            else if (criterios.Text == "2")
            {
                c1.IsVisible = true;
                c2.IsVisible = true;
                c7.IsVisible = false;
                c6.IsVisible = false;
                c5.IsVisible = false;
                c4.IsVisible = false;
                c3.IsVisible = false;
            }
            if (pesosManuales.IsChecked)
            {
                if (criterios.Text == "7")
                {
                    peso1.IsVisible = true;
                    peso2.IsVisible = true;
                    peso3.IsVisible = true;
                    peso4.IsVisible = true;
                    peso5.IsVisible = true;
                    peso6.IsVisible = true;
                    peso7.IsVisible = true;
                }
                else if (criterios.Text == "6")
                {
                    peso1.IsVisible = true;
                    peso2.IsVisible = true;
                    peso3.IsVisible = true;
                    peso4.IsVisible = true;
                    peso5.IsVisible = true;
                    peso6.IsVisible = true;
                    peso7.IsVisible = false;
                }
                else if (criterios.Text == "5")
                {
                    peso1.IsVisible = true;
                    peso2.IsVisible = true;
                    peso3.IsVisible = true;
                    peso4.IsVisible = true;
                    peso5.IsVisible = true;
                    peso7.IsVisible = false;
                    peso6.IsVisible = false;
                }
                else if (criterios.Text == "4")
                {
                    peso1.IsVisible = true;
                    peso2.IsVisible = true;
                    peso3.IsVisible = true;
                    peso4.IsVisible = true;
                    peso7.IsVisible = false;
                    peso6.IsVisible = false;
                    peso5.IsVisible = false;
                }
                else if (criterios.Text == "3")
                {
                    peso1.IsVisible = true;
                    peso2.IsVisible = true;
                    peso3.IsVisible = true;
                    peso7.IsVisible = false;
                    peso6.IsVisible = false;
                    peso5.IsVisible = false;
                    peso4.IsVisible = false;
                }
                else if (criterios.Text == "2")
                {
                    peso1.IsVisible = true;
                    peso2.IsVisible = true;
                    peso7.IsVisible = false;
                    peso6.IsVisible = false;
                    peso5.IsVisible = false;
                    peso4.IsVisible = false;
                    peso3.IsVisible = false;
                }
            }
        }

    }

    private float sumarPesos(List<float> pesos)
    {
        float acu = 0;
        foreach (float peso in pesos)
        {
            acu = acu + peso;
        }
        return acu;
    }

    private List<float> normalizarPesos(List<float> pesos)
    {
        float sumaPesos = sumarPesos(pesos);
        if (sumaPesos > 1)
        {
            for (int i = 0; i < int.Parse(criterios.Text); i++)
            {
                pesos[i] = pesos[i] / sumaPesos;
            }
        }
        return pesos;
    }

    private bool verificarSuma(List<float> pesos)
    {
        float sumaPesos = sumarPesos(pesos);
        if (sumaPesos < 1)
        {
            return false;
        }
        return true;
    }

    private void pesosManuales_CheckedChanged(object sender, CheckedChangedEventArgs e)
    {
        if (pesosEntropia.IsChecked)
        {
            peso1.IsVisible = false;
            peso2.IsVisible = false;
            peso7.IsVisible = false;
            peso6.IsVisible = false;
            peso5.IsVisible = false;
            peso4.IsVisible = false;
            peso3.IsVisible = false;
        }
        else
        {
            if (otro)
            {
                if (criterios.Text == "7")
                {
                    peso1.IsVisible = true;
                    peso2.IsVisible = true;
                    peso3.IsVisible = true;
                    peso4.IsVisible = true;
                    peso5.IsVisible = true;
                    peso6.IsVisible = true;
                    peso7.IsVisible = true;
                }
                else if (criterios.Text == "6")
                {
                    peso1.IsVisible = true;
                    peso2.IsVisible = true;
                    peso3.IsVisible = true;
                    peso4.IsVisible = true;
                    peso5.IsVisible = true;
                    peso6.IsVisible = true;
                    peso7.IsVisible = false;
                }
                else if (criterios.Text == "5")
                {
                    peso1.IsVisible = true;
                    peso2.IsVisible = true;
                    peso3.IsVisible = true;
                    peso4.IsVisible = true;
                    peso5.IsVisible = true;
                    peso7.IsVisible = false;
                    peso6.IsVisible = false;
                }
                else if (criterios.Text == "4")
                {
                    peso1.IsVisible = true;
                    peso2.IsVisible = true;
                    peso3.IsVisible = true;
                    peso4.IsVisible = true;
                    peso7.IsVisible = false;
                    peso6.IsVisible = false;
                    peso5.IsVisible = false;
                }
                else if (criterios.Text == "3")
                {
                    peso1.IsVisible = true;
                    peso2.IsVisible = true;
                    peso3.IsVisible = true;
                    peso7.IsVisible = false;
                    peso6.IsVisible = false;
                    peso5.IsVisible = false;
                    peso4.IsVisible = false;
                }
                else if (criterios.Text == "2")
                {
                    peso1.IsVisible = true;
                    peso2.IsVisible = true;
                    peso7.IsVisible = false;
                    peso6.IsVisible = false;
                    peso5.IsVisible = false;
                    peso4.IsVisible = false;
                    peso3.IsVisible = false;
                }
            }
        }
    }
}