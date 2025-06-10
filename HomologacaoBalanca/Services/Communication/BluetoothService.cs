using InTheHand.Bluetooth;
using System.Text;

namespace HomologacaoBalanca.Services.Communication
{
    public class BluetoothService : ICommunicationService
    {
        public string Type => "ble";
        public event Action<decimal>? ReceivedData;
        private readonly string _deviceName = "S3";
        private InTheHand.Bluetooth.BluetoothDevice? _device;
        private Guid _serviceUUID = Guid.Parse("6e400001-b5a3-f393-e0a9-e50e24dcca9e");
        private Guid _characteristicUUID = Guid.Parse("6e400003-b5a3-f393-e0a9-e50e24dcca9e");
        private Guid _characteristicUUIDWRITE = Guid.Parse("6e400002-b5a3-f393-e0a9-e50e24dcca9e");

        private GattCharacteristic? _writeCharacteristic;
        private GattCharacteristic? _notificationCharacteristic;

        private CancellationTokenSource? _cts;

        public async Task<bool> ConnectAsync(string portName)
        {
            var devices = await Bluetooth.GetPairedDevicesAsync();

            foreach (var device in devices)
            {
                if (device.Name.StartsWith(_deviceName))
                {
                    _device = device;
                    break;
                }
            }

            if (_device == null)
                return false;

            await _device.Gatt.ConnectAsync();

            var service = await _device.Gatt.GetPrimaryServiceAsync(_serviceUUID);
            if (service == null)
            {
                Console.WriteLine($"Serviço {_serviceUUID} não encontrado.");
                return false;
            }

            _notificationCharacteristic = await service.GetCharacteristicAsync(_characteristicUUID);
            if (_notificationCharacteristic == null)
            {
                Console.WriteLine($"Característica {_characteristicUUID} não encontrada.");
                return false;
            }

            _writeCharacteristic = await service.GetCharacteristicAsync(_characteristicUUIDWRITE);
            if (_writeCharacteristic == null)
            {
                Console.WriteLine($"Característica de escrita {_characteristicUUIDWRITE} não encontrada.");
                return false;
            }

            _notificationCharacteristic.CharacteristicValueChanged += (sender, args) =>
            {
                var data = args.Value;

                if (data != null)
                {
                    string asciiData = Encoding.ASCII.GetString(data);
                    Console.WriteLine($"ASCII: {asciiData}");

                    ReceivedData?.Invoke(decimal.Parse(asciiData));
                }
            };

            await _notificationCharacteristic.StartNotificationsAsync();

            _cts = new CancellationTokenSource();
            _ = SendCommandPeriodicallyAsync(_cts.Token);

            return true;
        }

        public Task<bool> ConnectAsync()
        {
            return Task.FromResult(true);
        }

        public async Task DisconnectAsync()
        {
            _cts?.Cancel();

            if (_notificationCharacteristic != null)
                await _notificationCharacteristic.StopNotificationsAsync();

            if (_device != null && _device.Gatt != null)
                _device.Gatt.Disconnect();

            _writeCharacteristic = null;
            _notificationCharacteristic = null;
            _device = null;
            _cts = null;
        }

        public List<string> GetDevices()
        {
            throw new NotImplementedException();
        }

        public Task<string> SendCommandAsync(string command)
        {
            throw new NotImplementedException();
        }

        private async Task SendCommandPeriodicallyAsync(CancellationToken token)
        {
            while (!token.IsCancellationRequested)
            {
                try
                {
                    var comando = "{RW}";
                    var data = Encoding.ASCII.GetBytes(comando);

                    if (_writeCharacteristic == null)
                        break;

                    await _writeCharacteristic.WriteValueWithResponseAsync(data);

                    Console.WriteLine($"Comando enviado: {comando}");

                    await Task.Delay(200, token);  // Aguarda 200ms
                }
                catch (TaskCanceledException)
                {
                    break;
                }
                catch
                {
                    throw;
                }
            }
        }
    }
}
