FROM node:alpine

# Install bash and Vim
RUN /bin/sh -c "apk add --no-cache bash" -qq && \
    apk update -qq && \
    apk add vim -qq

# Set current working directory
WORKDIR /app

# Copy and install dependencies in package.json
COPY package.json ./
RUN npm install > /dev/null 2>&1 

# Copy remaining project files, not outlined in .dockerignore
COPY ./ ./

EXPOSE 3000

# ENTRYPOINT ./entrypoint.sh
CMD ["npm", "run", "start"]
