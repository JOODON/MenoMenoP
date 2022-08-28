let mainHead=document.querySelector(`.maintitle`);
let navmain=document.querySelector(`.main`);
let navSeqrch=document.querySelector(`.Search`);
let navContact=document.querySelector(`.Contact`);
let navlogin=document.querySelector(`.login`);
let navjoin=document.querySelector(`.Custom`);

let Qusbt1=document.querySelector(`.question1`);
let Qusti1=document.querySelector(`.faq1text`);
let Qusbt2=document.querySelector(`.question2`);
let Qusti2=document.querySelector(`.faq2text`);
let Qusbt3=document.querySelector(`.question3`);
let Qusti3=document.querySelector(`.faq3text`);

let Read=document.querySelector(`.Reading`);
let Write=document.querySelector(`.Writing`);

let Readlink=document.querySelector(`.Readinglink`);
let Writelink=document.querySelector(`.Writinglink`);

let bc=0;
const mouseover=function (title){
    title.style.color=`#FF5675`;
}
const mouseout=function (title){
    title.style.color=`#464646`;
}
//마우스 올리면 제목 색상 변경
mainHead.addEventListener(`mouseover`,function (){
    mouseover(mainHead);
});

mainHead.addEventListener(`mouseout`,function (){
    mouseout(mainHead);
})

//네비게이션도 똑같이
navmain.addEventListener(`mouseover`,function (){
    mouseout(navmain);
})
navmain.addEventListener(`mouseout`,function (){
    mouseover(navmain);
})
navSeqrch.addEventListener(`mouseover`,function (){
    mouseout(navSeqrch);
})
navSeqrch.addEventListener(`mouseout`,function (){
    mouseover(navSeqrch);
})
navContact.addEventListener(`mouseover`,function (){
    mouseout(navContact);
})
navContact.addEventListener(`mouseout`,function (){
    mouseover(navContact);
})
navlogin.addEventListener(`mouseover`,function (){
    mouseout(navlogin);
})
navlogin.addEventListener(`mouseout`,function (){
    mouseover(navlogin);
})
navjoin.addEventListener(`mouseover`,function (){
    mouseout(navjoin);
})
navjoin.addEventListener(`mouseout`,function (){
    mouseover(navjoin);
})

Qusbt1.addEventListener(`click`,function (){
    bc += 1;
    console.log(bc);
    if (bc%2 !== 0){
        Qusti1.style.display=`block`;
        Qusbt1.style.color=`#FF5675`;
    }
    else {
        Qusti1.style.display=`none`;
    }
})
Qusbt1.addEventListener(`mouseover`,function (){
    Qusbt1.style.color=`#FF5675`
})

Qusbt1.addEventListener(`mouseout`,function (){
    Qusbt1.style.color=`#464646`
})

Qusbt2.addEventListener(`click`,function (){
    bc += 1;
    console.log(bc);
    if (bc%2 !== 0){
        Qusti2.style.display=`block`;
        Qusbt2.style.color=`#FF5675`;
    }
    else {
        Qusti2.style.display=`none`;
    }
})
Qusbt2.addEventListener(`mouseover`,function (){
    Qusbt2.style.color=`#FF5675`
})

Qusbt2.addEventListener(`mouseout`,function (){
    Qusbt2.style.color=`#464646`
})

Qusbt3.addEventListener(`click`,function (){
    bc += 1;
    console.log(bc);
    if (bc%2 !== 0){
        Qusti3.style.display=`block`;
        Qusbt3.style.color=`#FF5675`;
    }
    else {
        Qusti3.style.display=`none`;
    }
})
Qusbt3.addEventListener(`mouseover`,function (){
    Qusbt3.style.color=`#FF5675`;
})

Qusbt3.addEventListener(`mouseout`,function (){
    Qusbt3.style.color=`#464646`;
})

Read.addEventListener(`mouseover`,function (){
    Read.style.backgroundColor=`#FF5675`;
    Readlink.style.backgroundColor=`#FF5675`;
    Readlink.style.color=`#464646`;
})
Write.addEventListener(`mouseover`,function (){
    Write.style.backgroundColor=`#FF5675`;
    Writelink.style.backgroundColor=`#FF5675`;
    Writelink.style.color=`#464646`;
})
Read.addEventListener(`mouseout`,function (){
    Read.style.backgroundColor=`#eee8e8`;
    Readlink.style.backgroundColor=`#eee8e8`;
    Readlink.style.color=`#464646`;
})
Write.addEventListener(`mouseout`,function (){
    Write.style.backgroundColor=`#eee8e8`;
    Writelink.style.backgroundColor=`#eee8e8`;
    Writelink.style.color=`#464646`;
})


