document.getElementById('match-form').addEventListener('submit', function (event) {
    event.preventDefault();

    // Get matchId from the input field
    const matchId = document.getElementById('match-id').value;

    // Fetch match statistics from the server
    fetch(`/api/match_stats/${matchId}`)
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            // Display batting and bowling statistics
            displayStats('batting-stats', 'Batting Statistics', data.battingStats, ['PlayerName', 'RunsScored', 'BallsFaced']);
            displayStats('bowling-stats', 'Bowling Statistics', data.bowlingStats, ['PlayerName', 'OversBowled', 'RunsGiven', 'WicketsTaken']);
        })
        .catch(error => console.error('Error:', error));
});

// Function to display statistics in a table
function displayStats(elementId, heading, statsData, columns) {
    const statsDiv = document.getElementById(elementId);
    statsDiv.innerHTML = `<h3>${heading}</h3>`;

    if (statsData.length === 0) {
        statsDiv.innerHTML += `<p>No statistics found for this match.</p>`;
        return;
    }

    // Create the table dynamically
    let table = '<table>';
    table += `<tr>${columns.map(column => `<th>${column}</th>`).join('')}</tr>`;
    
    statsData.forEach(stats => {
        table += `<tr>${columns.map(column => `<td>${stats[column]}</td>`).join('')}</tr>`;
    });

    table += '</table>';
    statsDiv.innerHTML += table;
}
