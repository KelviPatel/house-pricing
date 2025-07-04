# house-pricing
ssh -i your-key.pem ubuntu@your-ec2-public-ip
sudo apt update
sudo apt install python3-pip -y
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker

mkdir myapp

Run this in your gitbash:

cd /path/to/your/keyfile
chmod 400 your-key.pem   # Only needed on Unix systems or WSL
ssh -i your-key.pem ubuntu@<EC2_PUBLIC_IP>

sudo apt update
sudo apt install python3.12-venv
