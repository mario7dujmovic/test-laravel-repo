FROM ubuntu:22.04
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install make php8.1 php8.1-dom php8.1-mbstring -y
RUN rm /var/www/html/index.html
COPY . /var/www/html/
COPY .env .env
COPY start.sh start.sh
RUN chown www-data:www-data start.sh
RUN chmod 777 start.sh
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html
RUN make /var/www/html
#RUN service apache2 start
CMD ["apache2ctl", "-D", "FOREGROUND"]
#ENTRYPOINT ["/bin/bash", "-c", "/start.sh", "-s"]
#CMD python /app/app.py