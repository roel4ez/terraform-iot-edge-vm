$msiPath = $([io.Path]::Combine($env:TEMP, 'AzureIoTEdge.msi'))
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest "https://aka.ms/AzEFLOWMSI-CR-X64" -OutFile $msiPath

Start-Process -Wait msiexec -ArgumentList "/i","$([io.Path]::Combine($env:TEMP, 'AzureIoTEdge.msi'))","/qn"

Deploy-Eflow -acceptEula Yes -acceptOptionalTelemetry Yes

Provision-EflowVm -provisioningType ManualConnectionString -devConnString <REPLACE_WITH_CONNECTION_STRING>