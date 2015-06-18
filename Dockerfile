FROM ubuntu:trusty

#RUN DEBIAN_FRONTEND=noninteractive ;\
#	apt-get update && apt-get install -y wget

# Entry-Script
COPY /scripts/zarafa-init.sh /usr/local/bin/zarafa-init.sh

ADD http://download.zarafa.com/zarafa/drupal/download_platform.php?platform=beta/7.2/7.2.1-49597/zcp-7.2.1-49597-ubuntu-14.04-x86_64-forhome.tar.gz /tmp/zcp-7.2.1-49597-ubuntu-14.04-x86_64-forhome.tar.gz
RUN  tar xz /tmp/zcp-7.2.1-49597-ubuntu-14.04-x86_64-forhome.tar.gz -C /root/packages --strip-components=1

VOLUME ["/var/lib/mysql"]
VOLUME ["/var/lib/zarafa"]

# Expose Ports
EXPOSE 236 236
EXPOSE 237 237
EXPOSE 10080 80
EXPOSE 10443 443

# Set Entrypoint
ENTRYPOINT ["/usr/local/bin/zarafa-init.sh"]
