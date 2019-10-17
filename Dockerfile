# MySQL container for local development

FROM mysql:8.0.18@sha256:0491ecfc011cdebbd6c9bc2f5cd8fd0bd43f6e9b96caae96fb404eb00381068d
LABEL MAINTAINER="Max Milton <max@wearegenki.com>"

# Allow external access
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Unset SUID on all files
RUN for i in $(find / -perm /6000 -type f); do chmod a-s $i; done

