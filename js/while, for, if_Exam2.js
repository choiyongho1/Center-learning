let age = prompt('숫자를 입력하시오.');
let a = 1;
let b = 1
let temp;
console.log(a);
console.log(b);
for(let i=1; i < age; i++){
    console.log(temp);
    temp=a+b;
    a=b;
    b=temp;
    if(temp > age){
        break;
    }

}






// a       1 1 2 3
// b       1 2 3 5 
// temp    2 3 5 8