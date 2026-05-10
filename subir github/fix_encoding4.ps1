$htmlPath = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\subir github\calculadora_elcondor.html"

$content = [System.IO.File]::ReadAllText($htmlPath, [System.Text.Encoding]::UTF8)

# Instead of relying on encoding passing, I'm replacing using explicit tokens from the string
$content = $content.Replace("Ã¢â‚¬â€ ", "—")
$content = $content.Replace("Ã°Å¸â€ Â¥", "🔥")
$content = $content.Replace("Ã¢â€ â‚¬", "─")
$content = $content.Replace("TECNOLOGí A", "TECNOLOGÍA")
$content = $content.Replace("ENERGí A", "ENERGÍA")
$content = $content.Replace("CLIMATIZACIÃƒâ€œN", "CLIMATIZACIÓN")
$content = $content.Replace("CATí LOGO", "CATÁLOGO")

[System.IO.File]::WriteAllText($htmlPath, $content, [System.Text.Encoding]::UTF8)
Write-Host "Manual replace completed."
