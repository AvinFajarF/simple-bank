CREATE TABLE "accounts" (
  "id" BIGSERIAL PRIMARY KEY NOT NULL,
  "owner" varchar NOT NULL,
  "balance" bigint NOT NULL,
  "currency" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "entries" (
  "id" BIGSERIAL PRIMARY KEY NOT NULL,
  "account_id" bigserial NOT NULL,
  "amount" bigint NOT NULL
);

CREATE TABLE "transfers" (
  "id" BIGSERIAL PRIMARY KEY NOT NULL,
  "from_account_id" bigserial NOT NULL,
  "to_account_id" bigserial NOT NULL,
  "amount" bigint NOT NULL
);

ALTER TABLE "entries" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("from_account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("to_account_id") REFERENCES "accounts" ("id");

CREATE INDEX ON "accounts" ("owner");

CREATE INDEX ON "entries" ("account_id");

CREATE INDEX ON "transfers" ("from_account_id");

CREATE INDEX ON "transfers" ("to_account_id");

CREATE INDEX ON "transfers" ("from_account_id", "to_account_id");