function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  x = 'out of block again';
  console.log(x);
}

// -------------

function madLib(verb, adj, noun) {
  return "We shall " + verb.toUpperCase() + " the " + adj.toUpperCase() + " " + noun.toUpperCase();
}

> madLib('make', 'best', 'guac');
"We shall MAKE the BEST GUAC."


// -------------

function isSubstring(searchString, subString) {
  return searchString.includes(subString)
}

> isSubstring("time to program", "time")
true

> isSubstring("Jump for joy", "joys")
false

// -------------

function fizzBuzz(array) {

  var res_array = [];

  const divisibleByFifteen = function (num) {
    return num % 15 === 0;
  };

  const push_if_divisable = function (num) {
    if (divisibleByFifteen(num)) {
        res_array.push(num);
    }
  }

  array.forEach(push_if_divisable)

  return res_array
}

> arr = [1,2,3,15,16,30]
[ 1, 2, 3, 15, 16, 30 ]
> fizzBuzz(arr)
[ 15, 30 ]
>

// -------------

function isPrime(num) {
  var i = 2;
  while (i < num) {
    // console.log(i)
    if (num % i === 0) {
      return false
    }
    i += 1
  }
  return true
}

console.log(isPrime(3548563))

> isPrime(2)
true

> isPrime(10)
false

> isPrime(15485863)
true

> isPrime(3548563)
false

// -------------

function isPrime(num) {
  var i = 2;
  while (i < num) {
    // console.log(i)
    if (num % i === 0) {
      return false
    }
    i += 1
  }
  return true
}

function sumOfNPrimes(n) {
  var res_sum = 0;
  var i = 2;
  var count = 0;

  while (count < n) {
    if (isPrime(i)) {
      res_sum += i;
      count += 1;
    }
    i += 1
  }

  return res_sum
}


> sumOfNPrimes(0)
0

> sumOfNPrimes(1)
2

> sumOfNPrimes(4)
17

// -------------

var print_each = function(arr) {
  arr.forEach(el => console.log(el))
}

function titleize(arr_of_names, print_each) {
  var mapped_names =  arr_of_names.map(function(el) {
      return "Mx. " + el + " Jingleheimer Schmidt";
  })

  print_each(mapped_names)

}

titleize(["Mary", "Brian", "Leo"],print_each)

// -------------
