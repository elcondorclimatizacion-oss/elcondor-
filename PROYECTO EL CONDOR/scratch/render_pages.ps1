$pdfPath = "c:\Users\PABLO\OneDrive\Desktop\revista junio (2) (3).pdf"
$scratchDir = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\scratch"

if (-not (Test-Path $pdfPath)) {
    Write-Error "PDF file not found at $pdfPath"
    exit 1
}

if (-not (Test-Path $scratchDir)) {
    New-Item -ItemType Directory -Path $scratchDir -Force | Out-Null
}

Write-Host "Opening PDF file..."
try {
    $storageFile = [Windows.Storage.StorageFile]::GetFileFromPathAsync($pdfPath).GetAwaiter().GetResult()
    # Dynamic type reference to load the class
    $pdfDocument = [Windows.Data.Pdf.PdfDocument]::LoadFromFileAsync($storageFile).GetAwaiter().GetResult()
} catch {
    Write-Error "Failed to open PDF document. Error: $_"
    exit 1
}

$pageCount = $pdfDocument.PageCount
Write-Host "Total Pages: $pageCount"

# Render first 8 pages
$pagesToRender = 0..[Math]::Min(7, $pageCount - 1)

foreach ($pageIndex in $pagesToRender) {
    Write-Host "Rendering Page $($pageIndex + 1)..."
    try {
        $page = $pdfDocument.GetPage($pageIndex)
        $outputPath = Join-Path $scratchDir "page_$pageIndex.png"
        
        $stream = New-Object Windows.Storage.Streams.InMemoryRandomAccessStream
        $page.RenderToStreamAsync($stream).GetAwaiter().GetResult()
        
        $bytes = New-Object byte[] $stream.Size
        $reader = New-Object Windows.Storage.Streams.DataReader($stream)
        $reader.LoadAsync($stream.Size).GetAwaiter().GetResult()
        $reader.ReadBytes($bytes)
        [System.IO.File]::WriteAllBytes($outputPath, $bytes)
        
        $reader.Dispose()
        $stream.Dispose()
        $page.Dispose()
        Write-Host "Saved page $pageIndex to $outputPath"
    } catch {
        Write-Warning "Failed to render page $pageIndex. Error: $_"
    }
}

$pdfDocument.Dispose()
Write-Host "Done!"
