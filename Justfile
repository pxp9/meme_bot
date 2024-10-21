db:
  docker run --rm -d --name postgres -p 5432:5432 -e POSTGRES_DB=meme_bot -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres postgres:latest

run:
	RUST_LOG=info DATABASE_URL=postgres://postgres:postgres@localhost/meme_bot cargo run

diesel:
	DATABASE_URL=postgres://postgres:postgres@localhost/meme_bot diesel migration run
stop: 
	docker kill postgres

docker_run:
	docker run --rm --env-file ./.env --network host --name meme_bot -t pxp9/meme_bot:latest

compose:
	if [ -d "./target" ]; then \
		rm -r "./target"; \
	fi \
	
	if [ ! -d "./db-data" ]; then \
		mkdir "db-data"; \
	fi
	echo "Docker compose";
	docker compose up
