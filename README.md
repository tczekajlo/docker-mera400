# docker-mera400
Dockerfile to build Docker container with tools for MERA400

To build is required docker 1.10+

```
git clone https://github.com/tczekajlo/docker-mera400.git
cd docker-mera400
################
# We can use two sources in order to build emulator. 
# As argument we give source, git or release channel.
# In case when we want to use release channel argument looks in
# following way "source=release" (for git, source=git).
################
docker build --build-arg source=release -t mera .
docker run -d -p 22100:22 -p 32000:32000 --name mera -t mera
ssh mera@localhost -p 22100
# password: mera400
```

More information you can find on [this side.](http://mera400.pl/CROOK-5_w_EM400)
