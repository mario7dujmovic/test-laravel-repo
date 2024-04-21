FROM ubuntu:22.04
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install make php8.1 php8.1-dom php8.1-mbstring -y
RUN rm /var/www/html/index.html
COPY . /var/www/html/
RUN chown -R www-data:www-data /var/www/html
RUN chown -R root:root /var/www/html/start.sh
RUN chmod -R 755 /var/www/html
RUN make /var/www/html
#WORKDIR "/var/www/html"
#CMD ["apache2ctl", "-D", "FOREGROUND"]
RUN chmod a+x /var/www/html/start.sh
#makes my container exit
ENTRYPOINT ["/bin/bash", "-c", "/var/www/html/start.sh", "-s"]
#CMD ["apache2ctl", "-D", "FOREGROUND"]
