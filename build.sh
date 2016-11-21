source /home/vcap/docker-bosh/tile-generator/bin/activate
cd docker-kafka
docker build -t rhardt/kafka:latest .
cd ..
mkdir docker-cache
docker save rhardt/kafka | gzip -c > docker-cache/rhardt-kafka.tgz
tile build --docker-cache ./docker-cache
pcf import product/*.pivotal
