FROM fedora:29

LABEL RUN='docker run -d -p 80:80 $IMAGE'

RUN mkdir /opt/origin-rpms && dnf install -y createrepo httpd && mkdir -p /var/www/html/rpms
COPY *.rpm /var/www/html/rpms/
RUN createrepo /var/www/html/rpms/ && ls /var/www/html/rpms/
EXPOSE 80
ADD run-apache.sh /run-apache.sh
RUN chmod -v +x /run-apache.sh

CMD ["/run-apache.sh"]
