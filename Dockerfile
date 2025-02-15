# Use official Node.js image
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Enable Corepack for Yarn 4+ support
RUN corepack enable && corepack prepare yarn@4.3.1 --activate

# Copy dependency files and install dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Copy the rest of the application files
COPY . .

# Set environment variables
ENV NODE_ENV=production

# Expose the application port
EXPOSE 3001

# Start the application
CMD ["node", "bin/server.js"]

