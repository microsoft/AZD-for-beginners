# Chapitre 3 : Configuration & Authentification

**📚 Cours** : [AZD Pour Débutants](../../README.md) | **⏱️ Durée** : 45-60 minutes | **⭐ Complexité** : Intermédiaire

---

## Aperçu

Ce chapitre traite de la configuration de l’environnement, des modèles d’authentification et des meilleures pratiques de sécurité pour les déploiements Azure Developer CLI.

> Validé avec `azd 1.25.6` en juin 2026.

## Objectifs d’apprentissage

En terminant ce chapitre, vous allez :
- Maîtriser la hiérarchie de configuration AZD
- Gérer plusieurs environnements (dev, staging, prod)
- Mettre en œuvre une authentification sécurisée avec des identités gérées
- Configurer des paramètres spécifiques à l’environnement

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|-------|
| 1 | [Guide de Configuration](configuration.md) | Configuration et gestion de l’environnement | 30 min |
| 2 | [Authentification & Sécurité](authsecurity.md) | Modèles d’identité gérée et RBAC | 30 min |

---

## 🚀 Démarrage Rapide

```bash
# Créer plusieurs environnements
azd env new dev
azd env new staging
azd env new prod

# Changer d'environnements
azd env select prod

# Définir des variables d'environnement
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Voir la configuration
azd env get-values
```

---

## 🔧 Hiérarchie de Configuration

AZD applique les paramètres dans cet ordre (le dernier remplace le précédent) :

1. **Valeurs par défaut** (intégrées dans les modèles)
2. **azure.yaml** (configuration du projet)
3. **Variables d’environnement** (`azd env set`)
4. **Options en ligne de commande** (`--location eastus`)

---

## 🔐 Meilleures Pratiques de Sécurité

```bash
# Utiliser l'identité gérée (recommandé)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Vérifier le statut d'authentification AZD
azd auth status

# Optionnel : vérifier le contexte Azure CLI si vous prévoyez d'exécuter des commandes az
az account show

# Ré-authentifier si nécessaire
azd auth login

# Optionnel : actualiser l'authentification Azure CLI pour les commandes az
az login
```

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|----------|
| **Précédent** | [Chapitre 2 : Développement IA](../chapter-02-ai-development/README.md) |
| **Suivant** | [Chapitre 4 : Infrastructure](../chapter-04-infrastructure/README.md) |

---

## 📖 Ressources Associées

- [Vérifications Pré-Déploiement](../chapter-06-pre-deployment/README.md)
- [Dépannage](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->