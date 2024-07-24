FROM centos:7

# Set DNS server to ensure DNS resolution
RUN echo "nameserver 8.8.8.8" > /etc/dns_override && cat /etc/dns_override > /etc/resolv.conf

# Clean all yum caches and update yum
RUN yum clean all && yum -y update

# Install necessary packages
RUN yum -y install epel-release
RUN yum -y install httpd eprints

# Clean up after yum installation to reduce image size
RUN yum clean all

# Copy EPrints configuration
# COPY eprints.cfg /etc/eprints/eprints.cfg

# Expose the HTTP port
EXPOSE 80

# Add a health check to ensure the web server is ready
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost/ || exit 1

# Start Apache in the foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
