# Increase Nginx limits to handle high concurrent requests.

exec { 'set-nginx-worker-rlimit':
  command => "/bin/sed -i '/^worker_processes/a worker_rlimit_nofile 65536;' /etc/nginx/nginx.conf",
  unless  => "/bin/grep -q '^worker_rlimit_nofile 65536;' /etc/nginx/nginx.conf",
  notify  => Exec['restart-nginx'],
}

exec { 'set-nginx-worker-connections':
  command => "/bin/sed -i 's/worker_connections [0-9]*;/worker_connections 4096;/' /etc/nginx/nginx.conf",
  unless  => "/bin/grep -q 'worker_connections 4096;' /etc/nginx/nginx.conf",
  notify  => Exec['restart-nginx'],
}

exec { 'restart-nginx':
  command     => '/bin/bash -c "ulimit -n 65536 && service nginx restart"',
  refreshonly => true,
}

service { 'nginx':
  ensure => running,
  enable => true,
}
