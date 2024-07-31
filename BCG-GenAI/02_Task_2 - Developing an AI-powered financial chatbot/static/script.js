function sendMessage() {
    const questionSelect = document.getElementById('question-select');
    const companySelect = document.getElementById('company-select');
    const yearSelect = document.getElementById('year-select');
    const chatLog = document.getElementById('chat-log');

    const selectedQuestion = questionSelect.value;
    const selectedCompany = companySelect.value;
    const selectedYear = yearSelect.value;

    if (selectedQuestion === "" || selectedCompany === "" || selectedYear === "") {
        alert("Please select all fields.");
        return;
    }

    // Append user's message to chat log
    const userMessage = document.createElement('div');
    userMessage.textContent = `User: ${selectedQuestion} for ${selectedCompany} in ${selectedYear}`;
    chatLog.appendChild(userMessage);

    // Send request to server
    fetch('/chat', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            query: selectedQuestion,
            company: selectedCompany,
            year: selectedYear
        })
    })
    .then(response => response.json())
    .then(data => {
        // Append bot's response to chat log
        const botResponse = document.createElement('div');
        botResponse.textContent = `Bot: ${data.response}`;
        chatLog.appendChild(botResponse);
    })
    .catch(error => {
        console.error('Error:', error);
        const errorMessage = document.createElement('div');
        errorMessage.textContent = "Bot: Sorry, something went wrong.";
        chatLog.appendChild(errorMessage);
    });
}