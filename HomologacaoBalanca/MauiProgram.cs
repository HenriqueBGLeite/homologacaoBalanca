using CommunityToolkit.Maui;
using HomologacaoBalanca.PagesModel;
using HomologacaoBalanca.Services.Communication;
using HomologacaoBalanca.Services.Error;
using Microsoft.Extensions.Logging;

namespace HomologacaoBalanca
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .UseMauiCommunityToolkit()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                });

#if DEBUG
    		builder.Logging.AddDebug();
#endif

            builder.Services.AddSingleton<ModalErrorHandler>();
            builder.Services.AddSingleton<MainPageModel>();
            builder.Services.AddSingleton<SerialCommunicationService>();
            builder.Services.AddSingleton<ICommunicationService, SerialCommunicationService>();
            builder.Services.AddSingleton<ICommunicationService, BluetoothService>();
            builder.Services.AddSingleton<IErrorHandler, ModalErrorHandler>();
            builder.Services.AddSingleton<BluetoothService>();
            builder.Services.AddSingleton<ICommunicatonFactory, CommunicationFactory>();
#if ANDROID
            builder.Services.AddSingleton<ICommunicationService, SerialBluetoothService>();
#endif
            return builder.Build();
        }
    }
}
