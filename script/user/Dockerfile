FROM ubuntu:latest

# Install SSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    apt-get install -y sudo && \
    mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Add a user for testing the script
RUN useradd -m -s /bin/bash testuser && \
    echo 'testuser:test' | chpasswd && \
    usermod -aG sudo testuser

# Copy the create_user.sh script into the container
COPY create_user.sh /usr/local/bin/

# Make the script executable
RUN chmod +x /usr/local/bin/create_user.sh

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
