CREATE TABLE "schema_migrations" ("version" varchar NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "username" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0 NOT NULL, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar, "last_sign_in_ip" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "slug" varchar, "slug_lower" varchar, "description" text, "topics_count" integer DEFAULT 0, "type" integer, "parent_id" integer DEFAULT 0, "created_at" datetime, "updated_at" datetime, "pic_url" varchar, "status" integer DEFAULT 0);
CREATE UNIQUE INDEX "index_categories_on_slug" ON "categories" ("slug");
CREATE UNIQUE INDEX "index_categories_on_slug_lower" ON "categories" ("slug_lower");
CREATE TABLE "knowledges" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "category_id" integer, "author" varchar, "title" varchar, "abstract" text, "body" text, "trashed" boolean DEFAULT 'f', "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_knowledges_on_category_id" ON "knowledges" ("category_id");
CREATE TABLE "products" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "price" decimal(12,3), "active" boolean, "description" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "order_statuses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "orders" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "subtotal" decimal(12,3), "tax" decimal(12,3), "shipping" decimal(12,3), "total" decimal(12,3), "order_status_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_orders_on_order_status_id" ON "orders" ("order_status_id");
CREATE TABLE "order_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "product_id" integer, "order_id" integer, "unit_price" decimal(12,3), "quantity" integer, "total_price" decimal(12,3), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_order_items_on_product_id" ON "order_items" ("product_id");
CREATE INDEX "index_order_items_on_order_id" ON "order_items" ("order_id");
INSERT INTO schema_migrations (version) VALUES ('20151007162956');

INSERT INTO schema_migrations (version) VALUES ('20151008125105');

INSERT INTO schema_migrations (version) VALUES ('20151008160708');

INSERT INTO schema_migrations (version) VALUES ('20151009125105');

INSERT INTO schema_migrations (version) VALUES ('20151010065000');

INSERT INTO schema_migrations (version) VALUES ('20151010065311');

INSERT INTO schema_migrations (version) VALUES ('20151010065333');

INSERT INTO schema_migrations (version) VALUES ('20151010065515');

INSERT INTO schema_migrations (version) VALUES ('20151010065524');

