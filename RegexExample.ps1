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
