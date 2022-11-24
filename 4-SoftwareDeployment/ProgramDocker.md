### Кроки роботи з Docker-образом та створюємим Docker-контейнером для виконання програми

1) Скачати образ openjdk <br>
 `sudo docker pull openjdk`
 
2) Треба скомпілювати код у докер-контейнері. Запустимо контейнер з такими параметрами:
 - назва  --name sirenko-java
 - створити новий каталог -w /app
 - зв'язати каталог у докері та локальній машині -v $(pwd):/app
 - після завершення видалити докер-контейнер --rm
 - опції компіляції java файлу javac -cp
 
 `sudo docker run --name sirenko-java -w /app -v $(pwd):/app --rm openjdk javac -cp "./postgresql-42.5.0.jar:./" Main.java`
 
 3) Треба виконати код у докер-контейнері. Запустимо контейнер з такими параметрами:
 - назва  --name sirenko-java
 - з'єднання з контейнером у якому раниться БД --network container:sirenko-postgres
 - створити новий каталог -w /app
 - зв'язати каталог у докері та локальній машині -v $(pwd):/app
 - після завершення видалити докер-контейнер --rm
 - опції запуску  скомпільованого файлу із байткодом Main.clas ( вкзуємо драйвер для БД)
 
 `sudo docker run --name sirenko-java --network container:sirenko-postgres -w /app -v $(pwd):/app --rm openjdk java -cp "./postgresql-42.5.0.jar:./" Main`
`
 
