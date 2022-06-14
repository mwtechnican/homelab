# taiga
docker exec -it taiga-back python manage.py migrate
docker exec -it taiga-back python manage.py collectstatic
