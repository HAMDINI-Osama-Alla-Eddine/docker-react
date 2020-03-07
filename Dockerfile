# Image de base
FROM node:alpine as builder

WORKDIR /usr/app

# Install some dependencies
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# Image de base
FROM nginx

# Copy the builder phase result
COPY --from=builder /usr/app/build /usr/share/nginx/html
