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
You should run the site locally to test your changes before opening up pull requests. You will need PostgeSQL installed.

1. run `rake db:setup` to create your database and load seed data
1. run `rails s` to start a local server

## Deploying
**Do not push changes directly to Heroku!**

After a pull request is merged, the site will automatically deploy (assuming tests are passing).
