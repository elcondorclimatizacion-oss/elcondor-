$photosJsPath = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\scratch\photos_js.txt"
$rootHtmlPath = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\index.html"
$servicesHtmlPath = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\servicios el condor\index.html"

if (-not (Test-Path $photosJsPath)) {
    Write-Error "photos_js.txt not found!"
    exit 1
}

$utf8Encoding = New-Object System.Text.UTF8Encoding($false) # UTF-8 without BOM

# Read files with explicit UTF-8 encoding
$photosJsContent = [System.IO.File]::ReadAllText($photosJsPath, $utf8Encoding)

# 1. Update root index.html
$rootHtml = [System.IO.File]::ReadAllText($rootHtmlPath, $utf8Encoding)
$pattern = "(?s)const photos = \[.*?\];"
$replacement = "const photos = [`r`n" + $photosJsContent + "`r`n        ];"
$newRootHtml = [regex]::Replace($rootHtml, $pattern, $replacement)
[System.IO.File]::WriteAllText($rootHtmlPath, $newRootHtml, $utf8Encoding)
Write-Output "Updated root index.html with UTF-8"

# 2. Update services index.html (replace FOTOS/ with ../FOTOS/)
$servicesPhotosJsContent = $photosJsContent.Replace("FOTOS/", "../FOTOS/")
$servicesHtml = [System.IO.File]::ReadAllText($servicesHtmlPath, $utf8Encoding)
$replacementServices = "const photos = [`r`n" + $servicesPhotosJsContent + "`r`n        ];"
$newServicesHtml = [regex]::Replace($servicesHtml, $pattern, $replacementServices)
[System.IO.File]::WriteAllText($servicesHtmlPath, $newServicesHtml, $utf8Encoding)
Write-Output "Updated services index.html with UTF-8"
