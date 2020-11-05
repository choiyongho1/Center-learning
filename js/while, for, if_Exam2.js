// 3. 숫자를 입력받아 입력받은 숫자보다 많아질때까지 피보나치 배열을 구현하세요
// 피보나치 배열은 다음과 같습니다
//  1, 1, 2, 3, 5, 8, 13, 21 과 같이 전 숫자와 전전 숫자를 더하여 계속되는 배열입니다.

let age = prompt('숫자를 입력하시오.');
let a = 1;
let b = 1;
let temp;
console.log(a);
console.log(b);
for (let i = 1; i < age; i++) {
  console.log(temp);
  temp = a + b;
  a = b;
  b = temp;
  if (temp > age) {
    break;
  }
}

// a       1 1 2 3
// b       1 2 3 5
// temp    2 3 5 8
