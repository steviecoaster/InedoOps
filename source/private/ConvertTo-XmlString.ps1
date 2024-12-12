function ConvertTo-XmlString {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String[]]
        $Group
    )

    process {
        $groupsXml = New-Object System.Xml.XmlDocument
        $root = $groupsXml.CreateElement("groups")
        $null = $groupsXml.AppendChild($root)

        foreach ($g in $group) {
            $groupElement = $groupsXml.CreateElement("group")
    
            $groupNameElement = $groupsXml.CreateElement("GroupName")
            $groupNameElement.InnerText = $g
            $null = $groupElement.AppendChild($groupNameElement)

            $null = $root.AppendChild($groupElement)
        }

        $groupsXml.OuterXml

    }
}