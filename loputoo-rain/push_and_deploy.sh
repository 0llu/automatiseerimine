#!/bin/bash
set -e

# 1. Mine projekti kausta
cd "$(dirname "$0")"

# 2. Loo commit sõnum automaatselt, kui pole antud
if [ -z "$1" ]; then
    COMMIT_MSG="Update loputoo-rain $(date '+%Y-%m-%d %H:%M:%S')"
else
    COMMIT_MSG="$1"
fi

# 3. Add kõik failid
git add .

# 4. Commit
git commit -m "$COMMIT_MSG" || echo "Nothing to commit"

# 5. Pull remote muudatused, et vältida non-fast-forward vigu
git pull --rebase origin main

# 6. Push branch GitHubi
git push -u origin main

echo "✅ Code pushed to GitHub, CI/CD pipeline should start automatically!"

# 7. Opsionaalne: käivita lokaalne Ansible deploy (ainult testimiseks)
echo "🚀 Running local Ansible deploy..."
ansible-playbook ansible/playbook.yml -i ansible/inventory

echo "✅ Deployment finished!"


