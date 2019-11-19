# Stage 1
FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod
# Stage 2
FROM nginx:alpline
COPY --from=node /app/dist/angular-demo /usr/share/nginx/html
