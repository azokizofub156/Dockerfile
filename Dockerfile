# Use a base image with a GUI (like Ubuntu)
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install required packages
RUN apt-get update && \
    apt-get install -y \
    xorg \
    xrdp \
    xfce4 \
    xfce4-goodies \
    && apt-get clean

# Set the default session to XFCE
RUN echo "xfce4-session" > ~/.xsession

# Expose the RDP port
EXPOSE 3389

# Start the xrdp server
CMD ["xrdp", "-n"]