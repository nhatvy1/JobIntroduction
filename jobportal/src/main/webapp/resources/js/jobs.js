const dropdownItems = document.querySelectorAll('.dropdown-menu a');
const jobCate = document.querySelector('.jobCategory')
//console.log(jobCate)
//console.log(dropdownItems);

for (let item of dropdownItems) {
    item.onclick = function() {
//        console.log(this.innerText)
        jobCate.innerText = this.innerText
    }
}

//console.log("Hello world");