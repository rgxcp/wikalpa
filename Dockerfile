FROM ruby:3.0.1

ENV TZ=Asia/Jakarta

RUN mkdir /app

WORKDIR /app

COPY . .

RUN gem install bundler:2.2.33 --no-document

RUN bundle config set without development test

RUN bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-e", "production", "-p", "3000", "-b", "0.0.0.0"]
