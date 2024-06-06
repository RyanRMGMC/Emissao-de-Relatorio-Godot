extends Node

class Person:
	var person_name: String
	var email: String
	var check_in_time: String

	func _init(person_name: String, email: String, check_in_time: String):
		self.person_name = person_name
		self.email = email
		self.check_in_time = check_in_time
	
	func get_data():
		return {
			"name": self.person_name,
			"email": self.email,
			"check_in_time": self.check_in_time
		}
	

func insertData():
	var persons = []
	persons.append(Person.new("Mike", "mike123@gmail.com", "17:00"))
	persons.append(Person.new("Steve", "stevenuniverse@hotmail.com", "16:30"))
	persons.append(Person.new("Billy", "billyTheK1s@outlook.com", "08:00"))
	persons.append(Person.new("Joe", "joejoe@gmail.com", "14:00"))
	return persons

#func dictionary_to_packed_string_array(dictionary):
#	var packed_array = PackedStringArray()
#
#	for key in dictionary.keys():
#		packed_array.append(str(key))
#		packed_array.append(str(dictionary[key]))
#
#	return packed_array

func _ready():
	var personList = insertData()

	var data = []
	for person in personList:
		print(person)
		data.append(person.get_data())
	
	# Print data to console
	for row in data:
		print(row)

	# Save data to a CSV file
	var file = FileAccess.open("res://ExportedCustomObjects.csv", FileAccess.READ_WRITE)
	if file:
		file.store_csv_line(["Name", "E-mail", "Check-in"])
		for row in data:
			file.store_csv_line([row.name, row.email, row.check_in_time])
		file.close()
