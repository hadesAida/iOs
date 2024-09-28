let fruits = ["Apple", "Banana", "Cherry", "Date", "Elderberry"]

print(fruits[2])

var favoriteNumbers: Set = [3,5,7]

favoriteNumbers.insert(11)

print(favoriteNumbers)

let languages = ["Swift": 2014, "Python": 1991, "Java": 1995]

print(languages["Swift"]!)

var colors = ["Red", "Green", "Blue", "Yellow"]

colors[1] = "Purple"

print(colors)

let setA: Set = [1,2,3,4]
let setB: Set = [3,4,5,6]

let intersection = setA.intersection(setB)

print(intersection)

var studentScores = ["Alice": 85, "Bob":90, "Charlie":88]
studentScores["Alice"] = 95
print(studentScores)

let array1 = ["apple", "banana"]
let array2 = ["cherry", "date"]

let mergedArray = array1 + array2
print(mergedArray)

var countries = ["USA": 331_000_000, "India": 1_380_000, "China": 1_400_000]
countries["Brazil"] = 212_000_000
print(countries)

let animalsA: Set = ["cat", "dog"]
let animalsB: Set = ["dog", "mouse"]

let result = animalsA.union(animalsB).subtracting(animalsB)

print(result)

let studentGrades = ["Alice": [85,90,92], "Bob": [78,88,84], "Charlie": [95,91,89]]
print(studentGrades["Bob"]![1])


