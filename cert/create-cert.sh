# generate ca key
openssl genrsa -aes256 -passout pass:winlabisgood -out ca.key 4096
# create root ca
openssl req -x509 -new -sha512 -days 3650 \
    -subj "/C=TW/ST=Hsinchu/L=Hsinchu/O=nycu/OU=lab/CN=winlab" \
    -passin pass:winlabisgood \
    -key ca.key \
    -out ca.pem

echo ----- COPY CA TO OS PATH AND DOCKER PATH -----
sudo mkdir /usr/share/ca-certificates/cluster
sudo cp ca.pem /usr/share/ca-certificates/cluster/

echo ----- UPDATE OS CERT -----
# sudo dpkg-reconfigure ca-certificates
sudo update-ca-certificates --fresh


echo ----- CREATE CSR -----
# generate cert key
openssl genrsa -out winlab.nycu.org.key 4096
# create certificate signing request
openssl req -sha512 -new \
    -subj "/C=TW/ST=Taiwan/L=Taipei/O=nycu/OU=lab/CN=*.winlab.nycu.org" \
    -key winlab.nycu.org.key \
    -out winlab.nycu.org.csr

# config
cat > v3.ext <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names
[alt_names]
DNS.1=*.winlab.nycu.org
DNS.2=winlab.nycu.org
EOF

echo ----- CREATE CERT -----
# create cert
openssl x509 -req -sha512 -days 3650 \
    -extfile v3.ext \
    -passin pass:winlabisgood \
    -CA ca.pem -CAkey ca.key -CAcreateserial \
    -in winlab.nycu.org.csr \
    -out winlab.nycu.org.pem


# traefik need fullchain cert (include ca)
cat winlab.nycu.org.pem ca.pem > fullchain.pem

echo ----- CREATE SECRET -----
kubectl create secret generic tls-secret -n traefik \
    --from-file=ca.pem \
    --from-file=tls.pem=fullchain.pem \
    --from-file=tls.key=winlab.nycu.org.key

echo ----- CREATE CONFIGMAP -----
kubectl apply -f traefik-config.yaml


# delete resource and files...
# kubectl delete secret tls-secret -n traefik
# kubectl delete -f traefik-config.yaml
# rm *.cert *.crt *.key *.csr *.srl *.pem
# sudo rm /usr/share/ca-certificates/cluster/ca.pem


helm upgrade --install traefik -f values.yaml --namespace traefik traefik/traefik --version 10.24.0