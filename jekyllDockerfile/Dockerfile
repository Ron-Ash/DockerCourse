FROM alpine:latest

# Prerequisites from https://jekyllrb.com/docs/installation/#requirements 
RUN apk update; apk upgrade; apk add build-base ruby-dev ruby
# install the jekyll and blunder gems
RUN gem install jekyll bundler && gem cleanup
# copy entrypoint bash script to local 
COPY entrypoint.sh /usr/local/bin
# enter volume where jekyll site was created
WORKDIR /site
EXPOSE 4000
# run the bash script which would run bundle install
ENTRYPOINT [ "entrypoint.sh"]
# run the command bundle exec jekyll serve --force_polling -H 0.0.0.0 -P 4000
CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]

# run the command below in terminal to open port 80 for the jekyll site
# docker container run --rm -it -p 80:4000  -v ${pwd}/myblog:/site rashri/jekyll