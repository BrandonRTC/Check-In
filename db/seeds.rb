# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#USERS

User.create({
	username: "Chas",
	password: "password",
	permissions: 0})

User.create({
	username: "House1_first",
	password: "house1pass",
	permissions: 1
})

User.create({
	username: "House1_second",
	password: "house1pass2",
	permissions: 1
})

User.create({
	username: "House2_first",
	password: "house2pass",
	permissions: 2
})

User.create({
	username: "House2_second",
	password: "house2pass2",
	permissions: 2
})

User.create({
	username: "House3_first",
	password: "house3pass",
	permissions: 3
})

User.create({
	username: "House3_second",
	password: "house3pass2",
	permissions: 3
})

User.create({
	username: "House4_first",
	password: "house4pass",
	permissions: 4
})

User.create({
	username: "House4_second",
	password: "house4pass2",
	permissions: 4
})

User.create({
	username: "House5_first",
	password: "house5pass",
	permissions: 5
})

User.create({
	username: "House5_second",
	password: "house5pass2",
	permissions: 5
})

User.create({
	username: "CB_first",
	password: "cbpass",
	permissions: 6
})

User.create({
	username: "CB_second",
	password: "cbpass2",
	permissions: 6
})

User.create({
	username: "NS_first",
	password: "nspass",
	permissions: 7
})

User.create({
	username: "NS_second",
	password: "nspass2",
	permissions: 7
})

#HOUSES

House.create({
	house_name: "House1",
	permission_number: 1
})

House.create({
	house_name: "House2",
	permission_number: 2
})

House.create({
	house_name: "House3",
	permission_number: 3
})

House.create({
	house_name: "House4",
	permission_number: 4
})

House.create({
	house_name: "House5",
	permission_number: 5
})

House.create({
	house_name: "CB",
	permission_number: 6
})

House.create({
	house_name: "NS",
	permission_number: 7
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


