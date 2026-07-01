FROM nginx:alpine

# Copy static HTML file
COPY index\ .html /usr/share/nginx/html/index.html

# Create minimal nginx config
RUN echo 'server { listen 3000; root /usr/share/nginx/html; index index.html; location / { try_files \$uri \$uri/ /index.html; } }' > /etc/nginx/conf.d/default.conf

# Remove default nginx config that listens on 80
RUN sed -i '/listen.*80/d' /etc/nginx/conf.d/default.conf || true

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
