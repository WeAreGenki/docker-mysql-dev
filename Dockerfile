# MySQL container for local development

FROM mysql:8.0.17@sha256:2e4114bdc9dd797549f6df0cffb5f6cb6354bef9d96223a5935b6b17aea03840
LABEL MAINTAINER="Max Milton <max@wearegenki.com>"

# Allow external access
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Unset SUID on all files
RUN for i in $(find / -perm /6000 -type f); do chmod a-s $i; done

