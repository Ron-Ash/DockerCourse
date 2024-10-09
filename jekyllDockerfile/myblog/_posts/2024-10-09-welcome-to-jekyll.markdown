---
layout: post
title: "Welcome to Jekyll!"
date: 2024-10-09 05:16:33 +0000
categories: jekyll update
---

If you are seeing this, then the Dockerfile has worked! Yay!

Dockefile:

{% highlight Dockerfile %}
FROM alpine:latest
RUN apk update; apk upgrade; apk add build-base ruby-dev ruby
RUN gem install jekyll bundler && gem cleanup
COPY entrypoint.sh /usr/local/bin
WORKDIR /site
EXPOSE 4000
ENTRYPOINT ["entrypoint.sh"]
CMD [ "bundle", "exec", "jekyll", "serve", "--force_polling", "-H", "0.0.0.0", "-P", "4000" ]
{% endhighlight %}

entrypoint.sh:
{% highlight bash %}
#!/bin/sh
bundle install --retry 5 --jobs 20;
exec "$@"
{% endhighlight %}

for it to run, `jekyll new myblog` needs to run to create a new site. Then run `docker container run --rm -it -p 80:4000  -v ${pwd}/myblog:/site jekyll`

Check out the [Jekyll docs][jekyll-docs] for more info on how to get the most out of Jekyll. File all bugs/feature requests at [Jekyll’s GitHub repo][jekyll-gh]. If you have questions, you can ask them on [Jekyll Talk][jekyll-talk].

[jekyll-docs]: https://jekyllrb.com/docs/home
[jekyll-gh]: https://github.com/jekyll/jekyll
[jekyll-talk]: https://talk.jekyllrb.com/
