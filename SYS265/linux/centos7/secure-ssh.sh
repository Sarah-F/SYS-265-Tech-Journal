#secure-ssh.sh
#author Sarah-F
#creates a new ssh user using $1 parameter
#adds a public key from the loccal repo or cirled from the remote repo
#removes roots ability to ssh in
echo "ALL YOUR CODE GOES HERE"

echo -e "enter username"
read user
sudo useradd $user
echo $user was created
sudo mkdir /home/$user/.ssh
sudo cp /home/sarah/SYS-265-Tech-Journal/SYS265/linux/public-keys/id_rsa.pub /home/$user/.ssh/authorized_keys
sudo chmod 700 /home/$user/.ssh
sudo chmod 600 /home/$user/.ssh/authorized_keys
sudo chown -R $user:$user /home/$user/.ssh

sudo printf '\n%s\n' 'PermitRootLogin no' >> /etc/ssh/sshd_config
sudo systemctl restart sshd
echo permit root login disabled
