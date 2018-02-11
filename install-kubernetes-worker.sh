# install docker
apt-get update
apt-get install -y docker.io

# install kubernetes
apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

apt-get update
apt-get install -y kubelet kubeadm kubectl

# replace with the PUBLIC IP address of the worker node
export WORKER_IP=<worker_ip>

# run the join command returned from the init command you ran on the master node
kubeadm join --token <token> <master_ip>:6443 --discovery-token-ca-cert-hash sha256:<token_hash>