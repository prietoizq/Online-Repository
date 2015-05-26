// Write a method that takes an integer `n` in; it should return
// n*(n-1)*(n-2)*...*2*1. Assume n >= 0.
//
// As a special case, `factorial(0) == 1`.
//
// Difficulty: easy.

function factorial(n) {
	if(n===0){
		return 1;
	}else{
		var result = 1;
		for(var i=n; i>0; i--){
			result = result*i;
		}
		return result;
	}
}

// These are tests to check that your code is working. After writing
// your solution, they should all print true.

console.log( factorial(0) === 1 )
console.log( factorial(1) === 1 )
console.log( factorial(2) === 2 )
console.log( factorial(3) === 6 )
console.log( factorial(4) === 24 )
