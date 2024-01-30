# OneUI Optimizer GUI by Haridhayal

Write-Host "" 
clear

If ( Test-Path $HOME\ADB\adb.exe ) {
            Write-Host "Adb is Installed"} else {
            Write-Host " "
            Write-Host "ADB is NOT Installed Systemwide" -ForegroundColor Red
            Write-Host " "
            Write-Host "Downloading script from https://github.com/haridhayal11/Systemwide_ADB_Installer to Install ADB Systemwide..."
            Start-Sleep 5
            Write-Host " "
            Start-Process powershell.exe -Verb RunAs -ArgumentList "-command iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/haridhayal11/Systemwide_ADB_Installer/main/systemwide_adb.ps1')) | Out-Host" -WindowStyle Normal
            Write-Host " "
            Write-Host " "
            Write-Host "Powershell will be closed in 5 seconds. Reopen it and run OneUI Optimizer"
            Write-Host " "
            Start-Sleep 5
            Exit
        }

$inputXML = (new-object Net.WebClient).DownloadString("https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/UI.xaml")

$inputXML = $inputXML -replace 'mc:Ignorable="d"', '' -replace "x:N", 'N' -replace '^<Win.*', '<Window'
[void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
[xml]$XAML = $inputXML
 
$reader = (New-Object System.Xml.XmlNodeReader $xaml) 
try { $Form = [Windows.Markup.XamlReader]::Load( $reader ) }
catch [System.Management.Automation.MethodInvocationException] {
    Write-Warning "XAML error..."
    write-host $error[0].Exception.Message -ForegroundColor Red
}

 
$xaml.SelectNodes("//*[@Name]") | ForEach-Object { Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name) }


 Function Get-FormVariables {   
    write-host " "
    Write-Host "     ____             _    _ _____    ____        _   _           _               "
    Write-Host "    / __ \           | |  | |_   _|  / __ \      | | (_)         (_)              "
    Write-Host "   | |  | |_ __   ___| |  | | | |   | |  | |_ __ | |_ _ _ __ ___  _ _______ _ __  "
    Write-Host "   | |  | | '_ \ / _ \ |  | | | |   | |  | | '_ \| __| | '_ ` _ \| |_  / _ \ '__| "
    Write-Host "   | |__| | | | |  __/ |__| |_| |_  | |__| | |_) | |_| | | | | | | |/ /  __/ |    "
    Write-Host "    \____/|_| |_|\___|\____/|_____|  \____/| .__/ \__|_|_| |_| |_|_/___\___|_|    "
    Write-Host "                                           | |                                    "
    Write-Host "                                           |_|                                    "
    Write-Host " 										      "
    Write-Host "	     __          __ __         _    ____                  ________ "
    Write-Host "	    / /  __ __  / // /__ _____(_)__/ / /  ___ ___ _____ _/ <  <  / "
    Write-Host "	   / _ \/ // / / _  / _ `/ __/ / _  / _ \/ _ `/ // / _ `/ // // /  "
    Write-Host "	  /_.__/\_, / /_//_/\_,_/_/ /_/\_,_/_//_/\_,_/\_, /\_,_/_//_//_/   "
    Write-Host "	       /___/                                 /___/                 "
    Write-Host "	 								   "
    Write-Host "  				For OneUI 3.x/4.x/5.x  "
    write-host " "                           
}

cd $HOME
Remove-Item -Force -Recurse Temp_OneUIOptimizer_test
mkdir -p Temp_OneUIOptimizer_test
cd Temp_OneUIOptimizer_test

irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/Bixby.txt" -OutFile Bixby.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/CameraAR.txt" -OutFile CameraAR.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/Dex.txt" -OutFile Dex.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/DigitalWellbeing.txt" -OutFile DigitalWellbeing.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/EmergencyMode.txt" -OutFile EmergencyMode.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/Facebook.txt" -OutFile Facebook.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/GLocation.txt" -OutFile GLocation.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/GMessages.txt" -OutFile GMessages.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/GSync.txt" -OutFile GSync.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/GTTS.txt" -OutFile GTTS.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/GalaxyStore.txt" -OutFile GalaxyStore.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/Getc.txt" -OutFile Getc.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/Knox.txt" -OutFile Knox.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/Microsoft.txt" -OutFile Microsoft.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/Netflix.txt" -OutFile Netflix.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/Routines.txt" -OutFile Routines.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/SCloud.txt" -OutFile SCloud.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/SOther.txt" -OutFile SOther.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/SWeather.txt" -OutFile SWeather.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/Themes.txt" -OutFile Themes.txt
irm "https://raw.githubusercontent.com/haridhayal11/OneUIOptimizer_GUI/test/Tweaks.txt" -OutFile Tweaks.txt


clear

Write-Host 'Authorize PC on phone if running adb for the first time'
Start-Sleep 1
adb devices

Get-FormVariables

$AppTitle = "OneUI Optimizer"

###########
# DEBLOAT #
###########

$WPFapply.Add_Click({
        $bloatsel = New-Object System.Collections.Generic.List[System.Object]

        # Samsung Apps
        If ( $WPFDex.IsChecked -eq $true ) { 
	        $Dex = get-content Dex.txt
	        foreach ($bloat in $Dex){
                $bloatsel.Add($bloat)               
                $WPFDex.IsChecked = $false 
	        }
        }

        If ( $WPFCameraAR.IsChecked -eq $true ) { 
	        $CameraAR = get-content CameraAR.txt
	        foreach ($bloat in $CameraAR){
                $bloatsel.Add($bloat)
                $WPFCameraAR.IsChecked = $false 
	        }
        }
        
        If ( $WPFDigitalWellbeing.IsChecked -eq $true ) { 
	        $DigitalWellbeing = get-content DigitalWellbeing.txt
	        foreach ($bloat in $DigitalWellbeing){
                $bloatsel.Add($bloat)
                $WPFDigitalWellbeing.IsChecked = $false 
	        }
        } 
        If ( $WPFEmergencyMode.IsChecked -eq $true ) { 
	        $EmergencyMode = get-content EmergencyMode.txt
	        foreach ($bloat in $EmergencyMode){
                $bloatsel.Add($bloat)
                $WPFEmergencyMode.IsChecked = $false 
	        }
        }           

        If ( $WPFGalaxyStore.IsChecked -eq $true ) { 
	        $GalaxyStore = get-content GalaxyStore.txt
	        foreach ($bloat in $GalaxyStore){
                $bloatsel.Add($bloat)
                $WPFGalaxyStore.IsChecked = $false 
	        }
        }           

        If ( $WPFKnox.IsChecked -eq $true ) { 
	        $Knox = get-content Knox.txt
	        foreach ($bloat in $Knox){
                $bloatsel.Add($bloat)
                $WPFKnox.IsChecked = $false 
	        }
        }

        If ( $WPFBixby.IsChecked -eq $true ) { 
	        $Bixby = get-content Bixby.txt
	        foreach ($bloat in $Bixby){
                $bloatsel.Add($bloat)
                $WPFBixby.IsChecked = $false 
	        }
        }

        If ( $WPFRoutines.IsChecked -eq $true ) { 
	        $Routines = get-content Routines.txt
	        foreach ($bloat in $Routines){
                $bloatsel.Add($bloat)
                $WPFRoutines.IsChecked = $false 
	        }
        }    

        If ( $WPFSCloud.IsChecked -eq $true ) { 
	        $SCloud = get-content SCloud.txt
	        foreach ($bloat in $SCloud){
                $bloatsel.Add($bloat)
                $WPFSCloud.IsChecked = $false 
	        }
        }

        If ( $WPFThemes.IsChecked -eq $true ) { 
	        $Themes = get-content Themes.txt
	        foreach ($bloat in $Themes){
                $bloatsel.Add($bloat)
                $WPFThemes.IsChecked = $false 
	        }
        }

        If ( $WPFSWeather.IsChecked -eq $true ) { 
	        $SWeather = get-content SWeather.txt
	        foreach ($bloat in $SWeather){
                $bloatsel.Add($bloat)
                $WPFSWeather.IsChecked = $false 
	        }
        }

        If ( $WPFSOther.IsChecked -eq $true ) { 
	        $SOther = get-content SOther.txt
	        foreach ($bloat in $SOther){
                $bloatsel.Add($bloat)
                $WPFSOther.IsChecked = $false 
	        }
        }

        # Google
        If ( $WPFGSync.IsChecked -eq $true ) { 
	        $GSync = get-content GSync.txt
	        foreach ($bloat in $GSync){
                $bloatsel.Add($bloat)
                $WPFGSync.IsChecked = $false 
	        }
        }

        If ( $WPFGMessages.IsChecked -eq $true ) { 
	        $GMessages = get-content GMessages.txt
	        foreach ($bloat in $GMessages){
                $bloatsel.Add($bloat)
                $WPFGMessages.IsChecked = $false 
	        }
        }        

        If ( $WPFGTTS.IsChecked -eq $true ) { 
	        $GTTS = get-content GTTS.txt
	        foreach ($bloat in $GTTS){
                $bloatsel.Add($bloat)
                $WPFGTTS.IsChecked = $false 
	        }
        }

        If ( $WPFGLocation.IsChecked -eq $true ) { 
	        $GLocation = get-content GLocation.txt
	        foreach ($bloat in $GLocation){
                $bloatsel.Add($bloat)
                $WPFGLocation.IsChecked = $false 
	        }
        }

        If ( $WPFGetc.IsChecked -eq $true ) { 
	        $Getc = get-content Getc.txt
	        foreach ($bloat in $Getc){
                $bloatsel.Add($bloat)
                $WPFGetc.IsChecked = $false 
	        }
        }

        # Third-party

        If ( $WPFFacebook.IsChecked -eq $true ) { 
	        $Facebook = get-content Facebook.txt
	        foreach ($bloat in $Facebook){
                $bloatsel.Add($bloat)
                $WPFFacebook.IsChecked = $false 
	        }
        }

        If ( $WPFMicrosoft.IsChecked -eq $true ) { 
	        $Microsoft = get-content Microsoft.txt
	        foreach ($bloat in $Microsoft){
                $bloatsel.Add($bloat)
                $WPFMicrosoft.IsChecked = $false 
	        }
        }

         If ( $WPFNetflix.IsChecked -eq $true ) { 
	        $Netflix= get-content Netflix.txt
	        foreach ($bloat in $Netflix){
                $bloatsel.Add($bloat)
                $WPFNetflix.IsChecked = $false 
	        }
        }

         If ( $WPFTweaks.IsChecked -eq $true ) { 
	        $Tweaks= get-content Tweaks.txt
	        foreach ($tweak in $Tweaks){
                #$tweaksel.Add($tweak)
                #$tweaksel.ToArray()
                # Define Output variable
                #$cmdStatus = New-Object System.Collections.Generic.List[System.Object]
                #foreach ( $node in $tweaksel ) {
                 #   try {
                        #Start-Process powershell.exe -ArgumentList "-command adb shell $node | Out-Host" -Wait -WindowStyle Minimized
                        adb shell $tweak
                        #$cmdStatus.Add("$tweaks`n")
                  #  }
                  #  catch {
                  #     Write-Error $_.Exception
                  #  }
                #}
                #$cmdStatus.ToArray()
                #$cmdStatus | % { $_ } | Out-Host

                $WPFTweaks.IsChecked = $false 

	        }
        }

        if ($bloatsel.Count -eq 0) {
            $WarningMsg = "Please select the apps to debloat"
            [System.Windows.MessageBox]::Show($WarningMsg, $AppTitle, [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Warning)
            return
        }

        $bloatsel.ToArray()
        $cmdStatus = New-Object System.Collections.Generic.List[System.Object]
        Write-Host "Debloating..."      
        foreach ( $node in $bloatsel ) {
            try {
                    Start-Process powershell.exe -ArgumentList "-command adb shell pm uninstall --user 0  $node | Out-Host" -Wait -WindowStyle Minimized
                    $cmdStatus.Add("$node`n")                             
            }
            catch {
                Write-Error $_.Exception
            }
        }
            $cmdStatus.ToArray()
            $cmdStatus | % { $_ } | Out-Host        
            Write-Host "Completed" 
    })

###########
# RESTORE #
###########

$WPFrestore.Add_Click({
        $bloatsel = New-Object System.Collections.Generic.List[System.Object]

        # Samsung Apps
        If ( $WPFDex.IsChecked -eq $true ) { 
	        $Dex = get-content Dex.txt
	        foreach ($bloat in $Dex){
                $bloatsel.Add($bloat)
                $WPFDex.IsChecked = $false 
	        }
        }

        If ( $WPFCameraAR.IsChecked -eq $true ) { 
	        $CameraAR = get-content CameraAR.txt
	        foreach ($bloat in $CameraAR){
                $bloatsel.Add($bloat)
                $WPFCameraAR.IsChecked = $false 
	        }
        }
        
        If ( $WPFDigitalWellbeing.IsChecked -eq $true ) { 
	        $DigitalWellbeing = get-content DigitalWellbeing.txt
	        foreach ($bloat in $DigitalWellbeing){
                $bloatsel.Add($bloat)
                $WPFDigitalWellbeing.IsChecked = $false 
	        }
        } 
        If ( $WPFEmergencyMode.IsChecked -eq $true ) { 
	        $EmergencyMode = get-content EmergencyMode.txt
	        foreach ($bloat in $EmergencyMode){
                $bloatsel.Add($bloat)
                $WPFEmergencyMode.IsChecked = $false 
	        }
        }           

        If ( $WPFGalaxyStore.IsChecked -eq $true ) { 
	        $GalaxyStore = get-content GalaxyStore.txt
	        foreach ($bloat in $GalaxyStore){
                $bloatsel.Add($bloat)
                $WPFGalaxyStore.IsChecked = $false 
	        }
        }           

        If ( $WPFKnox.IsChecked -eq $true ) { 
	        $Knox = get-content Knox.txt
	        foreach ($bloat in $Knox){
                $bloatsel.Add($bloat)
                $WPFKnox.IsChecked = $false 
	        }
        }

        If ( $WPFBixby.IsChecked -eq $true ) { 
	        $Bixby = get-content Bixby.txt
	        foreach ($bloat in $Bixby){
                $bloatsel.Add($bloat)
                $WPFBixby.IsChecked = $false 
	        }
        }

        If ( $WPFRoutines.IsChecked -eq $true ) { 
	        $Routines = get-content Routines.txt
	        foreach ($bloat in $Routines){
                $bloatsel.Add($bloat)
                $WPFRoutines.IsChecked = $false 
	        }
        }    

        If ( $WPFSCloud.IsChecked -eq $true ) { 
	        $SCloud = get-content SCloud.txt
	        foreach ($bloat in $SCloud){
                $bloatsel.Add($bloat)
                $WPFSCloud.IsChecked = $false 
	        }
        }

        If ( $WPFThemes.IsChecked -eq $true ) { 
	        $Themes = get-content Themes.txt
	        foreach ($bloat in $Themes){
                $bloatsel.Add($bloat)
                $WPFThemes.IsChecked = $false 
	        }
        }

        If ( $WPFSWeather.IsChecked -eq $true ) { 
	        $SWeather = get-content SWeather.txt
	        foreach ($bloat in $SWeather){
                $bloatsel.Add($bloat)
                $WPFSWeather.IsChecked = $false 
	        }
        }

        If ( $WPFSOther.IsChecked -eq $true ) { 
	        $SOther = get-content SOther.txt
	        foreach ($bloat in $SOther){
                $bloatsel.Add($bloat)
                $WPFSOther.IsChecked = $false 
	        }
        }

        # Google
        If ( $WPFGSync.IsChecked -eq $true ) { 
	        $GSync = get-content GSync.txt
	        foreach ($bloat in $GSync){
                $bloatsel.Add($bloat)
                $WPFGSync.IsChecked = $false 
	        }
        }

        If ( $WPFGMessages.IsChecked -eq $true ) { 
	        $GMessages = get-content GMessages.txt
	        foreach ($bloat in $GMessages){
                $bloatsel.Add($bloat)
                $WPFGMessages.IsChecked = $false 
	        }
        }        

        If ( $WPFGTTS.IsChecked -eq $true ) { 
	        $GTTS = get-content GTTS.txt
	        foreach ($bloat in $GTTS){
                $bloatsel.Add($bloat)
                $WPFGTTS.IsChecked = $false 
	        }
        }

        If ( $WPFGLocation.IsChecked -eq $true ) { 
	        $GLocation = get-content GLocation.txt
	        foreach ($bloat in $GLocation){
                $bloatsel.Add($bloat)
                $WPFGLocation.IsChecked = $false 
	        }
        }

        If ( $WPFGetc.IsChecked -eq $true ) { 
	        $Getc = get-content Getc.txt
	        foreach ($bloat in $Getc){
                $bloatsel.Add($bloat)
                $WPFGetc.IsChecked = $false 
	        }
        }

        # Third-party

        If ( $WPFFacebook.IsChecked -eq $true ) { 
	        $Facebook = get-content Facebook.txt
	        foreach ($bloat in $Facebook){
                $bloatsel.Add($bloat)
                $WPFFacebook.IsChecked = $false 
	        }
        }

        If ( $WPFMicrosoft.IsChecked -eq $true ) { 
	        $Microsoft = get-content Microsoft.txt
	        foreach ($bloat in $Microsoft){
                $bloatsel.Add($bloat)
                $WPFMicrosoft.IsChecked = $false 
	        }
        }

         If ( $WPFNetflix.IsChecked -eq $true ) { 
	        $Netflix= get-content Netflix.txt
	        foreach ($bloat in $Netflix){
                $bloatsel.Add($bloat)
                $WPFNetflix.IsChecked = $false 
	        }
        }

        #  If ( $WPFTweaks.IsChecked -eq $true ) { 
	    #     $Tweaks= get-content Tweaks.txt
	    #     foreach ($bloat in $Tweaks){
        #         $bloatsel.Add($bloat)
        #         Write-Host "Completed"
        #         $WPFTweaks.IsChecked = $false 
	    #     }
        # }

        if ($bloatsel.Count -eq 0) {
            $WarningMsg = "Please select the apps to restore"
            [System.Windows.MessageBox]::Show($WarningMsg, $AppTitle, [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Warning)
            return
        }
              
        $bloatsel.ToArray()
        $cmdStatus = New-Object System.Collections.Generic.List[System.Object]
        Write-Host "Restoring..."        
        foreach ( $node in $bloatsel ) {
            try {
                    Start-Process powershell.exe -ArgumentList "-command adb shell cmd package install-existing $node | Out-Host" -Wait -WindowStyle Minimized
                    $cmdStatus.Add("$node`n")                             
            }
            catch {
                Write-Error $_.Exception
            }
        }
            $cmdStatus.ToArray()
            $cmdStatus | % { $_ } | Out-Host        
            Write-Host "Completed" 
    })

$WPFselall.Add_Click({

        $WPFDex.IsChecked = $true
        $WPFCameraAR.IsChecked = $true
        $WPFDigitalWellbeing.IsChecked = $true
        $WPFEmergencyMode.IsChecked = $true
        $WPFGalaxyStore.IsChecked = $true
        $WPFKnox.IsChecked = $true
        $WPFBixby.IsChecked = $true
        $WPFRoutines.IsChecked = $true
        $WPFSCloud.IsChecked = $true
        $WPFThemes.IsChecked = $true
        $WPFSWeather.IsChecked = $true
        $WPFSOther.IsChecked = $true
        $WPFGSync.IsChecked = $true
        $WPFGMessages.IsChecked = $true        
        $WPFGTTS.IsChecked = $true
        $WPFGLocation.IsChecked = $true
        $WPFGetc.IsChecked = $true
        $WPFFacebook.IsChecked = $true
        $WPFMicrosoft.IsChecked = $true
        $WPFNetflix.IsChecked = $true
        $WPFTweaks.IsChecked = $true       
                
    })

$WPFdeselall.Add_Click({

        $WPFDex.IsChecked = $false
        $WPFCameraAR.IsChecked = $false
        $WPFDigitalWellbeing.IsChecked = $false
        $WPFEmergencyMode.IsChecked = $false    
        $WPFGalaxyStore.IsChecked = $false
        $WPFKnox.IsChecked = $false
        $WPFBixby.IsChecked = $false
        $WPFRoutines.IsChecked = $false
        $WPFSCloud.IsChecked = $false
        $WPFThemes.IsChecked = $false
        $WPFSWeather.IsChecked = $false
        $WPFSOther.IsChecked = $false
        $WPFGSync.IsChecked = $false
        $WPFGMessages.IsChecked = $false        
        $WPFGTTS.IsChecked = $false
        $WPFGLocation.IsChecked = $false
        $WPFGetc.IsChecked = $false
        $WPFFacebook.IsChecked = $false
        $WPFMicrosoft.IsChecked = $false
        $WPFNetflix.IsChecked = $false
        $WPFTweaks.IsChecked = $false  
    })

##  Add to powersaving (WIP)
#  adb shell pm list packages -3 | foreach-object { $_ -replace 'package:','' } | out-file userapps.txt
#  get-content userapps.txt | foreach-object {adb shell * $_ }

$Form.ShowDialog() | out-null
