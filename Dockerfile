# Auto-generated Dockerfile for static website
FROM nginx:alpine

# Copy all static files to nginx web directory
COPY . /usr/share/nginx/html

# Ensure proper permissions for all files
RUN chmod -R 644 /usr/share/nginx/html/* && \
    find /usr/share/nginx/html -type d -exec chmod 755 {} \;

# Expose port
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost || exit 1

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
