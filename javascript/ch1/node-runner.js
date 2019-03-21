// run with node node-runner.js ExXXX

var file = process.argv[2];

var debug = false;

if (debug) {
    process.argv.forEach(function (val, index, array) {
        console.log(index + ': ' + val);
    });
}

var ex = require('./' + file);

ex.test();