using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomologacaoBalanca.Services.Communication
{
    public interface ICommunicationService
    {
        Task<bool> ConnectAsync(string portName);
        Task<bool> ConnectAsync();
        Task DisconnectAsync();
        Task<string> SendCommandAsync(string command);
        List<string> GetDevices();

        event Action<decimal> ReceivedData;
        public string Type { get; }
    }
}
