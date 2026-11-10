# Configure Nginx to handle high concurrent requests.

exec { 'set-nginx-worker-rlimit':
  command => '/bin/sed -i "/^worker_processes/a worker_rlimit_nofile 65536;" /etc/nginx/nginx.conf',
  unless  => '/bin/grep -q "^worker_rlimit_nofile 65536;" /etc/nginx/nginx.conf',
}

exec { 'set-nginx-worker-connections':
  command => '/bin/sed -i "s/worker_connections [0-9]*;/worker_connections 4096;/" /etc/nginx/nginx.conf',
  unless  => '/bin/grep -q "worker_connections 4096;" /etc/nginx/nginx.conf',
}

service { 'nginx':
  ensure => running,
  enable => true,
}

exec { 'restart-nginx':
  command => '/usr/sbin/service nginx restart',
  require => [
    Exec['set-nginx-worker-rlimit'],
    Exec['set-nginx-worker-connections'],
    Service['nginx'],
  ],
}
