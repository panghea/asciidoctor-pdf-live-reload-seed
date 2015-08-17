var gulp = require('gulp');
var shell = require('gulp-shell')
var plumber = require('gulp-plumber');
var convertEncoding = require('gulp-convert-encoding');

console.log( process.argv.slice(2)[2])

var isWin = /^win/.test(process.platform);
if (isWin) {
    gulp.task('gen', function() {
        gulp.src(  process.argv.slice(2)[2] + ".adoc")
        .pipe(plumber())
        .pipe(shell(['powershell ./generate.ps1 ' + process.argv.slice(2)[2]]))
        .pipe(convertEncoding({to: "utf-8"}));
    });
} else {
    gulp.task('gen', function() {
        gulp.src(process.argv.slice(2)[2] +".adoc")
        .pipe(plumber())
        .pipe(shell(['./generate.sh ' + process.argv.slice(2)[2]]));
    });
}

gulp.task('watch', function (callback) {
  gulp.watch(process.argv.slice(2)[2] + ".adoc",['gen'], function (e) {
    // added, changed or deleted のどれかが発生するはず
    console.log(e.type)
  })
});

gulp.task('default',['watch']);

