FROM nginx:stable-alpine

# Remove arquivos padrão
RUN rm -rf /usr/share/nginx/html/*

# Copia os arquivos estáticos direto
COPY ./dist /usr/share/nginx/html

# Config nginx (opcional)
COPY ./docker/nginx/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]