var user = {};
var responses = [];

function question1(){
	var name = prompt('Hello! What is your name?');
	user.name = name;
}

question1();

alert("Let's start the quiz!");
alert("You will pass the quiz if you guess at least 3 answers!");

function question2(){
	var firstQuestion = prompt('Does null === 0 ? (Yes or No)');
	if (firstQuestion.toLowerCase() === 'yes'){
		firstQuestion = true;
		alert('Right answer!');
	} else if (firstQuestion.toLowerCase() === 'no'){
		firstQuestion = false;
		alert('Wrong answer!');
	} else {
		alert("Please answer either Yes or No");
		return question2();
	}
	responses.push(firstQuestion);
}

question2();

function question3(){
	var secondQuestion = prompt('What was the original name for JavaScript: Java, LiveScript, JavaLive, or ScriptyScript?');
	secondQuestion = secondQuestion.toLowerCase();
	switch (secondQuestion){
		case 'java':
		case 'javalive':
		case 'scriptyscript':
			alert('Wrong answer!');
			secondQuestion = false;
		break;

		case 'livescript':
			alert('Right answer!');
			secondQuestion = true;
		break;

		default:
			alert('Please, choose one of the options');
			return question3();
		break;
	}
	responses.push(secondQuestion);
}

question3();

function question4(){
	var thirdQuestion = prompt('True or false: an external file with JavaScript code should contain a <script> tag (Yes or No)');
	if (thirdQuestion.toLowerCase() === 'yes'){
		thirdQuestion = false;
		alert('Wrong answer!');
	} else if (thirdQuestion.toLowerCase() === 'no'){
		thirdQuestion = true;
		alert('Right answer!');
	} else {
		alert("Please, answer either Yes or No");
		return question4();
	}
	responses.push(thirdQuestion);
}

question4();


function question5(){
	var fourthQuestion = prompt('To execute a set of instructions repeatedly until a certain condition is false, you would use: Break, If, While, or Switch?');
	fourthQuestion = fourthQuestion.toLowerCase();
	switch (fourthQuestion){
		case 'break':
		case 'if':
		case 'switch':
			alert('Wrong answer!');
			fourthQuestion = false;
		break;

		case 'while':
			alert('Right answer!');
			fourthQuestion = true;
		break;

		default:
			alert('Please, choose one of the options');
			return question5();
		break;
	}
	responses.push(fourthQuestion);
}

question5();

function evaluate(responsesArray){
	var t=0, f=0;
	var total=responsesArray.length;
	for(var i=0; i<total; i+=1){
		if(responsesArray[i]===true){
			t+=1;
		}else{
			f+=1;
		}
	}
	user.trues = t;
	user.falses = f;

	showResults();
}

function showResults(){
	alert("User " + user.name + " has got " + user.trues + " correct answers and " + user.falses + " wrong answers." );
	if (user.trues > 2){
		alert("Congratulations!! You have passed the quiz!");
	}else{
		alert("Sorry! You didn't passed the quiz.");
	}

}

evaluate(responses);