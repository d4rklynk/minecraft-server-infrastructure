# minecraft-server-infrastructure

All Minecraft worlds are placed into `/opt/minecraft`.

You will need to create a homeless user `minecraft`.

## What's in there

- A backup system that sends an encrypted compressed archive of Minecraft repertory to OVH Object Storage service. Automatically run every day at 7 a.m.
- A Minecraft service unit that allows you to do start and stop the server.jar by using `systemctl` command.
- A sshd_config file that accepts only ed25519 ssh keys from root user.
- A firewalld configuration that allows only `ssh` (or custom ports, in that case, remove `ssh` service), `dhcpv6-client` and `minecraft` services.

## Custom ports

Edit SELinux context for ssh if you want to bind it to a custom port:

```bash
semanage port -a -t ssh_port_t -p tcp 45678
```

Choosing a random port for SSH is **ONLY** to avoid bots spamming your logs server, this is **NOT** in any case a security thing. 

You can safely stick with port 22 if you want to.

It's just bugged me to see so many failed attempts in my logs.