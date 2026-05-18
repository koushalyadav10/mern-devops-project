FROM node:18

WORKDIR /app

COPY package*.json ./

RUN npm install --legacy-peer-deps

COPY frontend/package*.json ./frontend/

WORKDIR /app/frontend

RUN npm install --legacy-peer-deps

WORKDIR /app

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
