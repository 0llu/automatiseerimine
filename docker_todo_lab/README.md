# Docker ToDo Lab

See on lihtne **Docker Fundamentals laboritöö**, kus on loodud mini-rakendus Flask + Docker Compose abil.

## Komponendid
- **Flask API** – töötab pordil 5000
- **Frontend (HTML/JS)** – töötab pordil 3000
- **Nginx reverse proxy** – suunab liikluse API ja frontend'i vahel, töötab pordil 80
- **MySQL** – andmebaas Flask API jaoks

## Käivitamine
```bash
docker-compose up -d --build
