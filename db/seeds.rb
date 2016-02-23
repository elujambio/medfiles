# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

superadmin1 = Admin.create(name: "Ilse Alejo", email: "ilse@medfiles.com.mx", password: "qwerty123", password: "qwerty123", superadmin: true )
superadmin2 = Admin.create(name: "Pablo Lujambio", email: "Pablo@medfiles.com.mx", password: "qwerty123", password: "qwerty123", superadmin: true )
superadmin3 = Admin.create(name: "Osmar Oramas", email: "osmar@medfiles.com.mx", password: "qwerty123", password: "qwerty123", superadmin: true )

admin = Admin.create(name: "Javier Rodríguez", email: "javier@medfiles.com.mx", password: "qwerty123", password: "qwerty123" )