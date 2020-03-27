# OpenVPN-client

This is a docker image of an OpenVPN client tied to a SOCKS proxy server. It is useful to isolate network changes (so the host is not affected by the modified routing). 

+ Supports directory style (where the certificates are not bundled together in one `.ovpn` file)
+ An `update-resolv-conf` equivalence would be executed on container startup

## Usage

```bash
docker run \
           --device=/dev/net/tun \
           --cap-add=NET_ADMIN \
           -v <your_openvpn_directory>:/root/openvpn/:ro \
           -p 1080:1080 \
           melsonlai/docker-openvpn-client-socks
```

`<your_openvpn_directory>` should contain 1 and only 1 `*.ovpn`. This `ovpn` file would be used as the connection profile.  


Then connect to SOCKS proxy through through `localhost:1080`.  

# Acknowledgement

+ 20200327: Forked from <https://github.com/kizzx2/docker-openvpn-client-socks>
+ 20200327: Restructure with <https://github.com/just-containers/s6-overlay>

