<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "dbc3f2f6acbaa09093b21a220e1c2769",
  "translation_date": "2025-11-19T11:13:53+00:00",
  "source_file": "docs/getting-started/installation.md",
  "language_code": "fr"
}
-->
# Guide d'installation et de configuration

**Navigation du chapitre :**
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 1 - Fondations et démarrage rapide
- **⬅️ Précédent** : [Notions de base d'AZD](azd-basics.md)
- **➡️ Suivant** : [Votre premier projet](first-project.md)
- **🚀 Chapitre suivant** : [Chapitre 2 : Développement axé sur l'IA](../microsoft-foundry/microsoft-foundry-integration.md)

## Introduction

Ce guide complet vous accompagnera dans l'installation et la configuration de l'Azure Developer CLI (azd) sur votre système. Vous découvrirez plusieurs méthodes d'installation pour différents systèmes d'exploitation, la configuration de l'authentification et les réglages initiaux pour préparer votre environnement de développement aux déploiements Azure.

## Objectifs d'apprentissage

À la fin de cette leçon, vous serez capable de :
- Installer avec succès Azure Developer CLI sur votre système d'exploitation
- Configurer l'authentification avec Azure via plusieurs méthodes
- Préparer votre environnement de développement avec les prérequis nécessaires
- Comprendre les différentes options d'installation et savoir quand les utiliser
- Résoudre les problèmes courants d'installation et de configuration

## Résultats d'apprentissage

Après avoir terminé cette leçon, vous serez en mesure de :
- Installer azd en utilisant la méthode appropriée pour votre plateforme
- Vous authentifier avec Azure en utilisant `azd auth login`
- Vérifier votre installation et tester les commandes de base d'azd
- Configurer votre environnement de développement pour une utilisation optimale d'azd
- Résoudre de manière autonome les problèmes courants d'installation

Ce guide vous aidera à installer et configurer Azure Developer CLI sur votre système, quel que soit votre système d'exploitation ou environnement de développement.

## Prérequis

Avant d'installer azd, assurez-vous d'avoir :
- **Un abonnement Azure** - [Créer un compte gratuit](https://azure.microsoft.com/free/)
- **Azure CLI** - Pour l'authentification et la gestion des ressources
- **Git** - Pour cloner des modèles et gérer le contrôle de version
- **Docker** (optionnel) - Pour les applications conteneurisées

## Méthodes d'installation

### Windows

#### Option 1 : PowerShell (Recommandé)
```powershell
# Run as Administrator or with elevated privileges
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 2 : Gestionnaire de paquets Windows (winget)
```cmd
winget install Microsoft.Azd
```

#### Option 3 : Chocolatey
```cmd
choco install azd
```

#### Option 4 : Installation manuelle
1. Téléchargez la dernière version depuis [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extrayez dans `C:\Program Files\azd\`
3. Ajoutez au chemin d'accès (PATH) des variables d'environnement

### macOS

#### Option 1 : Homebrew (Recommandé)
```bash
brew tap azure/azd
brew install azd
```

#### Option 2 : Script d'installation
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 3 : Installation manuelle
```bash
# Download and install
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1 : Script d'installation (Recommandé)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2 : Gestionnaires de paquets

**Ubuntu/Debian :**
```bash
# Add Microsoft package repository
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Install azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora :**
```bash
# Add Microsoft package repository
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd est préinstallé dans GitHub Codespaces. Créez simplement un codespace et commencez à utiliser azd immédiatement.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Vérification de l'installation

Après l'installation, vérifiez qu'azd fonctionne correctement :

```bash
# Check version
azd version

# View help
azd --help

# List available templates
azd template list
```

Sortie attendue :
```
azd version 1.5.0 (commit abc123)
```

**✅ Liste de vérification pour une installation réussie :**
- [ ] `azd version` affiche le numéro de version sans erreurs
- [ ] `azd --help` affiche la documentation des commandes
- [ ] `azd template list` montre les modèles disponibles
- [ ] `az account show` affiche votre abonnement Azure
- [ ] Vous pouvez créer un répertoire de test et exécuter `azd init` avec succès

**Si toutes les vérifications sont réussies, vous êtes prêt à passer à [Votre premier projet](first-project.md) !**

## Configuration de l'authentification

### Authentification via Azure CLI (Recommandé)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Verify authentication
az account show
```

### Authentification par code de périphérique
Si vous êtes sur un système sans interface graphique ou rencontrez des problèmes de navigateur :
```bash
az login --use-device-code
```

### Principal de service (CI/CD)
Pour les environnements automatisés :
```bash
az login --service-principal \
  --username <client-id> \
  --password <client-secret> \
  --tenant <tenant-id>
```

## Configuration

### Configuration globale
```bash
# Set default subscription
azd config set defaults.subscription <subscription-id>

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config list
```

### Variables d'environnement
Ajoutez-les à votre profil shell (`.bashrc`, `.zshrc`, `.profile`) :
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# azd configuration
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Enable debug logging
```

## Intégration IDE

### Visual Studio Code
Installez l'extension Azure Developer CLI :
1. Ouvrez VS Code
2. Allez dans Extensions (Ctrl+Shift+X)
3. Recherchez "Azure Developer CLI"
4. Installez l'extension

Fonctionnalités :
- IntelliSense pour azure.yaml
- Commandes intégrées dans le terminal
- Navigation dans les modèles
- Suivi des déploiements

### GitHub Codespaces
Créez un fichier `.devcontainer/devcontainer.json` :
```json
{
  "name": "Azure Developer CLI",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/azure/azure-dev/azd:latest": {}
  },
  "postCreateCommand": "azd version"
}
```

### IntelliJ/JetBrains
1. Installez le plugin Azure
2. Configurez les identifiants Azure
3. Utilisez le terminal intégré pour les commandes azd

## 🐛 Résolution des problèmes d'installation

### Problèmes courants

#### Permission refusée (Windows)
```powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### Problèmes de PATH
Ajoutez manuellement azd à votre PATH :

**Windows :**
```cmd
setx PATH "%PATH%;C:\Program Files\azd\"
```

**macOS/Linux :**
```bash
echo 'export PATH=$PATH:/usr/local/bin' >> ~/.bashrc
source ~/.bashrc
```

#### Problèmes de réseau/proxy
```bash
# Configure proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Skip SSL verification (not recommended for production)
azd config set http.insecure true
```

#### Conflits de version
```bash
# Remove old installations
# Windows: winget uninstall Microsoft.Azd
# macOS: brew uninstall azd
# Linux: sudo apt remove azd

# Clean configuration
rm -rf ~/.azd
```

### Obtenir plus d'aide
```bash
# Enable debug logging
export AZD_DEBUG=true
azd <command> --debug

# View detailed logs
azd logs

# Check system info
azd info
```

## Mise à jour d'azd

### Mises à jour automatiques
azd vous avertira lorsque des mises à jour sont disponibles :
```bash
azd version --check-for-updates
```

### Mises à jour manuelles

**Windows (winget) :**
```cmd
winget upgrade Microsoft.Azd
```

**macOS (Homebrew) :**
```bash
brew upgrade azd
```

**Linux :**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

## 💡 Foire aux questions

<details>
<summary><strong>Quelle est la différence entre azd et az CLI ?</strong></summary>

**Azure CLI (az)** : Outil de bas niveau pour gérer des ressources Azure individuelles
- `az webapp create`, `az storage account create`
- Une ressource à la fois
- Axé sur la gestion de l'infrastructure

**Azure Developer CLI (azd)** : Outil de haut niveau pour le déploiement complet d'applications
- `azd up` déploie une application entière avec toutes ses ressources
- Flux de travail basés sur des modèles
- Axé sur la productivité des développeurs

**Vous avez besoin des deux** : azd utilise Azure CLI pour l'authentification
</details>

<details>
<summary><strong>Puis-je utiliser azd avec des ressources Azure existantes ?</strong></summary>

Oui ! Vous pouvez :
1. Importer des ressources existantes dans des environnements azd
2. Référencer des ressources existantes dans vos modèles Bicep
3. Utiliser azd pour de nouveaux déploiements en parallèle avec une infrastructure existante

Consultez le [Guide de configuration](configuration.md) pour plus de détails.
</details>

<details>
<summary><strong>azd fonctionne-t-il avec Azure Government ou Azure China ?</strong></summary>

Oui, configurez le cloud :
```bash
# Azure Government
az cloud set --name AzureUSGovernment
az login

# Azure China
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Puis-je utiliser azd dans des pipelines CI/CD ?</strong></summary>

Absolument ! azd est conçu pour l'automatisation :
- Intégration avec GitHub Actions
- Support Azure DevOps
- Authentification par principal de service
- Mode non interactif

Consultez le [Guide de déploiement](../deployment/deployment-guide.md) pour les modèles CI/CD.
</details>

<details>
<summary><strong>Quel est le coût d'utilisation d'azd ?</strong></summary>

azd lui-même est **entièrement gratuit** et open-source. Vous ne payez que pour :
- Les ressources Azure que vous déployez
- Les coûts de consommation Azure (calcul, stockage, etc.)

Utilisez `azd provision --preview` pour estimer les coûts avant le déploiement.
</details>

## Prochaines étapes

1. **Complétez l'authentification** : Assurez-vous d'accéder à votre abonnement Azure
2. **Essayez votre premier déploiement** : Suivez le [Guide du premier projet](first-project.md)
3. **Explorez les modèles** : Parcourez les modèles disponibles avec `azd template list`
4. **Configurez votre IDE** : Préparez votre environnement de développement

## Support

Si vous rencontrez des problèmes :
- [Documentation officielle](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Signaler des problèmes](https://github.com/Azure/azure-dev/issues)
- [Discussions communautaires](https://github.com/Azure/azure-dev/discussions)
- [Support Azure](https://azure.microsoft.com/support/)

---

**Navigation du chapitre :**
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 1 - Fondations et démarrage rapide
- **⬅️ Précédent** : [Notions de base d'AZD](azd-basics.md) 
- **➡️ Suivant** : [Votre premier projet](first-project.md)
- **🚀 Chapitre suivant** : [Chapitre 2 : Développement axé sur l'IA](../microsoft-foundry/microsoft-foundry-integration.md)

**✅ Installation terminée !** Continuez avec [Votre premier projet](first-project.md) pour commencer à construire avec azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->