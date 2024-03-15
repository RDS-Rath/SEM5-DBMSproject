-- Create a table to store match details
CREATE TABLE matches (
    id INTEGER PRIMARY KEY,
    matchNumber INTEGER,
    team1 VARCHAR(50),
    team2 VARCHAR(50),
    stadium VARCHAR(100),
    battingFigures VARCHAR(100),
    bowlingFigures VARCHAR(100),
    result VARCHAR(100)
);

-- Insert sample data for 20 matches
INSERT INTO matches (matchNumber, team1, team2, stadium, battingFigures, bowlingFigures, result)
VALUES
    (1, 'India', 'Australia', 'MCG', '300/5 (50 overs)', 'Australia 3/45 (10 overs)', 'India won by 50 runs'),
    (2, 'England', 'Pakistan', 'Lord', '270/8 (50 overs)', 'England 2/40 (10 overs)', 'Pakistan won by 3 wickets'),
    (3, 'South Africa', 'New Zealand', 'Wanderers Stadium', '260/6 (50 overs)', 'New Zealand 3/55 (10 overs)', 'South Africa won by 20 runs'),
    (4, 'West Indies', 'Sri Lanka', 'Kensington Oval', '290/4 (50 overs)', 'Sri Lanka 2/60 (10 overs)', 'West Indies won by 6 wickets'),
    (5, 'Australia', 'Pakistan', 'SCG', '320/4 (50 overs)', 'Pakistan 4/70 (10 overs)', 'Australia won by 100 runs'),
    (6, 'India', 'England', 'Eden Gardens', '280/7 (50 overs)', 'England 3/65 (10 overs)', 'India won by 30 runs'),
    (7, 'New Zealand', 'South Africa', 'Seddon Park', '240/9 (50 overs)', 'South Africa 2/50 (10 overs)', 'New Zealand won by 20 runs'),
    (8, 'Sri Lanka', 'West Indies', 'R Premadasa Stadium', '270/5 (50 overs)', 'West Indies 3/55 (10 overs)', 'Sri Lanka won by 5 wickets'),
    (9, 'Pakistan', 'Australia', 'Gaddafi Stadium', '300/6 (50 overs)', 'Australia 2/40 (10 overs)', 'Pakistan won by 4 wickets'),
    (10, 'England', 'India', 'The Oval', '290/8 (50 overs)', 'India 4/65 (10 overs)', 'England won by 2 wickets'),
    (11, 'South Africa', 'New Zealand', 'SuperSport Park', '280/7 (50 overs)', 'New Zealand 3/60 (10 overs)', 'South Africa won by 3 wickets'),
    (12, 'West Indies', 'Sri Lanka', 'Providence Stadium', '260/5 (50 overs)', 'Sri Lanka 2/50 (10 overs)', 'West Indies won by 50 runs'),
    (13, 'Australia', 'Pakistan', 'Brisbane Cricket Ground', '310/4 (50 overs)', 'Pakistan 3/70 (10 overs)', 'Australia won by 80 runs'),
    (14, 'India', 'England', 'M Chinnaswamy Stadium', '300/6 (50 overs)', 'England 4/55 (10 overs)', 'India won by 60 runs'),
    (15, 'New Zealand', 'South Africa', 'Basin Reserve', '270/8 (50 overs)', 'South Africa 2/40 (10 overs)', 'New Zealand won by 2 wickets'),
    (16, 'Sri Lanka', 'West Indies', 'Sinhalese Sports Club Ground', '280/5 (50 overs)', 'West Indies 3/70 (10 overs)', 'Sri Lanka won by 20 runs'),
    (17, 'Pakistan', 'Australia', 'Sharjah Cricket Stadium', '290/7 (50 overs)', 'Australia 4/60 (10 overs)', 'Pakistan won by 1 wicket'),
    (18, 'England', 'India', 'Old Trafford', '300/6 (50 overs)', 'India 3/50 (10 overs)', 'England won by 4 wickets'),
    (19, 'South Africa', 'New Zealand', 'Newlands', '280/7 (50 overs)', 'New Zealand 2/55 (10 overs)', 'South Africa won by 30 runs'),
    (20, 'West Indies', 'Sri Lanka', 'Queen Park Oval', '270/6 (50 overs)', 'Sri Lanka 3/65 (10 overs)', 'West Indies won by 3 wickets');
