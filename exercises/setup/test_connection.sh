docker exec -e PGPASSWORD=super_secret -i practical-ai-db psql -h localhost -p 5432 -U postgres -d postgres -c "SELECT version();"
