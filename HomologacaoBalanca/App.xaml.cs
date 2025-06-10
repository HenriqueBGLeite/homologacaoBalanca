using CommunityToolkit.Mvvm.DependencyInjection;
using HomologacaoBalanca.Pages;
using HomologacaoBalanca.PagesModel;
using HomologacaoBalanca.Services.Communication;
using HomologacaoBalanca.Services.Error;
using System.Net.WebSockets;

namespace HomologacaoBalanca
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
        }

        protected override Window CreateWindow(IActivationState? activationState)
        {
            var serviceProvider = this.Handler!.MauiContext!.Services;
            var mainPageModel = serviceProvider.GetRequiredService<MainPageModel>();

            return new Window(new MainPage(mainPageModel));
        }
    }
}