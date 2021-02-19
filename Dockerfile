FROM node:10.13.0-alpine
ENV sqlite=TEEVER
ENV buildNumber=BUILD_NUMBER
ENV branchName=BRANCH
RUN apk add --no-cache git
COPY package*.json ./
RUN npm set progress=false && npm config set depth 0 && npm cache clean --force
RUN npm i && mkdir /ng-app && cp -R ./node_modules ./ng-app
WORKDIR /ng-app
COPY . .
RUN npm run addandroid
RUN npm run buildandroid
