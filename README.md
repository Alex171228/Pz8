# практическое задание 8
## Шишков Алексей Дмитриевич ЭФМО-02-21
## Тема
Работа с MongoDB: подключение, создание коллекции, CRUD-операции
## Цели
Понять базовые принципы документной БД MongoDB (документ, коллекция, BSON, _id:ObjectID).
Научиться подключаться к MongoDB из Go с использованием официального драйвера.
Создать коллекцию, индексы и реализовать CRUD для одной сущности (например, notes).
Отработать фильтрацию, пагинацию, обновления (в т.ч. частичные), удаление и обработку ошибок. 

### Структура проекта 

<img width="352" height="537" alt="изображение" src="https://github.com/user-attachments/assets/43afcd08-e469-4d6f-83eb-1c514fedddef" /> 

### Запуск проекта

1. Склонировать репозиторий и перейти в папку проекта:
   ```bash
   git clone https://github.com/Alex171228/Pz8
   cd pz8-mongo
    ```
2. Создать файл .env (если нет):
      ```bash
   cp .env.example .env
    ```
3. Запустить контейнеры:
   ```bash
   docker compose up -d
    ```
4. Проверить доступность api:
   ```bash
   curl http://109.237.98.39:8081/health
   ```
### Примеры запросов и результат их выполнения
1. Проверка здоровья
   
<img width="497" height="494" alt="изображение" src="https://github.com/user-attachments/assets/4201f5ff-ffa4-4569-8aad-2df3bc2f7de7" /> 

2. Создание заметки

<img width="647" height="595" alt="изображение" src="https://github.com/user-attachments/assets/b49d1a25-fe15-4cb8-a5ab-c643aead2126" /> 

3. Получение списка заметок

<img width="684" height="674" alt="изображение" src="https://github.com/user-attachments/assets/d0cf0939-5a37-4033-8a1f-45830c2a65f5" /> 

4. Получение заметки по ID

<img width="805" height="601" alt="изображение" src="https://github.com/user-attachments/assets/c779dd0f-da87-40b4-9b70-921203376c42" /> 

5. Обновление заметки

<img width="782" height="596" alt="изображение" src="https://github.com/user-attachments/assets/26d8f49a-0ded-400e-b60d-8f4b312f2a40" /> 

6. Удаление заметки

<img width="805" height="414" alt="изображение" src="https://github.com/user-attachments/assets/1b03a61e-3be5-4fa6-8f5f-6266d95b3b3e" /> 

7. Поиск заметок по ключевому слову

<img width="639" height="656" alt="изображение" src="https://github.com/user-attachments/assets/b343c1db-0f6e-4156-a3ac-67c0b13a62dd" /> 

8. Создание временной заметки (TTL)

<img width="648" height="610" alt="изображение" src="https://github.com/user-attachments/assets/f4a92fcf-ead7-4178-b11b-ff184d175399" />

Для выполнения запросов приложен json для Postman https://github.com/Alex171228/Pz8/blob/main/pz8-mongo%20%E2%80%94%20CRUD.postman_collection.json

### Типовые проблемы и их решения 

| Ошибка                 | Причина                              | Решение                                           |
| ---------------------- | ------------------------------------ | ------------------------------------------------- |
| `connection refused`   | MongoDB не запущен                   | Проверить `docker compose ps`                       |
| `E11000 duplicate key` | Уникальный `title` уже существует    | Изменить поле `title`                               |
| `invalid ObjectID`     | Неверный формат ID                   | Проверить значение в URL                            |
| `null` при поиске      | Нет совпадений или TTL удалил запись | Создать новую заметку и повторить                    |
| `CORS error`           | Запрос из браузера без разрешений    | Тестировать через Postman или добавить middleware |

