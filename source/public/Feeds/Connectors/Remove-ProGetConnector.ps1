function Remove-ProGetConnector {
<#
    .SYNOPSIS
    Removes a connector from ProGet.

    .DESCRIPTION
    The `Remove-ProGetConnector` function deletes a specified connector from ProGet. It supports confirmation prompts to prevent accidental deletions and can be forced to skip confirmation. The function uses the ProGet API to perform the deletion.

    .PARAMETER Connector
    The name of the connector(s) to remove. This parameter is mandatory and supports pipeline input.

    .PARAMETER Force
    Skips the confirmation prompt and forces the removal of the connector(s).

    .EXAMPLE
    Remove-ProGetConnector -Connector "MyConnector"

    Removes the connector named "MyConnector" after confirmation.

    .EXAMPLE
    Remove-ProGetConnector -Connector "MyConnector" -Force

    Forces the removal of the connector named "MyConnector" without confirmation.

    .EXAMPLE
    Get-ProGetConnector | Remove-ProGetConnector

    Pipes the output of `Get-ProGetConnector` to remove all listed connectors after confirmation.
#>
    [CmdletBinding(ConfirmImpact = 'High', SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory)]
        [Alias('Name')]
        [ArgumentCompleter({
            param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
        
            # Call Get-ProGetFeed and parse its output to get feed names
            $connectors = (Get-ProGetConnector).name
        
            if ($wordToComplete) {
                $connectors.Where{ $_ -match "^$WordToComplete" }
            }
            else {
                $connectors
            }
         
        })]
        [String[]]
        $Connector,

        [Parameter()]
        [Switch]
        $Force
    )

    $Connector | ForEach-Object {
        if ($Force -and -not $Confirm) {
            $ConfirmPreference = 'None'
            if ($PSCmdlet.ShouldProcess("$_", 'Remove Connector')) {
                $params = @{
                    Slug   = "/api/management/connectors/delete/$_"
                    Method = 'DELETE'
                }

                Invoke-ProGet @params
            }
        }
        else {
            if ($PSCmdlet.ShouldProcess("$_", 'Remove Connector')) {
                $params = @{
                    Slug   = "/api/management/connectors/delete/$_"
                    Method = 'DELETE'
                }
            }

            Invoke-ProGet @params
        }

    }
}