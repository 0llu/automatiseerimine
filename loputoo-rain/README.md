# Loputöö Rain

Veebirakendus, mis kuvab igal laadimisel ühe motivatsioonilise “Rain” tüübi koos pildi ja fraasiga.

## Kirjeldus
- Näitab erinevaid emotsioone: rõõmu, motivatsiooni, rahu, seiklus.
- Lahendab probleemi: iga päev saab motivatsiooni ja huvitava visuaalse elamuse.

## Tööriistad
### 1. Git
Versioonihaldus, kõik commitid ja branchid.

### 2. GitHub Actions
Automaatne testimine, Docker build ja deploy.

### 3. Docker
Rakenduse containeriseerimine ja lihtne lokaalne/remote käivitamine.

### 4. Ansible
Automatiseeritud deploy Docker containerisse.

## Käivitamine
```bash
git clone git@github.com:USERNAME/automatiseerimine.git
cd loputoo-rain
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python app.py
# Või Docker
docker-compose up


