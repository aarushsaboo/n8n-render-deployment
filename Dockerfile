FROM n8nio/n8n:latest

# Set environment variables
ENV N8N_PORT=5678
ENV NODE_ENV=production
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Create directory for persisting data
RUN mkdir -p /home/node/.n8n

# Set working directory
WORKDIR /home/node

# Ensure n8n is in the PATH
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Set user to node to avoid running as root
USER node

# Command to run n8n explicitly using npm
CMD ["npm", "run", "start"]