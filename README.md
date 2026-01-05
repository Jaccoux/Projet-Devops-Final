Voici le contenu complet et final pour ton fichier README.md. Tu peux tout sélectionner, le copier et le coller directement dans ton fichier ouvert sur VS Code.

Il intègre toutes tes preuves de réussite (captures d'écran) et répond exactement aux critères de validation de ton exercice.

🚀 Projet DevOps Final - Infrastructure & Automation
Ce projet a pour objectif la mise en place d'une infrastructure automatisée utilisant les principes de l'Infrastructure as Code (IaC) et du Configuration Management.

🏗️ Architecture du Projet
Le projet est articulé autour de trois piliers majeurs :

Terraform : Provisionnement de l'infrastructure (réseau Docker et conteneur Ubuntu 22.04).

Ansible : Configuration logicielle via des rôles (Docker, Nginx, Node_exporter).

GitHub Actions : Pipeline CI/CD pour l'automatisation totale du déploiement.

🛠️ Technologies utilisées
OS Cible : Ubuntu 22.04

IaC : Terraform v1.x

Config Management : Ansible v2.15+

Conteneurisation : Docker

CI/CD : GitHub Actions

Monitoring : Prometheus & Grafana

🚀 Installation et Lancement (Local)
Étape 1 : Infrastructure (Terraform)
Bash

cd infra
terraform init
terraform apply -auto-approve
Étape 2 : Configuration (Ansible)
Bash

cd ../ansible
# Exécution du playbook pour configurer web1
ansible-playbook -i inventory.ini site.yml
Étape 3 : Monitoring (Docker Compose)
Bash

cd ../monitoring
docker compose up -d
📊 Résultats et Points de Vérification
🌍 1. Serveur Web (Nginx)
Le serveur est accessible sur localhost:8080. La page affiche : "Serveur de Sjacc : Tout fonctionne !", confirmant le bon déploiement par Ansible.

📈 2. Monitoring (Prometheus & Grafana)
Prometheus : La cible web1 est détectée sur le port 9100 avec un statut UP.

Grafana : Les métriques système (charge CPU node_load1) sont visibles en temps réel sous forme de graphiques sur localhost:3000.

🤖 3. Pipeline CI/CD GitHub Actions
Le workflow est configuré avec un déclenchement manuel (workflow_dispatch).

Provisionnement : Terraform prépare l'environnement sur le runner GitHub.

Déploiement : Ansible configure les services via le connecteur Docker.

Statut : Le pipeline est entièrement validé (Succeeded).

💡 Notes Techniques
Stratégie CI/CD : Pour garantir la persistance de l'infrastructure Docker pendant le déploiement, les étapes Terraform et Ansible ont été regroupées au sein d'un seul job fluide.

Connexion : Le pipeline utilise la connexion directe Docker pour interagir avec les conteneurs, tandis que le mode local privilégie SSH pour la simulation de production.