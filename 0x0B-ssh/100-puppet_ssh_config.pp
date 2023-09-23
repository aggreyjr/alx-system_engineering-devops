#!/usr/bin/env bash
# connecting to server with no password with the requirements:
#+ SSH client configuration must be configured to use the private key ~/.ssh/school
#+ SSH client configuration must be configured to refuse to authenticate using a password

include stdlib

file_line { 'Turn off passwd auth':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => '    PasswordAuthentication no',
  replace => true,
}

file_line { 'Delare identity file':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => '     IdentityFile ~/.ssh/school',
  replace => true,
}
