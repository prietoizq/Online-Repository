var myRover = {position: [0,0], positionOld: [0,0], direction: 'N'};
var grid = [[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,1,0,0,0],[0,0,1,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,1,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]];
            //Los valores de 0 son tierra normal, y los valores de 1 son obstáculos
var obstacle = false;


function goForward(rover) {
  switch(rover.direction) {
    case 'N':
      rover.position[0]--;
      break;
    case 'E':
      rover.position[1]++;
      break;
    case 'S':
      rover.position[0]++;
      break;
    case 'W':
      rover.position[1]--;
      break;
  }
  updateRover(rover);
}

function goBack(rover) {
  switch(rover.direction) {
    case 'N':
      rover.position[0]++;
      break;
    case 'E':
      rover.position[1]--;
      break;
    case 'S':
      rover.position[0]--;
      break;
    case 'W':
      rover.position[1]++;
      break;
  }
  updateRover(rover);
}

function turnLeft(rover){
  switch(rover.direction) {
    case 'N':
      rover.direction = 'W';
      break;
    case 'E':
      rover.direction = 'N';
      break;
    case 'S':
      rover.direction = 'E';
      break;
    case 'W':
      rover.direction = 'S';
      break;
  }
}

function turnRight(rover){
  switch(rover.direction) {
    case 'N':
      rover.direction = 'E';
      break;
    case 'E':
      rover.direction = 'S';
      break;
    case 'S':
      rover.direction = 'W';
      break;
    case 'W':
      rover.direction = 'N';
      break;
  }

}

function updateRover(rover){
  
    var y = rover.position[0]; 
    var x = rover.position[1];
    if(y=== -1){rover.position[0] = 9}; //con estas condiciones hacemos que si se sale de la cuadrícula, aparezca en el otro lado
    if(y=== 10){rover.position[0] = 0};
    if(x=== -1){rover.position[1] = 9};
    if(x=== 10){rover.position[1] = 0};

    if (grid[rover.position[0]][rover.position[1]] === 1){ //si encuentra un obstáculo, vuelve a la posición anterior
      console.log("Oops! I have found an obstacle! I return to my last position");
      rover.position[0] = rover.positionOld[0];
      rover.position[1] = rover.positionOld[1];
      obstacle = true;    //si encuentra un obstáculo, la variable obstacle se hace verdadera
    }else{
    
    grid[rover.positionOld[0]][rover.positionOld[1]] = 0; //el valor que ocupaba el rover (R) en la posición anterior se sustituye con un 0
    
    console.log(rover); //Antes de actualizar la posición antigua con la nueva, se muestra el rover en la consola para que puedan verse las diferencias entre las dos posiciones

    grid[rover.position[0]][rover.position[1]] = "R"; //el nuevo valor que ocupa el rover (R)
    console.log(grid);
    
    rover.positionOld[0] = rover.position[0]; //se actualiza la posición antigua con la nueva
    rover.positionOld[1] = rover.position[1];
    }
}

function seeRover(rover){
  console.log(grid);
  console.log(rover);
}

function control(rover, orders){
  obstacle = false;                           //la variable de haber encontrado un obstáculo se reinicia
    for(var i=0, l=orders.length; i<l; i+=1){
      if(obstacle === false){                 //Si se encuentra con un obstáculo, dejan de ejecutarse instrucciones
      switch (orders[i]){
        case 'f':
          goForward(rover);
          break;
        case 'b':
          goBack(rover);
          break;
        case 'r':
          turnRight(rover);
          break;
        case 'l':
          turnLeft(rover);
          break;
      }
      }
    }
}


//control(myRover,"fffffrfflffffff");
