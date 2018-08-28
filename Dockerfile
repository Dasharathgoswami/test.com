FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y apache2 
EXPOSE 8000 
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
COPY . /var/www/html/