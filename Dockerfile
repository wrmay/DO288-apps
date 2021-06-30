FROM ubi:8.0
ENV DOCROOT=/var/www/html

RUN yum install -y --no-docs --disable-plugin=subscription-manager httpd && \
    yum clean all --disable-plugin=subscription-manager -y && \
    echo "Hello World!" > ${DOCROOT}/index.html 

ONBUILD COPY src/ ${DOCROOT}/

EXPOSE 80

RUN rm -rf /run/httpd && mkdir /run/httpd 

USER root

CMD /usr/sbin/httpd -DFOREGROUND 
