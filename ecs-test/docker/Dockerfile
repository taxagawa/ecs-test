FROM centos:centos7

# install all dependencies

RUN mkdir -p /var/www/
# && yum -y update \
# && yum -y install wget gcc-c++ make curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker autoconf ImageMagick ImageMagick-devel ImageMagick-perl pcre-devel gd-devel

# install latest git (2.14.4)

#RUN wget https://www.kernel.org/pub/software/scm/git/git-2.14.4.tar.gz \
# && tar vfx git-2.14.4.tar.gz

#WORKDIR git-2.14.4
#RUN make configure \
# && ./configure --prefix=/usr \
# && make all \
# && make install \
# && cd .. \
# && rm -rf git-2.14.4/ git-2.14.4.tar.gz

#WORKDIR /var/www
#RUN git clone https://6a054aa70fe3785baabd6113d375e8fa4aeda72d@github.com/SmartShopping/mat_admin_system.git

# install golang (version 1.10.2)

#RUN wget https://dl.google.com/go/go1.10.2.linux-amd64.tar.gz \
# && tar -xzf go1.10.2.linux-amd64.tar.gz \
# && mv go /usr/local \
# && rm -f go1.10.2.linux-amd64.tar.gz

#ENV GOROOT=/usr/local/go
#ENV GOPATH=/var/www/mat_admin_system
#ENV GOBIN=/var/www/mat_admin_system/bin
#ENV PATH=$GOBIN:$GOPATH/bin:$GOROOT/bin:$PATH

#RUN mkdir /var/www/mat_admin_system/bin \
# && curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

#WORKDIR /var/www/mat_admin_system/src/server

#RUN dep ensure \
# && go build

# install nginx compiled version

#RUN groupadd nginx \
# && useradd -g nginx nginx \
# && usermod -s /bin/false nginx

#WORKDIR /root
#ADD nginx/nginx.sh .
#RUN sh nginx.sh
# && rm -rf nginx.sh work/

#ADD nginx/nginx.conf /etc/nginx/
#ADD nginx/*.smartmat.jp.conf /etc/nginx/conf.d/

#EXPOSE 80

# install nodejs (version 10.9.0)

#ENV NODE_VERSION 10.9.0

#RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash \
# && export NVM_DIR="$HOME/.nvm" \
# && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
# && nvm install $NODE_VERSION \
# && nvm use $NODE_VERSION

#WORKDIR /var/www/mat_admin_system/src/client
#ENV PATH /root/.nvm/versions/node/v10.9.0/bin:$PATH

#RUN npm install \
# && npm run build

VOLUME /tmp

#WORKDIR /

#ENTRYPOINT /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf

###
