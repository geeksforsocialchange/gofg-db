FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /gofg-db
WORKDIR /gofg-db
ADD Gemfile /gofg-db/Gemfile
ADD Gemfile.lock /gofg-db/Gemfile.lock
RUN bundle install
ADD . /gofg-db
ENTRYPOINT ["/gofg-db/docker-entry.sh"]
