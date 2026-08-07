Vikunja
=======

First Setup
-----------

Set up on `192.168.0.6:3456` or `https://tasks.langchr86.ch`.


Use the CLI to manage users if self-registration is disabled `service.enableregistration: false`: https://vikunja.io/docs/cli/#user

Check the existing users:

~~~~~~
sudo docker exec vikunja /app/vikunja/vikunja user list
~~~~~~

Create new user:

~~~~~~
sudo docker exec -it vikunja /app/vikunja/vikunja user create --username clang --email lang.chr86@gmail.com
~~~~~~


TODO
----

# TODO(clang): try out CalDAV
# TODO(clang): SMTP?
