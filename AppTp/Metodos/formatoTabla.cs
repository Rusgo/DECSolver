using DocumentFormat.OpenXml.Office2010.PowerPoint;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppTp.Metodos
{
    public class formatoTabla
    {
        
        public static void CreateTable(string[,] matriz, string estePaso,Grid GridTablaPaso)
        {
            Color backgroundColor = Color.FromHex("#77B0AA");
            Color labelColor = Color.FromHex("#003C43");
            int cantFilas = matriz.GetLength(0);
            int cantColumnas = matriz.GetLength(1);
            for (int fila = 0; fila < cantFilas ; fila++)
            {
                GridTablaPaso.RowDefinitions.Add(new RowDefinition { Height = GridLength.Auto });

            }
            for (int columna = 0; columna < cantColumnas ; columna++)
            {
                GridTablaPaso.ColumnDefinitions.Add(new ColumnDefinition { Width = 100 });

            }
            for (int fila = 0; fila < cantFilas ; fila++)
            {
                for (int columna = 0; columna < cantColumnas ; columna++)
                {
                    View cellView;
                    if (columna == 0 && fila == 0)
                    {
                        cellView = new Frame
                        {
                            Content = new Label
                            {
                                Text = estePaso,
                                VerticalOptions = LayoutOptions.Center,
                                HorizontalOptions = LayoutOptions.Center,
                                FontAttributes = FontAttributes.Bold,
                                Margin = 5,
                                HorizontalTextAlignment = TextAlignment.Center,
                                VerticalTextAlignment = TextAlignment.Center,
                                TextColor = labelColor,
                                BackgroundColor = backgroundColor,
                            },
                            BorderColor = labelColor,
                            Padding = new Thickness(2),
                            CornerRadius = 0,
                            BackgroundColor = backgroundColor,
                        };
                    }
                    else if (columna == 0 && fila != 0)
                    {
                        
                            cellView = new Frame
                            {
                                Content = new Label
                                {
                                    Text = matriz[fila, columna],
                                    VerticalOptions = LayoutOptions.Center,
                                    HorizontalOptions = LayoutOptions.Center,
                                    FontAttributes = FontAttributes.Bold,
                                    TextColor = labelColor,
                                    BackgroundColor = backgroundColor,
                                },
                                BorderColor = labelColor,
                                CornerRadius = 0,
                                Padding = new Thickness(2),
                                BackgroundColor = backgroundColor,
                                };
                            }
                        

                    
                    else if (fila == 0 && columna != 0)
                    {
                        
                            cellView = new Frame
                            {
                                Content = new Label
                                {
                                    Text = matriz[fila, columna],
                                    VerticalOptions = LayoutOptions.Center,
                                    HorizontalOptions = LayoutOptions.Center,
                                    FontAttributes = FontAttributes.Bold,
                                    TextColor = labelColor,
                                    BackgroundColor = backgroundColor,
                                },
                                BorderColor = labelColor,
                                Padding = new Thickness(2),
                                CornerRadius = 0,
                                BackgroundColor = backgroundColor,
                            };
                        
                        
                    }
                    else
                    {
                        cellView = new Frame
                        {
                            Content = new Label
                            {
                                Text = matriz[fila, columna],
                                VerticalOptions = LayoutOptions.Center,
                                HorizontalOptions = LayoutOptions.Center,
                                Margin = 2,
                                TextColor = Colors.Black,
                            },
                            BorderColor = labelColor,
                            Padding = new Thickness(2),
                            CornerRadius = 0,
                            BackgroundColor = Colors.White,
                        };
                    }

                    GridTablaPaso.Add(cellView, columna, fila);

                }
            }
        }
    }
}
