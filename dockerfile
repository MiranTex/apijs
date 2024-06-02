FROM node:20

WORKDIR /app

# Ensure correct permissions for npm cache directory
RUN mkdir -p /usr/src/app/.npm && chown -R node:node /usr/src/app/.npm

# Set npm to use the new cache directory
RUN npm config set cache /usr/src/app/.npm-cache --global


COPY package*.json .

USER node

RUN npm install --no-lockfile --no-cache

COPY . .

ENV WATCHPACK_POLLING true

# RUN npm run build

EXPOSE 3000

# RUN yarn build

CMD ["npm","run","dev"]
