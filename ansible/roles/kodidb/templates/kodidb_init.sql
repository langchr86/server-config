CREATE USER '{{ kodidb_user_name }}' IDENTIFIED BY '{{ kodidb_user_password }}';
GRANT ALL ON *.* TO '{{ kodidb_user_name }}';
flush privileges;
