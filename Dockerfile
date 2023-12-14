FROM nginx:1.19.3

COPY build/web /usr/share/nginx/html
COPY nginx /etc/nginx