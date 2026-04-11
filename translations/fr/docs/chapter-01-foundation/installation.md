# Guide d'installation et de configuration

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 1 - Fondations & Démarrage rapide
- **⬅️ Précédent** : [Notions de base AZD](azd-basics.md)
- **➡️ Suivant** : [Votre premier projet](first-project.md)
- **🚀 Chapitre suivant** : [Chapitre 2 : Développement axé IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Ce guide complet vous accompagnera dans l'installation et la configuration de l'Azure Developer CLI (azd) sur votre système. Vous apprendrez plusieurs méthodes d'installation pour différents systèmes d'exploitation, la configuration de l'authentification et la configuration initiale pour préparer votre environnement de développement aux déploiements Azure.

## Objectifs d'apprentissage

À la fin de cette leçon, vous pourrez :
- Installer avec succès Azure Developer CLI sur votre système d'exploitation
- Configurer l'authentification avec Azure via plusieurs méthodes
- Configurer votre environnement de développement avec les prérequis nécessaires
- Comprendre les différentes options d'installation et quand les utiliser
- Résoudre les problèmes courants d'installation et de configuration

## Résultats d'apprentissage

Après avoir terminé cette leçon, vous serez capable de :
- Installer azd en utilisant la méthode appropriée pour votre plateforme
- Vous authentifier avec Azure en utilisant azd auth login
- Vérifier votre installation et tester les commandes de base azd
- Configurer votre environnement de développement pour une utilisation optimale d'azd
- Résoudre de manière autonome les problèmes courants d'installation

Ce guide vous aidera à installer et configurer Azure Developer CLI sur votre système, quel que soit votre système d'exploitation ou environnement de développement.

## Prérequis

Avant d'installer azd, assurez-vous d'avoir :
- **Abonnement Azure** - [Créez un compte gratuit](https://azure.microsoft.com/free/)
- **Azure CLI** - Pour l'authentification et la gestion des ressources
- **Git** - Pour cloner les modèles et le contrôle de version
- **Docker** (optionnel) - Pour les applications conteneurisées

## Méthodes d'installation

### Windows

#### Option 1 : Gestionnaire de paquets Windows (Recommandé)
```cmd
winget install microsoft.azd
```

#### Option 2 : Script d'installation PowerShell
```powershell
# Utile lorsque winget n'est pas disponible
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 3 : Chocolatey
```cmd
choco install azd
```

#### Option 4 : Installation manuelle
1. Téléchargez la dernière version depuis [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extrayez dans `C:\Program Files\azd\`
3. Ajoutez au PATH de votre environnement

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
# Télécharger et installer
curl -fsSL https://aka.ms/install-azd.sh | bash -s -- --base-url https://github.com/Azure/azure-dev/releases/latest/download --verbose
```

### Linux

#### Option 1 : Script d'installation (Recommandé)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2 : Gestionnaires de paquets

**Installation manuelle depuis les assets de la release :**
```bash
# Téléchargez la dernière archive pour votre architecture Linux depuis :
# https://github.com/Azure/azure-dev/releases
# Ensuite, extrayez-la et ajoutez le binaire azd à votre PATH.
```

### GitHub Codespaces

Certains Codespaces et environnements de conteneurs de développement incluent déjà `azd`, mais vous devriez vérifier plutôt que supposer :

```bash
azd version
```

Si `azd` manque, installez-le avec le script standard pour l'environnement.

### Docker

```bash
# Exécuter azd dans un conteneur
docker run --rm -it -v $(pwd):/workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Créer un alias pour une utilisation plus facile
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

**Note** : Le numéro de version réel peut varier. Consultez [Azure Developer CLI releases](https://github.com/Azure/azure-dev/releases) pour la dernière version.

**✅ Liste de contrôle de réussite d'installation :**
- [ ] `azd version` affiche le numéro de version sans erreurs
- [ ] `azd --help` affiche la documentation des commandes
- [ ] `azd template list` affiche les modèles disponibles
- [ ] Vous pouvez créer un répertoire de test et exécuter `azd init` avec succès

**Si tous les contrôles sont validés, vous êtes prêt à passer à [Votre premier projet](first-project.md) !**

## Configuration de l'authentification

### Configuration recommandée pour débutants

Pour les flux de travail AZD-first, connectez-vous avec `azd auth login`.

```bash
# Requis pour les commandes AZD telles que azd up
azd auth login

# Vérifier le statut d'authentification AZD
azd auth login --check-status
```

Utilisez la connexion via Azure CLI seulement si vous prévoyez d'exécuter des commandes `az` vous-même pendant le cours.

### Authentification via Azure CLI (optionnel)
```bash
# Installer Azure CLI si ce n'est pas déjà fait
# Windows : winget install Microsoft.AzureCLI
# macOS : brew install azure-cli
# Linux : voir la documentation d'installation d'Azure CLI pour votre distribution

# Se connecter à Azure
az login

# Vérifier l'authentification
az account show
```

### Quel flux de connexion utiliser ?

- Utilisez `azd auth login` si vous suivez le chemin débutant AZD et exécutez principalement des commandes `azd`.
- Utilisez aussi `az login` lorsque vous voulez exécuter des commandes Azure CLI telles que `az account show` ou inspecter directement des ressources.
- Si un exercice inclut des commandes `azd` et `az`, exécutez les deux commandes de connexion une fois au début.

### Authentification par code appareil
Si vous êtes sur un système sans interface graphique ou avez des problèmes de navigateur :
```bash
azd auth login --use-device-code
```

### Principal de service (CI/CD)
Pour les environnements automatisés :
```bash
azd auth login \
  --client-id <client-id> \
  --client-secret <client-secret> \
  --tenant-id <tenant-id>
```

### Valider votre installation complète

Si vous souhaitez une vérification rapide avant de commencer le Chapitre 1 :

**Windows :**
```powershell
.\validate-setup.ps1
```

**macOS / Linux :**
```bash
bash ./validate-setup.sh
```

## Configuration

### Configuration globale
```bash
# Définir l'abonnement par défaut
azd config set defaults.subscription <subscription-id>

# Définir l'emplacement par défaut
azd config set defaults.location eastus2

# Voir toute la configuration
azd config show
```

### Variables d'environnement
Ajoutez à votre profil shell (`.bashrc`, `.zshrc`, `.profile`) :
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
Installez l’extension Azure Developer CLI :
1. Ouvrez VS Code
2. Allez dans Extensions (Ctrl+Shift+X)
3. Recherchez « Azure Developer CLI »
4. Installez l’extension

Fonctionnalités :
- IntelliSense pour azure.yaml
- Commandes terminal intégrées
- Navigation des modèles
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
# Exécuter PowerShell en tant qu’administrateur
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
# Windows : winget uninstall microsoft.azd
# macOS : brew uninstall azd
# Linux : supprimer l'ancien binaire azd ou le lien symbolique avant de réinstaller

# Nettoyer la configuration
rm -rf ~/.azd
```

### Obtenir plus d'aide
```bash
# Activer la journalisation de débogage
export AZD_DEBUG=true
azd <command> --debug

# Voir la configuration actuelle
azd config show

# Voir l'état actuel du déploiement
azd show
```

## Mise à jour d'azd

### Vérification de mise à jour
azd avertit lorsqu'une nouvelle version est disponible, et vous pouvez vérifier votre version actuelle avec :
```bash
azd version
```

### Mises à jour manuelles

**Windows (winget) :**
```cmd
winget upgrade microsoft.azd
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
- Concentration sur la gestion d'infrastructure

**Azure Developer CLI (azd)** : Outil de haut niveau pour les déploiements complets d'applications
- `azd up` déploie l'application entière avec toutes les ressources
- Flux de travail basés sur des modèles
- Concentration sur la productivité du développeur

**Vous avez besoin des deux** : azd utilise az CLI pour l'authentification
</details>

<details>
<summary><strong>Puis-je utiliser azd avec des ressources Azure existantes ?</strong></summary>

Oui ! Vous pouvez :
1. Importer des ressources existantes dans les environnements azd
2. Référencer des ressources existantes dans vos modèles Bicep
3. Utiliser azd pour de nouveaux déploiements parallèlement à l'infrastructure existante

Voir le [Guide de configuration](configuration.md) pour plus de détails.
</details>

<details>
<summary><strong>azd fonctionne-t-il avec Azure Government ou Azure Chine ?</strong></summary>

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
<summary><strong>Puis-je utiliser azd dans les pipelines CI/CD ?</strong></summary>

Absolument ! azd est conçu pour l'automatisation :
- Intégration GitHub Actions
- Support Azure DevOps
- Authentification par principal de service
- Mode non-interactif

Voir le [Guide de déploiement](../chapter-04-infrastructure/deployment-guide.md) pour les modèles CI/CD.
</details>

<details>
<summary><strong>Quel est le coût d'utilisation d'azd ?</strong></summary>

azd lui-même est **complètement gratuit** et open-source. Vous payez uniquement pour :
- Les ressources Azure que vous déployez
- Les coûts de consommation Azure (calcul, stockage, etc.)

Utilisez `azd provision --preview` pour estimer les coûts avant le déploiement.
</details>

## Étapes suivantes

1. **Complétez l'authentification** : Assurez-vous d'accéder à votre abonnement Azure
2. **Essayez votre premier déploiement** : Suivez le [Guide premier projet](first-project.md)
3. **Explorez les modèles** : Parcourez les modèles disponibles avec `azd template list`
4. **Configurez votre IDE** : Configurez votre environnement de développement

## Support

En cas de problème :
- [Documentation officielle](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Signaler un problème](https://github.com/Azure/azure-dev/issues)
- [Discussions communautaires](https://github.com/Azure/azure-dev/discussions)
- [Support Azure](https://azure.microsoft.com/support/)
- [**Compétences Agent Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - Obtenez des conseils de commande Azure directement dans votre éditeur avec `npx skills add microsoft/github-copilot-for-azure`

---

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 1 - Fondations & Démarrage rapide
- **⬅️ Précédent** : [Notions de base AZD](azd-basics.md) 
- **➡️ Suivant** : [Votre premier projet](first-project.md)
- **🚀 Chapitre suivant** : [Chapitre 2 : Développement axé IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation terminée !** Continuez avec [Votre premier projet](first-project.md) pour commencer à construire avec azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçons d’assurer l’exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des imprécisions. Le document original dans sa langue native doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction professionnelle humaine est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->