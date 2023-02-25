FROM nginx:1.22.1

ENV HEADER=$HEADER
ENV TEXT=$TEXT
ENV IMAGE=$IMAGE

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

COPY site/* /usr/share/nginx/html

CMD ["/bin/bash", "-c" ,"/entrypoint.sh; nginx -g 'daemon off;'"]
