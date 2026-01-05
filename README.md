# 🚀 Projet DevOps Final - Infrastructure & Automation

Ce projet a pour objectif la mise en place d'une infrastructure automatisée utilisant les principes de l'**Infrastructure as Code (IaC)** et du **Configuration Management**.

## 🏗️ Architecture du Projet

Le projet est articulé autour de trois piliers majeurs :
1. **Terraform** : Provisionnement de l'infrastructure (réseau Docker et conteneur Ubuntu 22.04).
2. **Ansible** : Configuration logicielle via des rôles (Docker, Nginx, Node_exporter).
3. **GitHub Actions** : Pipeline CI/CD pour l'automatisation totale du déploiement.

## 🛠️ Technologies utilisées
* **OS Cible** : Ubuntu 22.04
* **IaC** : Terraform v1.x
* **Config Management** : Ansible v2.15+
* **Conteneurisation** : Docker
* **CI/CD** : GitHub Actions

## 🚀 Installation et Lancement (Local)

### Prérequis
* Docker Desktop installé et fonctionnel.
* WSL2 (Ubuntu) avec Ansible installé.

### Étape 1 : Infrastructure (Terraform)
```bash
cd infra
terraform init
terraform apply -auto-approve
