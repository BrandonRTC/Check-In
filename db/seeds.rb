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
	username: "John",
	password: "brandonbedcheck",
	superuser: true
})

User.create({
	username: "Super1",
	password: "superpassword1",
	superuser: true
})

User.create({
	username: "Super2",
	password: "superpassword2",
	superuser: true
})

User.create({
	username: "H1_first",
	password: "h1kindle1",
})

User.create({
	username: "H1_second",
	password: "h1kindle2",
})

User.create({
	username: "H2_first",
	password: "h2kindle1",
})

User.create({
	username: "H2_second",
	password: "h2kindle2",
})

User.create({
	username: "H3_first",
	password: "h3kindle1",
})

User.create({
	username: "H3_second",
	password: "h3kindle2",
})

User.create({
	username: "H4_first",
	password: "h4kindle1",
})

User.create({
	username: "H4_second",
	password: "h4kindle2",
})

User.create({
	username: "H5_first",
	password: "h5kindle1",
})

User.create({
	username: "H5_second",
	password: "h5kindle2",
})

User.create({
	username: "CB_first",
	password: "cbkindle1",
})

User.create({
	username: "CB_second",
	password: "cbkindle2",
})

User.create({
	username: "NS_first",
	password: "nskindle1",
})

User.create({
	username: "NS_second",
	password: "nskindle2",
})

#PERMISSIONS

i = 1
7.times do 

	Permission.create({
		user_id: User.first.id,
		house_id: i
	})

	Permission.create({
		user_id: User.first.id + 1,
		house_id: i
	})

	Permission.create({
		user_id: User.first.id + 2,
		house_id: i
	})

	i+=1
end

#BEWARE HARD CODED STARTING IDS!
#(probably maybe should cook up a more robust way to assign ids)
q = 4
z = 1

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
	house_name: "Cedarbrook",
})

House.create({
	house_name: "Nobscot",
})

#ROOMS; figure out how to make this less brittle

h1 = [1,2,4,2,4]
h2 = [1,1,4,1,4]
h3 = [1,1,3,3,2,1,4]
h4 = [3,4,1,1,1,1,2,2]
h5 = [2,2,1,1,1,1,1]
cb = [3,2,4,2]
ns = [2,3,2,4]

5.times do |i|
Room.create({
	room_name: "H1Room#{i+1}",
	house_id: 1,
	num_beds: h1[i]
})

Room.create({
	room_name: "H2Room#{i+1}",
	house_id: 2,
	num_beds: h2[i]
})
end

7.times do |i|
	Room.create({
		room_name: "H3Room#{i+1}",
		house_id: 3,
		num_beds: h3[i]
	})

	Room.create({
		room_name: "H5Room#{i+1}",
		house_id: 5,
		num_beds: h5[i]
	})
end

8.times do |i|
	Room.create({
		room_name: "H4Room#{i+1}",
		house_id: 4,
		num_beds: h4[i]
	})
end

4.times do |i|
	Room.create({
		room_name: "CBRoom#{i+1}",
		house_id: 6,
		num_beds: cb[i]
	})

	Room.create({
		room_name: "NSRoom#{i+1}",
		house_id: 7,
		num_beds: ns[i]
	})
end
