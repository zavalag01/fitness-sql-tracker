CREATE TABLE IF NOT EXISTS "exercises" (
	"exercise_id"	INTEGER,
	"workout_id"	INTEGER,
	"exercise_name"	TEXT,
	"sets"	INTEGER,
	"reps"	INTEGER,
	"weight_kg"	REAL,
	PRIMARY KEY("exercise_id"),
	FOREIGN KEY("workout_id") REFERENCES "workouts"("workout_id")
);

CREATE TABLE IF NOT EXISTS "users" (
	"user_id"	INTEGER,
	"name"	TEXT,
	"age"	INTEGER,
	"height_cm"	INTEGER,
	"weight_kg"	REAL,
	PRIMARY KEY("user_id")
);

CREATE TABLE IF NOT EXISTS "workouts" (
	"workout_id"	INTEGER,
	"user_id"	INTEGER,
	"workout_date"	TEXT,
	"workout_type"	TEXT,
	"duration_minutes"	INTEGER,
	PRIMARY KEY("workout_id"),
	FOREIGN KEY("user_id") REFERENCES "users"("user_id")
);
