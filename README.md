# Docker image for argus-server

This image provides the `argus` network flow collector server. For a list of all options available with the command, see [the documentation](http://qosient.com/argus/man/man8/argus.8.pdf).

To start a container that captures UDP and TCP traffic on interface `en0` with a reporting interval of 600 seconds and listens for argus client connections on port 561, use:

```
docker run -d -p 561:561 --network host jgoodall/argus -P 561 -S 600 -i en0 - "ip and (udp or tcp)"
```

