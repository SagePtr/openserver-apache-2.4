@echo off
set OPENSSL_CONF=%~dp0..\conf\openssl.cnf
..\bin\openssl req -x509 -sha256 -nodes -days 5475 -newkey rsa:2048 -keyout rootCA.key -x509 -out rootCA.crt -subj "/C=/ST=/L=/O=/OU=/CN=ospanel/emailAddress=/"
..\bin\openssl genrsa -out server.key 2048
..\bin\openssl req -new -key server.key -out server.csr -subj "/C=/ST=/L=/O=/OU=/CN=localhost/emailAddress=/"
..\bin\openssl x509 -req -sha256 -days 5475 -in server.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out server.crt
..\bin\openssl dhparam -out dhparam.pem 2048