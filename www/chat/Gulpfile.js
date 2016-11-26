var gulp = require('gulp');
var sass = require('gulp-sass');
var shell = require('gulp-shell');

/**
 * Transform SASS to CSS
 */
gulp.task('styles', function() {
  gulp.src('sass/**/*.scss')
      .pipe(sass().on('error', sass.logError))
      .pipe(gulp.dest('./css/'));
});

/**
 * Create a ZIP release
 */
gulp.task('release',
  shell.task(['rm dist/* | true && zip -9 -r -x@release-exclude.txt dist/release.zip .']));

/**
 * Default task: watch SASS
 */
gulp.task('default', ['styles'], function() {
  gulp.watch('sass/**/*.scss',['styles']);
});
