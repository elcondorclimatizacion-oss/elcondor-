$dirPath = "c:\Users\PABLO\OneDrive\Desktop\fotos highvolt"
$outPath = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\scratch\photos_js.txt"

if (-not (Test-Path $dirPath)) {
    Write-Error "Directory not found: $dirPath"
    exit 1
}

$files = Get-ChildItem -Path $dirPath -File | Where-Object { $_.Extension -eq ".jpeg" -or $_.Extension -eq ".jpg" }

$captionsMap = [ordered]@{
    "8.13.19" = "Montaje y Conexion de Tablero Electrico Principal Seccional"
    "8.13.20" = "Medicion y Distribucion de Fases en Tablero Principal"
    "8.13.21" = "Distribucion Peinada de Termicas y Disyuntores"
    "8.13.22" = "Instalacion y Medicion de Jabalina de Puesta a Tierra"
    "8.13.23" = "Conexion de Protectores de Tension e Indicadores LED"
    "23.13.48" = "Normalizacion de Acometida Principal Electrica"
    "23.13.49" = "Tablero de Distribucion Seccional en Obra de Gran Envergadura"
    "23.13.50" = "Cableado Estructurado y Canalizacion de Tableros de Comando"
    "23.13.53" = "Montaje de Bandejas Portacables y Canalizaciones de Fuerza Motriz"
    "23.13.54" = "Normalizacion Electrica Completa y Rotulado de Tablero Principal"
    "23.13.55" = "Terminacion y Peinado de Tablero con Terminales Tubulares"
    "23.23.26" = "Mantenimiento Preventivo de Tablero General Residencial"
    "23.23.27" = "Certificacion de Medicion de Puesta a Tierra y Continuidad"
    "11.15.02" = "Instalacion Electrica e Interconexion de Unidades de Climatizacion"
    "11.15.03" = "Canalizacion y Conexion de Fuerza Motriz para Condensadoras"
    "11.19.09" = "Instalacion Electrica de CCTV y Fuentes Centralizadas de Seguridad"
    "1.04.01"  = "Cableado de Potencia y Senal de Control Estandarizado"
    "11.43.52" = "Detalle de Peinado de Conductores en Canalizaciones"
    "11.44.02" = "Tablero Principal de Obra de Seguridad con Tomas Industriales"
    "11.44.03" = "Tendido de Alimentadores de Potencia e Interruptores de Cabecera"
    "11.44.04" = "Puesta en Marcha y Verificacion de Sentido de Giro Trifasico"
    "11.44.05" = "Tablero Seccional de Iluminacion y Automatismos Domoticos"
    "11.44.06" = "Protecciones Termomagneticas para Circuitos Seccionales"
    "11.44.07" = "Aislacion y Encintado Termico de Tuberias y Drenajes"
    "11.44.09" = "Conexion de Red y Servidor de Camaras de Seguridad"
    "11.44.11" = "Instalacion de Rack de Telecomunicaciones y Patchera de Red"
}

$defaultCaptions = @(
    "Instalacion de Tableros Electricos y Protecciones Especiales",
    "Normalizacion de Instalaciones Electricas de Alta Exigencia",
    "Cableado y Peinado Estetico bajo Normas AEA",
    "Instalacion de Sistemas de Iluminacion y Tomas de Fuerza Motriz",
    "Tendido y Canalizaciones Electricas Profesionales"
)

$outJs = New-Object System.Collections.Generic.List[string]
$idx = 0
foreach ($f in $files) {
    $caption = ""
    foreach ($k in $captionsMap.Keys) {
        if ($f.Name.Contains($k)) {
            $caption = $captionsMap[$k]
            break
        }
    }
    if ($caption -eq "") {
        $caption = $defaultCaptions[$idx % $defaultCaptions.Count]
    }

    $escapedCaption = $caption.Replace('"', '\"')
    $item = "            { src: `"FOTOS/$($f.Name)`", category: `"electricidad`", caption: `"$escapedCaption`" },"
    $outJs.Add($item)
    $idx++
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllLines($outPath, $outJs, $utf8NoBom)
Write-Output "Successfully generated $($outJs.Count) photo array items without accented characters."
