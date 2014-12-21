FROM ruby:2.1.5

ENV RAILS_ENV production

RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN useradd -g users user
# Add Gemfiles separatly so that they get cached
ADD Gemfile /usr/src/app/Gemfile
ADD Gemfile.lock /usr/src/app/Gemfile.lock
RUN chown -R user:users /usr/src/app && \
    chown -R user:users $GEM_HOME
WORKDIR /usr/src/app

USER user
RUN bundle install
ENV PATH /usr/src/app/vendor/bundle/bin:$PATH

USER root
ADD . /usr/src/app
RUN chown -R user:users /usr/src/app
USER user

RUN rake assets:precompile && \
    echo SECRET_TOKEN=$(rake secret) > .env

EXPOSE 3000
CMD ["rails", "server", "--binding", "0.0.0.0"]
