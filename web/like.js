function doLike(postid,userid){
    const d={
        pid:postid,
        uid:userid,
        operation:'like'
        
    };
    

$.ajax({
    url:'Like',
    data:d,
    success: function (data, textStatus, jqXHR) {
        console.log(data);
        if(data.trim()==="true"){
           
            let c=$(`.like_counter${postid}`).html();
             c++;
            $(`.like_counter${postid}`).html(c);
            
        }
    },
    error: function (jqXHR, textStatus, errorThrown) {
        
    }
    
    
});

}