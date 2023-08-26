# throw errors if Gemfile has been modified since Gemfile.lock
FROM ruby:2.7.8
#RUN bundle config --global frozen 1

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY . $APP_HOME

#COPY Gemfile Gemfile.lock ./
RUN bundle install

#CMD tail -f /dev/null
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
