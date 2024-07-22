create database ipl
 use ipl 
 drop database ipl

create TABLE matches (
    id INT NOT NULL,
    season INT NOT NULL,
    city  varchar(50),
    Match_date date NOT NULL,
    match_type	varchar(50),
    player_of_match	varchar(50),
    venue	varchar(100),
    team1	varchar(50),
    team2	varchar(50),
    toss_winner	varchar(50),
    toss_decision	varchar(50),
    winner	varchar(50),
    result	varchar(50),
    result_margin	varchar(50),
    target_runs	varchar(50),
    target_overs	varchar(50),
    super_over	varchar(50),
    method	varchar(50),
    umpire1	varchar(50),
    umpire2 varchar(50),
    PRIMARY KEY (id)
)

select * from matches
select count(*) from matches