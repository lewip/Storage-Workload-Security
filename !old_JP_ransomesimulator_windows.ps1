#データコレクタを停止してください
#下記 create files コマンドを実施する前に、必ずデータコレクタを止めてください

#create files
#ダミーファイルを作成します
$files="\\xxx.xxx.xxx.xxx\xxx\"
$i = 1
while ($i -le 5000) {
add-content -path $files$i.txt -value "ransom test"
$i++
}

#START DSC
#データコレクタを開始してください

#run Ransomware simulator
#下記　ランサム攻撃のシミューレーションテストを実施します
 
Write-Host ""
Write-Host "Simulating Ransom attack..."
Write-Host ""
$i = 1
while ($i -le 500) {
Invoke-Item -path $files$i.txt
Stop-Process -Force -Name "notepad"
add-content -path $files$i.txt -value "ransome"
Rename-Item -Path $files$i.txt -NewName "$i.txt.lol"
$i++
}
