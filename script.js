"use strict";
document.getElementById('send').addEventListener('click', function(){
    let lines=document.querySelectorAll('tr')
    for (let line of lines){
        line.remove()
    }
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
        let docEntries =document.getElementById("entries");
        for(let row of result) {
            let tr = document.createElement("tr")


            let id = row.id
            delete row.id

            for (let cell in row) {
                let tmp = document.createElement("td");
                tmp.classList.add(`${cell}`)
                let text = document.createElement("p");
                text.textContent = row[cell]
                tmp.appendChild(text)
                tr.appendChild(tmp)

            }
            docEntries.appendChild(tr)
        }
    })
})
