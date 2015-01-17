# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



#look back at factory_girl, testing docs, etc

#USERS

User.create({
	username: "Chas",
	password: "password",
	superuser: true
})

User.create({
	username: "House1_first",
	password: "house1pass",
})

User.create({
	username: "House1_second",
	password: "house1pass2",
})

User.create({
	username: "House2_first",
	password: "house2pass",
})

User.create({
	username: "House2_second",
	password: "house2pass2",
})

User.create({
	username: "House3_first",
	password: "house3pass",
})

User.create({
	username: "House3_second",
	password: "house3pass2",
})

User.create({
	username: "House4_first",
	password: "house4pass",
})

User.create({
	username: "House4_second",
	password: "house4pass2",
})

User.create({
	username: "House5_first",
	password: "house5pass",
})

User.create({
	username: "House5_second",
	password: "house5pass2",
})

User.create({
	username: "CB_first",
	password: "cbpass",
})

User.create({
	username: "CB_second",
	password: "cbpass2",
})

User.create({
	username: "NS_first",
	password: "nspass",
})

User.create({
	username: "NS_second",
	password: "nspass2",
})

#PERMISSIONS

i = 0
7.times do Permission.create({
	user_id: 0,
	house_id: i
	})
	i+=1
end

q = 2
z = 0
14.times do Permission.create({
	user_id: q,
	house_id: z
	})
	z+=1 if q % 2 == 1
	q+=1
end

#HOUSES

House.create({
	house_name: "House1",
})

House.create({
	house_name: "House2",
})

House.create({
	house_name: "House3",
})

House.create({
	house_name: "House4",
})

House.create({
	house_name: "House5",
})

House.create({
	house_name: "CB",
})

House.create({
	house_name: "NS",
})

#ROOMS

h1 = [1,2,4,2,4]
h2 = [1,1,4,1,4]
h3 = [1,1,3,3,2,1,4]
h4 = [3,4,1,1,1,1,2,2]
h5 = [2,2,1,1,1,1,1]
cb = [3,2,4,2]
ns = [2,2,3,4]


5.times do |i|
Room.create({
	room_name: "H1Room#{i+1}",
	house_id: 0,
	num_beds: h1[i]
})

Room.create({
	room_name: "H2Room#{i+1}",
	house_id: 1,
	num_beds: h2[i]
})
end

7.times do |i|
	Room.create({
		room_name: "H3Room#{i+1}",
		house_id: 2,
		num_beds: h3[i]
	})

	Room.create({
		room_name: "H5Room#{i+1}",
		house_id: 4,
		num_beds: h5[i]
	})
end

8.times do |i|
	Room.create({
		room_name: "H4Room#{i+1}",
		house_id: 3,
		num_beds: h4[i]
	})
end

4.times do |i|
	Room.create({
		room_name: "CBRoom#{i+1}",
		house_id: 5,
		num_beds: cb[i]
	})

	Room.create({
		room_name: "NSRoom#{i+1}",
		house_id: 6,
		num_beds: ns[i]
	})
end

#TOURS


#CHECK_INS


