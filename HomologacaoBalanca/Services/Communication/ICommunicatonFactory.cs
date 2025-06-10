using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomologacaoBalanca.Services.Communication
{
    public interface ICommunicatonFactory
    {
        ICommunicationService Create(string type);
    }
}
