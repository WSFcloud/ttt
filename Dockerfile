# syntax=docker/dockerfile:1

# Set Lab Environment
FROM debian:bookworm AS build

# Set the working directory
WORKDIR /tmp

# Update the source list
RUN cat <<EOF > /etc/apt/sources.list.d/debian.sources
Types: deb
URIs: http://mirrors.ustc.edu.cn/debian
Suites: bookworm bookworm-updates
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg

Types: deb
URIs: http://mirrors.ustc.edu.cn/debian-security
Suites: bookworm-security
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
EOF

# Update the package index
RUN apt update
