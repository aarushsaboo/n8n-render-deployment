FROM n8nio/n8n:latest

# Set environment variables (can be overridden by Render's environment variables)
ENV N8N_PORT=5678
ENV NODE_ENV=production
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV WEBHOOK_URL=your-render-app-url

# Create directory for persisting data if needed
RUN mkdir -p /home/node/.n8n

# Install any additional packages if needed
# RUN npm install some-package

# Set user to node to avoid running as root
USER node

# Command to run n8n
CMD ["n8n", "start"]