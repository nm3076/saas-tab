

var addLinkButton = document.getElementById("add-link-to-workspace"); 
var workspaceID = addLinkButton.value

addLinkButton.addEventListener("click", function(){ 

    //figure out last id for workspace inputs 
    var allInputs = document.getElementsByClassName("workspace-input");

    // if there are already links in table, 
    // then continue indexing off last one
    if (allInputs.length > 0){
        let allCurrentkeys = {}; 
        for(let i = 0; i < allInputs.length; i ++){
            let curr_input = allInputs[i].name ; 
            let index = curr_input.indexOf("-") + 1; 
            let currInt = Number(curr_input.substring(index, curr_input.length));
            if (!(currInt in allCurrentkeys)){
                allCurrentkeys[currInt] = curr_input;
            }
        }

        // ensure next key will be using is completeley unique
        let last_input = allInputs[allInputs.length - 1].name ; 
        let index = last_input.indexOf("-") + 1; 
        let nextInt = Number(last_input.substring(index, last_input.length)) + 1;
        let foundKey = false; 
        while(!foundKey){
            if (!(nextInt in allCurrentkeys)){
                allCurrentkeys[nextInt] = last_input;
                foundKey = true; 
            }else{ 
                nextInt += 1; 
            }
            console.log("next int currently : ", nextInt);
        }
        
        //create new row of input elements 
        let linkTable = document.getElementById("link-list"); 
        let newRow = document.createElement("tr"); 
        let keyValues = ["name-" + String(nextInt), "link-"+ String(nextInt), "date-"+ String(nextInt), "notes-"+ String(nextInt) ]; 
        
        for(let i = 0; i < keyValues.length; i ++){
            let inputWrapper = document.createElement("td");
            let inputLinkBox = document.createElement("input"); 
            inputLinkBox.placeholder = keyValues[i].substring(0,keyValues.length).charAt(0).toUpperCase() 
                                            + keyValues[i].substring(1,keyValues.length); 
            inputLinkBox.name = keyValues[i];
            inputLinkBox.className = "workspace-input";
            inputWrapper.appendChild(inputLinkBox);
            newRow.appendChild(inputWrapper);
        }
        console.log("added input box: ", nextInt)
        linkTable.appendChild(newRow); 

    }else{ 
        //create new row of input elements 
        let linkTable = document.getElementById("link-list"); 
        let newRow = document.createElement("tr"); 
        let nextInt = 0; 
        let keyValues = ["name-" + String(nextInt), "link-"+ String(nextInt), "date-"+ String(nextInt), "notes-"+ String(nextInt) ]; 
        
        for(let i = 0; i < keyValues.length; i ++){
            let inputWrapper = document.createElement("td");
            let inputLinkBox = document.createElement("input"); 
            inputLinkBox.placeholder = keyValues[i].substring(0,keyValues.length).charAt(0).toUpperCase() 
                                            + keyValues[i].substring(1,keyValues.length); 
            inputLinkBox.name = keyValues[i];
            inputLinkBox.className = "workspace-input";
            inputWrapper.appendChild(inputLinkBox);
            newRow.appendChild(inputWrapper);
        }
        console.log("added input box: ", nextInt)
        linkTable.appendChild(newRow); 


    }



}); 





