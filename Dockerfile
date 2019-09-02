# MySQL container for local development

FROM mysql:8.0.17@sha256:f0392b61ae096aef93b25f4b88206d774d2de1a7e43a7780a59a0c319c540b79
LABEL MAINTAINER="Max Milton <max@wearegenki.com>"

# Allow external access
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Unset SUID on all files
RUN for i in $(find / -perm /6000 -type f); do chmod a-s $i; done

