docker cp database.sql practical-ai-db:/database.sql
docker cp seed.sql practical-ai-db:/seed.sql
docker exec -i practical-ai-db psql -U postgres -f /database.sql
docker exec -i practical-ai-db psql -U postgres -f /seed.sql
