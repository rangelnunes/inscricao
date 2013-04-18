# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

role1 = Role.create! :name => "Admin"
role2 = Role.create! :name => "Moderator"
role3 = Role.create! :name => "Member"

user = User.create! :name => 'Rangel Nunes', :cpf => '99999999999', :institution => "IFPI", :minicurso_id => 0, :email => 'rangelnunes@gmail.com', :password => '12345678', :password_confirmation => '12345678', :tipo => 'Administrador'

user.role_ids = [1]

user.save

user1 = User.create! :name => 'Francisco Diniz', :cpf => '88888888888', :institution => "IFPI", :minicurso_id => 0, :email => 'profdiniz@hotmail.com', :password => '12345678', :password_confirmation => '12345678', :tipo => 'Administrador'

user1.role_ids = [1]

user1.save


