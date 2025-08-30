## Give me wildcard certs via DNS

You can use these scripts with docker container to obtain and keep up-to-date wildcard type certificates.

> #### DNS services support:
>
> - https://cloudflare.com
> - https://cloudnetip.com

### How to launch:

1. Clone this repo and goto folder

```sh
git clone https://github.com/oxmix/give-me-cert.git && cd give-me-cert
```

2. Set up environment

```ini
cat > .env <<EOF

# set up your domain
DOMAIN=my-domain.com

# set up subdomains of for your domain
DOMAINS_WILDCARD=*.my-domain.com,one.two.my-domain.com,*.three.my-domain.com

# select dns service: cloudflare or cloudnetip
DNS_SERVICE=cloudflare

# not necessary: if no set then used placeholder@{DOMAIN}
EMAIL_OWNER_DOMAIN=

# not necessary: creating dhparam.key (long time execution, need wait)
CREATE_DHPARAM=false

# ----------

# if use cloudflare dns service then set up these credentials
DNS_CF_ACCOUNT=account email of cloudflare

# where obtain: open https://dash.cloudflare.com/profile/api-tokens -> copy Global API Key
DNS_CF_KEY=...hash...

# where obtain: open https://dash.cloudflare.com/ -> open your domain -> click tab overview -> right column below -> copy Zone ID
DNS_CF_ZONE=...hash...

# ----------

# if use cloudnetip dns service then set up these credentials
# where obtain: https://cloudnetip.com/dns -> copy Key
DNS_NETIP_KEY=...hash...

EOF
```

3. Next, start the service `./run`

> After that, the certificates will appear in the ./certs folder, and the service will automatically keep them up to date
> 
> Checks validity every 6 hours and signs if 10 days remain
>
> Key: `./certs/domain.key`
> 
> Pub: `./certs/domain.pem`
>
> DHParam: `./certs/dhparam.key` (if exist)

---

### How to reinit when changed `DOMAIN` or `DOMAINS_WILDCARD`:

1. goto `cd give-me-cert`
2. edit `nano .env`
3. exec `rm certs/domain.pem`
4. exec `./run`

---

### How to hard reset:

1. goto `cd give-me-cert`
2. exec `rm certs/*`
3. exec `./run`
