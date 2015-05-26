// Write a method that takes in a string. Return the longest word in
// the string. You may assume that the string contains only letters and
// spaces.
//
// You may use the String `split` method to aid you in your quest.
//
// Difficulty: easy.

function longest_word(sentence) {

	var words = sentence.split(" ");
	var longestWord ="";
	words.forEach(function(word){
		if(word.length > longestWord.length){
			longestWord = word;
		}
	});
	return longestWord;
}


// These are tests to check that your code is working. After writing
// your solution, they should all print true.

console.log( longest_word( 'short longest' ) === 'longest' )
console.log( longest_word( 'one' ) === 'one' )
console.log( longest_word( 'abc def abcde' ) === 'abcde' )
