#!/bin/bash

##Database Details
dbhost='185.61.137.168';
dbuser='cybertea_old';
dbpass='jan022011';
dbname='cybertea_old';
dbport='3306';

ln -fs /usr/share/zoneinfo/Asia/Manila /etc/localtime

install () {
#install
yum install epel-release -y
yum update -y
yum install -y httpd nano squid
yum install -y mysql-server epel-release
yum install -y openvpn sudo curl 
yum install vixie-cron crontabs httpd git zip unzip epel-release -y
yum install php php-pdo php-mysqli php-mysql php-gd php-mbstring.x86_64 -y
yum install php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-snmp php-soap curl curl-devel -y

openssl dhparam -out /etc/openvpn/dh2048.pem 2048;

#CreatingFOlders
mkdir /usr/sbin/kpn
mkdir /etc/openvpn/script
mkdir /etc/openvpn/log
mkdir /etc/openvpn/keys
mkdir /var/www/html/status
touch /var/www/html/status/status.txt

#CreatingFiles
cat << EOF > /etc/openvpn/keys/ca.crt
-----BEGIN CERTIFICATE-----
MIIExDCCA6ygAwIBAgIJAKyvksf/QCcwMA0GCSqGSIb3DQEBCwUAMIGcMQswCQYD
VQQGEwJVUzELMAkGA1UECBMCUEgxEDAOBgNVBAcTB01heW5pbGExDjAMBgNVBAoT
BVRvbmRvMRQwEgYDVQQLEwtQaW5veUdyb3VuZDERMA8GA1UEAxMIVG9uZG8gQ0Ex
DzANBgNVBCkTBnNlcnZlcjEkMCIGCSqGSIb3DQEJARYVcGlub3lncm91bmRAZ21h
aWwuY29tMB4XDTE3MDYxNzEwMjMxM1oXDTI3MDYxNTEwMjMxM1owgZwxCzAJBgNV
BAYTAlVTMQswCQYDVQQIEwJQSDEQMA4GA1UEBxMHTWF5bmlsYTEOMAwGA1UEChMF
VG9uZG8xFDASBgNVBAsTC1Bpbm95R3JvdW5kMREwDwYDVQQDEwhUb25kbyBDQTEP
MA0GA1UEKRMGc2VydmVyMSQwIgYJKoZIhvcNAQkBFhVwaW5veWdyb3VuZEBnbWFp
bC5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCrfMyxOcaPROlq
TOrRfwixx/5vMdSyDh1b9j9zE/BDaWF1UtkZORXjI5YCdQNsk+86qHxVamZmC6jm
Tq5sC0XrZr725/qFANvj13rw7Bt3q+/Q5lCt5zwpuaSOem6YIlvqzBYbteShEaX8
h7ppL+bk6i+S9MOX5bc+m8zt0DwrLbC6tqBvC+1Btj8kvnhtoXI+uQoUxRa6PbsK
DcdW1iyjcjG+ARWKEXMSOjxL3RtWfoG6sRL4mkALNH/ghejvtXjYYeU3hUDyWGGy
QWux3WzreVYnoXyozEijwGPCCLdZ+Sdn8F4D7yXoPKsLxfqFvtt76zFVajNpszsX
cKbiBB5JAgMBAAGjggEFMIIBATAdBgNVHQ4EFgQUAvGhH/Tis+YRCGKQLUKaMcCE
hsgwgdEGA1UdIwSByTCBxoAUAvGhH/Tis+YRCGKQLUKaMcCEhsihgaKkgZ8wgZwx
CzAJBgNVBAYTAlVTMQswCQYDVQQIEwJQSDEQMA4GA1UEBxMHTWF5bmlsYTEOMAwG
A1UEChMFVG9uZG8xFDASBgNVBAsTC1Bpbm95R3JvdW5kMREwDwYDVQQDEwhUb25k
byBDQTEPMA0GA1UEKRMGc2VydmVyMSQwIgYJKoZIhvcNAQkBFhVwaW5veWdyb3Vu
ZEBnbWFpbC5jb22CCQCsr5LH/0AnMDAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEB
CwUAA4IBAQCa5JUgtw6j3poZEug6cV9Z/ndYqxvYkoOLNCaMG1xZYBch061qjqB1
8TvAqBpp4zF6w0i4P4Mwh1p+bUgOV04p7HB6aUMm14ALwn+hHhWlkVQ5bPqVEr9B
L8/xjcbBVGj1lgv6UCjzmx1Aq+VBlvy0wU1NQT3QuQXSIpEvGMAn3ApsNMmQQ8CW
hYWYMFbAcjF9vWi+FKoDtWQ6SyHvgcpkOuqWs4p9AEwI6WS1IpJPRiHIPYwAzA3u
824ER9Gn4OKoBLqVyhQvW3etMjMc/baWd6p0K06NSCwZsjchD+ayf5SjfUfhYTTM
llJ5x8d1nZT7CWpogTTvqDdK6iiKPb/+
-----END CERTIFICATE-----
EOF

cat << EOF > /etc/openvpn/keys/server.crt
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number: 1 (0x1)
    Signature Algorithm: sha256WithRSAEncryption
        Issuer: C=US, ST=PH, L=Maynila, O=Tondo, OU=PinoyGround, CN=Tondo CA/name=server/emailAddress=pinoyground@gmail.com
        Validity
            Not Before: Jun 17 10:23:30 2017 GMT
            Not After : Jun 15 10:23:30 2027 GMT
        Subject: C=US, ST=PH, L=Maynila, O=Tondo, OU=PinoyGround, CN=server/name=server/emailAddress=pinoyground@gmail.com
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                Public-Key: (2048 bit)
                Modulus:
                    00:e2:78:00:40:ca:de:85:d3:2d:63:54:cc:3c:49:
                    72:98:a9:76:bd:1b:62:95:aa:36:1f:eb:b6:86:4b:
                    da:a9:c0:50:7b:c0:bf:3f:6f:d4:38:32:b9:ad:33:
                    b8:13:fb:6b:b8:41:c1:98:05:ac:3e:49:64:3e:1b:
                    9f:8f:07:b8:b5:b6:7c:86:59:be:a3:93:31:8c:b7:
                    77:b8:50:a4:b1:19:3b:34:a9:21:4a:a6:25:83:48:
                    60:cb:0d:1f:13:5b:d5:af:eb:2a:1d:55:41:8d:76:
                    c5:05:0d:98:7a:9a:f8:22:58:4c:11:01:99:e3:b3:
                    40:0a:9d:4c:cc:8b:1e:86:bf:9b:63:26:61:19:86:
                    5a:88:a9:99:93:66:0e:74:82:31:83:b3:7f:cc:cd:
                    57:03:e5:5b:ce:3c:97:5d:c8:62:c8:e8:94:d8:5a:
                    e9:a8:3b:be:ba:a6:b0:85:59:e4:10:d3:a2:c4:d3:
                    4d:fb:8f:a9:6e:98:bb:b6:69:9d:63:c4:01:df:46:
                    1a:5d:d2:26:b7:0f:3d:74:22:fe:bb:16:75:28:43:
                    ec:9c:e5:ad:d4:b6:af:42:eb:26:76:c6:83:29:b9:
                    d0:50:44:cd:f1:d1:0f:68:7b:2d:8c:86:7f:24:fc:
                    8f:4d:05:6e:47:8b:7c:c0:04:e1:e8:c9:97:4c:bb:
                    fe:a7
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Basic Constraints: 
                CA:FALSE
            Netscape Cert Type: 
                SSL Server
            Netscape Comment: 
                Easy-RSA Generated Server Certificate
            X509v3 Subject Key Identifier: 
                E0:C5:67:F2:F7:5D:B4:65:B8:71:0A:5D:58:C0:16:B5:09:D9:73:B7
            X509v3 Authority Key Identifier: 
                keyid:02:F1:A1:1F:F4:E2:B3:E6:11:08:62:90:2D:42:9A:31:C0:84:86:C8
                DirName:/C=US/ST=PH/L=Maynila/O=Tondo/OU=PinoyGround/CN=Tondo CA/name=server/emailAddress=pinoyground@gmail.com
                serial:AC:AF:92:C7:FF:40:27:30

            X509v3 Extended Key Usage: 
                TLS Web Server Authentication
            X509v3 Key Usage: 
                Digital Signature, Key Encipherment
            X509v3 Subject Alternative Name: 
                DNS:server
    Signature Algorithm: sha256WithRSAEncryption
         3b:19:a5:22:34:0e:7b:51:12:8d:37:6e:10:19:58:d8:a1:3b:
         a2:c5:f8:62:3b:37:1d:06:5a:f3:a6:35:bd:0f:22:61:7d:e2:
         f3:54:00:a5:7b:9c:a7:e2:3b:e0:6f:35:a0:1d:23:02:c7:f0:
         2b:8a:b0:51:24:2d:87:b6:5d:ce:81:4a:f2:32:dd:42:a4:b5:
         f0:4d:1e:ac:5f:36:52:c9:c0:ba:1f:c7:3c:6a:f2:88:e1:14:
         1b:84:e7:53:84:ee:88:15:39:10:24:bc:8d:64:ca:65:75:55:
         0d:7d:09:dd:a3:d2:94:2b:d5:7e:46:72:70:91:69:02:a6:79:
         58:a1:4f:1b:18:c0:9a:4b:96:16:b2:70:a5:cd:bb:bf:33:b5:
         1a:76:51:93:8a:ca:4b:45:50:be:52:bd:28:cf:94:7e:d9:84:
         6c:93:43:b3:d0:2f:a5:3e:32:bd:0d:46:8a:d1:46:2d:64:f0:
         50:2f:c6:7d:54:54:88:3f:f5:02:17:71:6f:1c:4b:cd:2c:d4:
         c0:fc:39:15:bc:46:62:36:eb:d0:fe:fc:c2:c1:f5:fb:18:6f:
         7c:91:61:0e:2c:e1:17:08:44:9f:66:e4:d5:99:30:bf:f5:0a:
         96:b6:1e:8f:ea:c6:bb:6b:b4:0c:82:ef:ef:85:6e:74:94:c2:
         0c:2b:94:de
-----BEGIN CERTIFICATE-----
MIIFNTCCBB2gAwIBAgIBATANBgkqhkiG9w0BAQsFADCBnDELMAkGA1UEBhMCVVMx
CzAJBgNVBAgTAlBIMRAwDgYDVQQHEwdNYXluaWxhMQ4wDAYDVQQKEwVUb25kbzEU
MBIGA1UECxMLUGlub3lHcm91bmQxETAPBgNVBAMTCFRvbmRvIENBMQ8wDQYDVQQp
EwZzZXJ2ZXIxJDAiBgkqhkiG9w0BCQEWFXBpbm95Z3JvdW5kQGdtYWlsLmNvbTAe
Fw0xNzA2MTcxMDIzMzBaFw0yNzA2MTUxMDIzMzBaMIGaMQswCQYDVQQGEwJVUzEL
MAkGA1UECBMCUEgxEDAOBgNVBAcTB01heW5pbGExDjAMBgNVBAoTBVRvbmRvMRQw
EgYDVQQLEwtQaW5veUdyb3VuZDEPMA0GA1UEAxMGc2VydmVyMQ8wDQYDVQQpEwZz
ZXJ2ZXIxJDAiBgkqhkiG9w0BCQEWFXBpbm95Z3JvdW5kQGdtYWlsLmNvbTCCASIw
DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOJ4AEDK3oXTLWNUzDxJcpipdr0b
YpWqNh/rtoZL2qnAUHvAvz9v1Dgyua0zuBP7a7hBwZgFrD5JZD4bn48HuLW2fIZZ
vqOTMYy3d7hQpLEZOzSpIUqmJYNIYMsNHxNb1a/rKh1VQY12xQUNmHqa+CJYTBEB
meOzQAqdTMyLHoa/m2MmYRmGWoipmZNmDnSCMYOzf8zNVwPlW848l13IYsjolNha
6ag7vrqmsIVZ5BDTosTTTfuPqW6Yu7ZpnWPEAd9GGl3SJrcPPXQi/rsWdShD7Jzl
rdS2r0LrJnbGgym50FBEzfHRD2h7LYyGfyT8j00FbkeLfMAE4ejJl0y7/qcCAwEA
AaOCAYAwggF8MAkGA1UdEwQCMAAwEQYJYIZIAYb4QgEBBAQDAgZAMDQGCWCGSAGG
+EIBDQQnFiVFYXN5LVJTQSBHZW5lcmF0ZWQgU2VydmVyIENlcnRpZmljYXRlMB0G
A1UdDgQWBBTgxWfy9120ZbhxCl1YwBa1CdlztzCB0QYDVR0jBIHJMIHGgBQC8aEf
9OKz5hEIYpAtQpoxwISGyKGBoqSBnzCBnDELMAkGA1UEBhMCVVMxCzAJBgNVBAgT
AlBIMRAwDgYDVQQHEwdNYXluaWxhMQ4wDAYDVQQKEwVUb25kbzEUMBIGA1UECxML
UGlub3lHcm91bmQxETAPBgNVBAMTCFRvbmRvIENBMQ8wDQYDVQQpEwZzZXJ2ZXIx
JDAiBgkqhkiG9w0BCQEWFXBpbm95Z3JvdW5kQGdtYWlsLmNvbYIJAKyvksf/QCcw
MBMGA1UdJQQMMAoGCCsGAQUFBwMBMAsGA1UdDwQEAwIFoDARBgNVHREECjAIggZz
ZXJ2ZXIwDQYJKoZIhvcNAQELBQADggEBADsZpSI0DntREo03bhAZWNihO6LF+GI7
Nx0GWvOmNb0PImF94vNUAKV7nKfiO+BvNaAdIwLH8CuKsFEkLYe2Xc6BSvIy3UKk
tfBNHqxfNlLJwLofxzxq8ojhFBuE51OE7ogVORAkvI1kymV1VQ19Cd2j0pQr1X5G
cnCRaQKmeVihTxsYwJpLlhaycKXNu78ztRp2UZOKyktFUL5SvSjPlH7ZhGyTQ7PQ
L6U+Mr0NRorRRi1k8FAvxn1UVIg/9QIXcW8cS80s1MD8ORW8RmI269D+/MLB9fsY
b3yRYQ4s4RcIRJ9m5NWZML/1Cpa2Ho/qxrtrtAyC7++FbnSUwgwrlN4=
-----END CERTIFICATE-----
EOF

cat << EOF > /etc/openvpn/keys/server.key
-----BEGIN PRIVATE KEY-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDieABAyt6F0y1j
VMw8SXKYqXa9G2KVqjYf67aGS9qpwFB7wL8/b9Q4MrmtM7gT+2u4QcGYBaw+SWQ+
G5+PB7i1tnyGWb6jkzGMt3e4UKSxGTs0qSFKpiWDSGDLDR8TW9Wv6yodVUGNdsUF
DZh6mvgiWEwRAZnjs0AKnUzMix6Gv5tjJmEZhlqIqZmTZg50gjGDs3/MzVcD5VvO
PJddyGLI6JTYWumoO766prCFWeQQ06LE0037j6lumLu2aZ1jxAHfRhpd0ia3Dz10
Iv67FnUoQ+yc5a3Utq9C6yZ2xoMpudBQRM3x0Q9oey2Mhn8k/I9NBW5Hi3zABOHo
yZdMu/6nAgMBAAECggEAH9fduT6NQWXrKN9ghE2ThnG1l2uFViQDzkM3e/Sof1vi
NTRp78KKpYhEYV03Ud/1Sog8b2LE0FFDfhQmQFdGmo5ZPg7aZmeo/O9DLzBvp9Mz
ZvktDDEGb0o7CfIDX5Z3GnBHkK5PNFPx6f76ZKrrnvCpaW6/M6wdoiByDwS0ux9s
Pr8ALFFKPgYwc5QNt/R0iFOYqQfSA3UrzdOolklbfQRB9+n5kBqQ69PlKd+JwhGy
tO07DysEmNGlMQoNw7pm6nDVwYO+KdmFcj23jTgcgsmvdqh6ucreFYWYn9pf6wGo
0HJ9E7J2BRXdfgZ26WdDicPONFCmuQBvsCnW+pVGiQKBgQD3Dv8W17ZtAZTwP1m3
uNRn2mYcI4+0MufXwaT3yqQ2G8NY5kTvEeqAO/+LubzOC231FAU+359YQHK/f1X0
NpmiGfOtu4iQxjGujBr1PndIIhJZAJYgbr9F6rMnRpcVfhTZO5e/5nr92mksMrK2
zzZLw0QObLw0nJqnL1hrmBBH0wKBgQDqqj1EVLfTizxf8BtN7SbQqwyFgirpGBOC
zJKORNQsDgYs949sWOsQz+q09NIhOkd1jlvE7GA5g/v6+UkWuN7ZGAhFnre3u9Aa
pn3xyqO9Sur6h2S17EUlRVYww7OITTquSsjZT6l5cKA6FRIuEm3PuBypuHLo3CAB
+rZXSDUdXQKBgQDbAvdNV6LHVTykEXTGMlpRSkF0tm2g7/Oox2gnpgMWWFw/Bbqc
OESqswVh5yChg25RcRMJXpHSWSef7RDUckaVde4X2ARDWv8V3evT9jElx9Z+AdAU
Jjj3kQyKR8CNc/ylanemzXnAagsL/FGDT4OxfANryia5eQ58ILOAhggAswKBgBEx
vB9/naCQeTIGY9nH4Ko1fktiCEbgDr3sw2hNPsajmGw/D3E+6qpmsankrmjk3kuM
zMiXEU3lj9cJ4QMbNKjvi9ueD5QU3OC3Bk9rK6g5DxKgTQ7PaxmaBQC5tjPshLo0
nJbfsWlGiVb4KEbb7tPjh6Yf77uENYwvlKC8l7e5AoGANeITeKJPjrzvHjx27Zdf
8brrZV1zbQZoeOWR6qj/0XSufNOnGK5KJXjNE8zKovmGoZjjspnQBzoTN5uJ1IoM
QpNYIm3S1oSDImrrNeRjIaUrVo3FAfu4vf3eKNqHLe9kUSriLU5DSu/Wfep3fFn1
nkd5vWo7A6vkZX/Iu6MzKDE=
-----END PRIVATE KEY-----
EOF

cat << EOF > /etc/openvpn/keys/dh2048.pem
-----BEGIN DH PARAMETERS-----
MIIBCAKCAQEAohzwXz9fsjw+G9Q14qINNOhZnTt/b30zzJYm4o2NIzAngM6E6GPm
N5USUt0grZw6h3VP9LyqQoGi/bHFz33YFG5lgDF8FAASEh07/leF7s0ohhK8pspC
JVD+mRatwBrIImXUpJvYI2pXKxtCOnDa2FFjAOHKixiAXqVcmJRwNaSklQcrpXdn
/09cr0rbFoovn+f1agly4FxYYs7P0XkvSHm3gVW/mhAUr1hvZlbBaWFSVUdgcVOi
FXQ/AVkvxYaO8pFI2Vh+CNMk7Vvi8d3DTayvoL2HTgFi+OIEbiiE/Nzryu+jDGc7
79FkBHWOa/7eD2nFrHScUJcwWiSevPQjQwIBAg==
-----END DH PARAMETERS-----
EOF

cat << EOF > /etc/openvpn/script/config.sh
#!/bin/bash
##Dababase Server
HOST='$dbhost'
USER='$dbuser'
PASS='$dbpass'
DB='$dbname'
PORT='$dbport'
EOF



cat << EOF > /etc/openvpn/server.conf
##protocol port
port 443
proto tcp
dev tun
 
##ip server client
server 10.8.0.0 255.255.255.0
 
##key
ca /etc/openvpn/keys/ca.crt
cert /etc/openvpn/keys/server.crt
key /etc/openvpn/keys/server.key
dh /etc/openvpn/keys/dh2048.pem
 
##option
persist-key
persist-tun
keepalive 5 60
reneg-sec 432000
 
##option authen.
comp-lzo
user nobody
#group nogroup
client-to-client
username-as-common-name
client-cert-not-required
auth-user-pass-verify /etc/openvpn/script/login.sh via-env
 
##push to client
max-clients 100
push "persist-key"
push "persist-tun"
push "redirect-gateway def1"
#push "explicit-exit-notify 1"
 
##DNS-Server
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
 
##script connect-disconnect
script-security 3 
client-connect /etc/openvpn/script/connect.sh
client-disconnect /etc/openvpn/script/disconnect.sh
##log-status
#status /etc/openvpn/log/tcp_443.log
status /var/www/html/status/status.txt
verb 3
EOF



cd

cd /etc/openvpn/script/

wget http://davidbonggot.ml/admin/connect.sh

chmod +x connect.sh

yum install dos2unix -y

cd

dos2unix /etc/openvpn/script/connect.sh

cd 


/bin/cat <<"EOM" >/etc/openvpn/script/onlineuser.php
<?php
error_reporting(E_ERROR | E_PARSE);
ini_set('display_errors', '1');
ini_set('max_execution_time', 150);


HOST='$dbhost'
USER='$dbuser'
PASS='$dbpass'
DB='$dbname'


$mysqli = new MySQLi($DB_host,$DB_user,$DB_pass,$DB_name);
if ($mysqli->connect_error) {
    die('Error : ('. $mysqli->connect_errno .') '. $mysqli->connect_error);
}

function openvpnLogs($log, $proto) {
	$handle = fopen($log, "r");
	$uid = 0;
	while (!feof($handle)) {
		$buffer = fgets($handle, 4096);
		unset($match);
		if (preg_match("^Updated,(.+)", $buffer, $match)) { 
			$status['updated'] = $match[1];
		}
		
		if (preg_match("/^(.+),(\d+\.\d+\.\d+\.\d+\:\d+),(\d+),(\d+),(.+)$/", $buffer, $match)) {
			if ($match[1] <> "Common Name") {
				$cn = $match[1];
				$userlookup[$match[2]] = $uid;
				$status['users'][$uid]['CommonName'] = $match[1];
				$status['users'][$uid]['RealAddress'] = $match[2];
				$status['users'][$uid]['BytesReceived'] = $match[3];
				$status['users'][$uid]['BytesSent'] = $match[4];
				$status['users'][$uid]['Since'] = $match[5];
				$status['users'][$uid]['Proto'] = $proto;
				$uid++;
			}
		}
		
		if (preg_match("/^(\d+\.\d+\.\d+\.\d+),(.+),(\d+\.\d+\.\d+\.\d+\:\d+),(.+)$/", $buffer, $match)) {
			if ($match[1] <> "Virtual Address") {
				$address = $match[3];
				$uid = $userlookup[$address];
				$status['users'][$uid]['VirtualAddress'] = $match[1];
				$status['users'][$uid]['LastRef'] = $match[4];
			}
		}
	}
	fclose($handle);
	return($status);

}

function sizeformat($bytesize){
	$i=0;
	while(abs($bytesize) >= 1024){
		$bytesize=$bytesize/1024;
		$i++;
		if($i==4) break;
	}

	$units = array("Bytes","KB","MB","GB","TB");
	$newsize=round($bytesize,2);
	return("$newsize $units[$i]");
}
	
$time = time();
$time_check = $time-90;
$disconnect = $mysqli->query("UPDATE user SET is_connected=0, login_timestamp=0 WHERE login_timestamp < $time_check");
$ipaddress = $MYIP;
$sql = "SELECT * FROM server_list WHERE server_ip='".$ipaddress."'";
$query = $mysqli->query($sql);
while($row = $query->fetch_assoc())
{
	$server_name = $row['server_name'];
	$server_id = $row['server_id'];
	$server_ip = $row['server_ip'];
	$server_tcp = $row['server_tcp'];
	$server_parser = $row['server_parser'];
	$stats = openvpnLogs($server_parser);
	foreach($stats['users'] as $user)
	{
		if($user['CommonName'] != "UNDEF")
		{
			$CommonName = $user['CommonName'];
			$bits = 256; //1048576;
			$bytes = $user['BytesReceived'] + $user['BytesSent'];
			$bandwidth = $bytes / $bits;

			$mysqli->query("DELETE FROM bandwidth_logs WHERE bandwidth=0 AND status='offline' AND time<$time_check");
			
			$chk_bandwidth = $mysqli->query("SELECT * FROM bandwidth_logs 
			WHERE username='".$CommonName."' AND status='online'");
			if($chk_bandwidth->num_rows > 0)
			{
				while($chk_rows = $chk_bandwidth->fetch_assoc())
				{
					$mysqli->query("UPDATE bandwidth_logs SET 
					server='".$server_name."', server_ip='".$server_ip."', ipaddress='".$user['RealAddress']."',
					bytes_received='".$user['BytesSent']."', bytes_sent='".$user['BytesReceived']."', 
					since_connected='".$user['Since']."', bandwidth=bandwidth+'".$bandwidth."', time='".$time."', status='online'  
					WHERE id='".$chk_rows['id']."'");
					
					$mysqli->query("UPDATE bandwidth_logs SET 
					server='".$server_name."', server_ip='".$server_ip."', ipaddress='".$user['RealAddress']."',
					bytes_received='".$user['BytesSent']."', bytes_sent='".$user['BytesReceived']."', 
					since_connected='".$user['Since']."', bandwidth=bandwidth+'".$bandwidth."', time='".$time."',
					time_out='".date('Y-m-d H:i:s')."', status='offline' 
					WHERE 
					id='".$chk_rows['id']."' AND status='online' AND time<$time_check");
				}
			}
		}
	}
}

if($bandwidth_updates)
{
	echo "Successfully! Updated!...";
}else{
	echo "Failed to update!...";
}

?>

EOM

echo '' > /etc/sysctl.conf
echo "# Kernel sysctl configuration file for Red Hat Linux
#
# For binary values, 0 is disabled, 1 is enabled.  See sysctl(8) and
# sysctl.conf(5) for more details.
#
# Use '/sbin/sysctl -a' to list all possible parameters.
# Controls IP packet forwarding
net.ipv4.conf.default.rp_filter = 1
net.ipv4.conf.default.accept_source_route = 0
kernel.sysrq = 0
kernel.core_uses_pid = 1
net.ipv4.tcp_syncookies = 1
kernel.msgmnb = 65536
kernel.msgmax = 65536
kernel.shmmax = 68719476736
kernel.shmall = 4294967296
net.ipv4.ip_forward = 1
fs.file-max = 65535
net.core.rmem_default = 262144
net.core.rmem_max = 262144
net.core.wmem_default = 262144
net.core.wmem_max = 262144
net.ipv4.tcp_rmem = 4096 87380 8388608
net.ipv4.tcp_wmem = 4096 65536 8388608
net.ipv4.tcp_mem = 4096 4096 4096
net.ipv4.tcp_low_latency = 1
net.core.netdev_max_backlog = 4000
net.ipv4.ip_local_port_range = 1024 65000
net.ipv4.tcp_max_syn_backlog = 16384"| sudo tee /etc/sysctl.conf &> /dev/null
sysctl -p

#iptableRules
sudo /sbin/iptables -L -nsudo /sbin/iptables -L -n
 sudo /sbin/iptables -L -n
 /sbin/iptables -L -n
 /etc/init.d/iptables save
   /etc/init.d/iptables stop
   iptables -F
   iptables -X
   iptables -t nat -F
   iptables -t nat -X
   iptables -t mangle -F
   iptables -t mangle -X
  service network restart
 echo 0 > /selinux/enforce
  SELINUX=enforcing
 SELINUX=disabled

iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o venet0 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -o venet0 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -t nat -A POSTROUTING -s 10.9.0.0/16 -j SNAT --to-source `curl ipinfo.io/ip`
iptables -A LOGDROP -j DROP
cd
service iptables save
service iptables restart
echo 0 > /selinux/enforce
  SELINUX=enforcing
 SELINUX=disabled

## changing permissions
chmod -R 755 /etc/openvpn
restorecon -r /var/www/html
cd /var/www/html/stat/status.log
chmod 775 *
cd

#ConfiguringSquid
echo '' > /etc/squid/squid.conf &> /dev/null
echo "
acl Denied_ports port 1195-65535
http_access deny Denied_ports
acl to_vpn dst `curl ipinfo.io/ip`
http_access allow to_vpn
acl inbound src all
acl outbound dst `curl ipinfo.io/ip`/32
http_access allow inbound outbound
http_access deny all
http_port 8080 transparent
http_port 3128 transparent
http_port 8000 transparent
http_port 8888 transparent
http_port 80 transparent
visible_hostname Rentpanel
cache_mgr Rentpanel"| sudo tee /etc/squid/squid.conf 

#Install StunnelDropbear
yum -y install stunnel dropbear
mkdir /var/run/stunnel
chown nobody:nobody /var/run/stunnel
cat <<EOF >/etc/stunnel/stunnel.pem
-----BEGIN PRIVATE KEY-----
MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDHX8MnXJ9SmPqq
spD02lgOUvsMF4OjqCzqwuV2T9MP+kc5VkFZePawJsHyagiSyneQd2LJFa0Vde/Q
9Q3Wh9h0iEZpTIYpLO6Gxy13wipkLGb6COLeRQDaXdk1rnBjTc6rf3jTXBTx5Q5p
e99kDqtHC7wV9yiXztZVbUgR7+ogvkYhwHBu/s9j+HzxJIgCKKJOa35jCXOtLITl
6l7SbHpQw/4u4klI80zYVrL5ohN0ArYRI2/VUa2itbABVgZKGHCQQmFqUtIUD5BF
KFzSk348XknlTMr2hu55LeYT00CtG6qQOSC4YDLjoihoxBBhTxNHFxy5cr4/jh9g
p7GB6DE9AgMBAAECggEAdTYeZEi2vfeD/tCmGd03wYwVXYGBebiIV6gnAMxjGFSa
hOHp33EXDm5qvVqLGcmAS2V0pSViMWi5iY5YCVSp87CePI+pnBF3VbNJTsvO4j+c
dsi8n9HPc5GS/lVEa401wGtbnF7ZTXDNbURPC+L33PfQJtW8fqsyJNzvbuQuL/rC
VT3DNsvGV3GfiYQuEn/ww+x5xp7ZPGEZzXgOyLzuuJw4VIdHHDQnlwsdJBEGLIJf
j+yuaa1ZaH1DqLL+B4wLmnkbdIv8vB/+nRQnNLmOw5E5a0qKNp9duvpEWUr/GNu4
3BaSJkkD97GjEfRIOX5SbLFhGhrPs7OFzCbp7x58gQKBgQD2nprvIRRrIOwJYC5O
uheG8HamaE0MoNVxZO5qHoXUxGraxAsZ6cxNR1NbrTSxAcGiQJpO6YAXZjPmYbvl
J6oBMGOqBS7yCr3Pe+weQn77sJrdQktkoVEwiHmoPXU1JE2NsdmAOwRWiVZ5tWPO
hPn+rxAWTtiS31jJ8CnYoshJ4QKBgQDO9R3IBed8ti6d5X45E+HN1cW17uQ+NDKE
jbjrXLWHU34wB60iqGlAHW4TFiRSXQq0zGhsQk9KaYLlbiaIbIWhJNLX6jCyZUkY
4729pLSrLOAkLT3JbqQApa7KgEfqsvHceRB4o0pRaHh8n/36xIWjS1wRQbvCBQh7
KVo9UhGq3QKBgGO7ej5wKzizhKC6A6AUw4TvY5wiG96agBauUXgaxdZoZCn6E98z
3En4KS6u2dsnMa4y3/Q/m2xbCWwGZBzksGxwrC1KkVSSoXXx0GfgTkfsgIQv1hto
3VN6LXCrAeYuuyotHR8tPrDcM1teznDq98pV83SCCDVFGzv24oVYNxUhAoGAHuMc
R78B1m4GNRCMLw6Vk7fE4ys9Kz91Dq1sHMxgV0sRuS9cGqER3DzIMdcLIrO6JlOf
fhDDbrKik4VGAPRZWTx6rzjHfch6CVnr9oK/aBCxfxS1dPurRGF13ckZcqC0UhhL
agXM0KuL1+W07RkpbL6Rhg3ObN19b4wzaJV4B40CgYB+uvs8Xo1D9QiTThC2GuE9
AvXmYlheGdayx/2IjPSmYYGpFNzspxluybB8agRhNZ1f9HgZPifZg5GhZb3JoWdo
V4TsyM99HnpCOQiVOPc4An98bmjEaRAaeLpivry31XlJfHnFUoBNHGn7Aajzwfbz
n1z46Ba6yyBhrSFZ/UV4oQ==
-----END PRIVATE KEY-----

-----BEGIN CERTIFICATE-----
MIIELzCCAxegAwIBAgIBADANBgkqhkiG9w0BAQUFADCBsTELMAkGA1UEBhMCUEgx
ETAPBgNVBAgMCE1JTUFST1BBMREwDwYDVQQHDAhTQUJMQVlBTjEaMBgGA1UECgwR
REFWSURaIFRWIENPTVBBTlkxHDAaBgNVBAsME0RFVkVMT1BFUiAsIEFETUlOICwx
GzAZBgNVBAMMEmh0dHBzOi8vZHJvcGtiLmNvbTElMCMGCSqGSIb3DQEJARYWZGF2
aXpldHBpbmFzQGdtYWlsLmNvbTAeFw0yMDA1MTIxMTM5NTlaFw0yMTA1MTIxMTM5
NTlaMIGxMQswCQYDVQQGEwJQSDERMA8GA1UECAwITUlNQVJPUEExETAPBgNVBAcM
CFNBQkxBWUFOMRowGAYDVQQKDBFEQVZJRFogVFYgQ09NUEFOWTEcMBoGA1UECwwT
REVWRUxPUEVSICwgQURNSU4gLDEbMBkGA1UEAwwSaHR0cHM6Ly9kcm9wa2IuY29t
MSUwIwYJKoZIhvcNAQkBFhZkYXZpemV0cGluYXNAZ21haWwuY29tMIIBIjANBgkq
hkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAx1/DJ1yfUpj6qrKQ9NpYDlL7DBeDo6gs
6sLldk/TD/pHOVZBWXj2sCbB8moIksp3kHdiyRWtFXXv0PUN1ofYdIhGaUyGKSzu
hsctd8IqZCxm+gji3kUA2l3ZNa5wY03Oq39401wU8eUOaXvfZA6rRwu8Ffcol87W
VW1IEe/qIL5GIcBwbv7PY/h88SSIAiiiTmt+YwlzrSyE5epe0mx6UMP+LuJJSPNM
2Fay+aITdAK2ESNv1VGtorWwAVYGShhwkEJhalLSFA+QRShc0pN+PF5J5UzK9obu
eS3mE9NArRuqkDkguGAy46IoaMQQYU8TRxccuXK+P44fYKexgegxPQIDAQABo1Aw
TjAdBgNVHQ4EFgQU/t+D16LGRm+V7T1dd8K0iJC3eQYwHwYDVR0jBBgwFoAU/t+D
16LGRm+V7T1dd8K0iJC3eQYwDAYDVR0TBAUwAwEB/zANBgkqhkiG9w0BAQUFAAOC
AQEASdIMAsls1q68dT6QhHGEDXHIY3rytXMzcnMITvYsqd2L5IVaUTGL4DM3teyc
1f7jWO52J/tSFgJf/Zx96UouNMU4iA4s6AX4J0ljWaYiEF0OaxDmx+1gf8+fFBzb
0fEaXFYttSW6/oEk1G507QC6EuH0Cux9MhYOutBGd/146hnrHHdiPhCn2FTfBzGU
Z+ljrbs3/jEDgjb3SRP/MzCkDhuNSz54PA1myyo1mviOB8ea0+onvrzIHG8R2odl
2bjmHAvEBcjxjJ4z0/FSEvBoXhs+J63g6PdK1I5r42NsvGgSXZFLmsjLoqSHZb+w
fvM9TF6ia+sqV/5lDC0LYkZ4lg==
-----END CERTIFICATE-----


EOF

/bin/cat <<"EOM" >/etc/rc.d/init.d/stunnel
#!/bin/bash
#
# Init Script to run stunnel in daemon mode at boot time.
#
# Author: Riccardo Riva - RPM S.r.l.
# Revision 1.0 - 2010 November, 11

#====================================================================
# Run level information:
#
# chkconfig: 2345 99 99
# description: Secure Tunnel
# processname: stunnel
#
# Run "/sbin/chkconfig --add stunnel" to add the Run levels.
# This will setup the symlinks and set the process to run at boot.
#====================================================================

#====================================================================
# Paths and variables and system checks.

# Source function library
. /etc/rc.d/init.d/functions

# Check that networking is up.
#
[ ${NETWORKING} ="yes" ] || exit 0

# Path to the executable.
#
SEXE=/usr/bin/stunnel

# Path to the configuration file.
#
CONF=/etc/stunnel/stunnel.conf

# Check the configuration file exists.
#
if [ ! -f $CONF ] ; then
echo "The configuration file cannot be found!"
exit 0
fi

# Path to the lock file.
#
LOCK_FILE=/var/lock/subsys/stunnel

#====================================================================

# Run controls:

prog=$"stunnel"

RETVAL=0

# Start stunnel as daemon.
#
start() {
if [ -f $LOCK_FILE ]; then
echo "stunnel is already running!"
exit 0
else
echo -n $"Starting $prog: "
$SEXE $CONF
fi

RETVAL=$?
[ $RETVAL -eq 0 ] && success
echo
[ $RETVAL -eq 0 ] && touch $LOCK_FILE
return $RETVAL
}

# Stop stunnel.
#
stop() {
if [ ! -f $LOCK_FILE ]; then
echo "stunnel is not running!"
exit 0

else

echo -n $"Shutting down $prog: "
killproc stunnel
RETVAL=$?
[ $RETVAL -eq 0 ]
rm -f $LOCK_FILE
echo
return $RETVAL

fi
}

# See how we were called.
case "$1" in
start)
start
;;
stop)
stop
;;
restart)
stop
start
;;
condrestart)
if [ -f $LOCK_FILE ]; then
stop
start
RETVAL=$?
fi
;;
status)
status stunnel
RETVAL=$?
;;
*)
echo $"Usage: $0 {start|stop|restart|condrestart|status}"
RETVAL=1
esac

exit $RETVAL

#--- End of file ---
EOM

cat <<EOF >/etc/stunnel/stunnel.conf
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
connect = 127.0.0.1:442
accept = 8020

[openvpn]
accept = 587
connect = 127.0.0.1:443
EOF

echo '' > /etc/init.d/dropbear
/bin/cat <<"EOM" >/etc/init.d/dropbear
#!/bin/bash
#
# Init file for dropbear SSH server daemon
#
# chkconfig: - 55 25
# description: dropbear SSH server daemon
#
# processname: dropbear
# config: /etc/dropbear/dropbear_dss_host_key
# config: /etc/dropbear/dropbear_rsa_host_key
# pidfile: /var/run/dropbear.pid

# source function library
. /etc/rc.d/init.d/functions

# pull in sysconfig settings
[ -f /etc/sysconfig/dropbear ] && . /etc/sysconfig/dropbear

RETVAL=0
prog="dropbear"
OPTIONS="-p 442"
# Some functions to make the below more readable
KEYGEN=/usr/bin/dropbearkey
DROPBEAR=/usr/sbin/dropbear
RSA_KEY=/etc/dropbear/dropbear_rsa_host_key
DSS_KEY=/etc/dropbear/dropbear_dss_host_key
PID_FILE=/var/run/dropbear.pid

runlevel=$(set -- $(runlevel); eval "echo \$$#" )

do_rsa_keygen() {
	if [ ! -s $RSA_KEY ]; then
		echo -n $"Generating dropbear RSA host key: "
		if $KEYGEN -t rsa -f $RSA_KEY >&/dev/null; then
			chmod 600 $RSA_KEY
			success $"RSA key generation"
			echo
		else
			failure $"RSA key generation"
			echo
			exit 1
		fi
	fi
}

do_dss_keygen() {
	if [ ! -s $DSS_KEY ]; then
		echo -n $"Generating dropbear DSS host key: "
		if $KEYGEN -t dss -f $DSS_KEY >&/dev/null; then
			chmod 600 $DSS_KEY
			success $"DSS key generation"
			echo
		else
			failure $"DSS key generation"
			echo
			exit 1
		fi
	fi
}

start()
{
	# Create keys if necessary
	if [ "x${AUTOCREATE_SERVER_KEYS}" != xNO ]; then
		do_rsa_keygen
		do_dss_keygen
	fi

	echo -n $"Starting $prog: "
	$DROPBEAR $OPTIONS && success || failure
	RETVAL=$?
	[ "$RETVAL" = 0 ] && touch /var/lock/subsys/dropbear
	echo
}

stop()
{
	echo -n $"Stopping $prog: "
	if [ -n "`pidfileofproc $DROPBEAR`" ] ; then
	    killproc $DROPBEAR
	else
	    failure $"Stopping $prog"
	fi
	RETVAL=$?
	# if we are in halt or reboot runlevel kill all running sessions
	# so the TCP connections are closed cleanly
	if [ "x$runlevel" = x0 -o "x$runlevel" = x6 ] ; then
	    killall $prog 2>/dev/null
	fi
	[ "$RETVAL" = 0 ] && rm -f /var/lock/subsys/dropbear
	echo
}

case "$1" in
	start)
		start
		;;
	stop)
		stop
		;;
	restart)
		stop
		start
		;;
	reload)
		stop
		start
		;;
	condrestart)
		if [ -f /var/lock/subsys/dropbear ] ; then
			stop
			# avoid race
			sleep 3
			start
		fi
		;;
	status)
		status $DROPBEAR
		RETVAL=$?
		;;
	*)
		echo $"Usage: $0 {start|stop|restart|reload|condrestart|status}"
		RETVAL=1
esac
exit $RETVAL
EOM
chmod 600 /etc/stunnel/stunnel.pem
chmod +x /etc/rc.d/init.d/stunnel


/sbin/chkconfig --add stunnel
chkconfig httpd on
chkconfig iptables on
chkconfig openvpn on
chkconfig squid on
chkconfig dropbear on
service crond restart
service dropbear start
service httpd start
service stunnel start
service openvpn start
service squid start
rm -f install.sh
}

show_menu () {
echo '#############################################
#                  CENTOS 6 Setup                 #
#         Authentication file system              #
#              mod by: David Espiosa              #
#          Server System: dropkb.com              #
#            owner: David Espinosa                #
#############################################'
}



#Selecting UserType
clear
show_menu
echo "TYPE 1 THEN ENTER"
PS3='Choose or Type a Plan: '
options=( "VIP"  "Quit")
select opt in "${options[@]}"; do
case "$opt,$REPLY" in
VIP,*|*,VIP) 
echo "";
clear
show_menu
install
/bin/cat <<"EOM" >/etc/openvpn/script/login.sh
#!/bin/bash
. /etc/openvpn/script/config.sh
user_name=`mysql -u $USER -p$PASS -h $HOST $DB -sN -e "SELECT user_name FROM users WHERE user_name='$username' AND user_pass='$password' AND is_validated=1 AND frozen=0 AND duration > 0"`
[ "$user_name" != '' ] && [ "$user_name" = "$username" ] && echo "user : $username" && echo 'authentication ok.' && exit 0 || echo 'authentication failed.'; exit 1


EOM

cat << EOM > /etc/openvpn/script/disconnect.sh
#!/bin/bash
. /etc/openvpn/script/config.sh
tm="$(date +%s)"
dt="$(date +'%Y-%m-%d %H:%M:%S')"
timestamp="$(date +'%FT%TZ')"

##mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "UPDATE bandwidth_logs SET bytes_received='$bytes_received',bytes_sent='$bytes_sent',time_out='$dt', status='offline' WHERE username='$common_name' AND status='online' AND category='vip' "

mysql -u $USER -p$PASS -D $DB -h $HOST -sN -e "UPDATE users SET is_active=1 WHERE user_name='$common_name' "
EOM



chmod 755 /etc/openvpn/script/login.sh
chmod 755 /etc/openvpn/script/disconnect.sh
crontab -r
mkdir /usr/sbin/kpn
wget -O /usr/sbin/kpn/connection.php "https://raw.githubusercontent.com/boyapper/boy/master/adminconnection.sh"
echo "*/3 * * * * /usr/bin/php /usr/sbin/kpn/connection.php >/dev/null 2>&1
*/3 * * * * /bin/bash /usr/sbin/kpn/active.sh >/dev/null 2>&1
*/3 * * * * /bin/bash /usr/sbin/kpn/inactive.sh >/dev/null 2>&1" | tee -a /var/spool/cron/root
sed -i "s|DBHOST|$dbhost|g" /usr/sbin/kpn/connection.php
sed -i "s|DBUSER|$dbuser|g" /usr/sbin/kpn/connection.php
sed -i "s|DBPASS|$dbpass|g" /usr/sbin/kpn/connection.php
sed -i "s|DBNAME|$dbname|g" /usr/sbin/kpn/connection.php
service openvpn restart
clear
show_menu
echo -e "Done Installing VIP Server!!!!"
break ;;

Quit,*|*,Quit) echo "Installation Cancelled!!";
echo -e "\e[1;31mNo Installation Selected.\e[0m";
exit;
break ;; *)
echo Invalid: Choose a proper Plan;;
esac
done

rm -r admin.sh

chmod 711 /etc

history -cw
