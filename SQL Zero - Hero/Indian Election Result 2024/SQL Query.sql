-- Check All Tabels on the Dataset
SELECT * FROM constituencywise_details

SELECT * FROM constituencywise_results

SELECT * FROM states

SELECT * FROM partywise_results

SELECT * FROM statewise_results

-- Q 1. Total Seats

SELECT 
	COUNT("Constituency") AS total_seats
FROM statewise_results

-- Q2. What is the total number of seats available for elections in each State ?

SELECT
    s."State" AS states,
    COUNT(DISTINCT cr."Parliament_Constituency") AS total_seats
FROM states AS s
JOIN statewise_results AS sr ON s."State_ID" = sr."State_ID"
JOIN constituencywise_results AS cr ON sr."Parliament_Constituency" = cr."Parliament_Constituency"
GROUP BY s."State"
ORDER BY total_seats DESC;

-- Q3. Total Seat WON by NDA Alliance.


SELECT 
    SUM("Won") AS nda_total_seats
FROM 
    partywise_results
WHERE 
    "Party" IN (
        'Bharatiya Janata Party - BJP',
        'Janata Dal  (United) - JD(U)',
        'Telugu Desam - TDP',
        'Lok Janshakti Party(Ram Vilas) - LJPRV',
        'Apna Dal (Soneylal) - ADAL',
        'Janasena Party - JnP',
        'Janata Dal  (Secular) - JD(S)',
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS',
        'Rashtriya Loktantrik Party - RLTP',
        'Sikkim Krantikari Morcha - SKM'
    );

-- Q4. Seats won by NDA Alliance Party ?

SELECT
    "Party" AS party,
    SUM("Won") AS seat_won
FROM partywise_results
WHERE 
    "Party" IN (
        'Bharatiya Janata Party - BJP',
        'Janata Dal  (United) - JD(U)',
        'Telugu Desam - TDP',
        'Lok Janshakti Party(Ram Vilas) - LJPRV',
        'Apna Dal (Soneylal) - ADAL',
        'Janasena Party - JnP',
        'Janata Dal  (Secular) - JD(S)',
        'Asom Gana Parishad - AGP',
        'Hindustani Awam Morcha (Secular) - HAMS',
        'Rashtriya Loktantrik Party - RLTP',
        'Sikkim Krantikari Morcha - SKM'
    )
GROUP BY
    "Party";

-- Q5. Total Seat WON by I.N.D.I.A Allinace

SELECT 
    SUM("Won") AS total_seats_won_by_INDIA_alliance
FROM partywise_results
WHERE "Party" IN (
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',
    'Indian National Congress - INC',
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK',
    'Aazad Samaj Party (Kanshi Ram) - ASPKR'
);

-- Q6. Seat won by I.N.D.A party Alliance ?

SELECT
    "Party" AS party,
    SUM("Won") AS seat_won
FROM partywise_results
WHERE 
    "Party" IN (
        'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',
    'Indian National Congress - INC',
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK',
    'Aazad Samaj Party (Kanshi Ram) - ASPKR'
    )
GROUP BY
    "Party";


-- Q7. Add new column field in table parywise_result to get the party Allianz as NDA, INDIA and Others 

ALTER TABLE partywise_results ADD COLUMN party_allianz VARCHAR(100)

UPDATE partywise_results AS pr
SET party_allianz = 
    CASE 
        WHEN pr."Party" IN (
            'Aam Aadmi Party - AAAP',
            'All India Trinamool Congress - AITC',
            'Communist Party of India  (Marxist) - CPI(M)',
            'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
            'Communist Party of India - CPI',
            'Dravida Munnetra Kazhagam - DMK',
            'Indian National Congress - INC',
            'Indian Union Muslim League - IUML',
            'Jammu & Kashmir National Conference - JKN',
            'Jharkhand Mukti Morcha - JMM',
            'Kerala Congress - KEC',
            'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
            'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
            'Rashtriya Janata Dal - RJD',
            'Revolutionary Socialist Party - RSP',
            'Samajwadi Party - SP',
            'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
            'Viduthalai Chiruthaigal Katchi - VCK',
            'Aazad Samaj Party (Kanshi Ram) - ASPKR'
        ) THEN 'I.N.D.I.A'
        
        WHEN pr."Party" IN (
            'Bharatiya Janata Party - BJP',
            'Janata Dal  (United) - JD(U)',
            'Telugu Desam - TDP',
            'Lok Janshakti Party(Ram Vilas) - LJPRV',
            'Apna Dal (Soneylal) - ADAL',
            'Janasena Party - JnP',
            'Janata Dal  (Secular) - JD(S)',
            'Asom Gana Parishad - AGP',
            'Hindustani Awam Morcha (Secular) - HAMS',
            'Rashtriya Loktantrik Party - RLTP',
            'Sikkim Krantikari Morcha - SKM'
        ) THEN 'N.D.A'

        ELSE 'Others'
    END;

-- Chech New Column

SELECT DISTINCT "party_allianz" FROM partywise_results

--Q8. How many seat won each party Allianz ?

SELECT
	"party_allianz" AS party_allianz,
	SUM("Won") AS seat_won
FROM partywise_results
GROUP BY
	party_allianz;

-- Q9. Winnig candidate's name , their party name, total votes and the margin of victory for a
--     specific state and constituency ?  (State West Bengal)
SELECT
    cr."Constituency_Name" AS constituency_name,
    cr."Winning_Candidate" AS winning_candidate_name,
    pr."Party" AS party_name,
    s."State" AS state,
    cr."Total_Votes" AS total_votes,
    cr."Margin" AS margin,
	pr."party_allianz"
FROM
    constituencywise_results AS cr
JOIN
    partywise_results AS pr ON cr."Party_ID" = pr."Party_ID"
JOIN
    statewise_results AS sr ON cr."Parliament_Constituency" = sr."Parliament_Constituency"
JOIN
    states AS s ON sr."State_ID" = s."State_ID"
WHERE
    s."State" = 'West Bengal';  -- <-- Customize here


-- Q10. What is the distrubution of EVM votes versus postal votes for candidate in a specific constituency ?
-- (west bengal - MURSHIDABAD)

SELECT
	cd."Candidate" AS candidate_name,
	cr."Constituency_Name" AS constituency_name,
	cd."EVM_Votes" AS evm_votes,
	cd."Postal_Votes" AS postal_votes,
	cd."Total_Votes" AS total_votes
FROM
	constituencywise_details AS cd
JOIN
	constituencywise_results AS cr ON cd."Constituency_ID" = cr."Constituency_ID"
WHERE
	cr."Constituency_Name" = 'MURSHIDABAD' -- Customize here
ORDER BY
	total_votes DESC;


-- Q11. Which party win the most seats in a State, and how many seats did each party ?
SELECT
	s."State",
    p."Party",
    COUNT(cr."Constituency_ID") AS Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr."Party_ID" = p."Party_ID"
JOIN 
    statewise_results sr ON cr."Parliament_Constituency" = sr."Parliament_Constituency"
	
JOIN states s ON sr."State_ID" = s."State_ID"

-- WHERE s."State" = 'West Bengal'  --- Customize here

GROUP BY 
    p."Party",s."State"
ORDER BY 
    Seats_Won DESC;


-- Q.12 What is the total number of seats won by each party alliance(NDA, INDIA, and others) in each
--      state for the India Election 2024

SELECT 
    s."State" AS State_Name,
    SUM(CASE WHEN p."party_allianz" = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
    SUM(CASE WHEN p."party_allianz" = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
    SUM(CASE WHEN p."party_allianz" = 'OTHER' THEN 1 ELSE 0 END) AS OTHER_Seats_Won
FROM 
    constituencywise_results cr
JOIN 
    partywise_results p ON cr."Party_ID" = p."Party_ID"
JOIN 
    statewise_results sr ON cr."Parliament_Constituency" = sr."Parliament_Constituency"
JOIN 
    states s ON sr."State_ID" = s."State_ID"
-- WHERE 
--     p."party_allianz" IN ('NDA', 'I.N.D.I.A', 'OTHER')
--     AND p."Won" = 1
GROUP BY 
    s."State"
ORDER BY 
    s."State";



-- Q13. Which candidate received the highest number of EVM votes in each constituency (Top 10)?
SELECT 
    cr."Constituency_Name",
    cd."Constituency_ID",
    cd."Candidate",
    cd."EVM_Votes"
FROM 
    constituencywise_details cd
JOIN 
    constituencywise_results cr ON cd."Constituency_ID" = cr."Constituency_ID"
WHERE 
    cd."EVM_Votes" = (
        SELECT MAX(cd1."EVM_Votes")
        FROM constituencywise_details cd1
        WHERE cd1."Constituency_ID" = cd."Constituency_ID"
    )
ORDER BY 
    cd."EVM_Votes" DESC
LIMIT 10;






























































































































































































