#データコレクタを停止してください
#下記 create files コマンドを実施する前に、必ずデータコレクタを止めてください

#create files
#ダミーファイルを作成します
#$files="\\xxx.xxx.xxx.xxx\xxx\"
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
Write-Host "Simulating ransomware..."
Write-Host ""
$i = 1

while ($i -le 6000) {
Invoke-Item -path $files$i.txt
Stop-Process -Force -Name "notepad"
$ransomware = ""
foreach ($n in 1..$(Get-Random -min 1024 -max 71680)) {
  $ransomware=$ransomware+$(Get-Random -input 0,1,2,3,4,5,6,7,8,9,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z)
}
add-content -path $files$i.txt -value $ransomware
Rename-Item -Path $files$i.txt -NewName "$i.txt.locky"
$i++
}
Write-Host ""
Write-Host "--- Process complete ---"
Write-Host ""
Write-Host ""
$dummy = Read-Host "Press any key to close window..."
