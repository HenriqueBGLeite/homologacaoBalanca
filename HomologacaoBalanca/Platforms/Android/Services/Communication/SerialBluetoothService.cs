using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Android.Bluetooth;
using Java.Util;
using HomologacaoBalanca.Services.Communication;

namespace HomologacaoBalanca.Services.Communication
{
    public class SerialBluetoothService : ICommunicationService
    {
        private BluetoothSocket _socket;
        private StreamReader _reader;
        private StreamWriter _writer;
        private CancellationTokenSource _cts;

        public event Action<decimal> ReceivedData;

        public string Type => "SPP";

        public async Task<bool> ConnectAsync(string portName)
        {
            portName = "HD_EASY773223013";

            var adapter = BluetoothAdapter.DefaultAdapter;
            var device = adapter.BondedDevices.FirstOrDefault(d => d.Name == portName);

            if (device == null)
            {
                Console.WriteLine($"Device '{portName}' not found.");
                return false;
            }

            var uuid = device.GetUuids().FirstOrDefault()?.Uuid ?? UUID.RandomUUID();
            _socket = device.CreateRfcommSocketToServiceRecord(uuid);

            try
            {
                await _socket.ConnectAsync();
                _reader = new StreamReader(_socket.InputStream);
                _writer = new StreamWriter(_socket.OutputStream) { AutoFlush = true };

                await SendCommandAsync(";peso\r");

                _cts = new CancellationTokenSource();
                _ = Task.Run(ReadLoopAsync, _cts.Token);

                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Connection failed: {ex.Message}");
                return false;
            }
        }

        public Task<bool> ConnectAsync()
        {
            throw new NotImplementedException("Use ConnectAsync(string portName) instead.");
        }

        public async Task DisconnectAsync()
        {
            _cts?.Cancel();
            _reader?.Dispose();
            _writer?.Dispose();

            if (_socket != null && _socket.IsConnected)
            {
                _socket.Close();
            }

            _socket = null;
        }

        public async Task<string> SendCommandAsync(string command)
        {
            if (_socket == null || !_socket.IsConnected)
            {
                throw new InvalidOperationException("Not connected.");
            }

            await _writer.WriteLineAsync(command);

            return "Command sent.";
        }

        public List<string> GetDevices()
        {
            var adapter = BluetoothAdapter.DefaultAdapter;
            return adapter.BondedDevices.Select(d => d.Name).ToList();
        }

        private async Task ReadLoopAsync()
        {
            try
            {
                while (!_cts.Token.IsCancellationRequested)
                {
                    var line = await _reader.ReadLineAsync();

                    if (!string.IsNullOrEmpty(line))
                    {
                        line = CleanWeightData(line);

                        if (decimal.TryParse(line, out decimal value))
                        {
                            MainThread.BeginInvokeOnMainThread(() => ReceivedData?.Invoke(value));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Read error: {ex.Message}");
            }
        }

        private string CleanWeightData(string rawData)
        {
            if (string.IsNullOrWhiteSpace(rawData))
                return string.Empty;

            rawData = rawData.Trim('\r', '\n', '\0', ' ');

            // Remove sinal de positivo, se existir
            if (rawData.StartsWith("+"))
            {
                rawData = rawData.Substring(1);
            }

            // Pega somente a parte antes do primeiro ponto e vírgula
            int semicolonIndex = rawData.IndexOf(';');
            if (semicolonIndex >= 0)
            {
                rawData = rawData.Substring(0, semicolonIndex);
            }

            // Troca ponto por vírgula
            rawData = rawData.Replace(".", ",");

            // Remove espaços extras
            rawData = rawData.Trim();

            return rawData;
        }
    }
}