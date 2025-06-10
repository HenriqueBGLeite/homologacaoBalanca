using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using HomologacaoBalanca.Services.Communication;
using HomologacaoBalanca.Services.Error;

namespace HomologacaoBalanca.PagesModel
{
    public partial class MainPageModel : ObservableObject
    {
        private readonly ICommunicatonFactory _factory;
        private readonly IErrorHandler _errorHandler;
        private ICommunicationService _communicationService;

        public List<string> ConnectionOptions { get; } = ["BLE", "SPP", "Serial"];
        public string SelectedPort { get; set; } = string.Empty;

        [ObservableProperty]
        private bool connected, showAvailablePorts = false;

        [ObservableProperty]
        private List<string> availablePorts = new List<string>();

        [ObservableProperty]
        private string selectedConnectionType = "BLE";

        [ObservableProperty]
        private string receivedData = string.Empty;

        [ObservableProperty]
        private string msgCommand = string.Empty;

        [ObservableProperty]
        private string msgCommandGetWeight = string.Empty;

        public bool CanConnect => !Connected;

        public MainPageModel(IErrorHandler errorHandler, ICommunicatonFactory factory)
        {
            _factory = factory;
            _errorHandler = errorHandler;

            _communicationService = _factory.Create(selectedConnectionType);
            _communicationService.ReceivedData += OnDataReceived;
        }

        private void OnDataReceived(decimal data)
        {
            ReceivedData = data.ToString();
        }

        partial void OnConnectedChanged(bool value)
        {
            OnPropertyChanged(nameof(CanConnect));
        }

        partial void OnSelectedConnectionTypeChanged(string value)
        {
            _communicationService = _factory.Create(SelectedConnectionType);
            UpdatePortVisibility();
        }

        private void UpdatePortVisibility()
        {
            try
            {
                ShowAvailablePorts = SelectedConnectionType == "Serial";

                if (ShowAvailablePorts)
                {
                    LoadAvailablePorts();
                }
                else
                {
                    AvailablePorts.Clear();
                }
            }
            catch (Exception ex)
            {
                _errorHandler.HandleError(ex);
            }
        }

        [RelayCommand]
        private async Task Connect()
        {
            try
            {
                if (await EnsurePermissionsAsync())
                {
                    _communicationService.ReceivedData += OnDataReceived;
                    bool success = await _communicationService.ConnectAsync(SelectedPort);
                    Connected = success;
                }
            }
            catch (Exception ex)
            {
                _errorHandler.HandleError(ex);
            }
        }

        [RelayCommand]
        private async Task Send()
        {
            try
            {
                await _communicationService.SendCommandAsync(MsgCommand);
            }
            catch (Exception ex)
            {
                _errorHandler.HandleError(ex);
            }
        }

        [RelayCommand]
        private async Task GetWeight()
        {
            try
            {
                await _communicationService.SendCommandAsync(";peso\r");
            }
            catch (Exception ex)
            {
                _errorHandler.HandleError(ex);
            }
        }

        [RelayCommand]
        private async Task Disconnect()
        {
            try
            {
                await _communicationService.DisconnectAsync();
                Connected = false;
                ReceivedData = string.Empty;
            }
            catch (Exception ex)
            {
                _errorHandler.HandleError(ex);
            }
        }

        private async Task<bool> EnsurePermissionsAsync()
        {
            PermissionStatus BluetoothStatus = await Permissions.CheckStatusAsync<Permissions.Bluetooth>();
            
            if (BluetoothStatus != PermissionStatus.Granted)
            {
                BluetoothStatus = await Permissions.RequestAsync<Permissions.Bluetooth>();
            }

            if (BluetoothStatus == PermissionStatus.Granted)
            {

                return BluetoothStatus == PermissionStatus.Granted;
            }

            return false;
        }

        private void LoadAvailablePorts()
        {
            try
            {
                AvailablePorts = _communicationService.GetDevices();
            }
            catch (Exception ex)
            {
                _errorHandler.HandleError(ex);
            }
        }
    }
}
