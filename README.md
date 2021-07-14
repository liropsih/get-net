# test get-net

## Установка
```
npm install
```
В корне проекта создать файл .env с содержимым:
```
VUE_APP_API_URL=https://localhost:3000/api
SERVER_PORT=3000
SECRET_KEY=supersecret

DB_NAME= имя базы данных
DB_USER=postgres
DB_PASSWORD=root
DB_HOST=localhost
DB_PORT=5432
```


### База данных PostgreSQL
Бэкап базы данных хранится в /server/database/DATABASE.sql
Вместо восстановления бэкапа можно произвести установку, запустив команду:
```
npm run install
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
