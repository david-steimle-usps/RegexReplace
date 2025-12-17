<#
.DESCRIPTION

This PowerShell script processes a list of Christmas song titles to create a sortable song library. It does the following:

- Defines an array of song titles.
- Sets a regex pattern to match titles starting with "The", "A", or "An".
- For each song, it checks if the title starts with one of these prefixes.
- If so, it rearranges the title by moving the prefix to the end (e.g., "The First Noel" becomes "First Noel, The") for sorting purposes.
- It creates a custom object for each song with both the original and sortable titles.
- All song objects are added to a list, which is output at the end.

This approach helps sort song titles alphabetically while ignoring common English prefixes.
#>

$Songs = @(
    "The Christmas Song"
    "The Little Drummer Boy"
    "The First Noel"
    "A Holly Jolly Christmas"
    "A Christmas Carol"
    "An Old Fashioned Christmas"
    "White Christmas"
    "Silent Night"
    "O Holy Night"
    "All I Want for Christmas Is You"
)

$PrefixPattern = '^((?:The|A|An)\s)(.+)$'

$SongLibrary = New-Object "System.Collections.Generic.List[psobject]"

$Songs | ForEach-Object {
    $Title = $PSItem
    $Sortable = if($PSItem -match $PrefixPattern){
        $SortName =  $PSItem -replace $PrefixPattern,'$2, $1'
        Write-Output $SortName
    } else {
        Write-Output $PSItem
    }
    $Entry = [pscustomobject]@{
        Title = $Title
        Sortable = $Sortable
    }
    $SongLibrary.Add($Entry)
}

$SongLibrary
