$certPFXFileName="C:\PADCustomAction\PADCustomActionCert.pfx";
$certCERFileName="C:\PADCustomAction\PADCustomActionCert.cer";
$certStoreLocation="Cert:\LocalMachine\AuthRoot";
$certname = "PADCustomActionSelfSignCert"
$cert = New-SelfSignedCertificate -CertStoreLocation Cert:\CurrentUser\My -Type CodeSigningCert  -Subject "CN=$certname" -KeyExportPolicy Exportable -KeySpec Signature -KeyLength 2048 -KeyAlgorithm RSA -HashAlgorithm SHA256
$mypwd = ConvertTo-SecureString -String <YOUR CERT PASSWORD GOES HERE> -Force -AsPlainText
$certPFXFile = Export-PfxCertificate -Cert $cert -FilePath $certPFXFileName -Password $mypwd
$certCERFile = Export-Certificate -Cert $cert -FilePath $certCERFileName -Type CERT -Verbose -Force