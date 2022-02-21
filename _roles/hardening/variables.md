---
layout: default
title: Variables
parent: Hardening
grand_parent: Roles
nav_order: 3
---
# vfricou.hardening role variables
{: .no_toc .text-delta }

## Table of contents
{: .no_toc .text-delta }

1. TOC 
{:toc}

---
# Role wide variable

| Variable            | Type    | Default value  | Description                                 |
|---------------------|---------|----------------|---------------------------------------------|
| `openssh_config`    | boolean | `true`         | Activate OpenSSH server configuration tasks |
| `kernel_hardening`  | boolean | `true`         | Activate kernel hardening tasks             |
| `network_hardening` | boolean | `true`         | Activate network hardening tasks            |

# Configuration variables

## OpenSSH

| Variable                            | Type    | Default value                           | Description                                                              |
|-------------------------------------|---------|-----------------------------------------|--------------------------------------------------------------------------|
| `sshd_listen_port`                  | integer | `22`                                    | SSH daemon listening port                                                |
| `sshd_listen_address`               | array   | `['0.0.0.0']`                           | SSH daemon listen addresses                                              |
| `sshd_address_familly`              | String  | `'any'`                                 | SSH daemon listen address familly                                        |
| `sshd_ciphers`                      | Array   | See [Ciphers listing](#ciphers_listing) | Allowed ciphers for client connection                                    |
| `sshd_macs`                         | Array   | See [Ciphers listing](#ciphers_listing) | Allowed MACs for client connection                                       |
| `sshd_kexalgorithm`                 | Array   | See [Ciphers listing](#ciphers_listing) | Allowed KexAlgorithm for client connection                               |
| `sshd_compression`                  | String  | `'yes'`                                 | Activate compression                                                     |
| `sshd_syslogfacility`               | String  | `'AUTH'`                                | SSH syslog facility identifier                                           |
| `sshd_loglevel`                     | String  | `'INFO'`                                | SSH log level configuration                                              |
| `sshd_logingracetime`               | Int     | `120`                                   | Auth wait time in seconds                                                |
| `sshd_permitrootlogin`              | String  | `'prohibit-password'`                   | Root login methods                                                       |
| `sshd_auth_maxtries`                | Int     | `3`                                     | Max auth tries before disconnection                                      |
| `sshd_sessions`                     | Int     | `1`                                     | Max simultaneous sessions for same user                                  |
| `sshd_auth_pubkey`                  | String  | `'yes'`                                 | Allow public key authentication method activation                        |
| `sshd_auth_hostbased`               | String  | `'no'`                                  | Allow host based authentication method activation                        |
| `sshd_auth_password`                | String  | `'no'`                                  | Allow password authentication method activation                          |
| `sshd_auth_emptypassword`           | String  | `'no'`                                  | Allow empty password for authentication                                  |
| `sshd_auth_challengeresponse`       | String  | `'no'`                                  | Challenge response authentication method activation                      |
| `sshd_kerberos_enabled`             | Boolean | `false`                                 | Kerberos authentication method activation                                |
| `sshd_krb5_or_local_password`       | String  | `'yes'`                                 | Allow kerberos or local password if kerberos authentication is activated |
| `sshd_krb5_ticket_cleanup`          | String  | `'yes'`                                 | Allow kerberos ticket cleanup if kerberos authentication is activated    |
| `sshd_krb5_get_afs_token`           | String  | `'no'`                                  | Allow kerberos afs token if kerberos authentication is activated         |
| `sshd_gssapi_enabled`               | Boolean | `false`                                 | GSSAPI authentication method activation                                  |
| `sshd_gssapi_cleanup`               | String  | `'yes'`                                 | GSSAPI cleanup                                                           |
| `sshd_gssapi_strict_acceptor_check` | String  | `'yes'`                                 | GSSAPI strict acceptor check                                             |
| `sshd_gssapi_key_exchange`          | String  | `'no'`                                  | Allow GSSAPI key exchange                                                |
| `sshd_use_pam`                      | String  | `'yes'`                                 | Allow sshd to use pam for authentication                                 |
| `sshd_allow_agent_forwarding`       | String  | `'no'`                                  | Allow to forward ssh agent data                                          |
| `sshd_allow_tcp_forwarding`         | String  | `'no'`                                  | Allow tcp forwarding                                                     |
| `sshd_x11_forwarding`               | String  | `'no'`                                  | Allow X11 forwarding                                                     |
| `sshd_x11_display_offset`           | String  | `'10'`                                  | X11 forward display offset if X11 forwarding is activated                |
| `sshd_x11_use_localhost`            | String  | `'yes'`                                 | Define if X11 use localhost display if X11 forwarding is activated       |
| `sshd_permit_tty`                   | String  | `'yes'`                                 | Allow users to get TTY                                                   |
| `sshd_permit_motd`                  | String  | `'no'`                                  |                                                                          |
| `sshd_print_lastlog`                | String  | `'yes'`                                 | Print lastlog information at connection                                  |
| `sshd_tcp_keepalive`                | String  | `'yes'`                                 | Perform tcp keepalive to maintain open connections                       |
| `sshd_permit_user_environment`      | String  | `'no'`                                  | Allow to ship user local environment at connection                       |
| `sshd_use_dns`                      | String  | `'no'`                                  |                                                                          |
| `sshd_permit_tunnel`                | String  | `'no'`                                  | Allow to open tunnels                                                    |
| `sshd_enable_sftp`                  | Boolean | `true`                                  | Activate sftp subsystem                                                  |
| `sshd_banner_path`                  | String  | Not defined                             | SSH banner file displayed at connection                                  |

Another variable is usable, but not declared in previous table.  
This could be used to declare `Match` configuration in `sshd_config`.

Examples :
_User matching :_

```yaml
matchs:
  user:
    catch: root
		options:
      - 'PubkeyAuthentication yes'
      - 'PermitRootLogin prohibit-password'
```

_Group matching :_

```yaml
matchs:
  group:
    catch: sshpassusers
		options:
      - 'PasswordAuthentication yes'
```

_Host matching :_

```yaml
matchs:
  host:
    catch: '192.168.0.20'
		options:
      - 'PubkeyAuthentication yes'
      - 'PermitRootLogin prohibit-password'
```

_Address matching :_

```yaml
matchs:
  address:
    catch: '192.168.0.0/24'
		options:
      - 'PubkeyAuthentication yes'
      - 'PasswordAuthentication yes'
```

### Ciphers listings

`sshd_ciphers`:
- `'chacha20-poly1305@openssh.com'`
- `'aes256-gcm@openssh.com'`
- `'aes256-ctr'`

`sshd_macs` :
- `'hmac-sha2-512-etm@openssh.com'`
- `'hmac-sha2-256-etm@openssh.com'`
- `'umac-128-etm@openssh.com'`
- `'hmac-sha2-512'`
- `'hmac-sha2-256'`
- `'umac-128@openssh.com'`

`sshd_kexalgorithm`:
- `'curve25519-sha256@libssh.org'`
- `'ecdh-sha2-nistp521'`
- `'ecdh-sha2-nistp384'`
- `'ecdh-sha2-nistp256'`
- `'diffie-hellman-group-exchange-sha256'`

## Hardening

For each variable see sysctl endpoint impact to known which sysctl endpoint is modified

### Kernel and related

| Variable                            | Type    | Default value | Description                                               |
|-------------------------------------|---------|---------------|-----------------------------------------------------------|
| `hard_kernel_self_protection`       | integer | 1             | Activate kernel self protection.                          |
| `hard_kernel_dmesg_restrict`        | integer | 1             | Restrict dmesg view to CAP_SYSLOG capability              |
| `hard_kernel_disable_unpriv_bpf`    | integer | 1             | Restrict eBPF calls to CAP_BPF/CAP_SYS_ADMIN capability   |
| `hard_net_disable_unpriv_bpf`       | integer | 2             | Restrict BPF jit on network                               |
| `hard_dev_enable_ldisc_autoload`    | integer | 0             | Restrict line discipline to CAP_SYS_MODULE capability     |
| `hard_vm_enable_unpriv_userfaultfd` | integer | 0             | Restrict syscall userfaultfd to CAP_SYS_PTRACE capability |
| `hard_kernel_disable_kexec`         | integer | 1             | Disable kexec functionnality to hot switch kernel         |
| `hard_kernel_sysrq`                 | integer | 4             | Configure sysrq capability                                |

#### Sysctl endpoint impact

| Variable                            | Endpoint                           |
|-------------------------------------|------------------------------------|
| `hard_kernel_self_protection`       | `kernel.kptr_restrict`             |
| `hard_kernel_dmesg_restrict`        | `kernel.dmesg_restrict`            |
| `hard_kernel_disable_unpriv_bpf`    | `kernel.unprivileged_bpf_disabled` |
| `hard_net_disable_unpriv_bpf`       | `net.core.bpf_jit_harden`          |
| `hard_dev_enable_ldisc_autoload`    | `dev.tty.ldisc_autoload`           |
| `hard_vm_enable_unpriv_userfaultfd` | `vm.unprivileged_userfaultfd`      |
| `hard_kernel_disable_kexec`         | `kernel.kexec_load_disabled`       |
| `hard_kernel_sysrq`                 | `kernel.sysrq`                     |

### Network

| Variable                            | Type     | Default value | Description                                                             |
|-------------------------------------|----------|---------------|-------------------------------------------------------------------------|
| `hard_net_tcp_syncookies`           | integer  | 1             | Activate TCP SYN cookie to prevent SYN flood attack                     |
| `hard_net_tcp_rfc1337`              | integer  | 1             | Force dropping connection in TIME-WAIT state. Protection for RST attack |
| `hard_net_pkt_validation`           | integer  | 1             | Force packet source validation to prevent IP spoofing                   |
| `hard_net_accept_icmp_redirect`     | integer  | 0             | Accept ICMP redirect acceptance and sending                             |
| `hard_net_ignore_icmp_echo`         | integer  | 0             | Configuration to accept or deny ICMP echo request                       |
| `hard_net_allow_source_routing`     | integer  | 0             | Allow source routing                                                    |
| `hard_net_allow_ra`                 | integer  | 0             | Allow router advertisement                                              |
| `hard_net_allow_extended_ack`       | integer  | 0             | Allow extended ACK states (FACK, SACK and DSACK)                        |
| `hard_net_allow_ip_forward`         | integer  | 0             | Allow ip forwarding through interfaces                                  |
| `hard_net_allow_reverse_path`       | integer  | 0             | Disallow reverse path                                                   |
| `hard_net_log_martians`             | integer  | 1             | Allow martians packets logging                                          |
| `hard_net_ignore_icmp_not_rfc1122`  | integer  | 1             | Ignore non RFC1122 ICMP packets                                         |
| `hard_net_ephemeral_port_range`     | string   | '32768 65535' | Specify ephemeral port range                                            |
| `hard_net_allow_rs`                 | integer  | 0             | Allow router solicitation support                                       |
| `hard_net_allow_ra_rtr_pref`        | integer  | 0             | Allow router preferences from router advertisement                      |
| `hard_net_allow_ra_prefix_autoconf` | integer  | 0             | Allow prefix autoconfiguration from RA                                  |
| `hard_net_allow_ra_defroute`        | integer  | 0             | Allow router advertisement default route                                |
| `hard_net_allow_ra_autoconf`        | integer  | 0             | Allow router advertisement autoconfiguration                            |

#### Sysctl endpoint impact

| Variable                            | Endpoint                                     |
|-------------------------------------|----------------------------------------------|
| `hard_net_tcp_syncookies`           | `net.ipv4.tcp_syncookies`                    |
| `hard_net_tcp_rfc1337`              | `net.ipv4.tcp_rfc1337`                       |
| `hard_net_pkt_validation`           | `net.ipv4.conf.all.rp_filter`                |
|                                     | `net.ipv4.conf.default.rp_filter`            |
| `hard_net_accept_icmp_redirect`     | `net.ipv4.conf.all.accept_redirects`         |
|                                     | `net.ipv4.conf.default.accept_redirects`     |
|                                     | `net.ipv4.conf.all.secure_redirects`         |
|                                     | `net.ipv4.conf.default.secure_redirect`      |
|                                     | `net.ipv4.conf.all.send_redirects`           |
|                                     | `net.ipv4.conf.default.send_redirects`       |
|                                     | `net.ipv6.all.accept_redirects`              |
|                                     | `net.ipv6.default.accept_redirects`          |
| `hard_net_ignore_icmp_echo`         | `net.ipv4.icmp_echo_ignore_all`              |
| `hard_net_allow_source_routing`     | `net.ipv4.conf.all.accept_source_route`      |
|                                     | `net.ipv4.default.accept_source_route`       |
|                                     | `net.ipv6.all.accept_source_route`           |
|                                     | `net.ipv6.default.accept_source_route`       |
| `hard_net_allow_ra`                 | `net.ipv6.conf.all.accept_ra`                |
|                                     | `net.ipv6.conf.default.accept_ra`            |
| `hard_net_allow_extended_ack`       | `net.ipv4.tcp_sack`                          |
|                                     | `net.ipv4.tcp_dsack`                         |
|                                     | `net.ipv4.tcp_fack`                          |
| `hard_net_allow_ip_forward`         | `net.ipv4.ip_forward`                        |
| `hard_net_allow_reverse_path`       | `net.ipv4.conf.all.rp_filter`                |
|                                     | `net.ipv4.conf.default.rp_filter`            |
| `hard_net_log_martians`             | `net.ipv4.conf.all.log_martians`             |
| `hard_net_ignore_icmp_not_rfc1122`  | `net.ipv4.icmp_ignore_bogus_error_responses` |
| `hard_net_ephemeral_port_range`     | `net.ipv4.ip_local_port_range`               |
| `hard_net_allow_rs`                 | `net.ipv6.conf.all.router_solicitations`     |
|                                     | `net.ipv6.conf.default.router_solicitations` |
| `hard_net_allow_ra_rtr_pref`        | `net.ipv6.conf.all.accept_ra_rtr_pref`       |
|                                     | `net.ipv6.conf.default.accept_ra_rtr_pref`   |
| `hard_net_allow_ra_prefix_autoconf` | `net.ipv6.conf.all.accept_ra_pinfo`          |
|                                     | `net.ipv6.conf.default.accept_ra_pinfo`      |
| `hard_net_allow_ra_defroute`        | `net.ipv6.conf.all.accept_ra_defrtr`         |
|                                     | `net.ipv6.conf.default.accept_ra_defrtr`     |
| `hard_net_allow_ra_autoconf`        | `net.ipv6.conf.all.autoconf`                 |
|                                     | `net.ipv6.conf.default.autoconf`             |
