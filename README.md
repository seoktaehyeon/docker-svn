#### docker-compose.yaml

```yaml
version: '3'
services:
  svn:
    container_name: svn
    image: bxwill/svn:1.10
    ports:
      - 80:80
      - 443:443
      - 3690:3690
    volumes:
      - ./repos:/var/repos
#      - ./dav_svn.passwd:/etc/apache2/dav_svn.passwd
```

#### Create Repository

```bash
# Exexuted in container
cd /var/repos
svnadmin create <PROJECT NAME>
```

#### Create web username and password
```bash
htpasswd -cm /etc/apache2/dav_svn.passwd username password
```
