# Configure Nginx to handle high concurrent requests.

exec { 'set-nginx-worker-rlimit':
  command => [
    '/bin/sed',
    '-i',
    '/^[[:space:]]*worker_rlimit_nofile[[:space:]]/d; /^worker_processes/a worker_rlimit_nofile 65536;',
    '/etc/nginx/nginx.conf',
  ],
  unless  => '/bin/grep -q "^worker_rlimit_nofile 65536;" /etc/nginx/nginx.conf',
  notify  => Exec['restart-nginx'],
}

exec { 'set-nginx-worker-connections':
  command => [
    '/bin/sed',
    '-i',
    's/^[[:space:]]*worker_connections [0-9]*;/    worker_connections 4096;/',
    '/etc/nginx/nginx.conf',
  ],
  unless  => '/bin/grep -q "worker_connections 4096;" /etc/nginx/nginx.conf',
  notify  => Exec['restart-nginx'],
}

exec { 'restart-nginx':
  command     => '/usr/sbin/service nginx restart',
  refreshonly => true,
}

service { 'nginx':
  ensure => running,
  enable => true,
}
