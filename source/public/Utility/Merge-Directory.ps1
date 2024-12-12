function Merge-Directory {
    [CmdletBinding(ConfirmImpact = 'High', SupportsShouldProcess)]
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