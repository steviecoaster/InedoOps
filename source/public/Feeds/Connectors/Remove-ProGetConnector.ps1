function Remove-ProGetConnector {
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