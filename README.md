![Shuff.io](app/assets/images/shuffio-logo-128px.png)

[![CircleCI](https://circleci.com/gh/kevinreedy/shuffio.svg?style=svg)](https://circleci.com/gh/kevinreedy/shuffio)

# What is Shuff.io?
Shuff.io is a record and stat tracking system developed for the [Royal Palms Chicago](https://www.royalpalmschicago.com/) Shuffleboard League.

For more information about the site itself, visit [its FAQ](https://royalpalms.shuff.io/faq).

# Architecture
Shuff.io is a pretty standard Rails application that runs on Heroku and PostgeSQL.

## Git Workflow
When working on a feature, start a new branch on your own fork of the project. You cannot push directly to the master branch.

When your work is complete, open a Pull Request. Once tests are passing, and someone reviews your code, you can merge to the master branch.

## Running Locally
You should run the site locally to test your changes before opening up pull requests. You will need Ruby and PostgeSQL installed.

1. run `bundle install` to install dependant gems
1. run `rake db:setup` to create your database and load seed data
1. run `rails s` to start a local server

## Running Locally in Docker
The repo has `Dockerfile` and `docker-compose.yml` files to get started with developement quickly. When using Docker-Compose, the app directory will be mounted as a volume so that you can see changes without needing to rebuild the container.

1. run `docker-compose up` to bring up services
1. run `docker-compose exec web db:setup` to create your database and load seed data

If you end up with file permission errors around the database files, check permissions on `tmp/db`.

## Deploying
**Do not push changes directly to Heroku!**

After a pull request is merged, the site will automatically deploy (assuming tests are passing).
