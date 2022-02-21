---
layout: default
title: Tags
parent: Hardening
grand_parent: Roles
nav_order: 3
---
# vfricou.hardening role tags
{: .no_toc .text-delta }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

# Install

The tag `install` execute some tasks on remote hosts.  
**This tasks couldn’t be repeated after first time.**

This tag will execute `configure` tags too

| Role part | Tasks                                                                                             |
|-----------|---------------------------------------------------------------------------------------------------|
| OpenSSH   | Delete existing host keys (rsa, ecdsa and ed25519)                                                |
|           | Generate new host keys (not on RHEL based systems)                                                |
|           | RSA: 4096 bits                                                                                    |
|           | ED25519: 256 bits                                                                                 |
|           | Activate services `ssh-keygen@rsa.service` and `ssh-keygen@ed25519.service` on RHEL based systems |

# Configure

| Role part         | Tasks                                                                                                  |
|-------------------|--------------------------------------------------------------------------------------------------------|
| OpenSSH           | Deploy `sshd_config` file according to declared variables                                              |
|                   | Deploy if declared ssh banner                                                                          |
|                   | Restart OpenSSH server daemon                                                                          |
| Kernel Hardening  | Setup lots of kernel functions to protect system (see [Variables](../variables#hardening))             |
| Network Hardening | Setup lots of network functions in kernel to protect system  (see [Variables](../variables#hardening)) |
