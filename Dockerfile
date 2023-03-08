FROM nginx:1.23.3

ENV HEADER=$HEADER
ENV TEXT=$TEXT
ENV IMAGE=$IMAGE

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

COPY nginx.conf /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY stub-status.conf /etc/nginx/conf.d/stub-status.conf

COPY site/* /usr/share/nginx/html

CMD ["/bin/bash", "-c" ,"/entrypoint.sh; nginx -g 'daemon off;'"]
