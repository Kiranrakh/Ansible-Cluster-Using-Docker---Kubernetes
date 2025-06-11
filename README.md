# 🧰 Ansible Cluster Setup in Docker and Kubernetes

This repository contains two separate environments to manually set up and test an Ansible automation cluster:

## 📦 1. Docker-based Ansible Cluster

Located in: `docker-ansible-cluster/`

- Manually built Ansible image using Ubuntu
- Uses Docker Compose to spin up master and node containers
- SSH key setup and Ansible inventory file creation automated

## ☸️ 2. Kubernetes-based Ansible Cluster

Located in: `kubernetes-ansible-cluster/`

- Master and node pods based on raw Ubuntu image
- Installs all required packages at container startup
- Manual setup of SSH and Ansible inventory inside pods

## ⚙️ Requirements

- Docker & Docker Compose
- Kubernetes cluster (Minikube, kind, or remote)
- `kubectl` access
- Basic Ansible knowledge

## 👨‍💻 Author

Kiran Rakh  
DevOps Enthusiast | LinuxWorld Intern  
📧 [kiranrakh155@gmail.com](mailto:kiranrakh155@gmail.com)  
🔗 [LinkedIn](https://www.linkedin.com/in/kiran-rakh)

