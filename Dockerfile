FROM rails:4.2.6
MAINTAINER Yiming Chen <dsdshcym@gmail.com>
RUN mkdir /usr/app
COPY Gemfile /usr/app
COPY Gemfile.lock /usr/app
WORKDIR /usr/app
RUN bundle config mirror.https://rubygems.org https://ruby.taobao.org
RUN bundle install
CMD rails s -b 0.0.0.0
