



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

    addButton.addEventListener("click", function(){
        let url_path = "http://" + String(window.location.host) + "/add_link_to_workspace/" + String(workspaceID);
        let linkToAdd = String(inputLinkBox.value); 
        console.log("adding url: ", linkToAdd); 
        console.log('hostname: ',window.location.host );

        let settings = {
            method: "POST",
            headers: {
                "content-type":"application/json" 
            },
            body: JSON.stringify(linkToAdd)
        }
        
        fetch(url_path, settings); 
        
    }); 

    let inputWrapper = document.createElement("td");
    let addButtonWrapper = document.createElement("td"); 

    inputWrapper.appendChild(inputLinkBox); 
    addButtonWrapper.appendChild(addButton); 

    newRow.appendChild(inputWrapper); 
    newRow.appendChild(addButtonWrapper); 
    linkTable.appendChild(newRow); 
}); 





