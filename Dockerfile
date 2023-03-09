FROM node:14-buster
RUN mkdir -p /srv/app
ARG PORT=80
ENV PORT=$PORT
ENV FIREBASE_URL=$FIREBASE_URL
ENV FIREBASE_SECRET=$FIREBASE_SECRET
ENV SECRET=$SECRET
WORKDIR /srv/app
COPY package.json yarn.lock ./
RUN yarn --frozen-lockfile --non-interactive
RUN yarn build

COPY . /srv/app
#EXPOSE 80
CMD [ "node", "server.js" ]
