FROM nginx:1.15.2-alpine

ADD nginx.conf /etc/nginx/nginx.conf
ADD *.smartmat.jp.conf /etc/nginx/conf.d/

RUN apk --update add wget \
 && rm -rf /etc/nginx/conf.d/default.conf

#ADD https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh /usr/local/bin/wait-for-it.sh
#RUN chmod +x /usr/local/bin/wait-for-it.sh

<<<<<<< HEAD
EXPOSE 80

=======
>>>>>>> aaf14ed8ba7e88c3d6cd4e687acfde03ad7be3cb
ENTRYPOINT /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
