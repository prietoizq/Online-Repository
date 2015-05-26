// Write a method that takes in a number and returns a string, placing
// a single dash before and after each odd digit. There is one
// exception: don't start or end the string with a dash.
//
// You may wish to use the `%` modulo operation; you can see if a number
// is even if it has zero remainder when divided by two.
//
// Difficulty: medium.

function dasherize_number(num) {


    	FALTA POR ACABAR

	var array_num = num.toString().split("");

	var array = "";
	var l=array_num.length;

	for(var i=0; i<l; i++){
		array += array_num[i];
		if(array_num[i]%2===1){
			array += "-";
		}
	}


	array_num.forEach(function(n){
		if(n%2===1){
			array += "-";
		}
		array += n;
		if(n%2===1){
			array += "-";
		}
	})
	console.log(array);
	return array;
}

// These are tests to check that your code is working. After writing
// your solution, they should all print true.

console.log( dasherize_number(203) === '20-3' );
console.log( dasherize_number(303) === '3-0-3' );
console.log( dasherize_number(333) === '3-3-3' );
console.log( dasherize_number(3223) === '3-22-3' );
