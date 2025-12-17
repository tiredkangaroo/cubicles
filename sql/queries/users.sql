-- name: GetUserByUsername :one
SELECT id, active, username, email, created_at
FROM users
WHERE username = $1;

-- name: GetUserByEmail :one
SELECT id, active, username, email, created_at
FROM users
WHERE email = $1;

-- name: CreateUser :one
INSERT INTO users (username, email) VALUES ($1, $2) RETURNING id;

-- name: ActivateUserByEmail :exec
UPDATE users SET active = TRUE WHERE email = $1;

-- name: DeactivateUserByEmail :exec
UPDATE users SET active = FALSE WHERE email = $1;

-- name: DeleteUserByUsername :exec
DELETE FROM users WHERE username = $1;