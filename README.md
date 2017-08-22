# TeamCity docker image.

Jetbrains TeamCity docker image based on alpine liunx and open-jdk-8.  

### Build & Run.

```
docker pull jitesoft/teamcity
docker run -p 8111:8111 jitesoft/teamcity
```

### Persist data.

The directory `/app/data/` is the teamcity data dir in the container.  
I would recommend adding `/app/data/backup` to a shared volume and backup the system regulary.  
To add new plugins, place them in the `/app/data/plugins` directory and restart the docker image.  
Log files are located in `/opt/teamcity/logs`.

### Port.

Port `8111` is *exposed* in the image and the TeamCity application listens to that port.

### Example docker-compose file (v2).

```yml
version: "2"

services:

    mysql:
        image: mysql:5.7
        env_file: .env
        restart: unless-stopped
        networks:
            teamcity-network:
                aliases:
                    - mysql

    teamcity:
        image: jitesoft/teamcity:latest
        env_file: .env
        restart: unless-stopped
        networks:
            teamcity-network:
                aliases:
                    - teamcity
```