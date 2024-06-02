FROM node:20

WORKDIR /app


RUN apt-get -y update
RUN groupadd -r user && useradd -r -g user user

# Ensure correct permissions for npm cache directory
RUN mkdir -p /usr/src/app/.npm && chown -R user:user /usr/src/app/.npm
RUN mkdir -p /usr/src/app/.npm-cache/_cacache && chown -R user:user /usr/src/app/.npm-cache/_cacache
RUN mkdir -p /app/node_modules && chown -R user:user /app/node_modules
RUN chown -R 999:999 /usr/src/app/.npm-cache
RUN chmod -R 777 .
# /usr/src/app/.npm-cache/_cacache

# Set npm to use the new cache directory
RUN npm config set cache /usr/src/app/.npm-cache --global

# Install app dependencies
COPY package*.json ./


# Ensure the home directory has correct permissions
RUN mkdir -p /home/node && chown -R user:user /home/node

RUN npm cache clean --force

USER user

# Install dependencies without using cache
RUN npm install --no-lockfile

# Bundle app source
COPY --chown=user:user . .


EXPOSE 3000


CMD ["npm","run","dev"]
