using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppTp.Entidades
{
    public class Alternativa
    {
        public class alternativa
        {
            static int id = 1;            
            public string Name { get; set; }
            public string C1 { get; set; }
            public string C2 { get; set; }

            public string C3 { get; set; }
            public string C4 { get; set; }

            public string C5 { get; set; }
            public string C6 { get; set; }
            public string C7 { get; set; }
            public string U { get; set; }
            public string SB { get; set; }
            public string SM { get; set; }
            public alternativa()
            {
                Name = "A" + id.ToString();
                id++;
            }
            public alternativa(int id)
            {
                Name = "A" + id.ToString();
            }

        }
    }
}
