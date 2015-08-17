var gulp = require('gulp');
var shell = require('gulp-shell')
var plumber = require('gulp-plumber');
var browser = require("browser-sync");

console.log( process.argv.slice(2)[2])
gulp.task("server", function() {
    browser({
        server: {
            baseDir: "./"
        }
    });
});

var isWin = /^win/.test(process.platform);

//gulp.task('default',['watch']);
gulp.task("default",['server'], function() {
    gulp.watch(["*.adoc"],function (e) {
        console.log(e.path)
        if ( isWin ) {
            gulp.src(e.path)
            .pipe(plumber())
            .pipe(shell(['powershell ./generate.ps1 ' + e.path + " 2>errors.log" ]));
        } else {
            gulp.src(e.path)
            .pipe(plumber())
            .pipe(shell(['./generate.sh ' + e.path ]));
        }
    });
    gulp.watch("*.html").on('change', browser.reload);
});
