# Audi-A-models-database
### A MySQL database for Audi A models with multiple interconnected tables
**Entities and Tables:**
- **Main Info Table**: This table serves as the central point and contains data about specific car available for purchase; has a primary key 'id'; connects to other tables using foreign keys.

- **Model Table**: Contains information about different Audi A models (A1-A8). It has columns 'id_model' (primary key) and 'model_name'.

- **Generation Table**: Stores details about various generations of A models. It includes columns 'id_generation' (primary key), 'generation_name', 'release_year', and 'end_year'.

- **Body Type Table**: Holds data related to different body types of the models (sedan, hatchback, coupe, etc.). It consists of columns 'id_body_type' (primary key), 'body_type_name', and 'door_number'.

- **Transmission Table**: Contains information about transmission used in the car. It has columns 'id_transmission' (primary key), 'id_gearbox_type' (foreign key), and 'id_drive_gear' (foreign key).

- **Engine Table**: Stores details about the engines of the models. It includes columns 'id_engine' (primary key), 'engine_name', 'engine_size_in_l', and 'max_power_in_hp'.

- **Gearbox Type Table**: This table defines various types of gearboxes (manual and automatic). It has columns 'id_gearbox_type' (primary key) and 'gearbox_type_name'.

- **Drive Gear Table**: Contains different types of drive gears (front-wheel drive, rear-wheel drive, all-wheel drive). It consists of columns 'id_drive_gear' (primary key) and 'drive_gear_name'.

**Relationships:**
- **One-to-Many Relationships**: Several tables have one-to-many relationships with the 'Main Info' table through foreign keys. For example, a single 'Main Info' entry can be associated with multiple 'Transmission' records, each with different gearbox and drive gear types.

- **Many-to-One Relationships**: The 'Transmission,' 'Engine,' 'Body Type,' and 'Generation' tables have many-to-one relationships with the 'Main Info' table. This means multiple records in these tables can be linked to a single 'Main Info' entry.

- **One-to-One Relationships**: The 'Gearbox Type' and 'Drive Gear' tables have a one-to-one relationship with the 'Transmission' table. Each transmission entry connects to a specific gearbox type and drive gear type.
