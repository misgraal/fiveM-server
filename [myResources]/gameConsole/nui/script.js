document.addEventListener('DOMContentLoaded', function () {
    const commandButtons = document.querySelectorAll('.command-btn');
    const commandTypeContainer = document.querySelector('.command-type-container');
    const commandTypeTitle = document.getElementById('command-type-title');
    const commandTypesDiv = document.getElementById('command-types');
    const messagesDiv = document.getElementById('messages');
    const tpToPlayerForm = document.getElementById('tp-to-player-form');
    const consoleTitle = document.getElementById("console-title");

    // Available command types for each command
    const commandTypes = {
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
                    } else {
                        addMessage(`${type} executed!`);
                    }
                });

                commandTypesDiv.appendChild(typeButton);
            });
        });
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



    // Inside your script.js or JS block:

    // Add reference to TP to Player form and messages
    

});

window.addEventListener("message", (event) => {
    const data = event.data

    if (data.type === "notfound") {
        addMessage("Player with name "+data.targetName+" hasn't been found.")
    }
});
