	// app.js
	// create angular app
	'use strict';
	var validationApp = angular.module('validationApp', ['validationApp.directives']);

	// create angular controller
	validationApp.controller('mainController', function($scope) {
		//za konfirmacija na lozinka
		$scope.password = 'password';
		// function to submit the form after all validation has occurred			
		$scope.submitForm = function() {

			// check to make sure the form is completely valid
			if ($scope.userForm.$valid) {
				alert('our form is amazing');
			}

		};

	});
	
	//directives
	angular.module('validationApp.directives', [])
    .directive('pwCheck', [function () {
	    return {
	        require: 'ngModel',
	        link: function (scope, elem, attrs, ctrl) {
	            var firstPassword = '#' + attrs.pwCheck;
	            elem.add(firstPassword).on('keyup', function () {
	                scope.$apply(function () {
	                    //console.info(elem.val() === $(firstPassword).val());
	                    ctrl.$setValidity('pwmatch', elem.val() === $(firstPassword).val());	                    
	                });
	            });
	        }
	    }
    }]);
	