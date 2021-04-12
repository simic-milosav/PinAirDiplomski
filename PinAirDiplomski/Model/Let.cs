using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PinAirDiplomski
{
    public class Let
    {
        public Let()
        {

        }

        public Let(string idLeta, int preostaloMesta)
        {
            IdLeta = idLeta;
            PreostaloMesta = preostaloMesta;
        }

        public string IdLeta { get; set; }
        public int PreostaloMesta { get; set; }
    }
}