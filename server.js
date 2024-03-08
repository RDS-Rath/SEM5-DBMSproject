const express = require('express');
const cors = require('cors');
const sqlite3 = require('sqlite3');
const fs = require('fs');

const app = express();
const port = 3000;

// Enable CORS middleware
app.use(cors());

// Connect to SQLite database
const db = new sqlite3.Database(':memory:');

// Read and execute SQL queries from the file
const sqlQueries = fs.readFileSync('form.sql', 'utf8');
db.exec(sqlQueries, (err) => {
    if (err) {
        console.error('Error executing SQL queries:', err);
    } else {
        console.log('Database initialized with sample data.');
    }
});

// API endpoint to fetch batting and bowling statistics for a match
app.get('/api/match_stats/:matchId', (req, res) => {
    const matchId = req.params.matchId;

    // Use Promise.all to handle parallel execution of database queries
    Promise.all([
        new Promise((resolve) => {
            db.all(`
                SELECT Players.PlayerName, BattingScores.RunsScored, BattingScores.BallsFaced
                FROM Players
                JOIN BattingScores ON Players.PlayerID = BattingScores.PlayerID
                WHERE BattingScores.MatchID = ?`, matchId, (err, battingStats) => {
                if (err) {
                    console.error('Error fetching batting statistics:', err);
                    resolve([]);
                } else {
                    resolve(battingStats);
                }
            });
        }),
        new Promise((resolve) => {
            db.all(`
                SELECT Players.PlayerName, BowlingFigures.OversBowled, BowlingFigures.RunsGiven, BowlingFigures.WicketsTaken
                FROM Players
                JOIN BowlingFigures ON Players.PlayerID = BowlingFigures.PlayerID
                WHERE BowlingFigures.MatchID = ?`, matchId, (err, bowlingStats) => {
                if (err) {
                    console.error('Error fetching bowling statistics:', err);
                    resolve([]);
                } else {
                    resolve(bowlingStats);
                }
            });
        })
    ])
    .then(([battingStats, bowlingStats]) => {
        res.json({ battingStats, bowlingStats });
    })
    .catch((error) => {
        console.error('Error:', error);
        res.status(500).json({ error: 'Internal Server Error' });
    });
});

// Start the server
app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
