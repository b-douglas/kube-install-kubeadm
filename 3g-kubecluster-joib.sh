


#echo "$(hostname -i) 		kubework01" >> /etc/hosts


set -x

kubeadm join kubecp-01:6443 --token e4bim8.luofsi7hhxry236c \
    --discovery-token-ca-cert-hash sha256:c5b540db55174546d7858b169e46d9601a173cd5770340ee759a8369a24524e7

