$path = "c:\Users\PABLO\OneDrive\Desktop\PROYECTO EL CONDOR\subir github\calculadora_elcondor.html"
$lines = [System.IO.File]::ReadAllLines($path, [System.Text.Encoding]::UTF8)

# Instead of relying on string parsing, replace by index
$lines[1402] = '                list.push(` ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCi")) + ' 3m Caño de Cobre (${window.lastHvacPipes})`);'
$lines[1403] = '                list.push(` ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCi")) + ' 2u Fundas aislantes (una p/ cada caño)`);'
$lines[1404] = '                list.push(` ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCi")) + ' 4m Cable TPR 5x1.5mm (Interconexión)`);'
$lines[1405] = '                list.push(` ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCi")) + ' 4u Tacos antivibratorios de goma (p/ pie de unidad ext.)`);'
$lines[1406] = '                list.push(` ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCi")) + ' 3m Manguera cristal de drenaje`);'
$lines[1407] = '                list.push(` ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCi")) + ' 1u Cinta de PVC para terminación`);'

$lines[1410] = '                    list.push(`\n-- CANALIZACIÓN ESTÉTICA (${window.lastHvacCCDesc}) --`);'
$lines[1412] = '                    list.push(` ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCi")) + ' Codos, uniones y terminales originales del sistema`);'
$lines[1416] = '                    list.push(`\n-- EXTRAS DE ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("Q0HDkUVSw41B")) + ' (${window.lastHvacMtExtra} metros) --`);'
$lines[1417] = '                    list.push(` ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCi")) + ' ${window.lastHvacMtExtra}m Caño de cobre extra`);'
$lines[1418] = '                    list.push(` ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCi")) + ' ${window.lastHvacMtExtra}m Aislación y cable extra`);'

$lines[1466] = '            t += list.map(item => item.startsWith(''-'') ? item : ` ' + [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("4oCi")) + ' ${item}`).join(''\n'');'

[System.IO.File]::WriteAllLines($path, $lines, [System.Text.Encoding]::UTF8)
Write-Host "Success Bullets"
