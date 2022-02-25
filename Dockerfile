FROM node:16-alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

# /app/build <--- have all the build files

FROM nginx
EXPOSE 5000
COPY --from=builder /app/build /usr/share/nginx/html
