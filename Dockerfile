FROM node:22.12-alpine AS base
ENV PNPM_HOME=/pnpm
ENV PATH="$PNPM_HOME:$PATH"
RUN npm i -g pnpm@10.5.2

FROM base AS build
WORKDIR /src
COPY .docker.npmrc .npmrc
COPY . .
RUN --mount=type=cache,id=pnpm,target=/pnpm/store \
    pnpm install
RUN pnpm build
RUN pnpm deploy --filter=@repo-stuff/web --prod /web

FROM base AS web
WORKDIR /web
COPY --from=build /web/public ./public
COPY --from=build /web/.next ./.next
COPY --from=build /web/node_modules ./node_modules
COPY --from=build /web/package.json ./package.json
EXPOSE 3000
CMD [ "pnpm", "next", "start" ]