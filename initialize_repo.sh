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
git clone --recurse-submodules https://github.com/ragestudio/comty
cd comty
patch -p1 -N < ../mod.patch
npm i

bash packages/server/scripts/installNginxStatic.sh

cp comty-server.env comty/packages/server/.env

echo "#########################################################################"
echo "# Admin login"
echo "# User: root"
echo "# password: changemeorgethacked"      
echo "#########################################################################"
echo "# run these commands to run comty"
echo "# cd comty"
echo "# npm run dev"
echo "#########################################################################"
echo "# Note: Vite HMR does not work with firefox. Maybe firefox is not working"
echo "#########################################################################"
