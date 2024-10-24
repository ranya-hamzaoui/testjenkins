# Étape de construction
FROM node:20 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --prod

# Étape de production
FROM nginx:alpine
COPY --from=builder /app/dist/apptest /usr/share/nginx/html