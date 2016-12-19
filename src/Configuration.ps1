$protocol = "https";
$hostName = "bpmdev";
$port = "9443";
$endpoint = "${protocol}://${hostName}:${port}/rest/bpm/wle/v1";
$username = "bpmadmin";
$password = ConvertTo-SecureString “bpmdev” -AsPlainText -Force

$credential = New-Object System.Management.Automation.PSCredential ($username,  $password)



add-type @"
using System.Net;
using System.Security.Cryptography.X509Certificates;
public class TrustAllCertsPolicy : ICertificatePolicy {
    public bool CheckValidationResult(
        ServicePoint srvPoint, X509Certificate certificate,
        WebRequest request, int certificateProblem) {
        return true;
    }
}
"@

[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
$AllProtocols = [System.Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12'
[System.Net.ServicePointManager]::SecurityProtocol = $AllProtocols
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}


