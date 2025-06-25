using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using MahApps.Metro.Controls.Dialogs;
using System.Threading.Tasks;

namespace WpfMrpSimulatorApp.ViewModels
{
    public partial class MonitoringViewModel : ObservableObject
    {
        // readonly 생성자에서 할당하고나면 그 이후에 값변경 불가
        private readonly IDialogCoordinator dialogCoordinator;

        public MonitoringViewModel(IDialogCoordinator coordinator)
        {
            this.dialogCoordinator = coordinator;  // 파라미터값으로 초기화
        }

        [RelayCommand]
        public async Task SearchProcess()
        {
            await this.dialogCoordinator.ShowMessageAsync(this, "공정조회", "조회를 시작합니다");
        }

        [RelayCommand]
        public async Task StartProcess()
        {
            await this.dialogCoordinator.ShowMessageAsync(this, "공정시작", "공정을 시작합니다");
        }

    }
}
