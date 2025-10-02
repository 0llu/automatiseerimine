# Ansible LAMP Advanced Lab

See ülesanne on seotud Ansible'i kasutamisega, et automatiseerida LAMP (Linux, Apache, MySQL, PHP) stacki paigaldus ja seadistamine.

## Struktuur
- **inventory/** – sisaldab serverite nimekirja (nt `hosts.ini`)
- **playbooks/** – Ansible playbook'id Apache ja MySQL seadistamiseks
- **templates/** – Jinja2 mallid (nt `vhost.conf.j2`) virtuaalhostide jaoks
- **README.md** – ülesande lühikirjeldus

## Käivitamine
1. Kontrolli ühendust serveritega:
   ```bash
   ansible -i inventory/hosts.ini all -m ping
