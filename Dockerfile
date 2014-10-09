FROM ruby:2.1.3

ENV RAILS_ENV production

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN useradd -g users user
RUN mkdir -p /usr/src/app && chown -R user:users /usr/src/app
WORKDIR /usr/src/app
USER user

ADD Gemfile /usr/src/app/
ADD Gemfile.lock /usr/src/app/
RUN bundle install --path vendor/bundle
ENV PATH /usr/src/app/vendor/bundle/bin:$PATH

ADD . /usr/src/app

# Fix permissions
USER root
RUN chown -R user:users /usr/src/app
USER user

RUN rake assets:precompile
RUN echo SECRET_TOKEN=$(rake secret) > .env

EXPOSE 3000
CMD ["rails", "server"]
