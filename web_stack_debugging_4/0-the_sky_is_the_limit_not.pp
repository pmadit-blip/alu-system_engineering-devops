# Increase Nginx worker file limits to handle high concurrent requests.

exec { 'set-nginx-worker-file-limit':
  command => "/bin/sed -i '/^worker_processes/a worker_rlimit_nofile 65536;' /etc/nginx/nginx.conf && /bin/sed -i 's/worker_connections [0-9]*;/worker_connections 4096;/' /etc/nginx/nginx.conf && /usr/sbin/nginx -t",
  unless  => "/bin/grep -q '^worker_rlimit_nofile 65536;' /etc/nginx/nginx.conf && /bin/grep -q 'worker_connections 4096;' /etc/nginx/nginx.conf",
  notify  => Service['nginx'],
}

service { 'nginx':
  ensure => running,
  enable => true,
}
