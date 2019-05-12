# MySQL container for local development

FROM mysql:5.7@sha256:196fe3e00d68b2417a8cf13482bdab1fcc2b32cf7c7575d0906c700688b352b4
LABEL MAINTAINER="Max Milton <max@wearegenki.com>"

# Allow external access
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Unset SUID on all files
RUN for i in $(find / -perm /6000 -type f); do chmod a-s $i; done

