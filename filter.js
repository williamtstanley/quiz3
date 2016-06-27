


var isEven = function (x) { return x % 2 === 0; };


var filter = function(arr, fn) {
    outArr = [];
    for (var i = 0; i < arr.length; i++) {
        if (isEven(arr[i])){
            outArr.push(arr[i]);
        }
    }
    return outArr;
};

console.log(filter([1, 2, 3, 4], isEven)); // => [2, 4]