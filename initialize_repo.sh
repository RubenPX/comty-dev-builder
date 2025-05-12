# /bin/bash

# Build Comty DB user
# Configura tus variables
DB_NAME="comty"
DB_USER="comtyuser"
DB_PASS="tusegura_contraseña"

# Ejecutar comandos en MongoDB usando mongosh
mongosh <<EOF
use $DB_NAME
db.createUser({
  user: "$DB_USER",
  pwd: "$DB_PASS",
  roles: [
    { role: "readWrite", db: "$DB_NAME" },
    { role: "dbAdmin", db: "$DB_NAME" }
  ]
});
EOF

# Clone and patch comty

bash -i -c 'nvm install --lts && nvm use --lts'
git clone --recurse-submodules https://github.com/ragestudio/comty && cd comty
git apply CustomCodePach.patch
npm i
