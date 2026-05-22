# Use official Node.js Alpine base image
FROM node:20-alpine

# Install build dependencies for Node.js native modules and CLI tools
RUN apk add --no-cache git python3 make g++ curl

# Install OpenClaw globally
RUN npm i -g openclaw@latest

# Set workspace directory
WORKDIR /workspace

# Create OpenClaw directory
RUN mkdir -p /root/.openclaw/skills

# Copy skills into default global location
COPY skills/ /root/.openclaw/skills/

# Copy configuration
COPY openclaw.json /root/.openclaw/openclaw.json

# Expose default API / webhook ports if needed
EXPOSE 3000 8080

# Command to start the gateway daemon
CMD ["openclaw", "gateway", "start"]
