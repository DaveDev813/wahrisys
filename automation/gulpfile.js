
/**
 * Gulp Work Flow Automation 
 * @author Rodave Joseph B. Bobadilla
 */

(function (req) {
    "use strict";

    /**
     * Libraries
     */
    var
        gulp = req('gulp'),
        scss = req("gulp-sass"),
        watch = req('gulp-watch'),
        plumber = req('gulp-plumber')
    ;

    /**
     * Init Variables
     */
    var css_lacation = '../assets/css';
    var scss_location = '../assets/scss';

    var paths = {
        scss: [scss_location + '/*.scss']
    };

    gulp.task('sass', function () {
        return gulp.src(scss_location + '/*.scss')
                .pipe(plumber())
                .pipe(scss().on('error', scss.logError))
                .pipe(gulp.dest(css_lacation));
    });

    /**
     * gulp.watch( [path], ['task'] );
     */
    gulp.task('taskwatch', function () {
        gulp.watch(paths.scss, ['sass']);
    });

}(require));