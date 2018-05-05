# MySQL container for local development

FROM mysql:5.7@sha256:f030e84582d939d313fe2ef469b5c65ffd0f7dff3b4b98e6ec9ae2dccd83dcdf
LABEL MAINTAINER="Max Milton <max@wearegenki.com>"

# Allow external access
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Unset SUID on all files
RUN for i in $(find / -perm /6000 -type f); do chmod a-s $i; done

