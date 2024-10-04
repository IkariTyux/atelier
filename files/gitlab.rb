# Site url/domain
external_url "https://atelier.local"
registry_external_url "https://atelier.local:5050"

# SSL Config
## Main site
letsencrypt['enable'] = false
nginx['ssl_certificate'] = "/etc/gitlab/ssl/cert.crt"
nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/cert.key"

## Gitlab Container Registry
registry_nginx['ssl_certificate'] = "/etc/gitlab/ssl/cert.crt"
registry_nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/cert.key"
