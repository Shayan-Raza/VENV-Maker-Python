#! /bin/bash

echo "Shayan's Python VENV Maker"
echo 
echo "1) Create a VENV"
echo "2) Use post create configs"
echo "3) Create a .gitignore file"
echo 

#Functions 
venv () {
    read -p "Enter the name of the virtual environment: " name

    echo "Installing Virtual Env"
    python3 -m pip install --user virtualenv -q

    echo "Creating the Virtual Env"
    python3 -m venv $name
}

configs () { 
        #List of configs 
        echo 
        echo "Configs"
        echo "1) Data Science"
        echo "2) Web Development"   
        echo "3) Game Development"
        echo

        #Running Configs
        read -p "Choose config for install[1-3]: " n
            case $n in 
                1) pip install -r configs/datascience.txt ;;                
                2) pip install -r configs/webdev.txt -q ;;
                3) pip install -r configs/gamedev.txt -q ;;
            esac 
}

gitignore () {
    echo "Git ignoring the virtual environment and script"
    touch .gitignore 
    echo $name/ >> .gitignore 
    echo venv.sh >> .gitignore
}

#Running the functions based on user input
while true; do 
    read -p "Choose an option from above [1-3]: " option 
    case $option in 
        1) venv ; 
            break ;; 
        2) configs ; 
            break ;;
        3) gitignore ; 
            break ;; 
    esac 
done 