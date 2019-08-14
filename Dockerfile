# MySQL container for local development

FROM mysql:8.0.17@sha256:01cf53f2538aa805bda591d83f107c394adca8d31f98eacd3654e282dada3193
LABEL MAINTAINER="Max Milton <max@wearegenki.com>"

# Allow external access
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Unset SUID on all files
RUN for i in $(find / -perm /6000 -type f); do chmod a-s $i; done

