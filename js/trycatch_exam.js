try {
  alert('try 블록 시작');
  lalalala;
  alert('try 블록 끝');
} catch (err) {
  alert(`${err.name}, ${err.message}`);
}
