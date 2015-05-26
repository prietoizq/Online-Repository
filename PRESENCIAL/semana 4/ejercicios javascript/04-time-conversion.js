// Write a method that will take in a number of minutes, and returns a
// string that formats the number into `hours:minutes`.
//
// Difficulty: easy.

function time_conversion( minutes ) {
	var hours = Math.floor(minutes / 60);
	minutes = minutes % 60;

	return minutes > 9 ? hours+":"+minutes : hours+":0"+minutes;
}

// These are tests to check that your code is working. After writing
// your solution, they should all print true.

console.log( time_conversion(15) === '0:15' )
console.log( time_conversion(150) === '2:30' )
console.log( time_conversion(360) === '6:00' )
