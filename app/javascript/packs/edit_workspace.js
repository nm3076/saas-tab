



var addLinkButton = document.getElementById("add-link-to-workspace"); 
var workspaceID = addLinkButton.value
console.log("workspace id b4 click: ", workspaceID); 
addLinkButton.addEventListener("click", function(){ 
    let linkTable = document.getElementById("link-list"); 
    let newRow = document.createElement("tr"); 
    let inputLinkBox = document.createElement("input"); 
    inputLinkBox.placeholder = "Link to add..."; 
    let addButton = document.createElement("button"); 
    let addButtonText = document.createTextNode("Add Current Link"); 
    addButton.appendChild(addButtonText);

    addButton.addEventListener("click", async function(){
        let protocol = window.location.protocol; 

        let url_path = String(protocol) + "//" + String(window.location.host) + "/add_link_to_workspace/" + String(workspaceID);
        let linkToAdd = String(inputLinkBox.value); 
        
        let https = "https://www.";
        let http = "http://www.";
        let http2 = "http://";
        let https2 = "https://";

        if( !linkToAdd.includes(http) && !linkToAdd.includes(https) && !linkToAdd.includes(https2) && !linkToAdd.includes(http2)){
            alert("Invalid link! Cannot add this to your workspace." +
                  "Please make sure your link is valid and includes 'https://www.', " +
                  "'http://www.', 'http://', or 'https://'!"); 
            return 
        }
        

        console.log("adding url: ", linkToAdd); 
        console.log("protocol: ", protocol); 
        console.log('hostname: ',window.location.host );

        let settings = {
            method: "POST",
            headers: {
                "content-type":"application/json" 
            },
            body: JSON.stringify(linkToAdd)
        }
        
        await fetch(url_path, settings);
        
        window.location = String(protocol) + "//" + String(window.location.host) + "/workspaces/" + String(workspaceID);
    }); 

    let inputWrapper = document.createElement("td");
    let addButtonWrapper = document.createElement("td"); 

    inputWrapper.appendChild(inputLinkBox); 
    addButtonWrapper.appendChild(addButton); 

    newRow.appendChild(inputWrapper); 
    newRow.appendChild(addButtonWrapper); 
    linkTable.appendChild(newRow); 
}); 





