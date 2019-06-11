# MySQL container for local development

FROM mysql:8.0.16@sha256:415ac63da0ae6725d5aefc9669a1c02f39a00c574fdbc478dfd08db1e97c8f1b
LABEL MAINTAINER="Max Milton <max@wearegenki.com>"

# Allow external access
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Unset SUID on all files
RUN for i in $(find / -perm /6000 -type f); do chmod a-s $i; done

