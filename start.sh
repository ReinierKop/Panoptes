#!/bin/bash -ex

cd /rails_app

if [ -d "/rails_conf/" ]
then
    ln -sf /rails_conf/* ./config/
fi

if [ "$RAILS_ENV" == "development" ]
then
    bundle install
    rake db:migrate
fi

exec bundle exec rails s puma -p 80 $*
