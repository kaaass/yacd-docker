FROM node:latest AS builder
WORKDIR /app
RUN git clone https://github.com/haishanh/yacd.git .
# Using yarn to install dependencies in CI will cause network timeout
# Refer to https://github.com/date-fns/date-fns/issues/1004
RUN yarn config set network-timeout 300000 \
  && yarn \
  && yarn build \
  # remove source maps - people like small image
  && rm public/*.map || true

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=builder /app/public /usr/share/nginx/html
ENV YACD_DEFAULT "http://127.0.0.1:9090"
EXPOSE 80
ADD docker-entrypoint.sh /
CMD ["/docker-entrypoint.sh"]
