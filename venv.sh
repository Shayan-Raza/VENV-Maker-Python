#! /bin/bash

read -p "Enter the name of the virtual environment: " name

echo "Creating Virtual Environment"
python3 -m venv $name

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
        [Nn]* ) echo "You chose not to create a .gitignore" ;
            break;;
    * ) echo "Please answer yes or no.";;
    esac
done