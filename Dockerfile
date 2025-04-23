FROM n8nio/n8n:latest

# Switch to root user to install packages
USER root

# If you need to install an npm package globally, uncomment and replace "your-package" with the package name
# RUN npm install -g your-package

# Set environment variables
ENV N8N_PORT=5678
ENV NODE_ENV=production
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Create directory for persisting data
RUN mkdir -p /home/node/.n8n
# Ensure proper ownership
RUN chown -R node:node /home/node/.n8n

# Switch back to node user for security
USER node

# Use the exact command to run n8n from the original image's entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["n8n"]