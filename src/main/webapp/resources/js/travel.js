/**
 * travel.js
 */
 
  function toggle(){
  	if(document.getElementById('tab_hidden').style.display == 'block') {
  		document.getElementById('tab_hidden').style.display = 'none';
  		document.getElementById('tog_btn').textContent = '더보기';
  	} else {
  		document.getElementById('tab_hidden').style.display = 'block';
  		document.getElementById('tog_btn').textContent = '접기';
  	}
  }