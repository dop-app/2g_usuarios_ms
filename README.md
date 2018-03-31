# README

El microservicio usuario,se encarga de la gestión de usuario para la aplicación DOP.

**Ejecución:**

1.Compilar el microservicio:

**docker-compose build**

2.Hacer migraciones pertinentes de la bd:

**docker-compose run --rm users-ms rails db:migrate**

3.Correr el microservicio.

**docker-compose up**
