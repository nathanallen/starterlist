// $(document).ready(function(){
//   //$('h1').text(window.location.pathname)
//   var custom_url = window.location.pathname
//   if (!(custom_url == '/'))
//   $.getJSON("/list" + window.location.pathname +".json", function(response){
//     $('h1').text(response.name)
//   })
// })
function SignupCtrl($scope) {
  $scope.emails = ['email@email.com', 'test@test.com'];

  $scope.addEmail = function() {
    $scope.emails.push($scope.email);
    $scope.email = '';
  };
}