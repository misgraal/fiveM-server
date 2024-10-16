function addMessage(message) {
    const newMessage = document.createElement('p');
    newMessage.textContent = message;
    document.getElementById('messages').appendChild(newMessage);
}

window.addEventListener("message", (event) => {
    const data = event.data

    if (data.type === "userName") {
        document.getElementById("user-name").textContent = data.userName
    }
});

window.addEventListener("message", (event) => {
    const data = event.data

    if (data.type === "notfound") {
        addMessage("Player with name "+data.targetName+" hasn't been found.")
    }
});

window.addEventListener("message", (event) => {
    const data = event.data

    if (data.type === "openConsole") {
        var displayType = data.display;
        document.getElementById("main-container").style.display = displayType;
    }
});

window.addEventListener("message", (event) => {
    const data = event.data;

    if (data.type === "confirmNewUserName") {
        console.log("test");
        addMessage("New user name set to "+ data.newName +".");
    }
});

window.addEventListener("message", (event) => {
    const data = event.data;

    if (data.type === "playerIsNotInBase") {
        document.getElementById("reg-container").style.display = "block";
    }
});


document.addEventListener('DOMContentLoaded', function () {
    const commandButtons = document.querySelectorAll('.command-btn');
    const commandTypeContainer = document.querySelector('.command-type-container');
    const commandTypeTitle = document.getElementById('command-type-title');
    const commandTypesDiv = document.getElementById('command-types');
    const messagesDiv = document.getElementById('messages');
    const tpToPlayerForm = document.getElementById('tp-to-player-form');
    const consoleTitle = document.getElementById("console-title");
    const closeButton = document.getElementById("close");
    const userNameButton = document.getElementById("user-name-btn");
    const changeUserNameForm = document.getElementById("change-user-name-form");
    const registerBtn = document.getElementById("register-btn");

    // Available command types for each command
    const commandTypes = {
        'changeName': ['Change User Name on Server'],
        'teleport': ['TP to Player', 'TP Player to Me', 'TP to Location', 'TP to Coords'],
        'spawnCar': ['Spawn Specific Car', 'Spawn Random Car'],
        'changePed': ['Change to Ped Model', 'Random Ped'],
    };

    // Function to update command messages
    function addMessage(message) {
        const newMessage = document.createElement('p');
        newMessage.textContent = message;
        messagesDiv.appendChild(newMessage);
    }

    function convertToCamelCase(str) {
        // Split the string by spaces
        let words = str.toLowerCase().split(' ');
    
        // Convert the first word to lowercase and capitalize the others
        for (let i = 1; i < words.length; i++) {
            words[i] = words[i].charAt(0).toUpperCase() + words[i].slice(1);
        }
    
        // Join the words together
        return words.join('');
    }

    // Add event listeners to main command buttons
    commandButtons.forEach(button => {
        button.addEventListener('click', function () {
            const command = this.getAttribute('data-command');
            
            changeUserNameForm.style.display = "none";
            commandTypesDiv.style.display = 'block';
            
            // Update the command type container based on selected command
            consoleTitle.style.display = "none";
            commandTypeTitle.textContent = `Select ${this.textContent} Command Type`;
            commandTypesDiv.innerHTML = '';
            tpToPlayerForm.style.display = 'none';

            // Generate buttons for the command types
            commandTypes[command].forEach(type => {
                const typeButton = document.createElement('button');
                typeButton.textContent = type;
                typeButton.classList.add('command-type-btn');
                
                // Add an event listener to each command type button
                typeButton.addEventListener('click', function () {

                });

                typeButton.addEventListener('click', function () {
                    if (type === 'TP to Player') {
                        tpToPlayerForm.style.display = 'block'; // Show form when TP to Player is clicked
                        changeUserNameForm.style.display = "none";
                    } else {
                        addMessage(`${type} executed!`);
                    }
                    
                });

                commandTypesDiv.appendChild(typeButton);
            });
        });
    });

    userNameButton.addEventListener('click', function() {
        changeUserNameForm.style.display = "block";
        tpToPlayerForm.style.display = "none";
        commandTypesDiv.style.display = 'none';
    });

    document.getElementById("changeUserName-btn").addEventListener('click', function() {
        const newUserName = document.getElementById("userName-input").value;

        if (newUserName) {
            addMessage("Trying to change user name.");
            addMessage(newUserName);
            axios.post("https://"+GetParentResourceName()+"/changeName", {
                newName: newUserName,
            });
        } else {
            addMessage("Provide new user name");
        }
    });

    document.getElementById('teleport-btn').addEventListener('click', function () {
        const playerName = document.getElementById('player-name').value;
        if (playerName) {
            addMessage(`Teleporting to player: ${playerName}`);
            axios.post("https://"+GetParentResourceName()+"/tpToPlayer", {
                name: playerName,
            });
            // Add teleport logic here...
        } else {
            addMessage('Please enter a player name!');
        }
    });

    closeButton.addEventListener("click", function () {
        axios.post("https://"+GetParentResourceName()+"/closeConsole", {
            close: true,
        });

        document.getElementById("main-container").style.display = "none";
    });




    registerBtn.addEventListener('click', function() {
        const newUserName = document.getElementById('register-input').value;

        if (newUserName) {
            axios.post("https://"+GetParentResourceName()+"/changeName", {
                newName: newUserName,
            });

            axios.post("https://"+GetParentResourceName()+"/closeConsole", {
                newName: newUserName,
            });
            document.getElementById("reg-container").style.display = "none";
        } else {
            document.getElementById('register-alert').textContent = "Provide new user name";
        }
    });





    // Inside your script.js or JS block:

    // Add reference to TP to Player form and messages
    

});

