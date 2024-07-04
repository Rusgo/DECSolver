
using Microsoft.Maui.Graphics;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppTp.Entidades
{
    public class GrafoDrawable : IDrawable
    {
        private readonly List<Nodo> nodos;
        private readonly List<Arista> aristas;
        public float width;
        public float height;

        public GrafoDrawable(List<Nodo> nodos, List<Arista> aristas)
        {
            this.nodos = nodos;
            this.aristas = aristas;
        }

        public void Draw(ICanvas canvas, RectF dirtyRect)
        {
            foreach (var arista in aristas)
            {
                var startPoint = (arista.NodoOrigen.X, arista.NodoOrigen.Y);
                var endPoint = (arista.NodoDestino.X, arista.NodoDestino.Y);

                // Dibujar línea de la arista
                canvas.StrokeColor = Colors.Black;
                canvas.DrawLine(startPoint.X, startPoint.Y, endPoint.X, endPoint.Y);

                // Dibujar flecha dirigida
                DrawArrow(canvas, startPoint.X, startPoint.Y, endPoint.X, endPoint.Y, 30, Colors.Black);
            }

            foreach (var nodo in nodos)
            {
                canvas.FillColor = Colors.LightSeaGreen;
                canvas.FillCircle(nodo.X, nodo.Y, 30);


                canvas.FontColor = Colors.Black;
                canvas.FontSize = 12;
                canvas.DrawString(nodo.Nombre, nodo.X, nodo.Y, HorizontalAlignment.Center);
            }


        }
        private void DrawArrow(ICanvas canvas, float startx, float starty, float endx, float endy, double nodeRadius, Color color)
        {
            // Calcular el ángulo de la arista
            var angle = Math.Atan2(endy - starty, endx - startx);

            // Longitud de la flecha proporcional al radio del nodo
            var arrowLength = Math.Min(10, nodeRadius / 2);

            // Calcular las coordenadas finales de la flecha
            var arrowEndX = endx - (float)(nodeRadius * Math.Cos(angle));
            var arrowEndY = endy - (float)(nodeRadius * Math.Sin(angle));

            // Dibujar la línea de la flecha
            canvas.StrokeColor = color;
            canvas.DrawLine(startx, starty, arrowEndX, arrowEndY); // Línea de conexión al nodo

            // Calcular las coordenadas de los puntos que forman la flecha
            var arrowPoint1X = arrowEndX - (float)(arrowLength * Math.Cos(angle - Math.PI / 6));
            var arrowPoint1Y = arrowEndY - (float)(arrowLength * Math.Sin(angle - Math.PI / 6));
            var arrowPoint2X = arrowEndX - (float)(arrowLength * Math.Cos(angle + Math.PI / 6));
            var arrowPoint2Y = arrowEndY - (float)(arrowLength * Math.Sin(angle + Math.PI / 6));

            // Dibujar la flecha
            canvas.DrawLine(arrowEndX, arrowEndY, arrowPoint1X, arrowPoint1Y);
            canvas.DrawLine(arrowEndX, arrowEndY, arrowPoint2X, arrowPoint2Y);
        }
    }
}
