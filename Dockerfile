# MySQL container for local development

FROM mysql:5.7@sha256:0350f9443e138839b9bf5c7d22ceed374a6f80e21ae4dcd1853d102ee1182f43
LABEL MAINTAINER="Max Milton <max@wearegenki.com>"

# Allow external access
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Unset SUID on all files
RUN for i in $(find / -perm /6000 -type f); do chmod a-s $i; done

