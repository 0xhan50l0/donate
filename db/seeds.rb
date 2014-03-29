puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'aldfkjasfjdfs', :email => 'user@example.com', :password => 'changeme', :password_confirmation => 'changeme'
puts 'New user created: ' << user.name
user2 = User.create! :email => 'user2@example.com', :name => 'adflkajsdfakjsdfkasdf', :password => 'changeme', :password_confirmation => 'changeme'
puts 'New user created: ' << user2.name
