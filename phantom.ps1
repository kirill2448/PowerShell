$a = 1
$b = 10

for ($i = $a; $i -le $b; $i++) {
$guid = [System.Guid]::NewGuid()
$line = "$i`n$guid"
Add-Content -Path "исходный.txt" -Value $line
}

$guids = Get-Content -Path "исходный.txt" | Select-Object -Skip 1
$sortedGuids = $guids | Sort-Object
for ($i = $a; $i -le $b; $i++) {
$line = "$i`n$($sortedGuids[$i-1])"
Add-Content -Path "сортировкаN1.txt" -Value $line
}

$sortedGuidsN2 = $guids | Sort-Object { $_.Split('-')[1] }
for ($i = $a; $i -le $b; $i++) {
$line = "$i`n$($sortedGuidsN2[$i-1])"
Add-Content -Path "сортировкаN2.txt" -Value $line
}

$zipFile = "архив.zip"
$sourceFiles = "исходный.txt", "сортировкаN1.txt", "сортировкаN2.txt"
Compress-Archive -Path $sourceFiles -DestinationPath $zipFile
Remove-Item $sourceFiles





