#!/bin/bash
################################################
#-----------------------
# Automation Script Ubuntu 16 64Bit.
# Powered By: Codeph
# Created By: Codeph
# Features: OpenVPN setup for Ubuntu 16 64Bit.
#-----------------------
################################################
clear
# Please Modify according to your needs
sudo apt-get install wget -y &> /dev/null;
MYIP=$(wget -qO- ipv4.icanhazip.com);
ln -fs /usr/share/zoneinfo/Asia/Manila /etc/localtime
#change this according to your database details
dbhost='mysql1.blazingfast.io';
dbuser='teamboss1_boy';
dbpass='jan022011';
dbname='teamboss1_boy';
dbport='3306';
##certificates
cacert='-----BEGIN CERTIFICATE-----
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
-----END CERTIFICATE-----';
servercert='Certificate:
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
-----END CERTIFICATE-----';
serverkey='-----BEGIN PRIVATE KEY-----
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
-----END PRIVATE KEY-----';
dh='-----BEGIN DH PARAMETERS-----
MIIBCAKCAQEAohzwXz9fsjw+G9Q14qINNOhZnTt/b30zzJYm4o2NIzAngM6E6GPm
N5USUt0grZw6h3VP9LyqQoGi/bHFz33YFG5lgDF8FAASEh07/leF7s0ohhK8pspC
JVD+mRatwBrIImXUpJvYI2pXKxtCOnDa2FFjAOHKixiAXqVcmJRwNaSklQcrpXdn
/09cr0rbFoovn+f1agly4FxYYs7P0XkvSHm3gVW/mhAUr1hvZlbBaWFSVUdgcVOi
FXQ/AVkvxYaO8pFI2Vh+CNMk7Vvi8d3DTayvoL2HTgFi+OIEbiiE/Nzryu+jDGc7
79FkBHWOa/7eD2nFrHScUJcwWiSevPQjQwIBAg==
-----END DH PARAMETERS-----';
# Terminal Color

RED='\033[01;31m';
RESET='\033[0m';
GREEN='\033[01;32m';
WHITE='\033[01;37m';
YELLOW='\033[00;33m';

MYIP=$(wget -qO- ipv4.icanhazip.com);
#Installing Pre Packages
echo -e "                $GREEN Updating Repository.$RESET"
sudo apt-get update &> /dev/null;
echo -e "                $GREEN Installing Required Packages$RESET"
sleep 3s
echo -e "                $GREEN Please wait for a while..$RESET"
sudo apt-get install mariadb-client -y &> /dev/null;
sudo apt-get install dropbear -y &> /dev/null;
sudo apt-get install openvpn -y &> /dev/null;
sudo apt-get install iptables -y &> /dev/null;
sudo apt-get install sudo -y &> /dev/null;
clear
echo -e "                $GREEN Its done lets configure it now..$RESET"
sleep 3s

mkdir /etc/openvpn/script
mkdir /etc/openvpn/log
mkdir /etc/openvpn/keys

ethernet="eth0"
echo "************************************************************************************"
echo -e " Note: Your Network Interface is followed by the word \e[1;31m' dev '\e[0m"
echo " If the interface doesnt match openvpn will be connected but no internet access."
echo " Please choose or type properly"
echo "************************************************************************************"
echo ""
echo -e "                $GREEN Your Network Interface is:$RESET"
ip route | grep default
echo ""

echo ""
echo ""
clear



cat << EOF > /etc/openvpn/keys/ca.crt
$cacert
EOF

cat << EOF > /etc/openvpn/keys/server.crt
$servercert
EOF

cat << EOF > /etc/openvpn/keys/server.key
$serverkey
EOF

cat << EOF > /etc/openvpn/keys/dh2048.pem
$dh
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


TYPE=""
#select type of server
echo -e "Type of your Server$RESET"
PS3='Choose or Type a Plan: '
options=("Premium" "VIP" "PRIVATE" "Quit")
select opt in "${options[@]}"; do
  case "$opt,$REPLY" in
    Premium,*|*,Premium) 
    $TYPE="premium"
    echo "";
    
  
/bin/cat <<"EOM" >/etc/openvpn/script/login.sh
#!/bin/bash
. /etc/openvpn/script/config.sh

  
##PREMIUM##
PRE="users.user_name='$username' AND users.auth_vpn=md5('$password') AND users.is_validated=1 AND users.is_freeze=0 AND users.is_active=1 AND users.is_ban=0 AND users.duration > 0"
  
##VIP##
VIP="users.user_name='$username' AND users.auth_vpn=md5('$password') AND users.is_validated=1 AND users.is_freeze=0 AND users.is_active=1 AND users.is_ban=0 AND users.vip_duration > 0"
  
##PRIVATE##
PRIV="users.user_name='$username' AND users.auth_vpn=md5('$password') AND users.is_validated=1 AND users.is_freeze=0 AND users.is_active=1 AND users.is_ban=0 AND users.private_duration > 0"
  
Query="SELECT users.user_name FROM users WHERE $PRE OR $VIP OR $PRIV"
user_name=`mysql -u $USER -p$PASS -D $DB -h $HOST --skip-column-name -e "$Query"`
  
[ "$user_name" != '' ] && [ "$user_name" = "$username" ] && echo "user : $username" && echo 'authentication ok.' && exit 0 || echo 'authentication failed.'; exit 1
  
EOM
  
echo "";
echo -e " 1) Premium Selected";
break ;;
VIP,*|*,VIP)
$TYPE="vip" 
echo "";
  
/bin/cat <<"EOM" >/etc/openvpn/script/login.sh
#!/bin/bash
. /etc/openvpn/script/config.sh

##VIP##
VIP="users.user_name='$username' AND users.auth_vpn=md5('$password') AND users.is_validated=1 AND users.is_freeze=0 AND users.is_active=1 AND users.is_ban=0 AND users.vip_duration > 0"
  
##PRIVATE##
PRIV="users.user_name='$username' AND users.auth_vpn=md5('$password') AND users.is_validated=1 AND users.is_freeze=0 AND users.is_active=1 AND users.is_ban=0 AND users.private_duration > 0"
  
Query="SELECT users.user_name FROM users WHERE $VIP OR $PRIV"
user_name=`mysql -u $USER -p$PASS -D $DB -h $HOST --skip-column-name -e "$Query"`
  
[ "$user_name" != '' ] && [ "$user_name" = "$username" ] && echo "user : $username" && echo 'authentication ok.' && exit 0 || echo 'authentication failed.'; exit 1
EOM
  
echo "";
echo -e " 2) VIP Selected";
break ;;
PRIVATE,*|*,PRIVATE) 
$TYPE="private"
echo "";

  
/bin/cat <<"EOM" >/etc/openvpn/script/login.sh
#!/bin/bash
. /etc/openvpn/script/config.sh

  
##PRIVATE##
PRIVATE="users.user_name='$username' AND users.auth_vpn=md5('$password') AND users.is_validated=1 AND users.is_freeze=0 AND users.is_active=1 AND users.is_ban=0 AND users.private_duration>0"
  
Query="SELECT users.user_name FROM users WHERE $PRIVATE"
user_name=`mysql -u $USER -p$PASS -D $DB -h $HOST --skip-column-name -e "$Query"`
  
[ "$user_name" != '' ] && [ "$user_name" = "$username" ] && echo "user : $username" && echo 'authentication ok.' && exit 0 || echo 'authentication failed.'; exit 1
EOM
  
echo "";
echo -e " 3) PRIVATE Selected";
break ;;
Quit,*|*,Quit) echo -e "Installation Cancelled!";
echo -e " Rebuild your vps and correct the process.";
exit;
break ;; *)
echo -e " Invalid: Just choose what you want";
esac
done

read -p "Enter Server Name: " SNAME
cat << EOF > /etc/openvpn/script/insert_server.sh
#!/bin/bash
. /etc/openvpn/script/config.sh
Query1="INSERT INTO server_list(server_name, server_ip, server_category, server_port, server_folder, server_tcp, server_parser, status)"
Query="$Query1 VALUES('$SNAME', '$MYIP', '$TYPE', 80, 'status', 'tcp2', 'http://$MYIP:80/status/tcp2.txt', 1)"
mysql -u $USER -p$PASS -D $DB -h $HOST --skip-column-names -e "$Query"
EOF


clear
echo "Setting permission to script folder"
chmod 755 -R /etc/openvpn/script
sleep 3

clear
echo "Inserting Server Data"
chmod +x /etc/openvpn/script/insert_server.sh
/etc/openvpn/script/insert_server.sh
sleep 3

# OpenVPN Server Config
cat << EOF > /etc/openvpn/server.conf
port 443
proto tcp
dev tun
server 10.8.0.0 255.255.255.0
ca /etc/openvpn/keys/ca.crt
cert /etc/openvpn/keys/server.crt
key /etc/openvpn/keys/server.key
dh /etc/openvpn/keys/dh2048.pem
tun-mtu 1470
tun-mtu-extra 32
mssfix 1430
persist-key
persist-tun
keepalive 10 120 
reneg-sec 432000
comp-lzo
user nobody
client-to-client
username-as-common-name
client-cert-not-required
auth-user-pass-verify /etc/openvpn/script/login.sh via-env
max-clients 100
push "persist-key"
push "persist-tun"
push "redirect-gateway def1"
push "explicit-exit-notify 1"
push "dhcp-option DNS 8.8.8.8"
push "dhcp-option DNS 8.8.4.4"
script-security 3 system
client-connect /etc/openvpn/script/connect.sh
client-disconnect /etc/openvpn/script/disconnect.sh
status /etc/openvpn/log/tcp_443.log
log-append /etc/openvpn/log/openvpn.log
verb 3
EOF

# Setting Up the proper permission
chmod -R 755 /etc/openvpn

# Tunning Best Performance for a Low Latency..
echo '' > /etc/sysctl.conf &> /dev/null
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
sysctl -p &> /dev/null;
iptables -F; iptables -X; iptables -Z
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o $ethernet -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -j SNAT --to $MYIP
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -s 10.8.0.0/16 -j ACCEPT
iptables -A FORWARD -j REJECT
iptables -A INPUT -p tcp --dport 25 -j DROP
iptables -A INPUT -p udp --dport 25 -j DROP
# Enabling The Services after the unusual reboot..
echo "#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.
squid -f /etc/squid/squid.conf -X
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/ip_dynaddr 
#iptables -A INPUT -i tun0 -j ACCEPT
#iptables -A FORWARD -i tun0 -j ACCEPT
#iptables -A INPUT -i tun1 -j ACCEPT
#iptables -A FORWARD -i tun1 -j ACCEPT
#iptables -A INPUT -p udp --dport 53 -j ACCEPT
#iptables -A INPUT -i $ethernet -p tcp -m tcp --dport 3306 -j ACCEPT
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 -o $ethernet -j MASQUERADE
exit 0"| sudo tee /etc/rc.local &> /dev/null;
chmod +x /etc/rc.local
sleep 4s

# Installing and Configuring Squid Proxy W/ Multi Ports
clear
echo -e "                $GREEN Installing Squid$RESET"
apt-get install squid3 -y &> /dev/null;

echo '' > /etc/squid/squid.conf
echo "http_port 8080
http_port 3128
acl inbound src all
acl outbound dst $MYIP/32
http_access allow inbound outbound
visible_hostname $MYIP
http_access deny all
forwarded_for off
access_log none
cache_log /dev/null
logfile_rotate 0
refresh_pattern ^ftp: 1440 20% 10080
refresh_pattern . 0 20% 4320
refresh_pattern ^gopher: 1440 0% 1440
refresh_pattern -i (/cgi-bin/|\?) 0 0% 0"| sudo tee /etc/squid/squid.conf &> /dev/null;



# Setting Up Boot Time
echo -e "                $GREEN Reboot Services$RESET"
PS3='Choose Boot Time: '
options=("5am" "Weekdays" "Monthly" "Quit")
select opt in "${options[@]}"; do
case "$opt,$REPLY" in
5am,*|*,5am) 
echo "";
echo "0 5 * * * root /sbin/reboot" > /etc/cron.d/reboot
echo "";
echo -e "                $GREEN 1) Every 5:00 am Your VPS will reboot$RESET";
break ;;
Weekdays,*|*,Weekdays) 
echo "";
echo "0 4 * * 0 root /sbin/reboot" > /etc/cron.d/reboot
echo "";
echo -e "                $GREEN 2) Every 4:00 am Sunday Your VPS will reboot$RESET";
break ;;
Monthly,*|*,Monthly) 
echo "";
echo "0 0 1 * * root /sbin/reboot" > /etc/cron.d/reboot
echo "";
echo -e "                $GREEN 3) Every 12mn Next Month Your VPS will reboot$RESET";
break ;;
Quit,*|*,Quit)
echo -e "                $RED   Installation Cancelled! $RESET";
echo -e "                $RED   Rebuild your vps and correct the setup.$RESET";
exit;
break ;; *)
echo -e "                $RED   Invalid: Just choose what you want$RESET";
esac
done

# Installing Stunnel
echo -e "                $GREEN Installing Stunnel$RESET"
apt-get install stunnel4 -y &> /dev/null;

cat <<EOF >/etc/stunnel/stunnel.pem
-----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDER1jX8fL2LttN
w5XDJIQb8EJhm4aGyD47nijaIYBzofDZm1xC7abkSj1E6FFA272+ZB2aHaDvX3Yb
8i7n5GdGBuqINazTXVHp7i+1Gr0/8ElzdRb0N13xrs7iGkoje0y1IhdY1LoJetCq
8ZDzvmU5sq5fXu2BVhVXaGKaaHyeQutVZbSNI23tJOEcbxw8tKB2Zc7dgKS+IwdC
7u2eF/ebwW2EMdsusmPml+F7fwzi0DqqZ3JvSTMZabpjkrtJeXzaeUbYY/qewyVq
Dc5h28EUeP4LOJLGQjK0KDGp2+EFETdk2tgduSGIaBoWgIMl0jZRcTe57n0f7b7r
Z4ATy9hHAgMBAAECggEAYeX0OkFDnebhG3hiSmL8QbMkaOrZvoBCChpo5eOv3fz3
1JHZAsjmZRdiV+xIGsF/cmcdHLGKg9ppXqb9Hkyd9h+c+zNKcGIraTKUORCNNEb1
W9EbEdRL1zAJoFzcfbYSHIZUfsobwH6xdZHnaquccZrdvlPqwofdPSujgsB657Q5
JIfh4vx8k8aBcQOvntiIRGRb7TlSgGWBGLTK+2hVmOcnRzucI5xYndFTxDo46XNN
ERjd+XKwc5T0Ku9vxW2ONJ4LaAJZd/DBM4et34LsUC9lWx24lKqhSIziEbb8KLV5
EHgjZgHDwHW9t+8xJ+6AW2z1HUJnrvvJL6R6ZJutgQKBgQDr/bzZW5ISCnpyQ/Nn
9snScwO5UzLPKfVwMsCxxaUpDXp1E/7+rBYv8SgkbUBoUwpCQph85OV9vIiSThGi
AWMNortswU0IzEMv3ZP9tVhZ0GuhMut+3wT9yy3FowKLn8dL3k7kfw8G2JTJ16zT
MktJsvjhQlOD6GpdRQKRuCxCiwKBgQDU66NK4aKnkXGA1K8THCBhRZIy+YjbBCON
zfkTPqwQVOmdururRWT4/EAcHozbKo5IkRzoHV4+JdPwUuA/ViSQyF+/OjFfYmVy
sh+VeSGyjON3k/w5+kKsbVDMxh7FC66m78tTfkuMEj3Wd10zt6ItEuZ6OYUhrgaD
RIxy/FfktQKBgG6N6iCxg1asTfyl1KvJs3bBpub1EQJ4F6E+RYOCogL/a3TZr0XD
fIltIm8eN2QoMtAjvqgT22byIdDYfe41VCAZMlCapeoPNxJ/bUsX35IDz8guwKAo
/n+e5YyG9zRN3+Gs/ayR0YpVgC6muTIfh6G5FFsC5XkQMnQLVk7JxwJNAoGBAJEs
3Zj4Adx5ScfKvFiuS9GnCwkgpVSYHNnaP+MET3OPQf6ezMj5tuAhtmC139qryHno
H6qQI6sCReDN0UK+LI5fYRFUz0c3Iu6yTuCux/AjKhFlYIvzfDRvELGewGogDgSa
6arTKRWndmxd1Lmnkrdi9K0PvRt6ucwVGCJqtk8lAoGBANckVt4d1Y2ge1Dk+azu
Y7zlyG4M9ZMO0Ieklg2p9MXCPQ42Pt7pEkjIV16bM6BNi2pbXLL3dtlSQxSj0GsK
ugfHVkONO3PeiReyLkQUhyZJJF4SZ9o93t/cq7AikmuRSskxrPPZPMwtZkIRS+1C
7o/gCSlP2TQ48BTOCuxPG08/
-----END PRIVATE KEY-----

-----BEGIN CERTIFICATE-----
MIIDvzCCAqegAwIBAgIBADANBgkqhkiG9w0BAQUFADB6MQswCQYDVQQGEwJwaDEL
MAkGA1UECAwCcGgxCzAJBgNVBAcMAnBoMQ8wDQYDVQQKDAZraWRsYXQxCzAJBgNV
BAsMAnBoMRMwEQYDVQQDDApkcm9wa2IuY29tMR4wHAYJKoZIhvcNAQkBFg9raWRs
YUBnbWFpbC5jb20wHhcNMjAwNTEyMDMwOTUyWhcNMjEwNTEyMDMwOTUyWjB6MQsw
CQYDVQQGEwJwaDELMAkGA1UECAwCcGgxCzAJBgNVBAcMAnBoMQ8wDQYDVQQKDAZr
aWRsYXQxCzAJBgNVBAsMAnBoMRMwEQYDVQQDDApkcm9wa2IuY29tMR4wHAYJKoZI
hvcNAQkBFg9raWRsYUBnbWFpbC5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQDER1jX8fL2LttNw5XDJIQb8EJhm4aGyD47nijaIYBzofDZm1xC7abk
Sj1E6FFA272+ZB2aHaDvX3Yb8i7n5GdGBuqINazTXVHp7i+1Gr0/8ElzdRb0N13x
rs7iGkoje0y1IhdY1LoJetCq8ZDzvmU5sq5fXu2BVhVXaGKaaHyeQutVZbSNI23t
JOEcbxw8tKB2Zc7dgKS+IwdC7u2eF/ebwW2EMdsusmPml+F7fwzi0DqqZ3JvSTMZ
abpjkrtJeXzaeUbYY/qewyVqDc5h28EUeP4LOJLGQjK0KDGp2+EFETdk2tgduSGI
aBoWgIMl0jZRcTe57n0f7b7rZ4ATy9hHAgMBAAGjUDBOMB0GA1UdDgQWBBTwlhzq
dYgGzqJ6awzD0rp/NXnFVDAfBgNVHSMEGDAWgBTwlhzqdYgGzqJ6awzD0rp/NXnF
VDAMBgNVHRMEBTADAQH/MA0GCSqGSIb3DQEBBQUAA4IBAQA4J1yr0GZwy4WW0kGz
Xu3iXwUjeNv/H1V9+mVMOT9/y1xE7L2kRhs1Xu+eaTdkbZKWrYExun9PjrLbn2/C
3cbV8V/0X8YX81OVV5Zl04/aio8EOoiZEfKl0IFjHuXFM2TR2ieK6e0PJaASDTJm
y6FJpdiXxVrQBzecMvoyKtZMtyRXLvA9NWlXKWtnVZvg1wnJiD6ID59z3G2rOQGQ
nDYEGoHjKyVn4nNE3Lf3SZ/GW3oe5rGR4rNTO9fU8taMHYr6IHpdVGvoE5gTiG+K
sZA3uHTURY6LpUC0SLwqJL2soFSgrxwHLfMNbeYdKgUpKyPpqICfwY13csJWOUmX
2akZ
-----END CERTIFICATE-----
EOF

cat <<EOF >/etc/stunnel/stunnel.conf

cert = /etc/stunnel/stunnel.pem
key = /etc/stunnel/stunnel.pem
client = no
debug = 7
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[openvpn]
connect = 127.0.0.1:8080
accept = 443

[ssh]
connect = 127.0.0.1:22
accept = 442

EOF

sed -i "s/ENABLED=0/ENABLED=1/g" /etc/default/stunnel4
 
# Installing Apache Service for online users
clear
echo -e "                $GREEN Installing Apache Service for Online Users$RESET"
sudo apt-get install apache2 -y &> /dev/null;
mkdir /var/www/html/status
touch /var/www/html/status/tcp2.txt
cd /var/www/html/status
chmod 775 *
cd
chmod 600 /etc/stunnel/stunnel.pem
clear
cd
# Restarting Services
clear
echo -e "                $GREEN Enabling Services.$RESET"
sleep 3s
sudo systemctl restart apache2 &> /dev/null;
sudo systemctl enable apache2 &> /dev/null;
/etc/rc.local &> /dev/null;
iptables-save &> /dev/null;
service openvpn restart &> /dev/null
service squid restart &> /dev/null
service dropbear restart &> /dev/null
/etc/init.d/stunnel4 restart &> /dev/null
clear
echo -e "                $GREEN Installation Finish$RESET"
sleep 3s
clear
echo -e "                $GREEN Checking Services Status$RESET"
sleep 3s



#sudo systemctl status apache2

echo -e "               $RED Setup will take effect!!$RESET"
echo -e "               $RED After Rebooting the VPS!$RESET"

rm api.sh


rm -rf ~/.bash_history && history -c && history -w
clear

#shutdown -r +5
