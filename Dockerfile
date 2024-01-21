FROM nginx:1.24.0-alpine

COPY build/web /usr/share/nginx/html
COPY nginx /etc/nginx

#CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80