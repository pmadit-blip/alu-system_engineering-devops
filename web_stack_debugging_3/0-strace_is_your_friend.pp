
# Fix the incorrect WordPress locale filename causing Apache HTTP 500
exec { 'fix-wordpress-locale-filename':
  command => "/bin/sed -i 's/class-wp-locale.phpp/class-wp-locale.php/' /var/www/html/wp-settings.php",
  onlyif  => "/bin/grep -q 'class-wp-locale.phpp' /var/www/html/wp-settings.php",
}
