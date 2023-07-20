# syntax=docker/dockerfile:1
FROM node:16
WORKDIR /app
COPY ["package.json","package-lock.json", "./"]
COPY . .
ENV NODE_OPTIONS=--max-old-space-size=8192
RUN npm install
# RUN npm install
RUN npm run bootstrap
RUN npm run build
EXPOSE 4002
CMD ["npm","run","serve:app:fs"]
