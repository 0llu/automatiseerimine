# Linux Logimise Labor – Keskse Logiserveri Ehitamine

## Ülevaade
Selles ülesandes luuakse kaks Ubuntu Server 22.04 virtuaalmasinat:
- **LogServer (192.168.100.10)** – kogub kõik logid
- **LogClient (192.168.100.20)** – saadab logid LogServerile

## Eesmärk
- Logide tsentraliseerimine (üks server kogub kõik)
- Rsyslog konfiguratsiooni ja võrgu seadistuse harjutamine
- Põhiteadmised logide haldamisest ja võrguliiklusest

## Tehtavad sammud
1. Võrgu seadistus VirtualBox NAT Network abil
2. Statsionaarse IP määramine mõlemale VM-ile
3. Rsyslog teenuse seadistamine logiserveril ja kliendil
4. Logide testimine `logger` käsuga
5. (valikuline) TCP logiedastus ja logide pööramine

## Võrguseaded
| Masin | IP             | Roll       |
|-------|----------------|------------|
| LogServer | 192.168.100.10 | Logide vastuvõtja |
| LogClient | 192.168.100.20 | Logide saatja |

## Test
Kliendis:
```bash
logger "Tere, see on testlogi!"
