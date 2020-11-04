// * 추가 문제
// 문자열이 abbbbddddeeeefff 와 같이 이어질때, 1글자씩 압축한 문자열을 출력하여라
// 예) abbbbddddeeeefff -> a4b4d4e3f
const TARGET_STRING = "AAABBBCCC";

let result = "";
let nowCharacter = "";
let nowCharacterCount = 0;

for (const char of TARGET_STRING) {
    console.log(char);
    if (!nowCharacter) {
        console.log(`Refresh ${char}`)
        nowCharacter = char;
        nowCharacterCount ++;
    } else {
        if (nowCharacter === char) {
            nowCharacterCount ++;
        }
        else {
            if (nowCharacterCount === 1) {
                result += `${nowCharacter}`;    
            }
            else {
                result += `${nowCharacterCount}${nowCharacter}`;
            }
            nowCharacter = char;
            nowCharacterCount = 1;
        }
    }
}
if (nowCharacterCount === 1) {
    result += `${nowCharacter}`;    
}
else {
    result += `${nowCharacterCount}${nowCharacter}`;
}

console.log(result);