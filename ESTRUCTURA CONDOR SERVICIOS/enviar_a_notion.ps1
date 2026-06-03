param (
    [string]$TituloVideo = "Nueva Idea de Video (Generada por IA)",
    [string]$Servicio = "General",
    [string]$Temporada = "Actual",
    [string]$ContenidoGuion = "Guion pendiente de grabacion en obra."
)

# CREDENCIALES PRIVADAS DEL USUARIO (Se cargan localmente para seguridad)
$NotionToken = "TU_NOTION_TOKEN"
$DatabaseId = "TU_DATABASE_ID"

$ConfigPath = Join-Path $PSScriptRoot "..\config_notion.json"
if (Test-Path $ConfigPath) {
    try {
        $Config = Get-Content -Raw -Path $ConfigPath | ConvertFrom-Json
        if ($Config.NOTION_TOKEN) { $NotionToken = $Config.NOTION_TOKEN }
        if ($Config.DATABASE_ID) { $DatabaseId = $Config.DATABASE_ID }
    }
    catch {
        Write-Host "⚠️ No se pudo leer config_notion.json. Usando valores por defecto." -ForegroundColor Yellow
    }
}

Write-Host "`n> Conectando con el Cerebro de Notion..." -ForegroundColor Cyan
Write-Host "> Creando tarjeta: `"$TituloVideo`"" -ForegroundColor Yellow

$bodyObj = @{
    parent = @{ database_id = $DatabaseId }
    properties = @{
        "Name" = @{
            title = @(
                @{ text = @{ content = $TituloVideo } }
            )
        }
    }
    children = @(
        @{
            object = "block"
            type = "heading_2"
            heading_2 = @{ rich_text = @( @{ text = @{ content = "Datos de la Estrategia" } } ) }
        },
        @{
            object = "block"
            type = "paragraph"
            paragraph = @{
                rich_text = @(
                    @{ text = @{ content = "- Servicio enfocado: $Servicio`n- Temporada: $Temporada" } }
                )
            }
        },
        @{
            object = "block"
            type = "heading_2"
            heading_2 = @{ rich_text = @( @{ text = @{ content = "Guion para Grabar (CapCut)" } } ) }
        },
        @{
            object = "block"
            type = "paragraph"
            paragraph = @{
                rich_text = @( @{ text = @{ content = $ContenidoGuion } } )
            }
        }
    )
}

# Convertir a JSON asegurando la profundidad necesaria para la estructura de Notion
$jsonBody = $bodyObj | ConvertTo-Json -Depth 10

$headers = @{
    "Authorization" = "Bearer $NotionToken"
    "Notion-Version" = "2022-06-28"
}

try {
    $irmParams = @{
        Uri         = "https://api.notion.com/v1/pages"
        Method      = "Post"
        Headers     = $headers
        ContentType = "application/json; charset=utf-8"
        Body        = $jsonBody
    }
    $response = Invoke-RestMethod @irmParams

    Write-Host "`n[EXITO] La tarjeta se creo magicamente en tu Notion." -ForegroundColor Green
    Write-Host "[ENLACE] Puedes verla haciendo clic aqui: $($response.url)`n" -ForegroundColor Green
}
catch {
    Write-Host "`n[ERROR] Error al conectar con la API de Notion:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    if ($_.ErrorDetails) {
        Write-Host $_.ErrorDetails.Message -ForegroundColor DarkRed
    }
    Write-Host "[TIP] Verifica que la integracion tenga permisos en tu base de datos de Notion (Paso 2 de la guia).`n" -ForegroundColor Yellow
}
