const BIG_SUGAR = 5;
const SMALL_SUGAR = 3;
let sugar = 16;

let bagCount = 0;

while(true) {
    if(sugar % 5 === 0) {
        bagCount += sugar / 5;
        break;
    } else if (sugar <= 0) {
        bagCount = -1;
        break;
    }
    sugar -= 3;
    bagCount ++;
}
console.log(bagCount);