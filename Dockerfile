# Imagen de produccion para Coolify (gnerai-apps-fra1). Rama servidor-2026-10-31.
# Igual que en pm2 del servidor viejo: node server.cjs (puerto 5173) sirviendo la carpeta del repo.
FROM node:22.23.4-bookworm-slim
WORKDIR /app
ENV NODE_ENV=production PORT=5173 HOST=0.0.0.0
COPY package.json package-lock.json ./
RUN npm ci --omit=dev --no-audit --no-fund
COPY --chown=node:node . .
USER node
EXPOSE 5173
CMD ["node", "server.cjs"]
