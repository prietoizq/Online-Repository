/* 
 var grid = [[0,1,0,0,0,0,0,0,0,0],     //0,0 ... 0,9
			 [0,0,0,0,0,0,0,0,0,0],     //1,0 ... 1,9
			 [0,0,0,0,0,0,0,0,0,0],    //2,0 ... 2,9
			 [0,0,0,0,0,0,0,0,0,0],   //3,0 ... 3,9
			 [0,0,0,0,0,0,0,0,0,0],  //4,0 ... 4,9
			 [0,0,0,0,0,0,0,0,0,0], //5,0 ... 5,9
			 [0,0,0,0,0,0,0,0,0,0], //6,0 ... 6,9
			 [0,0,0,0,0,0,0,0,0,0], //7,0 ... 7,9
			 [0,0,0,0,0,0,0,0,0,0], //8,0 ... 8,9
			 [0,0,0,0,0,0,0,0,0,0]];//9,0 ... 9,9
*/
var grid = [];
var rover = {};



function createGrid() {
	
	for (i = 0 ; i < 10 ; i++) {
 		grid[i] = []; 

 		for (j = 0 ; j < 10; j++) {
 	 		grid[i][j]=0;
 			//console.log(grid[i][j]);
 		}
	}
}
function createRover() {
	rover = {
		position: [4][4],
		direction: "N"
	}
}

function showGrid() {
	for (i = 0 ; i < 10 ; i++) {
 		 document.write("<br>");

 		for (j = 0 ; j < 10; j++) {
 	 		document.write("<strong>|_"+grid[i][j]+"_|</strong>");			
 		}
	}
	document.write("<br>");
}

function initRover(i, j) {

	//console.log(starting_position);

	 rover = {

	 	 position: grid[i][j]="<strong style='color:blue;'>N</strong>"
	 };
	 document.body.innerHTML = "";
	 showGrid();
}


function moveRover(x,y) {
	var move = prompt("Where do you want to move? (N, S, E or W)");
	move = move.toLowerCase();

	var array_instructions = move.split(" ");
	console.log(array_instructions);

	var keep_moving = true;
	for (var i = 0 ; i < array_instructions.length; i++) {
		switch(array_instructions[i]) {
			case "n":
			rover.position = grid[x][y]="<strong style='color:green;'>"+0+"</strong>"
			rover.position = grid[x-=1][y]="<strong style='color:blue;'>N</strong>"

			break;

			case "s":
			rover.position = grid[x][y]="<strong style='color:green;'>"+0+"</strong>"
			rover.position = grid[x+=1][y]="<strong style='color:blue;'>N</strong>"
			break;

			case "e":
			rover.position = grid[x][y]="<strong style='color:green;'>"+0+"</strong>"
			rover.position = grid[x][y+=1]="<strong style='color:blue;'>N</strong>"
			break;

			case "w":
			rover.position = grid[x][y]="<strong style='color:green;'>"+0+"</strong>"
			rover.position = grid[x][y-=1]="<strong style='color:blue;'>N</strong>"
			break;	
		}
	

		document.body.innerHTML = "";
		showGrid();
	}
		var ask = prompt("Want to move to another point?(Yes or no)");
		ask = ask.toLowerCase();
		if (ask === "yes") {
			keep_moving = true;
			moveRover(x, y);
		}
		else {
			keep_moving = false;
		}


}

function setObstacles() {

}


createGrid();

//createRover();

showGrid();

initRover(4, 4);

moveRover(4, 4);


//console.log(grid[0][0]);