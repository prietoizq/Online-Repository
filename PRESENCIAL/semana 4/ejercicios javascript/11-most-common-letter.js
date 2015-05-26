// Write a method that takes in a string. Your method should return the
// most common letter in the array, and a count of how many times it
// appears.
//
// Difficulty: medium.

function most_common_letter(string) {

	var list = {};
	var array = string.split("");

	array.forEach(function(letter){
		if(list[letter]!==undefined){
			list[letter]+=1;
		}else{
		list[letter] = 1;
		}
	})
	console.log(list);

	var higher = 0;
	var higher_letter

	for (var letter in list){
		if(list[letter]>higher){
			higher = list[letter];
			higher_letter = letter;
		}
	}

	console.log([String(higher_letter), higher]);
	return [String(higher_letter), higher];
}


// These are tests to check that your code is working. After writing
// your solution, they should all print true.

console.log( most_common_letter('abca') === ['a', 2] );
console.log( most_common_letter('abbab') === ['b', 3] );
