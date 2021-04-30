# $jsonRaw = Get-Content ".\storageParameters.json" | Out-String | ConvertFrom-Json 
# $jsonParams = ($jsonRaw | ConvertTo-Json -Depth 30 -Compress).Replace('"', '\"') 


# Write-Host $jsonParams
$rg = "arm-test"

az group create -n $rg --location "uksouth"

New-AzResourceGroupDeployment -ResourceGroup $rg -TemplateFile ".\storage.json" -TemplateParameterFile ".\storageParameters.json"
#New-AzResourceGroupDeployment -ResourceGroup $rg -TemplateFile ".\main.json"
# az deployment group create -g $rg --template-file ".\storage.json" --parameters $jsonParams -n "dep-test" --confirm-with-what-if --what-if-result-format FullResourcePayloads