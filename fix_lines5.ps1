$path = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\subir github\calculadora_elcondor.html"
$lines = [System.IO.File]::ReadAllLines($path, [System.Text.Encoding]::UTF8)

# "SEGÚN" = U0VHVU4gLT4gU0VHWsOaTg==
$lines[1348] = '                list.push(`-- MATERIAL ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("QsOBU0lDTw==")) + ' DE BOCAS (' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("U0VHWsOaTg==")) + ' AEA 771) --`);'
$lines[1402] = '                list.push(` ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCi")) + ' 3m ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("Q2HDsW8=")) + ' de Cobre (${window.lastHvacPipes})`);'
$lines[1403] = '                list.push(` ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCi")) + ' 2u Fundas aislantes (una p/ cada ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("Y2HDsW8=")) + ')`);'
$lines[1404] = '                list.push(` ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCi")) + ' 4m Cable TPR 5x1.5mm (' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("SW50ZXJjb25leGnDs24=")) + ')`);'
$lines[1407] = '                list.push(` ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCi")) + ' 1u Cinta de PVC para ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("dGVybWluYWNpw7Nu")) + '`);'

$lines[1410] = '                    list.push(`\n-- ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("Q0FOQUxJWkFDScOzTiBFU1TDiVRJQ0E=")) + ' (${window.lastHvacCCDesc}) --`);'
$lines[1417] = '                    list.push(` ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCi")) + ' ${window.lastHvacMtExtra}m ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("Q2HDsW8=")) + ' de cobre extra`);'
$lines[1418] = '                    list.push(` ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCi")) + ' ${window.lastHvacMtExtra}m ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("QWlzbGFjacOzbg==")) + ' y cable extra`);'

[System.IO.File]::WriteAllLines($path, $lines, [System.Text.Encoding]::UTF8)
Write-Host "Success final mojibake"
