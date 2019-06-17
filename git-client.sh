!#/bin/bash

#$serverIP="192.168.11.11"
#$clientUser="clientName"
#$serverUser="git"
#$serverProject="project-example"
#$newProject="project"

echo "Please let me know your computers username: "
read clientUser
echo "Please let me know your Projects name: "
read newProject
echo "Please let me know your remote computers username (Default=git): "
read serverUser
echo "Please let me know your remote computers IP: "
read serverIP
echo "Please let me know your remote Projects name: "
read serverProject

$serverPath="/home/${serverUser}"
$serverProjectPath="${serverPath}/projects"
$clientPath="/home/${clientUser}"

## On Client
echo "Creating a new client SSH KEY..."
ssh-keygen -t rsa

echo "Sending public key to Remote Git Server and adding to authorizeds..."
cat ${clientPath}/.ssh/id_rsa.pub | ssh ${serverUser}@${serverIP} "mkdir -p ${serverPath}/.ssh && cat >> ${serverPath}/.ssh/authorized_keys"

# On Client
echo "Creating a new project path..."
mkdir -p ~/projects

cd ~/projects

## DO ONE OF TWO
##git init 
##git add .
##git commit -m "first"
## After this, DO remote add
##Otherwise DO :Clone:

#-------
# :Clone:
echo "Cloning ... (git@${serverIP}:${serverProjectPath}/${serverProject}.git ${newProject})"
git clone git@${serverIP}:${serverProjectPath}/${serverProject}.git ${newProject}

# :remote add:
echo "Linking local repo from remote server for synchronization..."
echo "(ssh://${serverUser}@${serverIP}${serverProjectPath}/${serverProject}.git)"
git remote add origin ssh://${serverUser}@${serverIP}${serverProjectPath}/${serverProject}.git
echo "DONE."