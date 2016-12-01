# TeamCity docker image.
Jetbrains TeamCity docker image based on alpine liunx and open-jdk-8.  

### TeamCity version.
The version currently used by the image is 10.0.3, this can be changed with the `TEAMCITY_VERSION` environment variable.  

### Build & Run.
```
docker pull jite/teamcity
docker run -p 8111:8111 jite/teamcity
```

### Persist data.
The directory `/app/data/` is the teamcity data dir in the container.

### Port.
Port `8111` is *exposed* in the image and the TeamCity application listens to that port.
