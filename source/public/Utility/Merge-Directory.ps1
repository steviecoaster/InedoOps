function Merge-Directory {
    <#
    .SYNOPSIS
    Merges the contents of a directory into a single flat directory.
    
    .DESCRIPTION
    The `Merge-Directory` function flattens the structure of a specified directory by moving all files from subdirectories into the root of the specified directory. It supports confirmation prompts and can be forced to skip confirmation.
    
    .PARAMETER Directory
    The path to the directory to merge. This parameter is mandatory.
    
    .PARAMETER Force
    Skips the confirmation prompt and forces the merge operation.
    
    .EXAMPLE
    Merge-Directory -Directory "C:\MyFolder"
    
    Flattens the structure of "C:\MyFolder" by moving all files from subdirectories into the root of "C:\MyFolder" with confirmation.
    
    .EXAMPLE
    Merge-Directory -Directory "C:\MyFolder" -Force
    
    Flattens the structure of "C:\MyFolder" by moving all files from subdirectories into the root of "C:\MyFolder" without confirmation.
#>
    [CmdletBinding(HelpUri = 'https://steviecoaster.github.io/Pagootle/Commands/Merge-Directory', ConfirmImpact = 'High', SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory)]
        [ValidateScript({ Test-Path $_ })]
        [String]
        $Directory,

        [Parameter()]
        [Switch]
        $Force
    )

    end {
        if ($Force -and -not $Confirm) {
            $ConfirmPreference = 'None'
            if ($PSCmdlet.ShouldProcess("$_", 'Merge (flatten) Directory')) {
                Push-Location $Directory
                Get-ChildItem -Recurse -File | ForEach-Object {
                    Move-Item $_.FullName $pwd
                }
                Pop-Location
            }
        }
        else {
            if ($PSCmdlet.ShouldProcess("$_", 'Merge (flatten) Directory')) {
                Push-Location $Directory
                Get-ChildItem -Recurse -File | ForEach-Object {
                    Move-Item $_.FullName $pwd
                }
                Pop-Location
            }
        }
    }
}