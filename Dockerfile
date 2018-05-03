# MySQL container for local development

FROM mysql:5.7@sha256:e3ce1b609c9275ed24afb3465a9dd73cce38385e64c94755edd5e596a5c1bc8c
LABEL MAINTAINER="Max Milton <max@wearegenki.com>"

# Allow external access
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Unset SUID on all files
RUN for i in $(find / -perm /6000 -type f); do chmod a-s $i; done

