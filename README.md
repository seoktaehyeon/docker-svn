#### docker-compose.yaml

```yaml
version: '3'
services:
  svn:
    container_name: svn
    image: bxwill/svn:1.10
    ports:
      - 80:80
      - 3690:3690
    volumes:
      - ./repos:/var/repos
```