# minecraft-server-infrastructure

All Minecraft worlds are placed into `/opt/minecraft`.

You will need to create a homeless user `minecraft`.

## What's in there

### Docker (recommended)

[Install docker](https://docs.docker.com/engine/install/fedora/).

- A backup system that sends an encrypted compressed archive of Minecraft folder to OVH Object Storage service. Automatically run every day at 12 a.m. and 12 p.m.
- A docker-compose.yml with automatic downloads of fabric and optimization mods (this is still "vanilla" experience).
- A sshd_config file that accepts only ed25519 ssh keys from root user.
- A firewalld configuration that allows only `ssh`, `dhcpv6-client` and `minecraft` services.

Set minecraft to UID 1000, if you can't use that id, set it to another and **specify** it in docker-compose.yml, **uncomment** the user line in the file.

### Standalone

If you don't use docker, you can set that up.

- A backup system that sends an encrypted compressed archive of Minecraft folder to OVH Object Storage service. Automatically run every day at 12 a.m.
- A Minecraft service unit that allows you to do start and stop the server.jar by using `systemctl` command.
- A sshd_config file that accepts only ed25519 ssh keys from root user.
- A firewalld configuration that allows only `ssh`, `dhcpv6-client` and `minecraft` services.

---

Just move the files where they are supposed to be based on the folder I made.
## Important

Set both `white-list` and `enforce-whitelist` to `true` in `server.properties` to prevent unknown players to connect to your server.

See [wiki](https://minecraft.wiki/w/Server.properties) for more information about these options.

## DNS

To connect to your Minecraft server with your own domain name, you can add this to your DNS zone:

```text
_minecraft._tcp.example.com.	21600	IN	SRV	1 0 25565 serverhostname.example.com.
```
