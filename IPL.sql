-- Extract the top 5  players who recieved the Man Of The Match awards and their count.
SELECT 
    player_of_match, COUNT(player_of_match) AS Total_Awards
FROM
    matches
GROUP BY player_of_match
ORDER BY Total_Awards DESC
LIMIT 5

-- Calculate number of matches wom by each team in each season
SELECT 
    season, winner AS Team, COUNT(*) AS matches_won
FROM
    matches
GROUP BY season , winner;
ORDER BY season


-- Extract the  Strike Rate of all the players 
SELECT 
    batter,
    (SUM(batsman_runs) / COUNT(ball)) * 100 AS Strike_Rate
FROM
    deliveries
GROUP BY batter

-- Extract the top 5  Strike Rate of all the players who has scored more than 1000 runs 

SELECT 
    batter,
    ((SUM(batsman_runs) / COUNT(ball)) * 100) AS Strike_Rate
FROM
    deliveries
GROUP BY batter
HAVING SUM(batsman_runs) >= 1000
ORDER BY Strike_Rate DESC
LIMIT 5


-- How many times each player gets out as bowled

SELECT 
    batter, COUNT(*) AS Get_Bowled
FROM
    deliveries
WHERE
    dismisal_kind = 'bowled'
GROUP BY batter
ORDER BY Get_Bowled DESC


-- Who has scored the highest runs from 2019 till date

SELECT 
    batter, SUM(batsman_runs) AS Total_Runs
FROM
    deliveries
GROUP BY batter
ORDER BY Total_Runs DESC
LIMIT 1

-- Total Runs scores by each batsman in each season

SELECT 
    deliveries.batter,
    SUM(deliveries.batsman_runs) AS Total_Runs,
    matches.season
FROM
    matches
        JOIN
    deliveries ON matches.id = deliveries.id
GROUP BY deliveries.batter , matches.season


-- Extract total number of wickets taken by bowler

SELECT 
    bowler, COUNT(*) AS Number_of_wickets
FROM
    deliveries
WHERE
    iswicket = '1'
        AND dismisal_kind = 'caught'
        OR 'bowled'
        OR 'lbw'
GROUP BY bowler
ORDER BY Number_of_wickets DESC


-- Extract the winners and player of the final match of each season

SELECT 
    season, winner, player_of_match
FROM
    matches
WHERE
    match_type = 'final'

 
-- Extract all bowler with overs_bowled and wickets_taken
SELECT 
    bowler,
    FLOOR(COUNT(ball) / 6) AS overs_bowled,
    SUM(CASE
        WHEN iswicket = '1' THEN 1
        ELSE 0
    END) AS number_of_wickets
FROM
    deliveries
GROUP BY bowler
ORDER BY Number_of_wickets DESC

