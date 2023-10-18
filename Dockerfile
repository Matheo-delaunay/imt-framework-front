FROM ubuntu:22.04

# Prerequisites
RUN apt-get update && apt-get install -y unzip xz-utils git openssh-client curl wget && apt-get upgrade -y && rm -rf /var/cache/apt

WORKDIR /usr/src
RUN mkdir flutter
RUN cd flutter
# Install flutter beta
RUN wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.4-stable.tar.xz
RUN tar xf flutter_linux_3.10.4-stable.tar.xz -C ./

ENV PATH "$PATH:/usr/src/flutter/bin"
RUN git config --global --add safe.directory /usr/src/flutter
# Run flutter doctor
RUN flutter doctor

# Enable flutter web
RUN flutter channel master
RUN flutter config --enable-web

# Copy files to container and build
RUN mkdir /app/
COPY . /app/
WORKDIR /app/
RUN flutter build web

# Record the exposed port
EXPOSE 5000

# make server startup script executable and start the web server
RUN ["chmod", "+x", "/app/server/server.sh"]

ENTRYPOINT [ "/app/server/server.sh"]