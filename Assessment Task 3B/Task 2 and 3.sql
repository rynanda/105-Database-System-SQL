USE treasurehunters;

# Query 1
SELECT firstName, lastName, gender, 
		DOB, email, suburb
FROM Player
WHERE suburb LIKE 'Sunnybank%';

# Query 2
SELECT username, SUM(cost) as totalspent
FROM purchase
GROUP BY username
ORDER BY username DESC
;

# Query 3
SELECT player.username, phonenumber.phoneNumber
FROM player
INNER JOIN phonenumber ON player.username=phonenumber.username
WHERE player.dob = (SELECT min(dob)
					FROM player)
;

# Query 4
SELECT badge.badgeName, player.firstName,
		player.lastName, player.email, purchase.badgeID, purchase.username
FROM badge
LEFT JOIN purchase ON badge.badgeID=purchase.badgeID
LEFT JOIN player ON purchase.username=player.username
ORDER BY badge.badgeName, player.firstName, player.lastName ASC
;

# Query 5
SELECT COUNT(playerprogress.questID) as quests,
		playerprogress.username, 
        playerprogress.progress, treasure.type
from playerprogress
INNER JOIN treasure ON playerprogress.questID=treasure.questID
WHERE progress = 'complete'
AND treasure.type = 'common'
GROUP BY username
ORDER BY quests ASC
;

# Create Index
CREATE INDEX treasure_webpage ON treasure(webpage);

# Create View
CREATE VIEW incomplete_account_details AS
SELECT firstName, lastName, creationDateTime
FROM player, playerprogress
WHERE NOT playerprogress.progress = 'complete'
GROUP BY firstName, lastName, creationDateTime
;

# Insert
INSERT INTO badge (badgeName, badgeDescription)
VALUES ('Fools Gold', 'Trickiest trickster in all the seas')
;

# Delete
DELETE FROM playerprogress
WHERE progress = 'inactive'
;

# Update
UPDATE player
SET streetNumber = '72', streetName = 'Evergreen Terrace', suburb = 'Springfield'
WHERE lastName = 'Smith'
;
