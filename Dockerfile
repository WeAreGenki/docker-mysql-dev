# MySQL container for local development

FROM mysql:5.7@sha256:f568db3bdc3226cc28e4b148e6b9fd4e68d9c42e97a82be671bbe9eeb37ab1d5
LABEL MAINTAINER="Max Milton <max@wearegenki.com>"

# Allow external access
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Unset SUID on all files
RUN for i in $(find / -perm /6000 -type f); do chmod a-s $i; done

