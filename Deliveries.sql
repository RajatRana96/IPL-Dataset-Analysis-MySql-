CREATE TABLE deliveries
(
    id int ,
	innings int,
    batting_team varchar(50),
    bowling_team varchar(50),
	overs int,
	ball int,
	batter varchar(50),
	bowler varchar(50),
	non_striker varchar(50),
	batsman_runs int,
    extra_runs int,
    total_runs int,
    extras_type varchar(50),
    iswicket int,
    player_dismissed varchar(50),
	dismisal_kind varchar(50),
	fielders_involved varchar(50)
)
	
select count(*) from deliveries
select * from deliveries

