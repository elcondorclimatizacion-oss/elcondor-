$highvoltDir = "c:\Users\PABLO\OneDrive\Desktop\fotos highvolt"
$cctvDir = "c:\Users\PABLO\OneDrive\Desktop\fotos cctv"
$outPath = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\scratch\photos_js.txt"

$addedFiles = @{}
$outJs = New-Object System.Collections.Generic.List[string]

# Captions maps
$highvoltCaptions = [ordered]@{
    "8.13.19" = @{ category = "electricidad"; caption = "Montaje y Conexion de Tablero Electrico Principal Seccional" }
    "8.13.20" = @{ category = "electricidad"; caption = "Medicion y Distribucion de Fases en Tablero Principal" }
    "8.13.21" = @{ category = "electricidad"; caption = "Distribucion Peinada de Termicas y Disyuntores" }
    "8.13.22" = @{ category = "electricidad"; caption = "Instalacion y Medicion de Jabalina de Puesta a Tierra" }
    "8.13.23" = @{ category = "electricidad"; caption = "Conexion de Protectores de Tension e Indicadores LED" }
    "23.13.48" = @{ category = "electricidad"; caption = "Normalizacion de Acometida Principal Electrica" }
    "23.13.49" = @{ category = "electricidad"; caption = "Tablero de Distribucion Seccional en Obra de Gran Envergadura" }
    "23.13.50" = @{ category = "electricidad"; caption = "Cableado Estructurado y Canalizacion de Tableros de Comando" }
    "23.13.53" = @{ category = "electricidad"; caption = "Montaje de Bandejas Portacables y Canalizaciones de Fuerza Motriz" }
    "23.13.54" = @{ category = "electricidad"; caption = "Normalizacion Electrica Completa y Rotulado de Tablero Principal" }
    "23.13.55" = @{ category = "electricidad"; caption = "Terminacion y Peinado de Tablero con Terminales Tubulares" }
    "23.23.26" = @{ category = "electricidad"; caption = "Mantenimiento Preventivo de Tablero General Residencial" }
    "23.23.27" = @{ category = "electricidad"; caption = "Certificacion de Medicion de Puesta a Tierra y Continuidad" }
    "11.15.02" = @{ category = "aa"; caption = "Instalacion de Unidad Condensadora Exterior de Aire Acondicionado" }
    "11.15.03" = @{ category = "aa"; caption = "Canalizacion y Conexion de Fuerza Motriz para Condensadoras" }
    "11.19.09" = @{ category = "cctv"; caption = "Instalacion de Camara de Seguridad de Alta Resolucion" }
    "1.04.01"  = @{ category = "electricidad"; caption = "Cableado de Potencia y Senal de Control Estandarizado" }
    "11.43.52" = @{ category = "electricidad"; caption = "Detalle de Peinado de Conductores en Canalizaciones" }
    "11.44.02" = @{ category = "electricidad"; caption = "Tablero Principal de Obra de Seguridad con Tomas Industriales" }
    "11.44.03" = @{ category = "electricidad"; caption = "Tendido de Alimentadores de Potencia e Interruptores de Cabecera" }
    "11.44.04" = @{ category = "electricidad"; caption = "Puesta en Marcha y Verificacion de Sentido de Giro Trifasico" }
    "11.44.05" = @{ category = "electricidad"; caption = "Tablero Seccional de Iluminacion y Automatismos Domoticos" }
    "11.44.06" = @{ category = "electricidad"; caption = "Protecciones Termomagneticas para Circuitos Seccionales" }
    "11.44.07" = @{ category = "aa"; caption = "Aislacion Termica e Impermeabilizacion de Tuberias de Refrigeracion" }
    "11.44.09" = @{ category = "cctv"; caption = "Conexion de Red y Servidor de Camaras de Seguridad" }
    "11.44.11" = @{ category = "cctv"; caption = "Instalacion de Rack de Telecomunicaciones y Patchera de Red" }
}

$cctvCaptions = @(
    "Instalacion de Camaras de Seguridad IP y Domos de Alta Resolucion",
    "Montaje y Ajuste de Lente en Camaras de Seguridad Exterior",
    "Cableado Estructurado de Red y Datos para Sistema de Monitoreo",
    "Configuracion de Central de Monitoreo y Grabador Digital",
    "Canalizacion y Montaje de Camaras de Vigilancia Perimetral"
)

# 1. Process High Volt folder
if (Test-Path $highvoltDir) {
    $files = Get-ChildItem -Path $highvoltDir -File | Where-Object { $_.Extension -eq ".jpeg" -or $_.Extension -eq ".jpg" }
    $idx = 0
    foreach ($f in $files) {
        if ($addedFiles.ContainsKey($f.Name)) { continue }
        
        $category = "electricidad"
        $caption = ""
        
        foreach ($k in $highvoltCaptions.Keys) {
            if ($f.Name.Contains($k)) {
                $category = $highvoltCaptions[$k].category
                $caption = $highvoltCaptions[$k].caption
                break
            }
        }
        
        if ($caption -eq "") {
            $caption = "Instalacion y Mantenimiento de Tableros Electricos y Cableado"
        }
        
        $escapedCaption = $caption.Replace('"', '\"')
        $item = "            { src: `"FOTOS/$($f.Name)`", category: `"$category`", caption: `"$escapedCaption`" },"
        $outJs.Add($item)
        $addedFiles[$f.Name] = $true
        $idx++
    }
}

# 2. Process CCTV folder
if (Test-Path $cctvDir) {
    $files = Get-ChildItem -Path $cctvDir -File | Where-Object { $_.Extension -eq ".jpeg" -or $_.Extension -eq ".jpg" }
    $idx = 0
    foreach ($f in $files) {
        if ($addedFiles.ContainsKey($f.Name)) { continue }
        
        $caption = $cctvCaptions[$idx % $cctvCaptions.Count]
        
        # Check if we have specific override for name patterns
        foreach ($k in $highvoltCaptions.Keys) {
            if ($f.Name.Contains($k)) {
                $caption = $highvoltCaptions[$k].caption
                break
            }
        }
        
        $escapedCaption = $caption.Replace('"', '\"')
        $item = "            { src: `"FOTOS/$($f.Name)`", category: `"cctv`", caption: `"$escapedCaption`" },"
        $outJs.Add($item)
        $addedFiles[$f.Name] = $true
        $idx++
    }
}

# 3. Add some default/additional Climatizacion/AA photos from FOTOS folder if they contain AA patterns to make AA tab rich
$photosDir = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\FOTOS"
if (Test-Path $photosDir) {
    $files = Get-ChildItem -Path $photosDir -File | Where-Object { $_.Extension -eq ".jpeg" -or $_.Extension -eq ".jpg" }
    $idx = 0
    foreach ($f in $files) {
        if ($addedFiles.ContainsKey($f.Name)) { continue }
        
        # Check if it has air conditioning names
        if ($f.Name.Contains("11.15.02") -or $f.Name.Contains("11.15.03") -or $f.Name.Contains("11.44.07")) {
            $category = "aa"
            $caption = "Instalacion de Unidad Condensadora Exterior de Aire Acondicionado"
            if ($f.Name.Contains("11.15.03")) { $caption = "Canalizacion y Conexion de Fuerza Motriz para Condensadoras" }
            if ($f.Name.Contains("11.44.07")) { $caption = "Aislacion Termica e Impermeabilizacion de Tuberias de Refrigeracion" }
            
            $escapedCaption = $caption.Replace('"', '\"')
            $item = "            { src: `"FOTOS/$($f.Name)`", category: `"aa`", caption: `"$escapedCaption`" },"
            $outJs.Add($item)
            $addedFiles[$f.Name] = $true
        }
    }
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllLines($outPath, $outJs, $utf8NoBom)
Write-Output "Successfully generated $($outJs.Count) perfectly categorized photo array items."
