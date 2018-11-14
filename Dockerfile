FROM centos:centos7

# install all dependencies

RUN mkdir -p /root/smartshopping/go/smartmat-system-api/scripts/ \
 && yum -y update \
 && yum -y install git gcc-c++ make wget openssl-devel ImageMagick ImageMagick-devel ImageMagick-perl pcre-devel gd-devel

#ADD scripts/* /root/smartshopping/go/smartmat-system-api/scripts/

# install golang (version 1.10.2)

RUN wget https://dl.google.com/go/go1.10.2.linux-amd64.tar.gz \
 && tar -xzf go1.10.2.linux-amd64.tar.gz \
 && mv go /usr/local \
 && rm -f go1.10.2.linux-amd64.tar.gz

ENV GOROOT=/usr/local/go
ENV GOPATH=/var/www/mat_admin_system
ENV GOBIN=/var/www/mat_admin_system/bin
ENV PATH=$GOBIN:$GOPATH/bin:$GOROOT/bin:$PATH

# install nginx compiled version

RUN groupadd nginx \
 && useradd -g nginx nginx \
 && usermod -s /bin/false nginx

WORKDIR /root
ADD nginx/nginx.sh .
RUN bash nginx.sh \
 && rm -rf nginx.sh work/

ADD nginx/nginx.conf /etc/nginx/
ADD nginx/*.smartmat.jp.conf /etc/nginx/conf.d/

EXPOSE 80

ENTRYPOINT /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
#        && bash /root/smartshopping/go/smartmat-system-api/scripts/stop.sh \
#        && bash /root/smartshopping/go/smartmat-system-api/scripts/start.sh

###
