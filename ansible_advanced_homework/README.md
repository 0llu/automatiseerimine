# Ansible Edasijõudnud Kodutöö - Vault ja Mallid

## 🎯 Ülesanne
Apache veebiserveri juurutamine Ansible Vault salajaste andmete ja Jinja2 mallide abil.

## ✅ Mida projekt sisaldab
- Apache veebiserver dünaamilise sisuga
- Vault-krüptitud salajased andmed
- Jinja2 mallid HTML genereerimiseks
- Handlers Apache teenuse automaatseks taaskäivitamiseks
- Serveri infofail dünaamiliste andmetega

## 🚀 Käivitamine
```bash
ansible-playbook docs/automation/site.yml --ask-vault-pass
# Parool: vault123
