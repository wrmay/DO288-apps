# s2i-httpd
FROM registry.access.redhat.com/ubi8/ubi:8.0 

LABEL component=httpd \
      name=s2i-httpd \
      version="1.0" \
      release="1"

LABEL io.k8s.description="Apache httpd server based s2i builder image based on ubi8" \
      io.k8s.display-name="Apache httpd server based s2i builder" \
      io.openshift.expose-services="8080:http" \
      io.openshift.s2i.scripts-url=image:///usr/libexec/s2i 

LABEL io.openshift.tags="builder,httpd"

ENV DOCROOT /var/www/html

RUN yum install -y --nodocs --disableplugin=subscription-manager httpd && \
    yum clean all --disableplugin=subscription-manager -y && \
    echo "This is the default index page from the builder image." > ${DOCROOT}/index.html 

RUN sed -i "s/Listen 80/Listen 8080/g" /etc/httpd/conf/httpd.conf 


COPY ./s2i/bin/ /usr/libexec/s2i

# TODO: Drop the root user and make the content of /opt/app-root owned by user 1001
# RUN chown -R 1001:1001 /opt/app-root

USER 1001

EXPOSE 8080

CMD ["/usr/libexec/s2i/usage"]
