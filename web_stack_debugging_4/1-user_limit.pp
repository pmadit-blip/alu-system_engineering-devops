# Configure file limits for the holberton user.

exec { 'change-os-configuration-for-holberton-user':
  command => '/bin/bash -c "sed -i \"/^holberton[[:space:]]\\+\\(soft\\|hard\\)[[:space:]]\\+nofile[[:space:]]/d\" /etc/security/limits.conf && printf \"holberton soft nofile 65536\\nholberton hard nofile 65536\\n\" >> /etc/security/limits.conf"',
  unless  => '/bin/grep -q "^holberton soft nofile 65536$" /etc/security/limits.conf && /bin/grep -q "^holberton hard nofile 65536$" /etc/security/limits.conf',
}
