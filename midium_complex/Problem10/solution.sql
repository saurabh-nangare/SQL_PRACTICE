CREATE TABLE artist (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(100),
    label_owner VARCHAR(100)
);

INSERT INTO artist (artist_id, artist_name, label_owner)
VALUES 
    (101, 'Ed Sheeran', 'Warner Music Group'),
    (120, 'Drake', 'Warner Music Group'),
    (125, 'Bad Bunny', 'Rimas Entertainment'),
    (145, 'Lady Gaga', 'Interscope Records'),
    (160, 'Chris Brown', 'RCA Records'),
    (200, 'Adele', 'Columbia Records'),
    (240, 'Katy Perry', 'Capitol Records'),
    (250, 'The Weeknd', 'Universal Music Group'),
    (260, 'Taylor Swift', 'Universal Music Group'),
    (270, 'Ariana Grande', 'Universal Music Group');

CREATE TABLE global_song_rank (
    day INT,
    song_id INT,
    rank INT
);

INSERT INTO global_song_rank (day, song_id, rank)
VALUES 
    (1, 45202, 2),
    (3, 45202, 2),
    (15, 45202, 6),
    (2, 55511, 2),
    (1, 19960, 3),
    (9, 19960, 15),
    (23, 12636, 9),
    (24, 12636, 7),
    (2, 12636, 23),
    (29, 12636, 7),
    (1, 69820, 1),
    (17, 44552, 8),
    (11, 44552, 16),
    (11, 11254, 5),
    (12, 11254, 16),
    (3, 33101, 16),
    (6, 23299, 1),
    (14, 89633, 2),
    (9, 28079, 9),
    (7, 28079, 10),
    (40, 11254, 1),
    (37, 23299, 5),
    (19, 11254, 10),
    (23, 89633, 10),
    (52, 33101, 7),
    (20, 55511, 10),
    (7, 22222, 8),
    (8, 44552, 1),
    (1, 54622, 34),
    (2, 44552, 1),
    (2, 19960, 3),
    (3, 260, 1),
    (3, 22222, 35),
    (3, 56112, 3),
    (4, 14525, 1),
    (4, 23339, 29),
    (4, 13997, 5),
    (13, 87752, 1),
    (14, 87752, 1),
    (1, 11254, 12),
    (51, 13997, 1),
    (52, 28079, 75),
    (15, 87752, 1),
    (5, 14525, 1),
    (6, 14525, 2),
    (7, 14525, 1),
    (40, 33101, 13),
    (1, 54622, 84),
    (7, 62887, 2),
    (50, 89633, 67),
    (50, 13997, 1),
    (33, 13997, 3),
    (1, 23299, 9);

CREATE TABLE songs (
    song_id INT PRIMARY KEY,
    artist_id INT,
    name VARCHAR(100)
);

INSERT INTO songs (song_id, artist_id, name)
VALUES 
    (55511, 101, 'Perfect'),
    (45202, 101, 'Shape of You'),
    (22222, 120, 'One Dance'),
    (19960, 120, 'Hotline Bling'),
    (12636, 125, 'Mia'),
    (69820, 125, 'Dakiti'),
    (44552, 125, 'Callaita'),
    (11254, 145, 'Bad Romance'),
    (33101, 160, 'Go Crazy'),
    (23299, 200, 'Hello'),
    (89633, 240, 'Last Friday Night'),
    (28079, 200, 'Someone Like You'),
    (13997, 120, 'Rich Flex'),
    (14525, 260, 'Cruel Summer'),
    (23689, 260, 'Blank Space'),
    (54622, 260, 'Wildest Dreams'),
    (62887, 260, 'Anti-Hero'),
    (56112, 270, '7 Rings'),
    (86645, 270, 'Thank U, Next'),
    (87752, 260, 'Karma'),
    (23339, 250, 'Blinding Lights');


with cte1 as(
select song_id,count(rank) as no_of_occurance
from global_song_rank 
where rank <= 10
group by song_id),
cte2 as(
    select s.*, cte1.no_of_occurance, a.artist_name
    from cte1
    join songs s 
    on cte1.song_id = s.song_id
    join artist a 
    on a.artist_id = s.artist_id
)
select artist_name, dense_rank() over(order by sum(no_of_occurance) desc) rnk from cte2 
group by artist_name ;




with cte1 as (
SELECT a.artist_name, count(r.rank) as no_of_occurances
from artist a 
join songs s 
on a.artist_id = s.artist_id
join global_song_rank r 
on s.song_id = r.song_id
where r.rank <= 10
group by a.artist_name),
cte2 as (
select artist_name, DENSE_RANK() over(order by no_of_occurances desc) artist_rank from cte1)
select * from cte2 where artist_rank < 6;