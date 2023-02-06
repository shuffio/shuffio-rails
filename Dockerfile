FROM ruby:2.7.7

RUN apt-get update -qq && apt-get install -y libpq-dev nodejs

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000

CMD ["/usr/src/app/bin/rails", "server", "-b", "0.0.0.0"]
