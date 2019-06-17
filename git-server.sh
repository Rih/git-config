!#/bin/bash

#$serverIP="192.168.11.11"
#$serverUser="git"
#$newProject="project-example"
#$serverPath="/home/${serverUser}"

echo "Please let me know your remote computers username (Default=git): "
read serverUser
echo "Please let me know your remote computers IP: "
read serverIP
echo "Please let me know your remote Projects name: "
read newProject

## On Server
# Run once
# sudo apt-get update
# Run once
# sudo apt-get install -y git-core
echo "Creating new Git server user..."
sudo useradd ${serverUser}
echo "Creating passwd to ${serverUser}..."
passwd ${serverUser}

## On Server
echo "Creating path to the project in ${serverPath}/projects/${newProject}.git"
mkdir -p ${serverPath}/projects/${newProject}.git

cd ${serverPath}/projects/${newProject}.git

echo "Creating an empty repo..."
git init --bare
echo "DONE."




# Gitlab installation

#sudo apt-get install postfix
#
#sudo dpkg-reconfigure postfix
#
#wget https://downloads-packages.s3.amazonaws.com/ubuntu-14.04/gitlab_7.9.4-omnibus.1-1_amd64.deb
#
#sudo dpkg -i gitlab_7.9.4-omnibus.1-1_amd64.deb
#
#sudo gitlab-ctl reconfigure
#
#vim /etc/gitlab/gitlab.rb