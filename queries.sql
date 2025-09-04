-- 1. Get all users
SELECT * FROM users;

-- 2. Get all workouts for Gabriel
SELECT * 
FROM workouts
WHERE user_id = 1
ORDER BY workout_date;

-- 3. Find all exercises performed in a given workout
SELECT e.exercise_name, e.sets, e.reps, e.weight_kg
FROM exercises e
JOIN workouts w ON e.workout_id = w.workout_id
WHERE w.workout_id = 1;

-- 4. Count how many workouts a user has logged
SELECT u.name, COUNT(w.workout_id) AS total_workouts
FROM users u
JOIN workouts w ON u.user_id = w.user_id
GROUP BY u.name;

-- 5. Calculate average weight used per exercise
SELECT exercise_name, AVG(weight_kg) AS avg_weight
FROM exercises
GROUP BY exercise_name
ORDER BY avg_weight DESC;

-- 6. Find the heaviest exercise performed
SELECT exercise_name, MAX(weight_kg) AS max_weight
FROM exercises;

-- 7. Total sets and reps completed by user across all workouts
SELECT u.name, SUM(e.sets) AS total_sets, SUM(e.reps) AS total_reps
FROM users u
JOIN workouts w ON u.user_id = w.user_id
JOIN exercises e ON w.workout_id = e.workout_id
GROUP BY u.name;

-- 8. Workouts by type (Push, Pull, Legs, Upper)
SELECT workout_type, COUNT(*) AS total_sessions
FROM workouts
GROUP BY workout_type;

-- 9. Track progress: compare bench press weights over time
SELECT w.workout_date, e.exercise_name, e.weight_kg
FROM exercises e
JOIN workouts w ON e.workout_id = w.workout_id
WHERE e.exercise_name = 'Barbell Bench Press'
ORDER BY w.workout_date;

-- 10. Find the longest workout
SELECT workout_date, workout_type, duration_minutes
FROM workouts
ORDER BY duration_minutes DESC
LIMIT 1;
