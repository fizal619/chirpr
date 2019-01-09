let area = document.querySelector('#create-post');
if (area){
  area.addEventListener('keyup', function(e){
    document.querySelector('#count_message').textContent = (140 - area.value.length) + " characters remaining!";
  })
}