# Guide d'installation et de configuration

**Navigation du chapitre :**
- **📚 Page du cours**: [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel**: Chapitre 1 - Fondations & Démarrage rapide
- **⬅️ Précédent**: [Bases d'AZD](azd-basics.md)
- **➡️ Suivant**: [Votre premier projet](first-project.md)
- **🚀 Chapitre suivant**: [Chapitre 2 : Développement axé sur l'IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Ce guide complet vous expliquera comment installer et configurer Azure Developer CLI (azd) sur votre système. Vous apprendrez plusieurs méthodes d'installation pour différents systèmes d'exploitation, la configuration de l'authentification et la configuration initiale pour préparer votre environnement de développement aux déploiements Azure.

## Objectifs d'apprentissage

À la fin de cette leçon, vous serez capable de :
- Installer avec succès Azure Developer CLI sur votre système d'exploitation
- Configurer l'authentification avec Azure en utilisant plusieurs méthodes
- Configurer votre environnement de développement avec les prérequis nécessaires
- Comprendre les différentes options d'installation et quand les utiliser
- Dépanner les problèmes courants d'installation et de configuration

## Résultats d'apprentissage

Après avoir terminé cette leçon, vous serez en mesure de :
- Installer azd en utilisant la méthode appropriée pour votre plateforme
- Vous authentifier auprès d'Azure en utilisant azd auth login
- Vérifier votre installation et tester les commandes azd de base
- Configurer votre environnement de développement pour une utilisation optimale d'azd
- Résoudre de manière autonome les problèmes d'installation courants

Ce guide vous aidera à installer et configurer Azure Developer CLI sur votre système, quel que soit votre système d'exploitation ou environnement de développement.

## Prérequis

Avant d'installer azd, assurez-vous d'avoir :
- **Abonnement Azure** - [Créer un compte gratuit](https://azure.microsoft.com/free/)
- **Azure CLI** - Pour l'authentification et la gestion des ressources
- **Git** - Pour cloner des modèles et le contrôle de version
- **Docker** (optionnel) - Pour les applications conteneurisées

## Méthodes d'installation

### Windows

#### Option 1 : PowerShell (recommandé)
```powershell
# Exécuter en tant qu'administrateur ou avec des privilèges élevés
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 2 : Windows Package Manager (winget)
```cmd
winget install Microsoft.Azd
```

#### Option 3 : Chocolatey
```cmd
choco install azd
```

#### Option 4 : Installation manuelle
1. Téléchargez la dernière version depuis [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extrayez vers `C:\Program Files\azd\`
3. Ajoutez au PATH (variable d'environnement)

### macOS

#### Option 1 : Homebrew (recommandé)
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
# Télécharger et installer
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1 : Script d'installation (recommandé)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2 : Gestionnaires de paquets

**Ubuntu/Debian :**
```bash
# Ajouter le dépôt de paquets Microsoft
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Installer azd
sudo apt-get update
sudo apt-get install azd
```

**RHEL/CentOS/Fedora :**
```bash
# Ajouter le dépôt de paquets Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/azure-cli
sudo dnf install azd
```

### GitHub Codespaces

azd est préinstallé dans GitHub Codespaces. Créez simplement un codespace et commencez à utiliser azd immédiatement.

### Docker

```bash
# Exécuter azd dans un conteneur
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Créer un alias pour faciliter l'utilisation
alias azd='docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

## ✅ Vérifier l'installation

Après l'installation, vérifiez que azd fonctionne correctement :

```bash
# Vérifier la version
azd version

# Voir l'aide
azd --help

# Lister les modèles disponibles
azd template list
```

Sortie attendue :
```
azd version 1.x.x (commit xxxxxx)
```

**Remarque** : Le numéro de version réel peut varier. Consultez [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) pour la dernière version.

**✅ Liste de contrôle de réussite d'installation :**
- [ ] `azd version` affiche le numéro de version sans erreurs
- [ ] `azd --help` affiche la documentation des commandes
- [ ] `azd template list` affiche les modèles disponibles
- [ ] `az account show` affiche votre abonnement Azure
- [ ] Vous pouvez créer un répertoire de test et exécuter `azd init` avec succès

**Si toutes les vérifications sont réussies, vous êtes prêt à passer à [Votre premier projet](first-project.md) !**

## Configuration de l'authentification

### Authentification via Azure CLI (recommandée)
```bash
# Installer Azure CLI s'il n'est pas déjà installé
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Se connecter à Azure
az login

# Vérifier l'authentification
az account show
```

### Authentification par code d'appareil
Si vous êtes sur un système sans interface graphique ou si vous rencontrez des problèmes de navigateur :
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
# Définir l'abonnement par défaut
azd config set defaults.subscription <subscription-id>

# Définir l'emplacement par défaut
azd config set defaults.location eastus2

# Afficher toute la configuration
azd config list
```

### Variables d'environnement
Ajoutez à votre profil de shell (`.bashrc`, `.zshrc`, `.profile`) :
```bash
# Configuration Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Configuration azd
export AZD_ALPHA_ENABLE_APPSERVICE_REMOTE_DEBUGGING=true
export AZD_DEBUG=true  # Activer la journalisation de débogage
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
- Parcours des modèles
- Surveillance des déploiements

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

## 🐛 Dépannage de l'installation

### Problèmes courants

#### Permission refusée (Windows)
```powershell
# Exécuter PowerShell en tant qu'administrateur
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

#### Problèmes réseau/proxy
```bash
# Configurer le proxy
azd config set http.proxy http://proxy:8080
azd config set https.proxy https://proxy:8080

# Ignorer la vérification SSL (non recommandé en production)
azd config set http.insecure true
```

#### Conflits de version
```bash
# Supprimer les anciennes installations
# Windows : winget uninstall Microsoft.Azd
# macOS : brew uninstall azd
# Linux : sudo apt remove azd

# Nettoyer la configuration
rm -rf ~/.azd
```

### Obtenir plus d'aide
```bash
# Activer la journalisation de débogage
export AZD_DEBUG=true
azd <command> --debug

# Afficher la configuration actuelle
azd config list

# Afficher l'état actuel du déploiement
azd show
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

## 💡 Questions fréquentes

<details>
<summary><strong>Quelle est la différence entre azd et az CLI ?</strong></summary>

**Azure CLI (az)** : Outil bas niveau pour la gestion des ressources Azure individuelles
- `az webapp create`, `az storage account create`
- Une ressource à la fois
- Axé sur la gestion de l'infrastructure

**Azure Developer CLI (azd)** : Outil de haut niveau pour les déploiements complets d'applications
- `azd up` déploie une application entière avec toutes les ressources
- Flux de travail basés sur des modèles
- Axé sur la productivité des développeurs

**Vous avez besoin des deux** : azd utilise az CLI pour l'authentification
</details>

<details>
<summary><strong>Puis-je utiliser azd avec des ressources Azure existantes ?</strong></summary>

Oui ! Vous pouvez :
1. Importer des ressources existantes dans les environnements azd
2. Référencer des ressources existantes dans vos templates Bicep
3. Utiliser azd pour de nouveaux déploiements aux côtés de l'infrastructure existante

Voir le [Guide de configuration](configuration.md) pour les détails.
</details>

<details>
<summary><strong>azd fonctionne-t-il avec Azure Government ou Azure China ?</strong></summary>

Oui, configurez le cloud :
```bash
# Azure Gouvernement
az cloud set --name AzureUSGovernment
az login

# Azure Chine
az cloud set --name AzureChinaCloud
az login
```
</details>

<details>
<summary><strong>Puis-je utiliser azd dans des pipelines CI/CD ?</strong></summary>

Absolument ! azd est conçu pour l'automatisation :
- Intégration GitHub Actions
- Prise en charge d'Azure DevOps
- Authentification par principal de service
- Mode non interactif

Voir le [Guide de déploiement](../chapter-04-infrastructure/deployment-guide.md) pour les modèles CI/CD.
</details>

<details>
<summary><strong>Quel est le coût d'utilisation d'azd ?</strong></summary>

azd lui-même est **complètement gratuit** et open-source. Vous ne payez que pour :
- Les ressources Azure que vous déployez
- Les coûts de consommation Azure (compute, stockage, etc.)

Utilisez `azd provision --preview` pour estimer les coûts avant le déploiement.
</details>

## Étapes suivantes

1. **Terminer l'authentification** : Assurez-vous de pouvoir accéder à votre abonnement Azure
2. **Essayez votre premier déploiement** : Suivez le [Guide du premier projet](first-project.md)
3. **Explorez les modèles** : Parcourez les modèles disponibles avec `azd template list`
4. **Configurez votre IDE** : Configurez votre environnement de développement

## Support

Si vous rencontrez des problèmes :
- [Documentation officielle](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Signaler un problème](https://github.com/Azure/azure-dev/issues)
- [Discussions communautaires](https://github.com/Azure/azure-dev/discussions)
- [Support Azure](https://azure.microsoft.com/support/)
- [**Azure Agent Skills**](https://skills.sh/microsoft/github-copilot-for-azure) - Obtenez des conseils de commandes Azure directement dans votre éditeur avec `npx skills add microsoft/github-copilot-for-azure`

---

**Navigation du chapitre :**
- **📚 Page du cours**: [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel**: Chapitre 1 - Fondations & Démarrage rapide
- **⬅️ Précédent**: [Bases d'AZD](azd-basics.md) 
- **➡️ Suivant**: [Votre premier projet](first-project.md)
- **🚀 Chapitre suivant**: [Chapitre 2 : Développement axé sur l'IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation terminée !** Continuez vers [Votre premier projet](first-project.md) pour commencer à développer avec azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Avis de non-responsabilité : Ce document a été traduit à l'aide du service de traduction par IA [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'en assurer l'exactitude, veuillez noter que les traductions automatiques peuvent comporter des erreurs ou des inexactitudes. Le document original, dans sa langue d'origine, doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction professionnelle réalisée par un traducteur humain est recommandée. Nous ne pouvons être tenus responsables des malentendus ou des mauvaises interprétations résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->