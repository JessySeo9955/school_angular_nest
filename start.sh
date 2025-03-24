#! /bin/sh

environment=$1

if [ -z "$environment" ] || [ "$environment" != 'production' ]; then
  environment='development'
fi

echo "=== Start ========"
echo "==== START DOCKER-COMPOSE ====="
if [  "$environment" == 'development' ];
then
  docker-compose -f docker-compose_${environment}.yml start
else
  docker-compose -f docker-compose_${environment}.yml up
fi
echo "==== END DOCKER-COMPOSE ====="

if [ "$environment" == 'development' ]; then
  echo "==== START BACKEND ====="
  # hot reload performance issue
  cd ./back-end/school
  npm run start:dev
  echo "==== END BACKEND ====="
fi

echo "==== END ====="