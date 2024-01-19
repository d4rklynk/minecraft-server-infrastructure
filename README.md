# minecraft-server-infrastructure


Edit SELinux context for ssh if you want to bind it to a custom port:

```bash
semanage port -a -t ssh_port_t -p tcp 45678
```
