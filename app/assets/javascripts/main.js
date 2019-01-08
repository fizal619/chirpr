const title = document.querySelector('#title');
// defensively coding
if (title) {
  title.textContent += ' LOL I am JS';
}

console.log('HELLO');

let area = document.querySelector('textarea');

if (area) {
  area.addEventListener('keyup', function(e){
    document.querySelector('#count_message').textContent = (140 - area.value.length) + " characters remaining!";
  })
}