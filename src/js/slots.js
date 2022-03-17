var icons = [
  'apple','bananas','cherry','grapes','orange','pineapple','strawberry','watermelon'
];



var slots = document.querySelector('.slots');
var cols = document.querySelectorAll('.col');
var lose_count = 0;
var win_count = 0;
var bet_amount;
for(var i in cols) {
  if (!cols.hasOwnProperty(i))
    continue;
  var col = cols[i];
  var str = '';
  var firstThree = '';
  for(var x = 0; x < 30; x++) {
    var part = '<svg class="icon"><use xlink:href="#icon-'+icons[Math.floor(Math.random()*icons.length)]+'"></use></svg>';
    str += part
    if (x < 3) firstThree += part;
  }
  col.innerHTML = str+firstThree;
}


//var bet_amount = document.getElementById("bet_amount").value;

/* if(bet_amount == ""){
	document.getElementById("spin").style.display = "none";
}

console.log("bet amount: ", bet_amount); */

document.querySelector('input').focus();
function spin(elem) {
  	
  document.getElementById("game_result").innerHTML = "";	
  bet_amount = document.getElementById("bet_amount").value;	
  console.log("bet amount: ", bet_amount);
  elem.setAttribute('disabled', true);
  slots.classList.toggle('spinning', true);
  window.setTimeout(function() {
    for(var i in cols) {
    if (!cols.hasOwnProperty(i))
      continue;
    var col = cols[i];
    
      var icons = [
  'apple','bananas','cherry','grapes','orange','pineapple','strawberry','watermelon'
];
      var results = [
        icons[Math.floor(Math.random()*icons.length)],
        icons[Math.floor(Math.random()*icons.length)],
        icons[Math.floor(Math.random()*icons.length)]
      ];
	  
	console.log(results); 
	for(var t in results){
	//	console.log(results[t]);
		if(t == 2){
		// console.log(results[t-2]);
		// console.log(results[t-1]);
		 //console.log(results[t]);
		 
		 //all results matching and win
		if((results[t-2] == results[t-1]) && (results[t-2] == results[t])){
		//	console.log("YOU WIN!!!");
			win_count = win_count + 1;
		
		}
		else{
			//console.log("YOU LOSE!!!");
			lose_count = lose_count + 1;
			
		}
	
		}
		
		
	}
	
	if(lose_count == 5){
		console.log("YOU LOSE!!!");
		document.getElementById("game_result").innerHTML = "YOU LOSE"
		}
	else if(win_count != 0){
		console.log("YOU WIN!!!");
		document.getElementById("game_result").innerHTML = "YOU WIN"
	}

	
	
    var icons = col.querySelectorAll('.icon use');
    for(var x = 0; x < 3; x++) {
      icons[x].setAttribute('xlink:href', '#icon-'+results[x]);
      icons[(icons.length-3)+x].setAttribute('xlink:href', '#icon-'+results[x]);
    }
  }
  }, 1500);
  
	lose_count = 0;
	win_count = 0;
	document.getElementById("bet_amount").value = "";	
  
  window.setTimeout(function() {
    slots.classList.toggle('spinning', false);
    elem.removeAttribute('disabled');
    elem.focus();
  }.bind(elem), 3500);
}


