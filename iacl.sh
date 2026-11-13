
#!/bin/bash

echo "Iniciando configuracao do sistema..."

# Criando os diretorios
echo "Criando diretorios..."
mkdir -p /publico /adm /ven /sec

# Criando os grupos
echo "Criando grupos..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# Criando usuarios e definindo os grupos
echo "Cadastrando usuarios..."

useradd -m -s /bin/bash -G GRP_ADM -p "$(openssl passwd -6 senha123)" carlos
useradd -m -s /bin/bash -G GRP_ADM -p "$(openssl passwd -6 senha123)" maria
useradd -m -s /bin/bash -G GRP_ADM -p "$(openssl passwd -6 senha123)" joao

useradd -m -s /bin/bash -G GRP_VEN -p "$(openssl passwd -6 senha123)" debora
useradd -m -s /bin/bash -G GRP_VEN -p "$(openssl passwd -6 senha123)" sebastiana
useradd -m -s /bin/bash -G GRP_VEN -p "$(openssl passwd -6 senha123)" roberto

useradd -m -s /bin/bash -G GRP_SEC -p "$(openssl passwd -6 senha123)" josefina
useradd -m -s /bin/bash -G GRP_SEC -p "$(openssl passwd -6 senha123)" amanda
useradd -m -s /bin/bash -G GRP_SEC -p "$(openssl passwd -6 senha123)" rogerio

# Configurando as permissoes dos diretorios
echo "Configurando permissoes..."

chown root:root /publico /adm /ven /sec

chmod 777 /publico

chown root:GRP_ADM /adm
chmod 770 /adm

chown root:GRP_VEN /ven
chmod 770 /ven

chown root:GRP_SEC /sec
chmod 770 /sec

echo "Configuracao finalizada!"
