FROM n8nio/n8n:latest

# Environment variables
ENV N8N_PORT=5678
ENV NODE_ENV=production
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Create directory for persisting data
USER root
RUN mkdir -p /home/node/.n8n
RUN chown -R node:node /home/node/.n8n
USER node

# Use full path to n8n executable (adjust if needed)
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/local/bin/n8n"]