# Lost Rails

## Todos

CRUD iklan

## Commands

### heroku clean

heroku restart --app=lost-rails && heroku pg:reset DATABASE --confirm lost-rails --app=lost-rails && heroku run rake db:migrate --app=lost-rails

### seed on heroku

heroku restart --app=lost-rails && heroku pg:reset DATABASE --confirm lost-rails --app=lost-rails && heroku run rake db:migrate db:seed --app=lost-rails 

### migrate and seed on heroku

heroku run rake db:migrate db:seed --app=lost-rails 

heroku run console --app=lost-rails 
heroku run bash --app=lost-rails 

### rebuild database locally

rake db:drop db:create db:migrate
rake db:drop db:create db:migrate db:seed
rake db:seed

### logs

heroku logs --tail --app lost-rails

### secret key

EDITOR=vim rails credentials:edit
rails credentials:show

### Create Backup
heroku pg:backups:capture --app lost-rails

### Download Backup
heroku pg:backups:download --app lost-rails

### Restore
heroku pg:backups:restore --app lost-rails --confirm lost-rails
