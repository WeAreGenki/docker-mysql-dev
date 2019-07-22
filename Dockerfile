# MySQL container for local development

FROM mysql:8.0.17@sha256:b1b2c176a45f4ff6875d0d7461fe1fdd8606deb015b38b69545f72de97714efd
LABEL MAINTAINER="Max Milton <max@wearegenki.com>"

# Allow external access
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Unset SUID on all files
RUN for i in $(find / -perm /6000 -type f); do chmod a-s $i; done

