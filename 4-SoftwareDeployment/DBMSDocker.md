### Кроки роботи з Docker-образом та створюємим Docker-контейнером для СКБД
1) Завантажити образ СКБД PostgreSql : <br>
`sudo docker pull postgres`

2) Запустити контейнер з завантаженим образом СКБД <br><br>
 (назва контейнеру --name sirenko-postgres, <br>
  порт -p 1521,<br>
  пароль POSTGRES_PASSWORD=abc123,<br>
  створити  каталог з  файлами у  системі  Docker-образу -w /scripts,<br>
  встановити зв’язок між локальним каталогом комп’ютера та робочим каталогом -v $(pwd):/scripts,<br>
  запуск у фоновому режимі -d postgres)
  <br><br>
`sudo docker run --name sirenko-postgres -p 1521:1521 -e POSTGRES_PASSWORD=abc123 -w /scripts -v $(pwd):/scripts -d postgres`

3) Почати роботу з оболонкою командного рядку запущеного контейнеру<br>
`sudo docker exec -it sirenko-postgres bash`

4) Створити БД під користувачем postgres та назвою 'sirenkodb' <br>
`createdb sirenkodb -U postgres`

5) Запустити SQL-скрипт для створення та заповнення БД у базі даних sirenkodb під користувачем postgres <br>
`psql -U postgres -d sirenkodb < ./scripts/db_script.sql`

6) Для закінчення роботи і виходу з оболонки <br>
`exit`
