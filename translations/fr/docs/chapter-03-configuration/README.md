# Chapitre 3 : Configuration & Authentification

**📚 Cours**: [AZD pour les débutants](../../README.md) | **⏱️ Durée**: 45-60 minutes | **⭐ Complexité**: Intermédiaire

---

## Aperçu

Ce chapitre couvre la configuration des environnements, les modèles d'authentification et les meilleures pratiques de sécurité pour les déploiements avec Azure Developer CLI.

## Objectifs d'apprentissage

En terminant ce chapitre, vous :
- Maîtriserez la hiérarchie de configuration d'AZD
- Gèrerez plusieurs environnements (dev, staging, prod)
- Mettrez en œuvre une authentification sécurisée avec des identités gérées
- Configurerez des paramètres spécifiques à l'environnement

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|------|
| 1 | [Guide de configuration](configuration.md) | Configuration et gestion des environnements | 30 min |
| 2 | [Authentification & Sécurité](authsecurity.md) | Identité gérée et modèles RBAC | 30 min |

---

## 🚀 Démarrage rapide

```bash
# Créer plusieurs environnements
azd env new dev
azd env new staging
azd env new prod

# Basculer entre les environnements
azd env select prod

# Définir des variables d'environnement
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Afficher la configuration
azd env get-values
```

---

## 🔧 Hiérarchie de configuration

AZD applique les paramètres dans cet ordre (les éléments suivants remplacent les précédents) :

1. **Valeurs par défaut** (intégrées aux modèles)
2. **azure.yaml** (configuration du projet)
3. **Variables d'environnement** (`azd env set`)
4. **Options de ligne de commande** (`--location eastus`)

---

## 🔐 Bonnes pratiques de sécurité

```bash
# Utilisez une identité gérée (recommandée)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Vérifiez l'état d'authentification
azd auth whoami
az account show

# Ré-authentifiez-vous si nécessaire
azd auth login
az login
```

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|---------|
| **Précédent** | [Chapitre 2 : Développement d'IA](../chapter-02-ai-development/README.md) |
| **Suivant** | [Chapitre 4 : Infrastructure](../chapter-04-infrastructure/README.md) |

---

## 📖 Ressources associées

- [Vérifications pré-déploiement](../chapter-06-pre-deployment/README.md)
- [Dépannage](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Clause de non-responsabilité :
Ce document a été traduit à l'aide du service de traduction par IA Co-op Translator (https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original, dans sa langue d'origine, doit être considéré comme la source faisant foi. Pour les informations sensibles ou critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un traducteur humain. Nous ne pouvons être tenus responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->