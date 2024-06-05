extends Node

class Person:
	var person_name: String
	var age: int
	var occupation: String

	func _init(person_name: String, age: int, occupation: String):
		self.person_name = person_name
		self.age = age
		self.occupation = occupation
	
	func get_data():
		return {
			"name": self.person_name,
			"age": self.age,
			"occupation": self.occupation
		}
	

func insertData():
	var persons = []
	persons.append(Person.new("Mike", 25, "Software Engineer"))
	persons.append(Person.new("Steve", 30, "Doctor"))
	persons.append(Person.new("Billy", 35, "Teacher"))
	return persons

#func dictionary_to_packed_string_array(dictionary):
#	var packed_array = PackedStringArray()
#
#	for key in dictionary.keys():
##		packed_array.append(str(key))
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
	var file = FileAccess.open("res://ExportedCustomObjects.csv", FileAccess.WRITE)
	if file:
		for row in data:
			file.store_csv_line([row.name, str(row.age), row.occupation])
		file.close()
