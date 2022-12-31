docker stop zanders-term
docker rm zanders-term
docker rmi zanders-term -f
docker build -t zanders-term:latest .
docker run --name zanders-term -d zanders-term:latest
docker exec -it zanders-term /bin/zsh