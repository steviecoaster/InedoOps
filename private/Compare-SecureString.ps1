function Compare-SecureString {
    <#
    .NOTES
    From https://stackoverflow.com/a/48810852
    #>
    param(
      [Security.SecureString]
      $secureString1,
  
      [Security.SecureString]
      $secureString2
    )
    try {
      $bstr1 = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureString1)
      $bstr2 = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($secureString2)
      $length1 = [Runtime.InteropServices.Marshal]::ReadInt32($bstr1,-4)
      $length2 = [Runtime.InteropServices.Marshal]::ReadInt32($bstr2,-4)
      if ( $length1 -ne $length2 ) {
        return $false
      }
      for ( $i = 0; $i -lt $length1; ++$i ) {
        $b1 = [Runtime.InteropServices.Marshal]::ReadByte($bstr1,$i)
        $b2 = [Runtime.InteropServices.Marshal]::ReadByte($bstr2,$i)
        if ( $b1 -ne $b2 ) {
          return $false
        }
      }
      return $true
    }
    finally {
      if ( $bstr1 -ne [IntPtr]::Zero ) {
        [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr1)
      }
      if ( $bstr2 -ne [IntPtr]::Zero ) {
        [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr2)
      }
    }
  }