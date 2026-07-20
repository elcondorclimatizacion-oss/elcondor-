$zipPath = "$env:TEMP\xpdf-tools.zip"
$destPath = "$env:TEMP\xpdf-tools"
$pdfPath = "c:\Users\PABLO\OneDrive\Desktop\revista junio (2) (3).pdf"
$outTxt = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\scratch\extracted_text.txt"

Write-Host "Downloading xpdf tools 4.06..."
try {
    Invoke-WebRequest -Uri "https://dl.xpdfreader.com/xpdf-tools-win-4.06.zip" -OutFile $zipPath
} catch {
    Write-Error "Failed to download xpdf tools. Error: $_"
    exit 1
}

Write-Host "Extracting zip..."
try {
    Expand-Archive -Path $zipPath -DestinationPath $destPath -Force
} catch {
    Write-Error "Failed to extract zip. Error: $_"
    exit 1
}

Write-Host "Extracting PDF text..."
try {
    $exePath = Join-Path $destPath "xpdf-tools-win-4.06\bin64\pdftotext.exe"
    & $exePath -f 1 -l 15 $pdfPath $outTxt
} catch {
    Write-Error "Failed to extract text using pdftotext. Error: $_"
    exit 1
}

if (Test-Path $outTxt) {
    $item = Get-Item $outTxt
    Write-Host "Success! Extracted file: $($item.FullName) ($($item.Length) bytes)"
} else {
    Write-Error "Output file was not created."
}
