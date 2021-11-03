

var openAllButton = document.getElementById("click-to-open"); 
openAllButton.addEventListener("click", async function(){

    let openLink = function(link){ 
        window.open(link); 
        console.log("opened link, ", link);
    };

    console.log("OPEN ALL BUTTON CLICKED!"); 
    let protocol = window.location.protocol; 

    let workspaceID = openAllButton.value; 


    let host_url = String(protocol) + '//' + String(window.location.host) + '/open_links/' + String(workspaceID);
    console.log("host url: ", host_url);  
    let settings = {
        method: 'GET',
        headers:  {
          "Content-Type": "application/json",
        }
    }

    console.log('in open-all')
    let response = await fetch(host_url, settings); 
    let links = await response.json(); 
    console.log("Response from server: ", links);                     
    
    for(let i = 0; i < links.length ; i++ ){ 
        let curr_link = links[i]["link"]; 
        console.log("opening link, ", curr_link);
        openLink(curr_link); 
    }

}); 



