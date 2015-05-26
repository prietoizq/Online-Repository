// Write a method that takes an array of numbers. If a pair of numbers
// in the array sums to zero, return the positions of those two numbers.
// If no pair of numbers sums to zero, return `null`.
//
// Difficulty: medium.

function two_sum( nums ) {

	for(var i=0; i<nums.length; i++){
		for(var x=i+1; x<nums.length; x++){
			if(nums[i] + nums[x] === 0){
				console.log([i,x]);
				return [i,x];
			}
		}
	}
	return null;
}

// These are tests to check that your code is working. After writing
// your solution, they should all print true.

console.log( two_sum([1, 3, 5, -3]) === [1, 3] )
console.log( two_sum([1, 3, 5, -3]) === [1, 3] )
console.log( two_sum([1, 3, 0, 0]) === [2, 3] )
console.log( two_sum([1, 3, 0, 6]) === null )
console.log( two_sum([1, 3, 5]) === null )
