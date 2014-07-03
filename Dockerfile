FROM ubuntu:14.04
MAINTAINER Henrik Nygren <nygrenh@gmail.com>

RUN apt-get update
RUN apt-get upgrade -yq

# Create user for the server
RUN useradd -m -s /bin/false rails

# Install dependencies
RUN apt-get install -yq software-properties-common git make postgresql-client libpq-dev g++ sqlite libsqlite3-dev
RUN apt-add-repository -y ppa:brightbox/ruby-ng
RUN apt-add-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -yq nodejs ruby2.1 ruby2.1-dev
RUN echo 'gem: --no-document' > /usr/local/etc/gemrcdoc
RUN gem install bundler

# Install the app
ADD . /home/rails/index
RUN chown -R rails:rails /home/rails/index
RUN su -c "cd ~/index; RAILS_ENV=development bundle install --path vendor/bundler" -s /bin/sh rails
RUN su -c "cd ~/index; RAILS_ENV=development bundle exec rake db:migrate" -s /bin/sh rails
RUN su -c "cd ~/index; RAILS_ENV=development bundle exec rake assets:precompile" -s /bin/sh rails

EXPOSE 3000

CMD ["su", "-c", "cd ~/index; RAILS_ENV=development bundle exec rails s", "-s", "/bin/sh", "rails"]
