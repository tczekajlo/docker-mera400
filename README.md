# docker-mera400
Dockerfile to build Docker container with tools for MERA400

```
git clone https://github.com/tczekajlo/docker-mera400.git
cd docker-mera400
docker build -t mera .
docker run -d -p 22100:22 -p 32000:32000 --name mera -t mera
ssh mera@localhost -p 22100
# password: mera400
```

More information you can find on [this side.](http://mera400.pl/CROOK-5_w_EM400)
