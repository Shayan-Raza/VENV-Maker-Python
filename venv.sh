#! /bin/bash

echo "Shayan's Python VENV Maker"
echo 
echo "1) Create a VENV (in the current directory)"
echo "2) Use post create configs (datascience, webdev and gamedev)"
echo "3) Create a .gitignore file (ignore the VENV and the script)"
echo "4) Create a requirements.txt for your project"
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

requirements () { 
    echo "Installing the pip reqs module"
    pip3 install pipreqs

    echo "Creating requirements.txt"
    pipreqs ./
}

#Running the functions based on user input
while true; do 
    read -p "Choose an option from above [1-4]: " option 
    case $option in 
        1) venv ; 
            break ;; 
        2) configs ; 
            break ;;
        3) gitignore ; 
            break ;; 
        4) requirements ; 
            break ;; 
    esac 
done 
