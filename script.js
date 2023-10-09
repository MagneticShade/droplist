"use strict";
document.getElementById('send').addEventListener('click', function(){
    let arr=document.querySelectorAll('select')
    let string=" ";
    for (let elem of arr) {
        if (elem.value){
            string+=`${elem.name}=${elem.value}`
            string+=`&`
        }
    }
    if (string){
        string=string.slice(0, -1)
    }
    let tmp=fetch("table.php?"+string
    ).then(result=>{
        return result.json()
    }).then(result=>{
        
    })

})