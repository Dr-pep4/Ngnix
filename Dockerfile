FROM ubuntu:22.04

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/*

# Remove default Nginx configuration


# Expose Nginx ports
EXPOSE 80

# Run Nginx as the non-root user
CMD ["nginx", "-g", "daemon off;"]
