######## Builder Phase ########
FROM node:alpine as builder

# Install bash and nginx
RUN /bin/sh -c "apk add --no-cache bash" -qq && \
    apk add nginx -qq

# Set current working directory
WORKDIR '/app'

# Copy and install dependencies in package.json
COPY package.json ./
RUN npm install > /dev/null 2>&1 

# Copy remaining project files, not outlined in .dockerignore
COPY ./ ./

# Generate build directory
RUN npm run build


######## Runner Phase ########
FROM nginx

# Expose port
EXPOSE 80

# Copy build directory created in builder phase
COPY --from=builder /app/build /usr/share/nginx/html