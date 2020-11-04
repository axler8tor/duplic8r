using namespace System.Management.Automation
using namespace System.Management.Automation.Language

Import-Module '/Users/axl/.local/share/powershell/Modules/posh-git/1.0.0/posh-git.psd1'
Import-Module '/Users/axl/.local/share/powershell/Modules/oh-my-posh/2.0.332/oh-my-posh.psd1'

Set-Theme PowerLine

$PSReadLineOptions = @{
    EditMode = "Vi"
    BellStyle = "None"
    HistoryNoDuplicates = $True
    MaximumHistoryCount = 2048
    ViModeIndicator = "Cursor"
    Colors = @{
        "ContinuationPrompt"="`e[33m"
        "Operator"="`e[33m"
        "Parameter"="`e[36m"
        "Member"="`e[35m"
        "Number"="`e[36m"
        "Type"="`e[34m"
        "Default"="`e[32m"
    }
}
Set-PSReadLineOption @PSReadLineOptions


