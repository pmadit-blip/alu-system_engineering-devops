# Web Stack Debugging 3

## Task: Strace Is Your Friend

### Problem
Apache was returning `500 Internal Server Error` when accessing the local web server.

### Investigation
Used `strace` to trace Apache's file operations and identify missing-file errors.

The investigation revealed an incorrect filename in:

`/var/www/html/wp-settings.php`

The file was referenced as `class-wp-locale.phpp`, but the correct filename is `class-wp-locale.php`.

### Solution
Created a Puppet manifest named `0-strace_is_your_friend.pp` to correct the filename automatically.

### Verification
After applying the Puppet manifest:

- Confirmed the WordPress filename was corrected.
- Tested the local web server using `curl`.
- Expected response: HTTP 200 OK.

### Files
- `0-strace_is_your_friend.pp` — Puppet manifest that fixes the WordPress filename.
