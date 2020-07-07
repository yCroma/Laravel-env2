FROM nginx:stable-alpine

RUN adduser -S www-data -u 82 && \
    echo "www-data ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    echo 'www-data:www-data' | chpasswd