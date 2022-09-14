#!/bin/bash

echo ""
echo "*****************************************************"
echo "*  Stopping an removing all Containers and volumes  *"
echo "*****************************************************"
echo ""

docker-compose down -v

if [[ $@ = *"--dcr"* ]] ;then
    echo ""
    echo "*****************************************************"
    echo '*               Full docker setup.....              *'
    echo "*****************************************************"
    docker-compose -f ./docker-compose.yml up -d
    echo "MySql is up.........."
    echo ""
    sleep 10
    echo ""
    echo "Creating Database........"
    echo ""
    bundle exec rake db:create db:migrate db:seed
    echo ""
    echo "Attaching to Budget_app container........"
    echo ""
    docker attach budget_app
    echo ''
elif [[ $@ = *"--test"* ]] ;then
    echo ""
    echo "*****************************************************"
    echo '*            Test setup (Database only)             *'
    echo "*****************************************************"
    echo ''
    docker-compose -f ./docker-compose.db.yml up -d
    echo "MySql is up.........."
    echo ""
    sleep 10
    echo ""
    echo "Creating Database........"
    echo ""
    RAILS_ENV=test bundle exec rake db:create db:migrate db:seed
else
    echo ""
    echo "*****************************************************"
    echo '*           Docker db + local app server            *'
    echo "*****************************************************"
    echo ''
    env_var_req=true
    docker-compose -f ./docker-compose.db.yml up -d
    echo "MySql is up.........."
    echo ""
    echo "Removing server pid, just in case"
    rm tmp/pids/server.pid
    sleep 10
    echo ""
    echo "Starting Rails server........"
    echo ""
    bundle exec rake db:create db:migrate db:seed && bundle exec rails s
fi
