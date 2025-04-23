FROM n8nio/n8n:latest

# Set environment variables
ENV N8N_PORT=5678
ENV NODE_ENV=production
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Create directory for persisting data
RUN mkdir -p /home/node/.n8n

# Set user to node to avoid running as root
USER node

# Use the exact command to run n8n from the original image's entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["n8n"]