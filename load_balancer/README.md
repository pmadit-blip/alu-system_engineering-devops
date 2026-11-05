# Load Balancer

## Task 0: Double the Number of Web Servers

### Objective

Configure two Ubuntu web servers using Nginx and add a custom HTTP response header to identify which server responds to an HTTP request.

### Requirements

- Install Nginx on both web servers.
- Configure the custom HTTP response header `X-Served-By`.
- Set the header value to the hostname of the server.
- Create an automated Bash script named `0-custom_http_response_header`.
- Ensure the script can configure a brand-new Ubuntu machine.

### Web Servers

| Server | Hostname | Public IP |
|---|---|---|
| Web server 1 | 7335-web-01 | 35.179.77.152 |
| Web server 2 | 7335-web-02 | 18.133.238.148 |

### Expected HTTP Response Headers

Web server 1:

```text
X-Served-By: 7335-web-01
```

Web server 2:

```text
X-Served-By: 7335-web-02
```

### Testing

Run these commands to verify the custom headers:

```bash
curl -sI http://35.179.77.152 | grep X-Served-By

curl -sI http://18.133.238.148 | grep X-Served-By
```

### Files

```text
load_balancer/
├── README.md
└── 0-custom_http_response_header
```

### Technologies

- Ubuntu Linux
- Nginx
- Bash scripting
- Git and GitHub
## Task 1: Install Your Load Balancer

### Objective
Install and configure HAProxy to distribute HTTP traffic between two Nginx web servers.

### Configuration
- Load balancer: 7335-lb-01
- Load balancer IP: 35.177.104.53
- Web server 1: 35.179.77.152
- Web server 2: 18.133.238.148
- Algorithm: Round-robin
- Listening port: 80

### Testing
```bash
curl -sI http://35.177.104.53
sudo service haproxy status
