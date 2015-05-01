// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

button = document.getElementById('like-button');
button.addEventListener('click', likeArticle, false);

var number = 0;
numero = document.getElementById('contador');
numero.innerHTML = number;


function likeArticle () {
//	console.log(button);
	number += 1;
	numero.innerHTML = number;
  button.classList.add('liked');
  button.innerHTML = "Liked!";
  document.querySelector('h1').style.color = "red";
};
