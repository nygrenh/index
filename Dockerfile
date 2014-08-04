FROM rails
MAINTAINER Henrik Nygren <nygrenh@gmail.com>

ENV RAILS_ENV production
RUN rake assets:precompile
RUN echo SECRET_TOKEN=$(rake secret) > .env

# Run rails as a regular user
RUN useradd -g users user
RUN chown -R user:users /usr/src/app
USER user
