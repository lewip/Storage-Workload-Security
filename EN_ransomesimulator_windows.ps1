#STOP ONTAP DataCollector
#Before you run below create files command, please ensure that ONTAP DataCollector is stopped

#create files
#create 5000 dummy .txt files
$files="\\IP_address\share_name\"
while ($i -le 5000) {
add-content -path $files$i.txt -value "ransomware simulation test"
$i++
}

#START ONTAP DataCollector

#run Ransomware simulator
#Before you run the simulator, open a file to see if the activity is recorded on CloudSecure
Write-Host ""
Write-Host "Simulating Ransom attack..."
Write-Host ""
$i = 1
while ($i -le 5000) {
Invoke-Item -path $files$i.txt
Stop-Process -Force -Name "notepad"
add-content -path $files$i.txt -value "adding more contents"
Rename-Item -Path $files$i.txt -NewName "$i.txt.lock"
$i++
}
