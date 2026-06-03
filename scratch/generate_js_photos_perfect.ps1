$highvoltDir = "c:\Users\PABLO\OneDrive\Desktop\fotos highvolt"
$cctvDir = "c:\Users\PABLO\OneDrive\Desktop\fotos cctv"
$outPath = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\scratch\photos_js.txt"

$addedFiles = @{}
$outJs = New-Object System.Collections.Generic.List[string]

# Captions maps
$highvoltCaptions = [ordered]@{
    "8.13.19" = @{ category = "electricidad"; caption = "" }
    "8.13.20" = @{ category = "electricidad"; caption = "" }
    "8.13.21" = @{ category = "electricidad"; caption = "" }
    "8.13.22" = @{ category = "electricidad"; caption = "" }
    "8.13.23" = @{ category = "electricidad"; caption = "" }
    "23.13.48" = @{ category = "electricidad"; caption = "" }
    "23.13.49" = @{ category = "electricidad"; caption = "" }
    "23.13.50" = @{ category = "electricidad"; caption = "" }
    "23.13.53" = @{ category = "electricidad"; caption = "" }
    "23.13.54" = @{ category = "electricidad"; caption = "" }
    "23.13.55" = @{ category = "electricidad"; caption = "" }
    "23.23.26" = @{ category = "electricidad"; caption = "" }
    "23.23.27" = @{ category = "electricidad"; caption = "" }
    "11.15.02" = @{ category = "aa"; caption = "" }
    "11.15.03" = @{ category = "aa"; caption = "" }
    "11.19.09" = @{ category = "cctv"; caption = "" }
    "1.04.01"  = @{ category = "electricidad"; caption = "" }
    "11.43.52" = @{ category = "electricidad"; caption = "" }
    "11.44.02" = @{ category = "electricidad"; caption = "" }
    "11.44.03" = @{ category = "electricidad"; caption = "" }
    "11.44.04" = @{ category = "electricidad"; caption = "" }
    "11.44.05" = @{ category = "electricidad"; caption = "" }
    "11.44.06" = @{ category = "electricidad"; caption = "" }
    "11.44.07" = @{ category = "aa"; caption = "" }
    "11.44.09" = @{ category = "cctv"; caption = "" }
    "11.44.11" = @{ category = "cctv"; caption = "" }
}

# 1. Process High Volt folder
if (Test-Path $highvoltDir) {
    $files = Get-ChildItem -Path $highvoltDir -File | Where-Object { $_.Extension -eq ".jpeg" -or $_.Extension -eq ".jpg" }
    foreach ($f in $files) {
        if ($addedFiles.ContainsKey($f.Name)) { continue }
        
        $category = "electricidad"
        
        foreach ($k in $highvoltCaptions.Keys) {
            if ($f.Name.Contains($k)) {
                $category = $highvoltCaptions[$k].category
                break
            }
        }
        
        $item = "            { src: `"FOTOS/$($f.Name)`", category: `"$category`", caption: `"`" },"
        $outJs.Add($item)
        $addedFiles[$f.Name] = $true
    }
}

# 2. Process CCTV folder
if (Test-Path $cctvDir) {
    $files = Get-ChildItem -Path $cctvDir -File | Where-Object { $_.Extension -eq ".jpeg" -or $_.Extension -eq ".jpg" }
    foreach ($f in $files) {
        if ($addedFiles.ContainsKey($f.Name)) { continue }
        
        $item = "            { src: `"FOTOS/$($f.Name)`", category: `"cctv`", caption: `"`" },"
        $outJs.Add($item)
        $addedFiles[$f.Name] = $true
    }
}

# 3. Add some default/additional Climatizacion/AA photos from FOTOS folder if they contain AA patterns to make AA tab rich
$photosDir = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\FOTOS"
if (Test-Path $photosDir) {
    $files = Get-ChildItem -Path $photosDir -File | Where-Object { $_.Extension -eq ".jpeg" -or $_.Extension -eq ".jpg" }
    foreach ($f in $files) {
        if ($addedFiles.ContainsKey($f.Name)) { continue }
        
        # Check if it has air conditioning names
        if ($f.Name.Contains("11.15.02") -or $f.Name.Contains("11.15.03") -or $f.Name.Contains("11.44.07")) {
            $category = "aa"
            $item = "            { src: `"FOTOS/$($f.Name)`", category: `"aa`", caption: `"`" },"
            $outJs.Add($item)
            $addedFiles[$f.Name] = $true
        }
    }
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllLines($outPath, $outJs, $utf8NoBom)
Write-Output "Successfully generated $($outJs.Count) photo array items with empty captions."
