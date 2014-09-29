FROM rails:onbuild
MAINTAINER Henrik Nygren <nygrenh@gmail.com>

RUN rake assets:precompile
RUN echo SECRET_TOKEN=$(rake secret) > .env

# Run rails as a regular user
RUN useradd -g users user
RUN chown -R user:users /usr/src/app

ENV RAILS_ENV production
USER user
