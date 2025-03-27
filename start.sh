#! /bin/sh

environment=$1

if [ -z "$environment" ] || [ "$environment" != 'production' ]; then
  environment='development'
fi

echo "==== START DOCKER-COMPOSE ====="
if [  "$environment" == 'development' ];
then
  docker-compose -f docker-compose_${environment}.yml up
else
  docker-compose -f docker-compose_${environment}.yml up
fi
echo "==== END DOCKER-COMPOSE ====="

