FROM n8nio/n8n:latest

# Switch to root user to make changes
USER root

# Set environment variables
ENV N8N_PORT=5678
ENV NODE_ENV=production
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true
ENV PATH="/usr/local/bin:${PATH}"

# Create directory for persisting data and set permissions
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

# Verify n8n exists and is executable
RUN ls -la /usr/local/bin/n8n && \
    chmod +x /usr/local/bin/n8n

# Switch back to node user for security
USER node

# Use a shell to ensure PATH is properly sourced
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["exec /docker-entrypoint.sh /usr/local/bin/n8n"]