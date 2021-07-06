# s2i-httpd
FROM registry.access.redhat.com/rhscl/httpd-24-rhel7

LABEL component=httpd \
      name=s2i-httpd \
      version="1.0" \
      release="1"

LABEL io.k8s.description="Apache httpd server based s2i builder image based on rhscl/httpd-24-rhel7" \
      io.k8s.display-name="Apache httpd server based s2i builder" \
      io.openshift.expose-services="8080:http" \
      io.openshift.s2i.scripts-url=image:///usr/libexec/s2i 

LABEL io.openshift.tags="builder,httpd"

ENV DOCROOT /var/www/html

COPY ./s2i/bin/ /usr/libexec/s2i

# not doing SSL for this exercise
RUN rm /etc/httpd/conf.d/ssl.conf 

CMD ["/usr/libexec/s2i/usage"]
