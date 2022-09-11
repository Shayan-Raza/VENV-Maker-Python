#! /bin/bash

read -p "Enter the name of the virtual environment: " name

echo "Installing Virtual Env"
python3 -m pip install --user virtualenv -q

echo "Creating the Virtual Env"
python3 -m venv $name

#Functions
git () {
    touch .gitignore 
    echo $name/ >> .gitignore 
}

#gitignore
while true; do 
    read -p "Create a .gitignore[Y/n]: " yn
    case $yn in 
        [Yy]*) git  ; 
            break;;
        [Nn]*) echo "You chose not to create a .gitignore" ;
            break;;
    * ) echo "Please answer yes or no.";;
    esac
done
