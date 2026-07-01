FROM nginx:alpine

WORKDIR /etc/nginx

# Copy static HTML file
COPY index.html /usr/share/nginx/html/index.html

# Create proper nginx configuration
RUN rm -f /etc/nginx/conf.d/default.conf

RUN cat > /etc/nginx/conf.d/default.conf <<EOF
server {
    listen 3000;
    server_name _;
    root /usr/share/nginx/html;
    index index.html;

    location / {
        try_files \$uri \$uri/ /index.html;
    }

    error_page 404 /index.html;
}
EOF

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
