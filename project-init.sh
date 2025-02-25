#!/usr/bin/env bash
project_basename=${PWD##*/}

echo ""; echo "Setting up new rails project '$project_basename'..."; echo ""
docker compose build --build-arg "APPNAME=$project_basename"
git checkout -b main

docker compose run --rm web bash -c "/app/in-container-scripts/setup-rails-project.sh '$project_basename'"
docker compose run --rm web bash -c "bin/rails db:create"
docker compose down

