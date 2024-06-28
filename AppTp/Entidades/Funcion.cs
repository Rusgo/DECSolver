using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppTp.Entidades
{
    public class Funcion
    {
        public float indiferencia {  get; set; }
        public float preferencia { get; set; }
        public float sigma { get; set; }
        public int funcion { get; set; }


        public Funcion(float indiferencia, float preferencia, float sigma, int funcion)
        {
            this.funcion = funcion;
            this.preferencia = preferencia;
            this.indiferencia = indiferencia;
            this.sigma = sigma;
            
           
        }
        //solo uso la diferencia y veo si es 0 o no
        public float verdaderoCriterio(float diferencia)
        {
            if (diferencia == 0)
            {
                return 0;
            }
            return 1;
        }
        //Defino preferencia
        public float cuasiCriterio(float diferencia, float q)
        {
            if (diferencia <= q)
            {
                return 0;
            }
            return 1;

        }
        //limite de preferencia es p
        public float seudoCriterio(float diferencia, float p)
        {
            if (diferencia <= p)
            {
                return (diferencia / p);
            }
            return 1;
        }
        //Defino limite de indiferencia y preferencia
        public float levelCriterio(float diferencia, float indiferencia, float preferencia)
        {
            if (diferencia <= indiferencia)
            {
                return 0;
            }
            else if (indiferencia < diferencia && diferencia <= preferencia)
            {
                return 1 / 2;
            }
            return 1;
        }
        public float linealIndiferencia(float diferencia, float indiferencia, float preferencia)
        {
            if (diferencia <= indiferencia)
            {
                return 0;
            }
            else if (diferencia > indiferencia && diferencia <= preferencia)
            {
                return (diferencia - indiferencia) / (preferencia - indiferencia);
            }
            return 1;
        }
        public float criterioGauss(float diferencia, float q, float o)
        {
            float exponente = (float)(Math.Pow(q, 2) / (2 * Math.Pow(o, 2)));
            return 1 - (float)Math.Exp(exponente);
        }

        public float resolver(float diferencia)
        {
            if(funcion == 1)
            {
                return verdaderoCriterio(diferencia);
            }
            if (funcion == 2)
            {
                return cuasiCriterio(diferencia, indiferencia);
            }
            if (funcion == 3)
            {
                return seudoCriterio(diferencia, preferencia);
            }
            if (funcion == 4)
            {
                return levelCriterio(diferencia, indiferencia, preferencia);
            }
            if (funcion == 5)
            {
                return linealIndiferencia(diferencia, indiferencia, preferencia);
            }
            return criterioGauss(diferencia, indiferencia, sigma); 
            
        }
    }
}
