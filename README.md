# house-pricing
Prerequisites

An AWS EC2 instance (Ubuntu 22.04+ recommended)

Python 3.12+ installed on the EC2 instance

A .github/workflows/deploy.yml file set up for GitHub Actions

SSH key pair (.pem file) for EC2 access


1. Launch and Configure Your EC2 Instance
Launch an EC2 instance with Ubuntu OS.

Open inbound security group ports:

22 for SSH

5000 for the Flask app (or whichever port your app runs on)   

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

sudo apt update
sudo apt install python3.12-venv python3-pip

| Secret Name    | Value                                                               |
| -------------- | ------------------------------------------------------------------- |
| `EC2_HOST`     | Your EC2 public IP (e.g. `3.123.4.5`)                               |
| `EC2_USERNAME` | Usually `ubuntu`                                                    |
| `DEPLOY_PATH`  | `/home/ubuntu/myapp`                                                |
| `EC2_KEY`      | Your private SSH key content (not the `.pem` path, the **content**) |



