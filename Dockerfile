FROM ubuntu:22.04
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install make git zip unzip php8.1 php8.1-dom php8.1-mbstring php8.1-curl php8.1-zip php8.1-mysql -y
RUN rm /var/www/html/index.html
COPY . /var/www/html/
COPY ups-mon.conf /etc/apache2/sites-enabled/
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html
RUN chmod -R 775 /var/www/html/storage/logs
RUN make /var/www/html

ENTRYPOINT ["/bin/bash", "-c", "/var/www/html/start.sh", "-s"]
