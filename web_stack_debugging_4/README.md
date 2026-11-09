# Web Stack Debugging 4

## Task 0: Sky is the limit

This task focuses on improving Nginx performance under high
concurrency by increasing the number of file descriptors
available to Nginx workers.

The Puppet manifest `0-the_sky_is_the_limit_not.pp`:

- Configures the Nginx worker file descriptor limit.
- Increases Nginx worker connections to 4096.
- Validates the Nginx configuration.
- Ensures the Nginx service is running and enabled.

## Task 1: User limit

This task focuses on adjusting operating system file limits
so that the holberton user can log in and open files without
receiving a "Too many open files" error.

The Puppet manifest is `1-user_limit.pp`.
