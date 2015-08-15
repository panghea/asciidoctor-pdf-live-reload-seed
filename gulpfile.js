var gulp = require('gulp');
var shell = require('gulp-shell')

    console.log( process.argv.slice(2)[2])

gulp.task('gen', function() {
    gulp.src("*.adoc")
    .pipe(shell(['./generate.sh ' + process.argv.slice(2)[2]]));
});

gulp.task('watch', function (callback) {
  gulp.watch(process.argv.slice(2)[2] + ".adoc",['gen'], function (e) {
    // added, changed or deleted のどれかが発生するはず
    console.log(e.type)
  })
});

gulp.task('default',['watch']);
