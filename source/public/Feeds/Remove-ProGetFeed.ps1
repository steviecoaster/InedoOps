function Remove-ProGetFeed {
<#
    .SYNOPSIS
    Removes a feed from ProGet.

    .DESCRIPTION
    The `Remove-ProGetFeed` function deletes a specified feed from ProGet. It supports pipeline input and provides confirmation prompts to prevent accidental deletions. The function uses the ProGet API to perform the deletion.

    .PARAMETER Feed
    The name of the feed(s) to remove. This parameter is mandatory and supports pipeline input.

    .PARAMETER Force
    Skips the confirmation prompt and forces the removal of the feed(s).

    .EXAMPLE
    Remove-ProGetFeed -Feed "MyFeed"

    Removes the feed named "MyFeed" after confirmation.

    .EXAMPLE
    Remove-ProGetFeed -Feed "MyFeed" -Force

    Forces the removal of the feed named "MyFeed" without confirmation.

    .EXAMPLE
    Get-ProGetFeed | Remove-ProGetFeed

    Pipes the output of `Get-ProGetFeed` to remove all listed feeds after confirmation.
#>
    [CmdletBinding(HelpUri = 'https://steviecoaster.github.io/Pagootle/Remove-ProGetFeed', ConfirmImpact = 'High', SupportsShouldProcess)]
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