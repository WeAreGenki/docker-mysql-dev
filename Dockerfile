# MySQL container for local development

FROM mysql:5.7
LABEL MAINTAINER="Max Milton <max@wearegenki.com>"

# Allow external access
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Unset SUID on all files
RUN for i in $(find / -perm /6000 -type f); do chmod a-s $i; done

