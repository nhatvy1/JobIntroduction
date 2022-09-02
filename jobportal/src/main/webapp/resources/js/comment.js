function loadComment(api) {
    fetch(api)
        .then(function(response) {
            return response.json();
        })
        .then(function(data) {
            let c = document.getElementById("comment");
            let h = '';
            console.log(data);
            for (let d of data) {
                h += `  <div class="d-flex flex-column comment-section">
                            <div class="bg-white p-2">
                                <div class="d-flex flex-row user-info"><img class="rounded-circle" src="${d.user.image}" width="40">
                                    <div class="d-flex flex-column justify-content-start ml-2">
                                        <span class="d-block font-weight-bold name">${d.content}</span>
                                        <span class="date text-black-50">Shared publicly - Jan 2020</span>
                                    </div>
                                </div>
                                <div class="mt-2">
                                    <p class="comment-text">${d.content}</p>
                                </div>
                            </div>
                            <div class="bg-white">
                                <div class="d-flex flex-row fs-12">
                                    <div class="like p-2 cursor"><i class="fa fa-thumbs-o-up"></i><span class="ml-1">Like</span></div>
                                    <div class="like p-2 cursor"><i class="fa fa-commenting-o"></i><span class="ml-1">Comment</span></div>
                                    <div class="like p-2 cursor"><i class="fa fa-share"></i><span class="ml-1">Share</span></div>
                                </div>
                            </div>
                        </div>`;
            }   
            c.innerHTML = h;
        });
};