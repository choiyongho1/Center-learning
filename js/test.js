const ID = '123456733';
const PASSWORD = '1234567';
let security = prompt('아이디를 입력해주세요.');
let security1 = prompt('암호를 입력해주세요.');
if (security === ID && security1 === PASSWORD) {
    alert("로그인 되었습니다!");
} else {
    alert("로그인에 실패하였습니다.");
}