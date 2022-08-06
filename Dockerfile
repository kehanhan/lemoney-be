FROM ruby:3.1.2

ENV RAILS_ENV production
RUN mkdir /lemoney
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.com
WORKDIR /lemoney
ADD . /lemoney
RUN bundle config set --local without 'development test'
RUN bundle install

ENTRYPOINT bundle exec puma