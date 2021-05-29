function mkcert
  set --local NAME $argv[1]

  set --local C  "/countryName=ZA"
  set --local ST "/stateOrProvinceName=Gauteng"
  set --local L  "/localityName=Centurion"
  set --local O  "/organizationName=annaxxKØ (Pty) Ltd"
  set --local OU "/organizationalUnitName=IT Security"
  set --local CN "/commonName=itsec.annaxxko.net"
  set --local E  "/emailAddress=itsec@annaxxko.net"

  set --local SUBJECT "$C$ST$L$O$OU$CN$E"

  echo (cat /dev/urandom | tr -dc '[:alnum:][:punct:]' | head -c63) > "$NAME".password
  chmod u+r-wx,go-rwx "$NAME".password

  openssl req                           \
    -x509                               \
    -newkey    rsa:4096                 \
    -keyout    "$NAME"-key.pem          \
    -out       "$NAME"-cert.pem         \
    -passout   file:"$NAME".password    \
    -days      4935                     \
    -subj      "$SUBJECT"
end
