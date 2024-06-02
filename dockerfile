FROM node:20

WORKDIR /app

COPY package*.json .

#yarn install
RUN npm install -g yarn

RUN npm install --no-lockfile

COPY . .

ENV WATCHPACK_POLLING true

# RUN npm run build

EXPOSE 3000

# RUN yarn build

CMD ["npm","run","dev"]
