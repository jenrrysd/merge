#!/bin/bash

git config --global core.editor true

# Leer la URL del repositorio y el nombre de la rama
read -p "Ingresar el git clone del pase: " gitclone
read -p "Ingresar el mvl del pase: " mvl

# Clonar el repositorio y cambiar a la rama master
git clone $gitclone --branch master --single-branch
REPO_NAME=$(basename "$gitclone" .git)
cd $REPO_NAME
git checkout master

# Combinar la rama release/mvl con master
git pull --strategy-option theirs origin release/$mvl --allow-unrelated-histories

# Verificar el estado y añadir todos los cambios
git status
git add .

# Confirmar los cambios
git commit -m "Merged release/$mvl into master"

# Empujar o subir los cambios a la rama master del repositorio remoto
git push origin master



