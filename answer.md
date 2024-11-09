SDG Selection and Problem Definition
SDG Chosen:

SDG 13: Climate Action – Take urgent action to combat climate change and its impacts.
Problem Definition: The problem selected to address within SDG 13: Climate Action focuses on the increasing impact of climate change, specifically extreme weather events, on communities, agriculture, and water resources. Climate change is causing a rise in extreme weather events such as floods, droughts, storms, and unpredictable rainfall patterns. These extreme events have devastating effects on agriculture, food security, and water resources, especially in developing countries like Kenya.

To address this, the goal is to create a data-driven solution that:

Analyzes historical climate and weather data to identify trends and patterns.
Provides insights into the frequency, severity, and geographical distribution of climate-related disasters (floods, droughts, storms).
Helps develop adaptation strategies for communities, especially in regions most affected by climate change.
Key Problem:

Lack of early warning systems and strategies to adapt to changing climate conditions in key sectors such as agriculture, urban planning, and water management.
Insufficient data-driven decisions on climate action at the regional and local levels.
By developing a database of historical weather data, climate disasters, and relevant adaptation strategies, and analyzing this data, it becomes possible to generate valuable insights that inform climate resilience strategies and early warning systems.

Part 2: Database Design

Entities & Relationships (ERD)
For this project, the database will store data related to weather patterns, climate-related disasters, regional data, and adaptation strategies. Below are the entities that will be created:

WeatherData – Stores the weather records such as temperature, rainfall, wind speed, etc.

Attributes: weather_id, date, temperature, rainfall, wind_speed, region_id (foreign key)
ClimateDisasters – Stores information about climate-related disasters, including the type, date, impact, and affected region.

Attributes: disaster_id, type, date, region_id (foreign key), impact
Regions – Information about geographical regions such as cities, counties, or provinces.

Attributes: region_id, region_name
AdaptationStrategies – Describes strategies to mitigate climate change impacts, such as crop adaptation, water conservation, etc.

Attributes: strategy_id, strategy_name, description

ERD Diagram (Example):

+----------------+    +-------------------+    +--------------+
| WeatherData    |    | ClimateDisasters  |    | Regions      |
+----------------+    +-------------------+    +--------------+
| weather_id     |    | disaster_id       |    | region_id    |
| date           |    | type              |    | region_name  |
| temperature    |    | date              |    +--------------+
| rainfall       |    | region_id (FK)    |
| wind_speed     |    | impact            |
+----------------+    +-------------------+

         +-------------------------+
         | AdaptationStrategies    |
         +-------------------------+
         | strategy_id             |
         | strategy_name           |
         | description             |
         +-------------------------+


Database Schema (SQL Statements)
Here are the SQL statements to create the database schema for this project:
-- Create Regions table
CREATE TABLE Regions (
    region_id INT PRIMARY KEY AUTO_INCREMENT,
    region_name VARCHAR(100)
);

-- Create WeatherData table
CREATE TABLE WeatherData (
    weather_id INT PRIMARY KEY AUTO_INCREMENT,
    date DATE,
    temperature FLOAT,
    rainfall FLOAT,
    wind_speed FLOAT,
    region_id INT,
    FOREIGN KEY (region_id) REFERENCES Regions(region_id)
);

-- Create ClimateDisasters table
CREATE TABLE ClimateDisasters (
    disaster_id INT PRIMARY KEY AUTO_INCREMENT,
    type VARCHAR(100),
    date DATE,
    region_id INT,
    impact TEXT,
    FOREIGN KEY (region_id) REFERENCES Regions(region_id)
);

-- Create AdaptationStrategies table
CREATE TABLE AdaptationStrategies (
    strategy_id INT PRIMARY KEY AUTO_INCREMENT,
    strategy_name VARCHAR(100),
    description TEXT
);


Sample Data Insertion (SQL Statements)
Here are SQL statements to populate the database with sample data:
-- Inserting Regions data
INSERT INTO Regions (region_name) VALUES
('Nairobi'), 
('Mombasa'), 
('Kisumu');

-- Inserting WeatherData
INSERT INTO WeatherData (date, temperature, rainfall, wind_speed, region_id) VALUES
('2024-01-01', 28.5, 15.2, 12.3, 1),
('2024-01-02', 29.0, 10.0, 10.0, 1),
('2024-01-01', 30.2, 20.0, 15.0, 2);

-- Inserting ClimateDisasters
INSERT INTO ClimateDisasters (type, date, region_id, impact) VALUES
('Flood', '2023-11-15', 1, 'Severe flooding in low-lying areas. Crop damage.'),
('Drought', '2024-01-05', 2, 'Water shortage affecting agriculture.');

-- Inserting AdaptationStrategies
INSERT INTO AdaptationStrategies (strategy_name, description) VALUES
('Rainwater Harvesting', 'Building systems to collect rainwater for irrigation and domestic use.'),
('Drought-resistant Crops', 'Using genetically modified crops that withstand long dry periods.');


Part 3: SQL Programming
1. Data Retrieval Queries
Retrieve Average Temperature and Rainfall by Region and Year

SELECT r.region_name, YEAR(w.date) AS year, AVG(w.temperature) AS avg_temperature, AVG(w.rainfall) AS avg_rainfall
FROM WeatherData w
JOIN Regions r ON r.region_id = w.region_id
GROUP BY r.region_name, YEAR(w.date);

2. Count the Frequency of Climate Disasters by Region
SELECT r.region_name, COUNT(c.disaster_id) AS disaster_count
FROM ClimateDisasters c
JOIN Regions r ON r.region_id = c.region_id
GROUP BY r.region_name;

3. Analyze the Impact of Disasters by Region
SELECT r.region_name, SUM(LENGTH(c.impact)) AS total_impact
FROM ClimateDisasters c
JOIN Regions r ON r.region_id = c.region_id
GROUP BY r.region_name;


Data Analysis Queries
These queries can provide valuable insights into how climate change affects different regions and help inform adaptation strategies:

i. Average Temperature Trends by Region to identify warming areas.
ii. Rainfall Patterns to help predict potential droughts or floods.
iii. Climate Disaster Frequency to assess vulnerability by region.

Part 4: Data Analysis Using Excel