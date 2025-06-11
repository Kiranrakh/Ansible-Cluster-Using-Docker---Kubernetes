
# 🐳 Ansible Cluster Using Docker (Manual Setup)

This guide explains how to manually set up an **Ansible Master-Node Cluster** using Docker containers **without using any pre-built images**. It includes **only terminal commands**—you will create and populate the files manually.

---

## 📋 Prerequisites

- Docker & Docker Compose installed
- `sshpass` installed on your local system

---

## 🚀 Step-by-Step Setup (Commands Only)

### 📁 Step 1: Create and Navigate to Project Directory

```bash
mkdir ansible-docker-cluster
cd ansible-docker-cluster
````

---

### 🛠️ Step 2: Create Required Files

Use the following commands to create the required files. You will paste content into each manually.

```bash
nano Dockerfile
```

```bash
nano docker-compose.yml
```

```bash
nano inventory
```

```bash
nano setup.sh
chmod +x setup.sh
```

> 📝 Inside each file, paste the relevant content as needed (Dockerfile, Compose, inventory, and setup script).

---

### 🧱 Step 3: Build and Start Docker Containers

```bash
docker-compose up -d --build
```

---

### 🔐 Step 4: Run Setup Script to Configure SSH and Ansible

```bash
./setup.sh
```

---

### ✅ Step 5: Verify Ansible Cluster Is Working

If setup is correct, the output should be:

```bash
node1 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
node2 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

This confirms:

* Passwordless SSH access is working from master to nodes
* Ansible can ping both nodes

---

## 📦 Directory Structure (After Setup)

```bash
ansible-docker-cluster/
├── Dockerfile
├── docker-compose.yml
├── inventory
├── setup.sh
```

---

## 👨‍💻 Author

**Kiran Rakh**
DevOps Intern @ LinuxWorld Informatics Pvt. Ltd.
📧 [kiranrakh155@gmail.com](mailto:kiranrakh155@gmail.com)
🔗 [LinkedIn](https://www.linkedin.com/in/kiran-rakh)

```


