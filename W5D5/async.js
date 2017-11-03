
const fn = function() {
  alert('HAMMERTIME');
};

window.setTimeout(fn, 5000);

// asynchronous
//----------------

const hammerTime = function hammerTime(time) {
  window.setTimeout(function() {alert(`${time} is hammertime!`)},time);
};

//----------------
