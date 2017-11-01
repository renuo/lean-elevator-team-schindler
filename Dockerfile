FROM buildpack-deps:jessie
MAINTAINER Josua Schmid <josua.schmid@renuo.ch>

ENV HOME /root
ENV APP_HOME /app

# Install packages for building ruby
RUN apt-get update
RUN apt-get install -y --force-yes build-essential curl git
RUN apt-get install -y --force-yes zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev
RUN apt-get clean

# Install rbenv and ruby-build
RUN git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
RUN $HOME/.rbenv/plugins/ruby-build/install.sh
ENV PATH $HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH
ENV RBENV_SHELL=sh

# Prepare work directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Install ruby and gems
COPY .ruby-version $APP_HOME/
RUN rbenv install
RUN gem install bundler

COPY Gemfile* $APP_HOME/
RUN bundle config --global silence_root_warning 1
RUN bundle install

RUN ls /root/.rbenv/versions/2.4.0/bin/

COPY . $APP_HOME/

# Start ruby app and allow port 4567 to leave the container
EXPOSE 9292
CMD ["bin/run"]

