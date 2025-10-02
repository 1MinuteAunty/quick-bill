FROM node:22-alpine
WORKDIR /workspace
COPY . .
USER node
CMD npm ci