### 1. Please rename or duplicate file `config/master.key.dev` to `config/master.key`

### 2. Install Docker & Docker Compose

#### Docker
```html
https://docs.docker.com/get-docker/
```

#### Docker Compose
```html
https://docs.docker.com/compose/install/
```

### 3. Build & run docker applications

* Build
```html
docker-compose build
```

* Run
```html
docker-compose up
```

* Or
```html
docker-compose up -d
```

* Access
```html
http://localhost:3000
```

### Shortener URL explained
* When user creates a shortened URL, the application will generate a unique token attached to URL, which has a length is 5 (include only letters / numbers and it's lowercase).

* When someone has the shortened URL access on the browser (the shortened format : `app_root_url`/`url.token)`), the application will look it up in the database by column `url.token`.

* If the URL exists, the application will increase the number of clicks of the URL by +1 and redirect user to `original_url`

* If not, they will redirect to `root_url`
