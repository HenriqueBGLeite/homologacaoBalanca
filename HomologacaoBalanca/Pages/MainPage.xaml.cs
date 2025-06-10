using HomologacaoBalanca.PagesModel;

namespace HomologacaoBalanca.Pages;

public partial class MainPage : ContentPage
{
	public MainPage(MainPageModel model)
	{
		InitializeComponent();
		BindingContext = model;
	}
}