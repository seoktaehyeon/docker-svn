## Subversion + Apache2

> Base http Docker image to install subversion and configure Apache

[![org](https://img.shields.io/static/v1?style=for-the-badge&label=org&message=Assurance%20Sphere&color=ff582c)](https://will.bowxeon.com)
![author](https://img.shields.io/static/v1?style=for-the-badge&label=author&message=v.stone@163.com&color=blue)
[![httpd](https://img.shields.io/static/v1?style=for-the-badge&logo=apache&label=HTTPD&message=2.4&color=cb1b49)](https://hub.docker.com/_/httpd)
[![svn](https://img.shields.io/static/v1?style=for-the-badge&logo=subversion&label=subversion&message=1.10&color=7591c2)](http://subversion.apache.org/)
[![httpd](https://img.shields.io/static/v1?style=for-the-badge&logo=docker&label=docker&message=bxwill/svn:1.10&color=2496ED)](https://hub.docker.com/r/bxwill/svn)

#### Start Container

```bash
docker-compose up -d
```

`docker-compose.yaml` as below:

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
```

#### Create Repository in container

Init Repository:

```bash
cd /var/repos
svnadmin create <REPO_NAME>
```

Add/Modify username and password:

```bash
cd <REPO_NAME>/conf
vim authz            # add username
vim passwd           # set password
vim svnserve.conf    # Enable password-db = passwd
```

#### Access via SVN

Svn repo `<REPO_NAME>` works: `svn://127.0.0.1/<REPO_NAME>`

Execute svn command:
```bash
svn checkout svn://127.0.0.1/<REPO_NAME> --username <SVN_NAME> --password <SVN_PASSWD>
```

#### Access via HTTP

Svn web URL: `http://127.0.0.1/svn/<REPO_NAME>`

Default username is `admin` and password is `opendevops`
