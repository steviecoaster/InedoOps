function Remove-ProGetFeed {
    [CmdletBinding(ConfirmImpact = 'High', SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory, ValueFromPipelineByPropertyName)]
        [Alias('Name')]
        [ArgumentCompleter({
                param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
            
                # Call Get-ProGetFeed and parse its output to get feed names
                $feeds = (Get-ProGetFeed).name
            
                if ($wordToComplete) {
                    $feeds.Where{ $_ -match "^$WordToComplete" }
                }
                else {
                    $feeds
                }
             
            })]
        [String[]]
        $Feed,

        [Parameter()]
        [Switch]
        $Force
    )
    process {
        $Feed | Foreach-Object {

            if($Force -and -not $Confirm){
                $ConfirmPreference = 'None'
                if($PSCmdlet.ShouldProcess("$_",'Remove Feed')){
                    $params = @{
                        Slug = "/api/management/feeds/delete/$_"
                        Method = 'DELETE'
                    }

                    Invoke-ProGet @params
                }
            }
            else {
                if($PSCmdlet.ShouldProcess("$_", 'Remove Feed')){
                    $params = @{
                        Slug = "/api/management/feeds/delete/$_"
                        Method = 'DELETE'
                    }

                    Invoke-ProGet @params
                }
            }
        }
    }
}