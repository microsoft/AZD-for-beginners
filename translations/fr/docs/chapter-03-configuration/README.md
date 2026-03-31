# Chapitre 3 : Configuration & Authentification

**📚 Cours** : [AZD Pour Débutants](../../README.md) | **⏱️ Durée** : 45-60 minutes | **⭐ Complexité** : Intermédiaire

---

## Aperçu

Ce chapitre couvre la configuration de l'environnement, les modèles d'authentification et les meilleures pratiques de sécurité pour les déploiements Azure Developer CLI.

> Validé avec `azd 1.23.12` en mars 2026.

## Objectifs d'apprentissage

En terminant ce chapitre, vous allez :
- Maîtriser la hiérarchie de configuration AZD
- Gérer plusieurs environnements (dev, staging, prod)
- Mettre en œuvre une authentification sécurisée avec des identités gérées
- Configurer des paramètres spécifiques à l'environnement

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|-------|
| 1 | [Guide de Configuration](configuration.md) | Configuration et gestion de l'environnement | 30 min |
| 2 | [Authentification & Sécurité](authsecurity.md) | Identité gérée et modèles RBAC | 30 min |

---

## 🚀 Démarrage Rapide

```bash
# Créer plusieurs environnements
azd env new dev
azd env new staging
azd env new prod

# Changer d'environnement
azd env select prod

# Définir des variables d'environnement
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Voir la configuration
azd env get-values
```

---

## 🔧 Hiérarchie de Configuration

AZD applique les paramètres dans cet ordre (le plus tard écrase le plus tôt) :

1. **Valeurs par défaut** (intégrées dans les modèles)
2. **azure.yaml** (configuration du projet)
3. **Variables d'environnement** (`azd env set`)
4. **Options en ligne de commande** (`--location eastus`)

---

## 🔐 Meilleures Pratiques de Sécurité

```bash
# Utilisez une identité gérée (recommandé)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Vérifiez le statut d'authentification AZD
azd auth status

# Optionnel : vérifiez le contexte Azure CLI si vous prévoyez d’exécuter des commandes az
az account show

# Ré-authentifiez-vous si nécessaire
azd auth login

# Optionnel : actualisez l'authentification Azure CLI pour les commandes az
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

- [Vérifications avant Déploiement](../chapter-06-pre-deployment/README.md)
- [Dépannage](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction humaine professionnelle est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->