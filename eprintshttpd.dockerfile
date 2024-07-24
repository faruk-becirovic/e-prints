FROM centos:7

# Update and install necessary packages
RUN yum update -y && yum install -y \
    httpd \
    mod_perl \
    perl \
    wget

# Download and extract EPrints
RUN wget -q https://files.eprints.org/3001/2/eprints-3.3.15.tar.gz -O /tmp/eprints-3.3.15.tar.gz && \
    tar -xzf /tmp/eprints-3.3.15.tar.gz -C /usr/share && \
    mv /usr/share/eprints-3.3.15 /usr/share/eprints3 && \
    rm /tmp/eprints-3.3.15.tar.gz

# Set the working directory
WORKDIR /usr/share/eprints3

# Expose the HTTP port
EXPOSE 80
