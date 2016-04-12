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

plan1 = TemplatePlan.create(name: "Plan 500", description: "Este plan es ideal para usted si tiene entre 1 y 500 expedientes", monthly_cost: 1500, anual_discount:30, max_files: 500 )
plan2 = TemplatePlan.create(name: "Plan 2000", description: "Este plan es ideal para usted si tiene entre 501 y 2000 expedientes", monthly_cost: 2500, anual_discount:30, max_files: 2000 )
plan3 = TemplatePlan.create(name: "Plan 5000", description: "Este plan es ideal para usted si tiene entre 2001 y 5000 expedientes", monthly_cost: 3500, anual_discount:30, max_files: 5000 )
plan4 = TemplatePlan.create(name: "Plan 7000", description: "Este plan es ideal para usted si tiene entre 5001 y 7000 expedientes", monthly_cost: 4500, anual_discount:30, max_files: 7000 )
plan5 = TemplatePlan.create(name: "Plan 10000", description: "Este plan es ideal para usted si tiene entre 7001 y 10000 expedientes", monthly_cost: 5500, anual_discount:30, max_files: 1000 )


doctor1 = Doctor.create(name: "Claudia Gutiérrez", email: "claudia@gmail.com", password: "qwerty123", password: "qwerty123", speciality: "Ginecología")
doctor2 = Doctor.create(name: "Miriam Gutiérrez", email: "miriam@gmail.com", password: "qwerty123", password: "qwerty123", speciality: "Ginecología")
doctor3 = Doctor.create(name: "José Gutiérrez", email: "jose@gmail.com", password: "qwerty123", password: "qwerty123", speciality: "Ginecología")
doctor4 = Doctor.create(name: "Pepe Gutiérrez", email: "pepe@gmail.com", password: "qwerty123", password: "qwerty123", speciality: "Ginecología")
doctor5 = Doctor.create(name: "Julián Gutiérrez", email: "julian@gmail.com", password: "qwerty123", password: "qwerty123", speciality: "Ginecología")
doctor6 = Doctor.create(name: "María Gutiérrez", email: "maria@gmail.com", password: "qwerty123", password: "qwerty123", speciality: "Oftalmología")
doctor7 = Doctor.create(name: "Samuel Gutiérrez", email: "samuel@gmail.com", password: "qwerty123", password: "qwerty123", speciality: "Oftalmología")
doctor8 = Doctor.create(name: "Carlos Gutiérrez", email: "carlos@gmail.com", password: "qwerty123", password: "qwerty123", speciality: "Oftalmología")
doctor9 = Doctor.create(name: "César Gutiérrez", email: "cesar@gmail.com", password: "qwerty123", password: "qwerty123", speciality: "Oftalmología")
doctor10 = Doctor.create(name: "Juan Gutiérrez", email: "juan@gmail.com", password: "qwerty123", password: "qwerty123", speciality: "Oftalmología")
doctor11 = Doctor.create(name: "Lupita Gutiérrez", email: "lupita@gmail.com", password: "qwerty123", password: "qwerty123", speciality: "Oftalmología")

#1.upto(1998) do |i|
#	GynecologyTemplate.create(name: Faker::Name.name, doctor_id: doctor1.id)
#end