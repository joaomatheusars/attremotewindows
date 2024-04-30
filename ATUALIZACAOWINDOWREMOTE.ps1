$sala1 = Get-Content ""
$sala2 = Get-Content ""
$terreo = Get-Content ""
$analista = Get-Content ""

while($true){
    cls
    Write-Output "Atualização de Sistema Operacional.`n`n"
    $s = Read-Host -Prompt "Escolha qual sala deseja atualizar `n1 - Sala1`n2 - Sala2`n3 - Terreo`n4 - Analista`n"
    cls
    $i = 0
    switch($s){
        
        1{ 
            foreach($c in $sala1){
                Write-Output "$i - $c" 
                $i++
            }
            $com = Read-Host -Prompt "`nEscolha quais maquinas deseja atualizar (EX: FBDKT000,FBDKT001)"
            $att = $com.Split(',')
            $cred = get-credential Empresa\administrator
            foreach($c in $att){
                Invoke-Command -ComputerName $c  -Credential $cred -ScriptBlock{
                    Install-Module -Name PSWindowsUpdate -Force
                    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
                    Invoke-WuJob -ComputerName $hostname -Script{
                        New-Item -Path 'C:\ATT_WINDOWS\LOG' -ItemType Directory
                        ipmo PSWindowsUpdate; Install-WindowsUpdate -AcceptAll -IgnoreReboot | 
                        Out-File c:\ATT_WINDOWS\LOG\LOG.log
                    } -RunNow -Confirm:$false -Verbose -ErrorAction Ignore     
                }
            }
            cls
            sleep 60
            $s = "s"
            while($s -eq "s"){
                $s = Read-Host -Prompt "Deseja acompanhar o progresso [s\n]?"
                cls
                if ($s -eq "s"){
                    foreach($c in $att){
                        Write-Output "`n-------------- $c --------------"
                        Invoke-Command -ComputerName $c -ScriptBlock{
                            type C:\ATT_WINDOWS\LOG\LOG.log
                        }
                    }
                }

                if ($s -eq "n"){
                    $s = "n"
                }
            }                        
         }
            
        

        2{
            foreach($c in $sala2){
                    Write-Output "$i - $c" 
                    $i++
            }
            $com = Read-Host -Prompt "`nEscolha quais maquinas deseja atualizar (EX: FBDKT000,FBDKT001)"
            $att = $com.Split(',')
            $cred = get-credential Flexdoc\administrator
            foreach($c in $att){
                Invoke-Command -ComputerName $c  -Credential $cred -ScriptBlock{
                    Install-Module -Name PSWindowsUpdate -Force
                    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
                    Invoke-WuJob -ComputerName $hostname -Script{
                        New-Item -Path 'C:\ATT_WINDOWS\LOG' -ItemType Directory
                        ipmo PSWindowsUpdate; Install-WindowsUpdate -AcceptAll -IgnoreReboot | 
                        Out-File c:\ATT_WINDOWS\LOG\LOG.log
                    } -RunNow -Confirm:$false -Verbose -ErrorAction Ignore     
                }
            }
            cls
            sleep 60
            $s = "s"
            while($s -eq "s"){
                $s = Read-Host -Prompt "Deseja acompanhar o progresso [s\n]?"
                cls
                if ($s -eq "s"){
                    foreach($c in $att){
                        Write-Output "`n-------------- $c --------------"
                        Invoke-Command -ComputerName $c -ScriptBlock{
                            type C:\ATT_WINDOWS\LOG\LOG.log
                        }
                    }
                }

                if ($s -eq "n"){
                    $s = "n"
                }
            }            
        }

        3{foreach($c in $terreo){
                Write-Output "$i - $c"
                $i++
            }            
        }

        4{
           foreach($c in $analista){
                Write-Output "$i - $c" 
                $i++
            }
            $com = Read-Host -Prompt "`nEscolha quais maquinas deseja atualizar (EX: FBDKT000,FBDKT001)"
            $att = $com.Split(',')
            $cred = get-credential Flexdoc\administrator
            foreach($c in $att){
                Invoke-Command -ComputerName $c  -Credential $cred -ScriptBlock{
                    Install-Module -Name PSWindowsUpdate -Force
                    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
                    Invoke-WuJob -ComputerName $hostname -Script{
                        New-Item -Path 'C:\ATT_WINDOWS\LOG' -ItemType Directory
                        ipmo PSWindowsUpdate; Install-WindowsUpdate -AcceptAll -IgnoreReboot | 
                        Out-File c:\ATT_WINDOWS\LOG\LOG.log
                    } -RunNow -Confirm:$false -Verbose -ErrorAction Ignore     
                }
            }
            cls
            sleep 60
            $s = "s"
            while($s -eq "s"){
                $s = Read-Host -Prompt "Deseja acompanhar o progresso [s\n]?"
                cls
                if ($s -eq "s"){
                    foreach($c in $att){
                        Write-Output "`n-------------- $c --------------"
                        Invoke-Command -ComputerName $c -ScriptBlock{
                            type C:\ATT_WINDOWS\LOG\LOG.log
                        }
                    }
                }

                if ($s -eq "n"){
                    $s = "n"
                }
            }          
        }
    }  
}