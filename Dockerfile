# Node 14.21.3 on amd64 keeps the packaged Windows target and build inputs consistent.
FROM --platform=linux/amd64 node@sha256:c0bff0d29a742f40650d5f0305dd581351c10954e6cb6676fc96f47590b9666e

WORKDIR /home/root/tornado-cli
COPY .npmrc package.json package-lock.json ./
RUN npm ci

COPY scripts/createDeterministicExecutable.js scripts/
COPY cli.js config.js ./
COPY abis/ abis/
COPY circuits/tornado.json circuits/tornado.json
RUN node scripts/createDeterministicExecutable.js
