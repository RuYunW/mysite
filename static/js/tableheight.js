
function table_height()
{
    var parent=document.getElementsByTagName("tr");
    // alert(parent[parent.length-1].offsetTop);
    var bg=document.getElementsByClassName("body_container2");
    if (parent[parent.length-1].offsetTop<1100)
    {
        console.log("???????");

        bg.style.height='1100px';
    }
    else
        bg.setAttribute('height','parent[parent.length-1].offsetTop');
}
