# Menggunakan Node 14 Alpine agar size lebih kecil
FROM node:14.21.1-alpine3.16

# Init Workdir di /app dan mencopy seluruh content aplikasi ke /app
WORKDIR /app
COPY . .

# Memastikan ENV production dan mengarahkan DB ke item-db
ENV NODE_ENV=production DB_HOST=item-db

# Melakukan npm install utk dependencies dan melakukan build app
RUN npm install --production --unsafe-perm && npm run build

# Mengekspos port 8080
EXPOSE 8080

# Mendefinisikan entrypoint ketika image dijalankan
ENTRYPOINT ["npm", "start"]