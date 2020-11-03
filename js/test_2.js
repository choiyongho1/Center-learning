const NUM = 21;
let sum=0;
while (true) {
    let number = prompt('숫자를 입력해주세요.');
    sum += parseInt(number, 10);
    // sum += Number(number);
    // alert(sum);

    if (sum === NUM) {
        alert('승리하였습니다.');
        break;
    } else if (sum < NUM) {
        continue;
    } else if (sum > NUM) {
        alert('패배하였습니다.');
    }
}
