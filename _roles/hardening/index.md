---
layout: default
title: Hardening
parent: Roles
nav_order: 2
has_children: true
---

# Hardening role

This ansible role is designed to perform postinstall hardening configurations.  
It was designed to setup hardened SSH server, and to configure lots on kernel features to get a protected OS.

This role could be user with tag `configure` to run on already deployed systems.  
Warning: The pure kernel hardening section could be cause non stable state on systems. Ensure to perform full test 
on your environment before apply this in production.

## Role parts

This role is multiparted to could be split or used separately.

Refer to [Role wide variable](../variables#role-wide-variable) to use wanted part on this role.
