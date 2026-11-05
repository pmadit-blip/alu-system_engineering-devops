# ALU System Engineering & DevOps

## Project: Load Balancer

This project focuses on configuring web servers and preparing them to work behind a load balancer using Nginx.

### Task 0: Double the Number of Web Servers

**Objective**

Configure two Ubuntu web servers with Nginx and add a custom HTTP response header to identify which server handles each request.

**Requirements**

- Install and configure Nginx.
- Add the custom HTTP response header `X-Served-By`.
- Set the header value to the hostname of the server.
- Create an automated Bash script named `0-custom_http_response_header`.
- Ensure the script can configure a new Ubuntu server.

**Servers**

| Server | Hostname |
|---|---|
| Web server 1 | 7335-web-01 |
| Web server 2 | 7335-web-02 |

**Custom HTTP Header**

Web server 1:
`X-Served-By: 7335-web-01`

Web server 2:
`X-Served-By: 7335-web-02`

**Testing**

Use the following commands to verify the response headers:

```bash
curl -sI http://35.179.77.152 | grep X-Served-By
curl -sI http://18.133.238.148 | grep X-Served-By
```

**Directory Structure**

```text
alu-system_engineering-devops/
├── README.md
└── load_balancer/
    └── 0-custom_http_response_header
```


