using ClosedXML.Excel;
using DocumentFormat.OpenXml.Spreadsheet;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppTp.Entidades
{
    public class ExcelExporter
    {
        public void ExportToExcel(List<string> sheetNames, List<string[,]> matrices, string filePath, List<string> texts)
        {
            using (var workbook = new XLWorkbook())
            {

                for (int i = 0; i < sheetNames.Count; i++)
                {
                    var worksheet = workbook.Worksheets.Add(sheetNames[i]);
                    ExportMatrixToSheet(matrices[i], worksheet);
                    AddTextToSheet(texts[i], worksheet, matrices[i].GetLength(0), matrices[i].GetLength(1));
                }
                foreach (var worksheet in workbook.Worksheets)
                {
                    // Obtiene el rango usado en la hoja de cálculo
                    var range = worksheet.RangeUsed();

                    if (range != null) // Verifica que el rango usado no sea nulo
                    {
                        // Aplica bordes a todas las celdas en el rango usado
                        range.Style.Border.OutsideBorder = XLBorderStyleValues.Thin;
                        range.Style.Border.InsideBorder = XLBorderStyleValues.Thin;
                    }


                }
                workbook.SaveAs(filePath);
            }
        }
        private void AddTextToSheet(string text, IXLWorksheet worksheet, int rowCount, int colCount)
        {
            // Agregar texto al lado de la última columna de la matriz
            var textCell = worksheet.Cell(1, colCount + 2); // Coloca el texto en la primera fila después de la última columna
            textCell.Value = text;
            textCell.Style.Font.Bold = true;
            textCell.Style.Fill.BackgroundColor = XLColor.LightGray;
            textCell.Style.Alignment.WrapText = true;

            // Ajustar el ancho de la columna para que el texto se ajuste correctamente
            worksheet.Column(colCount + 2).AdjustToContents();

            // Combinar las celdas para simular un cuadro de texto al lado de toda la matriz
            if (rowCount > 1)
            {
                worksheet.Range(1, colCount + 2, rowCount, colCount + 2).Merge().Style.Alignment.WrapText = true;
            }
        }
        private void ExportMatrixToSheet(string[,] matrix, IXLWorksheet worksheet)
        {
            int rows = matrix.GetLength(0);
            int cols = matrix.GetLength(1);

            for (int i = 0; i < rows; i++)
            {
                for (int j = 0; j < cols; j++)
                {
                    worksheet.Cell(i + 1, j + 1).Value = matrix[i, j];
                }
            }
        }
    }
}