# Set the open-file limits for the holberton user.

file { '/etc/security/limits.d/99-holberton-nofile.conf':
  ensure  => file,
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  content => "holberton soft nofile 65536\nholberton hard nofile 65536\n",
}
