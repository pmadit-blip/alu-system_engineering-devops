# Web Stack Debugging #2

## Task 0: Run software as another user

The `0-iamsomeoneelse` script runs the `whoami` command as a user supplied as an argument.

### Usage

```bash
./0-iamsomeoneelse www-data
```

### Example output

```text
www-data
```

The script uses `sudo -u` to execute a command as another user instead of running everything as root.
