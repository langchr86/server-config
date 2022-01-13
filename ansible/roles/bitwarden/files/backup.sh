#!/bin/bash -e

DB_FILE="db.sqlite3"

echo "------"
echo "running as: $(whoami) with UID=$(id -u) GID=$(id -g)"

echo "------"
echo "show content of /data/"
ls -la /data/

echo "------"
echo "backup all files using rsync"
rsync --archive --delete --itemize-changes /data/ /backup
mv /backup/${DB_FILE} /backup/${DB_FILE}.copied

echo "------"
echo "backup sqlite DB"
# Back up the database using the Online Backup API (https://www.sqlite.org/backup.html)
# as implemented in the SQLite CLI. However, if a call to sqlite3_backup_step() returns
# one of the transient errors SQLITE_BUSY or SQLITE_LOCKED, the CLI doesn't retry the
# backup step; instead, it simply stops the backup and returns an error. This is unlikely,
# but to minimize the possibility of a failed backup, implement a retry mechanism here.
max_tries=10
tries=0
until sqlite3 "file:/data/${DB_FILE}?mode=ro" ".backup '/backup/${DB_FILE}'"; do
  rm -f /backup/${DB_FILE}
  if (( ++tries >= max_tries )); then
	   echo "Aborting after ${max_tries} failed DB backup attempts..."
	   break
  fi
  echo "DB backup failed. Retry #${tries}..."
  sleep 1
done

echo "------"
echo "create timestamp file"
touch "/backup/$(date '+%Y-%m-%d-%H-%M-%S').timestamp"

echo "------"
echo "show content of /backup/"
ls -la /backup/
