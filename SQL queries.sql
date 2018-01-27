use Pokedex;

SELECT id, Name, height AS decimeters, weight AS hectograms
FROM Pokemon;

SELECT PS.generation_id, AVG(P.height) AS avg_height, AVG(P.weight) AS avg_weight
FROM Pokemon P
	INNER JOIN pokemon_species PS ON P.id = PS.id
GROUP BY generation_id
ORDER BY avg_weight DESC;

SELECT PS.species_name, MAX(P.weight) AS weight
FROM Pokemon P
	INNER JOIN pokemon_species PS ON P.id = PS.id
WHERE generation_id = 4
GROUP BY species_name
ORDER BY MAX(P.weight) DESC
LIMIT 1;


SELECT M.type_id, TN.type_name, M.moves_name, M.contest_type_id, 
	M.contest_effect_id
FROM moves M 
	INNER JOIN types_name TN ON TN.id = M.type_id
WHERE contest_effect_id >= 30
ORDER BY contest_effect_id DESC;

SELECT type_name, COUNT(type_id) AS num_moves_per_type, contest_type_id, 
contest_effect_id 
FROM contest_moves
GROUP BY type_name, contest_type_id, contest_effect_id
ORDER BY COUNT(type_id) DESC;

SELECT PH.habitat_name, AVG(PS.capture_rate) AS avg_capture_rate
FROM pokemon_habitats PH
	INNER JOIN pokemon_species PS ON PH.id = PS.habitat_id
    INNER JOIN Pokemon P ON PS.id = P.id
GROUP BY PH.habitat_name
ORDER BY AVG(PS.capture_rate) ASC;

SELECT M.moves_name
FROM moves M
	INNER JOIN pokemon_species PS ON M.generation_id = PS.generation_id
    INNER JOIN Pokemon P ON PS.id = P.id
WHERE P.Name = 'bulbasaur';

#which type of pokemon has the highest avg power of moves
SELECT TN.type_name, AVG(M.id)
FROM moves M
	INNER JOIN pokemon_species PS ON M.generation_id = PS.generation_id
    INNER JOIN Pokemon P ON PS.id = P.id
    INNER JOIN pokemon_types PT ON P.id = PT.id
    INNER JOIN types_name TN ON PT.type_id = TN.id
GROUP BY TN.type_name
ORDER BY AVG(M.id) DESC;

