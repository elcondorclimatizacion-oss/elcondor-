# CREDENCIALES PRIVADAS DEL USUARIO (Se cargan localmente para seguridad)
$NotionToken = "TU_NOTION_TOKEN"
$PageId = "TU_PAGE_ID"

$ConfigPath = Join-Path $PSScriptRoot "..\config_notion.json"
if (Test-Path $ConfigPath) {
    try {
        $Config = Get-Content -Raw -Path $ConfigPath | ConvertFrom-Json
        if ($Config.NOTION_TOKEN) { $NotionToken = $Config.NOTION_TOKEN }
        if ($Config.PAGE_ID) { $PageId = $Config.PAGE_ID }
    }
    catch {
        Write-Host "⚠️ No se pudo leer config_notion.json. Usando valores por defecto." -ForegroundColor Yellow
    }
}

Write-Host "`n> Construyendo la Base de Datos automaticamente en tu hoja en blanco..." -ForegroundColor Cyan

$bodyObj = @{
    parent = @{
        type = "page_id"
        page_id = $PageId
    }
    title = @(
        @{
            type = "text"
            text = @{ content = "Calendario de Contenidos" }
        }
    )
    properties = @{
        "Name" = @{
            title = @{}
        }
        "Servicio" = @{
            select = @{
                options = @(
                    @{ name = "Climatizacion (AA)"; color = "blue" },
                    @{ name = "Electricidad"; color = "yellow" },
                    @{ name = "CCTV"; color = "red" },
                    @{ name = "Domotica"; color = "green" },
                    @{ name = "Fibra Optica"; color = "purple" }
                )
            }
        }
        "Temporada" = @{
            select = @{
                options = @(
                    @{ name = "Otono - Invierno"; color = "orange" },
                    @{ name = "Primavera - Verano"; color = "pink" }
                )
            }
        }
        "Estado" = @{
            select = @{
                options = @(
                    @{ name = "Idea / Guion IA"; color = "yellow" },
                    @{ name = "Para Grabar en Obra"; color = "blue" },
                    @{ name = "En Edicion (CapCut)"; color = "red" },
                    @{ name = "Publicado"; color = "green" }
                )
            }
        }
    }
}

$jsonBody = $bodyObj | ConvertTo-Json -Depth 10

$headers = @{
    "Authorization" = "Bearer $NotionToken"
    "Notion-Version" = "2022-06-28"
}

$irmParams = @{
    Uri         = "https://api.notion.com/v1/databases"
    Method      = "Post"
    Headers     = $headers
    ContentType = "application/json; charset=utf-8"
    Body        = $jsonBody
}

try {
    $response = Invoke-RestMethod @irmParams
    Write-Host "`n[EXITO] La Base de Datos se creo magicamente dentro de tu hoja en blanco." -ForegroundColor Green
    Write-Host "[NUEVO ID DE BASE DE DATOS] $($response.id)" -ForegroundColor Yellow
    Write-Host "URL: $($response.url)`n" -ForegroundColor Green
}
catch {
    Write-Host "`n[ERROR] No se pudo crear la base de datos:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    if ($_.ErrorDetails) {
        Write-Host $_.ErrorDetails.Message -ForegroundColor DarkRed
    }
}
