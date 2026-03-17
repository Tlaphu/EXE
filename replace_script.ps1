$path = "d:\EXE\breatree.html"
$lines = Get-Content $path -Encoding UTF8
$new_block = Get-Content "d:\EXE\clean_content.txt"
$start = 236
$end = 400
$result = $lines[0..($start-1)] + $new_block + $lines[($end+1)..($lines.Count-1)]
$utf8NoBOM = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllLines($path, $result, $utf8NoBOM)
Write-Output "Replacement complete"
