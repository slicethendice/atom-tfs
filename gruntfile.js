module.exports = function(grunt) {
  var libFiles = 'lib/**/*.js';

  grunt.initConfig({
    githooks: {
      all: {
        'pre-commit': {
          taskNames: 'lint test'
        }
      }
    },
    jsdoc: {
      dist: {
        src: libFiles,
        options: {
          destination: 'doc'
        }
      }
    },
    jshint: {
      dist: {
        options: {
          reporter: require('jshint-stylish')
        },
        target: libFiles
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-githooks');

  grunt.registerTask('lint', 'jshint:dist');
  // grunt.registerTask('test', 'mochaTest:dist');
};
