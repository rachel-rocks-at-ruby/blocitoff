## Blocitoff
Blocitoff will aim to keep to-do lists manageable by automatically deleting to-do items that have not been completed after 7 days. The hypothesis is that if the to-do item is not important enough to be completed in 7 days, it doesn't belong on your to-do list.

Heroku app name: https://rachel-bloccitoff.herokuapp.com/

#### Set-up
config/application.yml 
blank template: config/application.example.yml

#### Gems
* bootstrap-sass 3.1.1 - for styling

* devise - for user authentication

* figaro 1.0 - to securely store configuration values

* whenever - for cron jobs