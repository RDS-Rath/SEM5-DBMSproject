CREATE TABLE Teams (
    TeamID INT PRIMARY KEY,
    TeamName VARCHAR(100) NOT NULL
);

CREATE TABLE Players (
    PlayerID INT PRIMARY KEY,
    PlayerName VARCHAR(100) NOT NULL,
    TeamID INT,
    FOREIGN KEY (TeamID) REFERENCES Teams(TeamID)
);

CREATE TABLE Matches (
    MatchID INT PRIMARY KEY,
    MatchDate DATE,
    Team1ID INT,
    Team2ID INT,
    WinnerID INT,
    FOREIGN KEY (Team1ID) REFERENCES Teams(TeamID),
    FOREIGN KEY (Team2ID) REFERENCES Teams(TeamID),
    FOREIGN KEY (WinnerID) REFERENCES Teams(TeamID)
);

CREATE TABLE BattingScores (
    ScoreID INT PRIMARY KEY,
    PlayerID INT,
    MatchID INT,
    RunsScored INT,
    BallsFaced INT,
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID)
);

CREATE TABLE BowlingFigures (
    FigureID INT PRIMARY KEY,
    PlayerID INT,
    MatchID INT,
    OversBowled DECIMAL(4,1),
    RunsGiven INT,
    WicketsTaken INT,
    FOREIGN KEY (PlayerID) REFERENCES Players(PlayerID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID)
);

-- Sample data for Teams
INSERT INTO Teams (TeamID, TeamName) VALUES 
(1, 'Team A'),
(2, 'Team B');

-- Sample data for Players
INSERT INTO Players (PlayerID, PlayerName, TeamID) VALUES
(1, 'Player 1', 1),
(2, 'Player 2', 1),
(3, 'Player 3', 1),
(4, 'Player 4', 2),
(5, 'Player 5', 2),
(6, 'Player 6', 2);

-- Sample data for Matches
INSERT INTO Matches (MatchID, MatchDate, Team1ID, Team2ID, WinnerID) VALUES
(1, '2024-01-01', 1, 2, 1),
(2, '2024-01-05', 2, 1, 2);

-- Sample data for BattingScores
INSERT INTO BattingScores (ScoreID, PlayerID, MatchID, RunsScored, BallsFaced) VALUES
(1, 1, 1, 50, 30),
(2, 2, 1, 40, 25),
(3, 4, 1, 60, 40),
(4, 5, 1, 30, 20),
(5, 1, 2, 60, 35),
(6, 2, 2, 20, 15),
(7, 4, 2, 45, 30),
(8, 5, 2, 70, 50);

-- Sample data for BowlingFigures
INSERT INTO BowlingFigures (FigureID, PlayerID, MatchID, OversBowled, RunsGiven, WicketsTaken) VALUES
(1, 3, 1, 4.0, 25, 2),
(2, 6, 1, 3.5, 40, 1),
(3, 1, 2, 5.0, 30, 3),
(4, 3, 2, 4.2, 35, 2);
