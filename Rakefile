# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Starterlist::Application.load_tasks

task 'db:reset' => ['db:drop', 'db:create', 'db:migrate']
task 'db:reseed' => ['db:drop', 'db:create', 'db:migrate', 'db:seed']
