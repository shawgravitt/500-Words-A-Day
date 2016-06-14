var gulp =           require('gulp');
var jshint =         require('gulp-jshint');
var jshintReporter = require('jshint-stylish');
var watch =          require('gulp-watch');
var shell =          require('gulp-shell');
var bs =             require('browser-sync').create();
var coffee =         require('gulp-coffee');
var gutil =          require('gulp-util');

var coffeeStream =   coffee({bare: true});

// var paths = {
//     'src':['*.js', 'package.json'],
//     'style': {
//         output: './files/'
//     }
// };

// gulp lint
// gulp.task('lint', function(){
//     gulp.src(paths.src)
//         .pipe(jshint())
//         .pipe(jshint.reporter(jshintReporter));
// });

// // gulp watcher for lint
// gulp.task('watch:lint', function () {
//     gulp.src(paths.src)
//         .pipe(watch())
//         .pipe(jshint())
//         .pipe(jshint.reporter(jshintReporter));
// });

coffeeStream.on('error', gutil.log);

gulp.task('coffee', function() {
    gulp.src('*.coffee')
        .pipe(coffee({bare: true}).on('error', gutil.log))
        .pipe(gulp.dest('./js/'));
});

gulp.task('watch:coffee', function () {
    gulp.watch('*.coffee', ['coffee']);
});

gulp.task('browser-sync', function(){
  bs.init({
    proxy: 'http://localhost:3000',
    port: '4000'
  });
});

gulp.task('watch', ['watch:coffee']);
gulp.task('default', ['watch']);