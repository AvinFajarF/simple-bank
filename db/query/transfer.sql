-- name: CreateTransfer :one
INSERT INTO transfers (
 from_account_id,
 to_account_id,
 amount
) VALUES (
  $1, $2, $3
) RETURNING *;

-- name: ListTransfer :many
SELECT * FROM transfers
WHERE from_account_id = $1;

-- name: UpdateTransfer :one
UPDATE transfers SET to_account_id = $2, amount = $3 
WHERE id = $1
RETURNING *;

-- name: DeleteTransfer :exec
DELETE FROM transfers WHERE id = $1;