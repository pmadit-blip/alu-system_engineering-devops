# SSH

This project covers connecting to a server securely with SSH.

## Files

| File | Description |
|------|-------------|
| `0-use_a_private_key` | Bash script that connects to a server as `ubuntu` using the private key `~/.ssh/school` |
| `1-create_ssh_key_pair` | Bash script that creates a 4096-bit RSA key pair named `school`, protected by a passphrase |
| `100-puppet_ssh_config.pp` | Puppet manifest that configures the SSH client to use `~/.ssh/school` and refuse password authentication |
