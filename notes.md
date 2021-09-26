# Notes

## Run queries in Sqlite

- cat query.sql | sqlite3 -header -column univ.db
- sqlite3 univ.db ".read query.sql"

