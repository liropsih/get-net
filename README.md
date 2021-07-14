# test get-net

## Установка
1. Установка модулей
```
npm install
```
2. В корне проекта создать файл .env с содержимым:
```
VUE_APP_API_URL=https://localhost:3000/api
SERVER_PORT=3000
SECRET_KEY=supersecret

DB_NAME=get-net-test
DB_USER=postgres
DB_PASSWORD=root
DB_HOST=localhost
DB_PORT=5432
```

3. Восстановление базы данных PostgreSQL
Бэкап базы данных хранится в /server/database/DATABASE.sql
Вместо восстановления бэкапа можно создать базу данных "get-net-test" и произвести установку, запустив команду:
```
npm run install
```

### Данные для авторизации
```
Email: aa@aa.aa
Пароль: 123456
```

### Запуск в режиме разработки
```
npm run dev
```

### Компилирование для production
```
npm run build
```

### Запуск production
```
npm run start
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).
