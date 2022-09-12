#! /bin/bash

read -p "Enter the name of the virtual environment: " name

echo "Installing Virtual Env"
python3 -m pip install --user virtualenv -q

echo "Creating the Virtual Env"
python3 -m venv $name

#Functions
gitignore () {
    touch .gitignore 
    echo $name/ >> .gitignore 
    echo venv.sh >> .gitignore
}

#gitignore
while true; do 
    read -p "Create a .gitignore[Y/n]: " yn
    case $yn in 
        [Yy]*) gitignore ; 
            break;;
        
        [Nn]*) echo "You chose not to create a .gitignore" ;
            break;;
    * ) echo "Please answer yes or no.";;
    esac
done

#Activating and running premade configs
while true; do 
    read -p "Activate Environment and use post install configs[Y/n]: " yn 
    case $yn in 
        [Yy]*) source $name/bin/activate ;;
        
        #List of configs 
        echo 
        echo "1) Data Science"
        echo "2) Web Development"
        echo

        #Running Configs
        read -p "Choose config for install[1-2]: " n
            case $n in 
                1) pip install -r configs/datascience.txt ;;                
                2) pip install -r configs/webdev.txt -q ;;
            esac 
            break;;

        [Nn]*) echo "You chose not to use post install configs" ; 
            break;;
        *) echo "Please answer yes or no."
    esac     
done