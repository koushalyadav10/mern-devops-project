FROM node:18

WORKDIR /app

COPY . .

RUN npm install
RUN cd frontend && npm install
RUN cd backend && npm install

EXPOSE 5000

CMD ["npm","run","start"]
