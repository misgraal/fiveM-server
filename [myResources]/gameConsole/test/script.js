document.addEventListener('DOMContentLoaded', function () {
    const commandButtons = document.querySelectorAll('.command-btn');
    const commandTypeContainer = document.querySelector('.command-type-container');
    const commandTypeTitle = document.getElementById('command-type-title');
    const commandTypesDiv = document.getElementById('command-types');
    const messagesDiv = document.getElementById('messages');

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

    // Add event listeners to main command buttons
    commandButtons.forEach(button => {
        button.addEventListener('click', function () {
            const command = this.getAttribute('data-command');
            
            // Update the command type container based on selected command
            commandTypeTitle.textContent = `Select ${this.textContent} Command Type`;
            commandTypesDiv.innerHTML = '';

            // Generate buttons for the command types
            commandTypes[command].forEach(type => {
                const typeButton = document.createElement('button');
                typeButton.textContent = type;
                typeButton.classList.add('command-type-btn');
                
                // Add an event listener to each command type button
                typeButton.addEventListener('click', function () {
                    addMessage(`${type} executed!`);
                });

                commandTypesDiv.appendChild(typeButton);
            });
        });
    });
});
