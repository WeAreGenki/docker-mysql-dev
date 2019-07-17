# MySQL container for local development

FROM mysql:8.0.16@sha256:5d11283aee9b73509b737785e0ad79a2d9abf51f4abf3f221702a8add0e36bf2
LABEL MAINTAINER="Max Milton <max@wearegenki.com>"

# Allow external access
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Unset SUID on all files
RUN for i in $(find / -perm /6000 -type f); do chmod a-s $i; done

