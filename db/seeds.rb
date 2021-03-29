# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development? || Rails.env.production?
  default_groups = [
    { name: 'body', icon: 'body.jpg' },
    { name: 'brakes', icon: 'brakes.jpg' },
    { name: 'diagnostics', icon: 'diagnosis.jpg' },
    { name: 'electronics', icon: 'electronics.jpg' },
    { name: 'engine', icon: 'engine.jpg' },
    { name: 'service', icon: 'service.jpg' },
    { name: 'suspension', icon: 'suspension.png' },
    { name: 'transmission', icon: 'transmission.jpg' },
    { name: 'tyre-clinic', icon: 'tyre.png' }]

  Group.create(default_groups)
end