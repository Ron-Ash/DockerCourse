FROM alpine:latest

# Prerequisites
RUN apk update; apk upgrade; apk add build-base ruby-dev ruby

RUN gem install jekyll bundler && gem cleanup

COPY entrypoint.sh /usr/local/bin

WORKDIR /site

EXPOSE 4000

ENTRYPOINT [ "entrypoint.sh"]

CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]
# bundle exec jekyll serve --force_polling -H 0.0.0.0 -P 4000

# docker container run --rm -it -p 80:4000  -v ${pwd}/myblog:/site jekyll