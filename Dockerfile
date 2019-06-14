FROM keymetrics/pm2:10-alpine

WORKDIR /app

ENV NODE_ENV="production"
ENV PATH="./node_modules/.bin:$PATH"

# Copy built application from previous container
COPY package.json .
COPY yarn.lock .

RUN yarn 

COPY . .

# Expose application default port
EXPOSE 3000

CMD [ "pm2-docker", "start", "ecosystem.config.js" ]