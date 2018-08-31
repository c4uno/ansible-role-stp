# Ansible Role: STP

[![Build Status](https://travis-ci.org/geerlingguy/ansible-role-git.svg?branch=master)](https://travis-ci.org/geerlingguy/ansible-role-git)

It install Cisco's AnyConnect VPN and, optionally, a script to monitoring the VPN is always connected. It was specially create to STP Mexico. Only tested in Ubuntu 16.04 LTS.

## Requirements

None.

## Role Variables

You can see the last value variables in `defaults/main.yml`

```yaml

stp_host: vpn.stpmex.com
stp_username: c4uno
stp_password: secret
stp_ip: 1.2.3.4
stp_domain: prod.stpmex.com
stp_vpn_command: /opt/cisco/anyconnect/bin/vpn
stp_vpn_script: /usr/local/bin/vpn.sh
stp_monitoring_vpn_refresh_time: 30

```

If you need to the VPN is always run then you can use the role `oefenweb.supervisor` and add the following entry

```yaml
supervisor_programs_present:
  stp-vpn:
    command: '{{ stp_vpn_script }}'
    autostart: true
    autorestart: true
    startretries: 3
    stdout_logfile: '/var/log/{{ subdomains.spei}}.stp-vpn.log'
    stdout_logfile_maxbytes: 0
    stderr_logfile: '/var/log/{{ subdomains.spei}}.stp-vpn-error.log'
    stderr_logfile_maxbytes: 0
    user: root
    numprocs: 1
    process_name: '%(program_name)s-%(process_num)s'
```

## Dependencies

None.

## Example Playbook

    - hosts: servers
      roles:
        - { role: c4uno.stp }

## License

MIT / BSD

## Author Information

This role was created in 2018 by [Victor Aguilar](https://pollin14.io/) for Comunidad 4uno.
