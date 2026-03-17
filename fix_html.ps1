try {
    $htmlPath = "d:\EXE\breatree.html"
    $contentPath = "d:\EXE\clean_content.txt"
    
    # Read files with UTF8 encoding
    $content = [System.IO.File]::ReadAllText($htmlPath, [System.Text.Encoding]::UTF8)
    $clean = [System.IO.File]::ReadAllText($contentPath, [System.Text.Encoding]::UTF8)
    
    $startTag = "<!-- BEGIN: Packaging Section -->"
    $endTag = "<!-- END: Instructions Section -->"
    
    $startIndex = $content.IndexOf($startTag)
    $endIndex = $content.IndexOf($endTag)
    
    if ($startIndex -eq -1 -or $endIndex -eq -1) {
        Write-Error "Tags not found"
        exit 1
    }
    
    $endIndex += $endTag.Length
    
    $newHtml = $content.Remove($startIndex, $endIndex - $startIndex).Insert($startIndex, $clean)
    
    # Write back without BOM
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($htmlPath, $newHtml, $utf8NoBom)
    
    Write-Output "Successfully updated breatree.html"
} catch {
    Write-Error $_
    exit 1
}
