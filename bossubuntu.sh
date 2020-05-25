#!/bin/bash
# Auto Script for Centos 6.xx
# Made w/love by hunters
# version v.11
ln -fs /usr/share/zoneinfo/Asia/Manila /etc/localtime
sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config &> /dev/null
#change this according to your database details
#Note: Password w/ Special Characters are not allowed.
dbhost='mysql1.blazingfast.io';
dbuser='cybertea_kidlat';
dbpass='jan022011';
dbname='cybertea_kidlat';
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
dh='-----BEGIN DH PARAMETERS-----
MIIBCAKCAQEAohzwXz9fsjw+G9Q14qINNOhZnTt/b30zzJYm4o2NIzAngM6E6GPm
N5USUt0grZw6h3VP9LyqQoGi/bHFz33YFG5lgDF8FAASEh07/leF7s0ohhK8pspC
JVD+mRatwBrIImXUpJvYI2pXKxtCOnDa2FFjAOHKixiAXqVcmJRwNaSklQcrpXdn
/09cr0rbFoovn+f1agly4FxYYs7P0XkvSHm3gVW/mhAUr1hvZlbBaWFSVUdgcVOi
FXQ/AVkvxYaO8pFI2Vh+CNMk7Vvi8d3DTayvoL2HTgFi+OIEbiiE/Nzryu+jDGc7
79FkBHWOa/7eD2nFrHScUJcwWiSevPQjQwIBAg==
-----END DH PARAMETERS-----';
RED='\033[01;31m';
RESET='\033[0m';
GREEN='\033[01;32m';

echo -e "$GREEN                Please Wait... $RESET"
sleep 3s
echo -e "$GREEN                Installing Updates $RESET"
yum update -y
clear
echo -e "$GREEN                Updates Done  $RESET"
sleep 3s
echo -e "$GREEN                Lets install the required packages. $RESET"
sleep 3s
clear
echo -e "$GREEN                Please Wait... $RESET"
yum update -y &> /dev/null
yum install -y telnet telnet-server vixie-cron crontabs httpd nano squid mysql-server &> /dev/null
yum install -y php php-pdo php-mysqli php-mysql php-mbstring.x86_64 epel-release &> /dev/null
yum install -y openvpn curl sudo &> /dev/null
MYIP=$(curl -4 icanhazip.com); &> /dev/null
echo -e "$GREEN                Installation Complete $RESET"
echo -e "$GREEN                Lets configure the settings and routing $RESET"
sleep 4s
clear
echo -e "$GREEN                Please wait while we are fighting with your firewall $RESET"
sleep 4s

#ethernet
ethernet=""

echo "************************************************************************************"
echo -e " Note: Your Network Interface is followed by the word \e[1;31m' dev '\e[0m"
echo " If the interface doesnt match openvpn will be connected but no internet access."
echo " Please choose or type properly"
echo "************************************************************************************"
echo ""
echo "Your Network Interface is:"
ip route | grep default
echo ""
echo "Ethernet:"
read ethernet
echo ""
echo ""
clear;

## making script and keys
mkdir /etc/openvpn/script
mkdir /etc/openvpn/log
mkdir /etc/openvpn/keys
mkdir /var/www/html/status
touch /var/www/html/status/tcp2.txt
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

/bin/cat <<"EOM" >/etc/openvpn/script/connect.sh
#!/bin/bash
  
tm="$(date +%s)"
dt="$(date +'%Y-%m-%d %H:%M:%S')"
timestamp="$(date +'%FT%TZ')"
  
  
. /etc/openvpn/script/config.sh
device=`mysql -u $USER -p$PASS -D $DB -h $HOST --skip-column-name -e "SELECT users.device_connected FROM users WHERE users.user_name='$common_name'"`
device2="$device"
add="1"
mysql -u $USER -p$PASS -D $DB -h $HOST -e "UPDATE users SET users.device_connected='$device2'+'$add' WHERE users.user_name='$common_name'"
  
EOM
  
/bin/cat <<"EOM" >/etc/openvpn/script/disconnect.sh
#!/bin/bash
tm="$(date +%s)"
dt="$(date +'%Y-%m-%d %H:%M:%S')"
timestamp="$(date +'%FT%TZ')"
  
. /etc/openvpn/script/config.sh
device=`mysql -u $USER -p$PASS -D $DB -h $HOST --skip-column-name -e "SELECT users.device_connected FROM users WHERE users.user_name='$common_name'"`
device2="$device"
deduct="1"
mysql -u $USER -p$PASS -D $DB -h $HOST -e "UPDATE users SET users.device_connected='$device2'-'$deduct' WHERE users.user_name='$common_name'"
  
  
EOM



echo -e "                $GREEN Type of your Server$RESET"
PS3='Choose or Type a Plan: '
options=("Premium" "VIP" "PRIVATE" "Quit")
select opt in "${options[@]}"; do
  case "$opt,$REPLY" in
    Premium,*|*,Premium) 
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
echo -e "                $GREEN 1) Premium Selected$RESET";
break ;;
VIP,*|*,VIP) 
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
echo -e "                $GREEN 2) VIP Selected$RESET";
break ;;
PRIVATE,*|*,PRIVATE) 
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
echo -e "                $GREEN 3) PRIVATE Selected$RESET";
break ;;
Quit,*|*,Quit) echo -e " $RED   Installation Cancelled!$RESET";
echo -e "                $RED   Rebuild your vps and correct the process.$RESET";
exit;
break ;; *)
echo -e "                $RED   Invalid: Just choose what you want$RESET";
esac
done
clear


cat << EOF > /etc/openvpn/server.conf
local $MYIP
mode server 
tls-server 
port 1194
proto tcp
dev tun
tun-mtu-extra 32 
tun-mtu 1400 
mssfix 1360
server 10.8.0.0 255.255.255.0
ca /etc/openvpn/keys/ca.crt
cert /etc/openvpn/keys/server.crt
key /etc/openvpn/keys/server.key
dh /etc/openvpn/keys/dh2048.pem
persist-key
persist-tun
keepalive 1 180
comp-lzo
mute 3
mute-replay-warnings
user nobody
client-to-client
username-as-common-name
client-cert-not-required
auth-user-pass-verify /etc/openvpn/script/login.sh via-env
push "redirect-gateway def1"
push "dhcp-option DNS 1.1.1.1"
push "dhcp-option DNS 1.0.0.1"
script-security 3
status /var/www/html/status/tcp2.txt 1
#log-append /etc/openvpn/log/openvpn.log
verb 3
connect-retry-max infinite
EOF
#denying ads
cat << EOF > /etc/squid/ads.txt
101com.com
101order.com
123found.com
180hits.de
180searchassistant.com
207.net
247media.com
24log.com
zjjlf.croukwexdbyerr.net
zkic.com
zous.szm.sk
zt.tim-taxi.com
zyrdu.cruisingsmallship.com
EOF
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
sysctl -p &> /dev/null
iptables -F; iptables -X; iptables -Z
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o $ethernet -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -j SNAT --to $MYIP
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -s 10.8.0.0/24 -j ACCEPT
iptables -A FORWARD -j REJECT
iptables -A INPUT -p tcp --dport 25 -j DROP
iptables -A INPUT -p udp --dport 25 -j DROP

#install PHP
yum install gcc php-devel php-pear libssh2 libssh2-devel make -y
pecl install -f ssh2 -y
 echo extension=ssh2.so > /etc/php.d/ssh2.ini
service httpd restart
 php -m | grep ssh2 
sed -i "s/#ServerName www.example.com:80/ServerName localhost:80/g" /etc/httpd/conf/httpd.conf
clear
sed -i "s/#Port 22/Port 24/g" /etc/ssh/sshd_config &> /dev/null;

service iptables save &> /dev/null

## changing permissions
chmod -R 755 /etc/openvpn
restorecon -r /var/www/html
cd /var/www/html/status
chmod 775 *
cd
echo '' > /etc/squid/squid.conf &> /dev/null
echo "acl Denied_ports port 1025-65535
http_access deny Denied_ports
acl to_vpn dst $MYIP
http_access allow to_vpn
acl inbound src all
acl outbound dst $MYIP/32
http_access allow inbound outbound
http_access deny all
http_port 8080 transparent
http_port 8989 transparent
http_port 8000 transparent
http_port 53 transparent
http_port 9201 transparent
visible_hostname jhoe_XII
cache_mgr codeph"| sudo tee /etc/squid/squid.conf &> /dev/null
clear
echo -e "$GREEN                    We are almost done $RESET"
sleep 4s
clear
echo "0 0 1 * * root /sbin/reboot" > /etc/cron.d/reboot
echo "";
echo -e "$GREEN  Every 12mn Next Month Your VPS will reboot
Restarting and Re-enabling after Boot $RESET"
echo "";
service iptables save &> /dev/null
/sbin/chkconfig crond on
chkconfig iptables on
chkconfig openvpn on
chkconfig squid on
/sbin/service crond start
chkconfig httpd on &> /dev/null
/etc/init.d/squid start &> /dev/null
/etc/init.d/openvpn start &> /dev/null
/etc/init.d/httpd start &> /dev/null
service httpd restart &> /dev/null
service squid restart 
service openvpn restart
rm openvpn.sh
rm openvpn.sh.1
clear
echo ''
echo ''
echo ''
echo -e "$YELLOW
============================   
         SUCCESS!!!
============================   $RESET"
sleep 3s
echo ''
echo -e "$GREEN     OpenVPN Installed Sucessfully$RESET"
sleep 3s
echo "";
Quit,*|*,Quit) echo -e " $RED   Installation Finish!$RESET";
echo -e "                $RED   Thank you for using my installation$RESET";
sleep 3s
echo ''
sleep 3s
echo ''
echo -e "                $RED   Please dont modify my script: by: hunter xii$RESET";
esac
done
