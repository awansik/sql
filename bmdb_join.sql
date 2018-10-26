-- 3 table join
select FirstName, LastName, CharacterName, Title, Year
from credits c 
inner join actor a
	on ActorID = a.ID
inner join movie m
	on MovieID = m.ID
order by Year;
    