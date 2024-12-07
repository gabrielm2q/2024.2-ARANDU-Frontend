FROM node:22-alpine AS base

FROM base AS deps
RUN apk add --no-cache libc6-compat

WORKDIR /app

COPY package.json package-lock.json* ./
RUN \
  if [ -f package-lock.json ]; then npm ci; npm run build \
  fi


FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

COPY .env .env

FROM base AS runner
WORKDIR /app

ENV NODE_ENV=production

RUN addgroup -g 1001 -S nodejs \
  && adduser -S arandu -u 1001

COPY --from=builder --chown=arandu:nodejs /app/.next/standalone ./
COPY --from=builder --chown=arandu:nodejs /app/.next/static ./.next/static

RUN mkdir -p .next/cache \
  && chown -R arandu:nodejs .next

USER arandu

EXPOSE 4000

ENV PORT=4000

CMD ["node", "server.js"]
