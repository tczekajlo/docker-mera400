# docker-mera400
Dockerfile to build Docker container with tools for MERA400

```
git clone https://github.com/tczekajlo/docker-mera400.git
cd docker-mera400
docker build -t mera20 .
docker run -d -p 22100:22 --name mera -t mera
docker run -d -p 22100:22 -t mera
ssh mera@localhost -p 22100
# password: mera400
```
