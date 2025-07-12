# House Price Prediction

[![CI/CD Pipeline](https://github.com/YOUR_USERNAME/YOUR_REPOSITORY/actions/workflows/deploy.yml/badge.svg)](https://github.com/YOUR_USERNAME/YOUR_REPOSITORY/actions/workflows/deploy.yml)

This project demonstrates an end-to-end machine learning solution for predicting house prices. The model is served via a Flask web application and is automatically deployed to an AWS EC2 instance using a CI/CD pipeline powered by GitHub Actions.

## ✨ Features

*   **Machine Learning Model**: A trained model to predict housing prices.
*   **Web API**: A simple Flask API to serve predictions.
*   **Automated CI/CD**: Pushing to the `main` branch automatically triggers a deployment to the AWS EC2 server.
*   **Reproducible Infrastructure**: Clear, documented steps to provision and configure the server environment.

## 🛠️ Tech Stack

*   **Backend**: Python, Flask
*   **ML Stack**: Scikit-learn, Pandas
*   **Infrastructure**: AWS EC2
*   **CI/CD**: GitHub Actions
*   **Containerization**: Docker

---

## 🚀 Getting Started (Local Setup)

To run this application on your local machine, follow these steps.

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/YOUR_USERNAME/house-pricing.git
    cd house-pricing
    ```

2.  **Create and activate a virtual environment:**
    ```bash
    # For macOS/Linux
    python3 -m venv venv
    source venv/bin/activate

    # For Windows
    # python -m venv venv
    # venv\Scripts\activate
    ```

3.  **Install the required dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

4.  **Run the Flask application:**
    ```bash
    python app.py
    ```

The application will be running at `http://127.0.0.1:5000`.

---

## ☁️ Deployment to AWS EC2 with CI/CD

This project is configured for automated deployment to an AWS EC2 instance whenever changes are pushed to the `main` branch. Here’s how to set up the infrastructure and the pipeline.

### Prerequisites

*   An AWS account.
*   A GitHub repository for this project.
*   An SSH key pair (`.pem` file) for EC2 access.

### Step 1: Launch and Configure AWS EC2 Instance

1.  **Launch Instance**:
    *   Go to the EC2 Dashboard in your AWS Console.
    *   Launch a new instance with the **Ubuntu 22.04 LTS** image.
    *   Choose an instance type (e.g., `t2.micro` is sufficient).
    *   Select your SSH key pair or create a new one. **Download and save the `.pem` file securely.**

2.  **Configure Security Group**:
    *   Create a new security group or use an existing one.
    *   Add the following **inbound rules**:
        *   **Type**: `SSH`, **Protocol**: `TCP`, **Port**: `22`, **Source**: `My IP` (for secure access).
        *   **Type**: `Custom TCP`, **Protocol**: `TCP`, **Port**: `5000`, **Source**: `Anywhere` (to allow public access to the Flask app).

### Step 2: Configure the EC2 Server

1.  **Connect to your instance via SSH.** On your local machine's terminal, first set the correct permissions for your key file (this is not required on Windows CMD/PowerShell).
    ```bash
    chmod 400 /path/to/your-key.pem
    ```
    Then connect using the instance's public IP address:
    ```bash
    ssh -i /path/to/your-key.pem ubuntu@<YOUR_EC2_PUBLIC_IP>
    ```

2.  **Install all required software.** Once connected to the EC2 instance, run the following block of commands to set everything up:
    ```bash
    # Update package manager and install Python, pip, and venv
    sudo apt-get update
    sudo apt-get install -y python3.12-venv python3-pip

    # Install Docker
    sudo apt-get install -y docker.io

    # Start and enable the Docker service so it runs on startup
    sudo systemctl start docker
    sudo systemctl enable docker

    # Create the deployment directory
    # This is where your application code will live
    mkdir ~/myapp
    ```

### Step 3: Set up GitHub Actions Secrets

To allow GitHub Actions to securely connect to your EC2 instance, you must add the following secrets to your GitHub repository.

Go to your repository > `Settings` > `Secrets and variables` > `Actions` > `New repository secret`.

| Secret Name    | Description                                                                                                   | Example Value                                |
| -------------- | ------------------------------------------------------------------------------------------------------------- | -------------------------------------------- |
| `EC2_HOST`     | The public IP address of your EC2 instance.                                                                   | `3.123.4.5`                                  |
| `EC2_USERNAME` | The username for your EC2 instance (typically `ubuntu` for Ubuntu AMIs).                                      | `ubuntu`                                     |
| `DEPLOY_PATH`  | The absolute path on your server where the app will be deployed.                                              | `/home/ubuntu/myapp`                         |
| `EC2_KEY`      | The **content** of your private SSH key (`.pem` file). **Do not** add the path; copy the entire file's content. | `-----BEGIN RSA PRIVATE KEY-----...`         |

**To get your `EC2_KEY` content, run this command on your local machine and copy the entire output:**
```bash
cat /path/to/your-key.pem
