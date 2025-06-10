using System;
using System.Collections.Generic;
using System.IO.Ports;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomologacaoBalanca.Services.Communication
{
    public class SerialCommunicationService : ICommunicationService
    {
        public string Type => "serial";
        private SerialPort? _serialPort;
        public event Action<decimal>? ReceivedData;

        public Task<bool> ConnectAsync(string portName = "COM3")
        {
            _serialPort = new SerialPort(portName, 9600, Parity.None, 8, StopBits.One);
            _serialPort.DataReceived += SerialPortDataReceived;
            _serialPort.Open();

            return Task.FromResult(true);
        }

        public Task<bool> ConnectAsync()
        {
            throw new NotImplementedException();
        }

        private void SerialPortDataReceived(object sender, SerialDataReceivedEventArgs e)
        {
            if (_serialPort == null) return;

            string data = _serialPort.ReadExisting();

            if (string.IsNullOrEmpty(data))
            {
                Console.WriteLine($"Recebido: {data}");
                
                data = HandleScaleMessage(data);

                ReceivedData?.Invoke(decimal.Parse(data));
            }            
        }

        internal string HandleScaleMessage(string data)
        {
            data = data.Trim();

            if (data.Contains(";"))
            {
                string[] dados = data.Split(';');

                var pesoTmp = dados[0].Trim().Replace(".", ",");
                decimal valueFinal; 

                if (dados[1] == "E" && decimal.TryParse(pesoTmp, out valueFinal))
                {
                    return pesoTmp.Replace("+", "").Replace("-", "");
                }
                return "";
            }
            return "";
        }

        public Task DisconnectAsync()
        {
            if (_serialPort != null)
            {
                _serialPort.DataReceived -= SerialPortDataReceived;
                _serialPort.Close();
                _serialPort.Dispose();
            }

            return Task.CompletedTask;
        }

        public Task<string> SendCommandAsync(string command)
        {
            if (_serialPort == null || !_serialPort.IsOpen)
                throw new InvalidOperationException("Serial port is not connected.");

            _serialPort.WriteLine(command);

            return Task.FromResult("Comando enviado.");
        }

        public List<string> GetDevices()
        {
            return SerialPort.GetPortNames().ToList();
        }
    }
}
