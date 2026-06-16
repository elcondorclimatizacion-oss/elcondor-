$jsonPath = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\subir github\mappings_2.json"
$htmlPath = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\subir github\calculadora_elcondor.html"

# Ensure UTF8 for everything
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$mappings = Get-Content $jsonPath -Raw -Encoding UTF8 | ConvertFrom-Json
$content = [System.IO.File]::ReadAllText($htmlPath, [System.Text.Encoding]::UTF8)

foreach ($prop in $mappings.psobject.properties) {
    $bad = $prop.Name
    $good = $prop.Value
    $content = $content.Replace($bad, $good)
}

[System.IO.File]::WriteAllText($htmlPath, $content, [System.Text.Encoding]::UTF8)
Write-Host "Reemplazos parte 2 completados."
