username=zookeeper
if ! id $username; then
    useradd --groups docker  --create-home $username
fi
echo 'Waiting for docker dameon to start'
while ! pgrep -f docker ; do echo 'Waiting for docker dameon to start...'; sleep 2; done
echo 'Waiting 10 more seconds for docker dameon to become available.'
sleep 10
while ! docker pull zookeeper:3.6 ; do echo 'Waiting for image to download...'; sleep 2; done
docker run --name zookeeper --user=$username --net=host -e "ZOO_SERVERS=server.1=0.0.0.0:2888:3888;2181" -p 0.0.0.0:2181:2818 -p 2888:2888 -p 3888:3888 -p 8080:8080 --restart always -d zookeeper:3.6
sudo iptables -w -A INPUT -p tcp --dport 2181  -j ACCEPT