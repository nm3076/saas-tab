var openAllButton = document.getElementById("click-to-open"); 
console.log(openAllButton);
openAllButton.addEventListener("click", async function(){
    console.log(window.location);
    let protocol = window.location.protocol; 
    console.log('hello!')
    let host_url = String(protocol) + '//' + String(window.location.host) + '/open_links/'; 
    let settings = {
        method: 'GET',
        headers:  {
          "Content-Type": "application/json",
        }
    }

    console.log('in open-all')
    let response = await fetch(host_url, settings); 
    let links = await response.json(); 
                        
    console.log(links, "-> links: ", links.length); 
    for(let i = 0; i < links.length ; i++ ){ 
        window.open(links[i], '_blank'); 
        console.log("opening link, ", links[i]);
    }

}); 

