## Apache Server

#### Apache

```bash
docker run -dit -p 8008:80 boyantodorov/apache
```

---

```bash
curl localhost:8008
```
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Apache</title>
</head>
<body>
    <h2>Apache</h2>
    <p>Apache in container :D</p>
</body>
</html>
```

#### Nginx

```bash
docker run -dit -p 8008:80 boyantodorov/nginx
```

---

```bash
curl localhost:8009
```
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Nginx</title>
</head>
<body>
<h2>Nginx</h2>
<p>Nginx in a container</p>
</body>
</html>
```
