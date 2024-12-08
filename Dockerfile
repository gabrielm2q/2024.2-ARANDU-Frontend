FROM node:22 AS base

WORKDIR /src

RUN npm install nodemon --save-dev

COPY package.json package-lock.json* ./
RUN \
  if [ -f package-lock.json ]; then npm ci; \
  fi

FROM base AS builder
WORKDIR /src
RUN npm install
COPY . . 


COPY .env .env
RUN npm run build

FROM base as runner

ENV NODE_ENV=development

RUN addgroup -g 1001 -S nodejs \
  && adduser -S arandu -u 1001

COPY --from=builder --chown=arandu:nodejs /src/.next/standalone ./
COPY --from=builder --chown=arandu:nodejs /src/node_modules ./node_modules
COPY --from=builder --chown=arandu:nodejs /src/.next/static ./.next/static

RUN mkdir -p .next/cache \
  && chown -R arandu:nodejs .next

USER arandu

EXPOSE 4000

ENV PORT=4000

CMD ["npm", "run", "prod"]
