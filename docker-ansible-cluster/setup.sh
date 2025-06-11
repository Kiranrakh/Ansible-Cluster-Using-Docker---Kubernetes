#!/bin/bash

echo "[INFO] Generate SSH keys on Ansible master"
docker exec -u ansible ansible-master ssh-keygen -t rsa -N "" -f /home/ansible/.ssh/id_rsa

for node in node1 node2; do
  echo "[INFO] Adding $node to known_hosts"
  docker exec -u ansible ansible-master ssh-keyscan -H $node >> /home/ansible/.ssh/known_hosts

  echo "[INFO] Copying SSH key to $node"
  docker exec -u ansible ansible-master sshpass -p "ansible" ssh-copy-id -o StrictHostKeyChecking=no ansible@$node
done

echo "[INFO] Copy inventory file to master"
docker cp inventory ansible-master:/home/ansible/inventory

echo "[INFO] Test connection with Ansible"
docker exec -u ansible ansible-master ansible all -i /home/ansible/inventory -m ping




