app.factory('ProfileDataOp', ['$http', function($http){

	    var vm = this;
      var ProfileDataOp = {

        getProfile : function(){
          return $http({
              method: 'GET',
              url: 'Access/getProfile'
          })
        },

      };


      return ProfileDataOp;
    }]);
