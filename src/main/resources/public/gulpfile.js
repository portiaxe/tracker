var gulp = require('gulp');
var concat = require('gulp-concat');
var rename = require('gulp-rename');
var uglify = require('gulp-uglify');


function  compileClientScripts(){
	
}

function compileVendorScripts(){
	
}

gulp.task('concat', function() {
    return gulp
	    	.src([
	    		  'node_modules/angular/angular.min.js',
	    		  'node_modules/angular-ui-router/release/angular-ui-router.min.js'
	    		])
	        .pipe(concat('vendor.js'))
	        .pipe(gulp.dest('vendor'));
});