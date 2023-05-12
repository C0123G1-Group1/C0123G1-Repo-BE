// let userName =document.querySelector("#user");
// let password=document.querySelector("#password");
// let confirmPassword=document.querySelector("#confirm-password");
// let fullName =document.querySelector("#fullName");
// let email=document.querySelector("#email");
// let phoneNumber=document.querySelector("#phoneNumber")
// // let form=document.querySelector('form')
// function showError(input,message){
//     let parent =input.parentElement;
//     let small= parent.querySelector('small')
//
//     parent.classList.add('error')
//     small.innerText=message;
// }
// showError(userName,'');
// // function checkError(listInput) {
// //     let isEmptyError=false;
// // }
// function checkEmptyError(listInput) {
//     let isEmptyError=false;
//     listInput.forEach(input =>{
//         input.value=input.value.trim()
//         if (!input.value){
//             isEmptyError=true;
//             showError(input,'Cannot be left empty')
//         }else {
//             showSuccess(input)
//         }
//     });
//     return isEmptyError
// }
// function showSuccess(input) {
//     let parent =input.parentElement;
//     let small= parent.querySelector('small')
//
//     parent.classList.remove('error')
//     small.innerText='';
// }
// form.addEventListener('submit',function (e) {
//     e.preventDefault()
//     checkEmptyError(userName,email,password,confirmPassword,fullName,phoneNumber)
// })

function checkPassword() {
    let passwordFirst = document.getElementById("password").value;
    let passwordLast = document.getElementById("confirm-password").value;
    if(passwordLast !== ""){
        if(passwordFirst === passwordLast){
            document.getElementById("3").innerText = "";
        }else {
            document.getElementById("3").innerText = "Password invalid";
        }
    }x
}
    function checkName() {
        let name = document.getElementById("fullName").value;
        let regexName = /^[A-Z][a-z]*(\s[A-Z][a-z]*)+$/;
        if (regexName.test(name)) {
            document.getElementById('4').innerText='';
        } else {
            document.getElementById('4').innerText="The Name is not in the correct format";
        }
}
function checkUser() {
    let name = document.getElementById("user").value;
    let regexName = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,10}$/;
    if (regexName.test(name)) {
        document.getElementById("1").innerText = "";
    } else {
        document.getElementById("1").innerText = "The Name is not in the correct format";
    }
}
function checkEmail() {
    let name = document.getElementById("email").value;
    let regexName = /^[a-z]\w{5,}\@[a-z]{3,5}\.[a-z]{2,5}$/;
    if (regexName.test(name)) {
        document.getElementById("5").innerText = "";
    } else {
        document.getElementById("5").innerText = "The Name is not in the correct format";
    }
}
function checkPhoneNumber() {
    let name = document.getElementById("phoneNumber").value;
    let regexPhone=/^((\+84)|0)[0-9]{9}$/;
    if (regexPhone.test(name)) {
        document.getElementById("6").innerText = "";
    } else {
        document.getElementById("6").innerText = "The Name is not in the correct format";
    }
}

