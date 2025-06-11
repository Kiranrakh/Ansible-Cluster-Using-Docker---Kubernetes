📘 PART 2: Ansible Cluster Using Kubernetes (Manual Setup)

✅ Step 1: Project Setup
📍Run on your host machine (laptop):
cd kubernetes-ansible-cluster

✅ Step 2: Start Minikube with Docker
📍Run on host machine:
minikube config set driver docker
minikube start --driver=docker

✅ Step 3: Build Docker Image
📍Run on host machine:
eval $(minikube docker-env)
docker build -t ansible-image:v1 .

✅ Step 4: Apply Kubernetes Pods
📍Run on host machine:
kubectl apply -f k8s-master.yaml
kubectl apply -f k8s-node1.yaml
kubectl apply -f k8s-node2.yaml
kubectl get pods -o wide

✅ Step 5: SSH Key Generation
📍Run inside ansible-master pod:
kubectl exec -it ansible-master -- bash
su - ansible
ssh-keygen -t rsa -b 2048
Just press Enter for all prompts.

✅ Step 6: Fix SSH Permissions (If Needed)
📍Still inside the pod, switch to root:
exit  # back to root
chown -R ansible:ansible /home/ansible/.ssh
chmod 700 /home/ansible/.ssh
su - ansible

✅ Step 7: Copy SSH Key to Nodes
📍Inside ansible-master pod as ansible user:
ssh-copy-id ansible@<node1-IP>
ssh-copy-id ansible@<node2-IP>
📍If permission error on node:
🔁 Inside each node pod (as root):
mkdir -p /home/ansible/.ssh
chown -R ansible:ansible /home/ansible/.ssh
chmod 700 /home/ansible/.ssh
📍If host key verification fails (back in master pod):
ssh-keygen -R <node-IP>
ssh-keyscan <node-IP> >> ~/.ssh/known_hosts

✅ Step 8: Create Ansible Inventory
📍Inside ansible-master pod as ansible user:
echo "[node]" > inventory
echo "<node1-IP> ansible_user=ansible" >> inventory
echo "<node2-IP> ansible_user=ansible" >> inventory
Verify:
cat inventory

✅ Step 9: Test with Ansible Ping
📍Inside master pod as ansible user:
ansible -i ./inventory all -m ping

✅ Expected output:
<node1-IP> | SUCCESS => { "ping": "pong" }
<node2-IP> | SUCCESS => { "ping": "pong" }