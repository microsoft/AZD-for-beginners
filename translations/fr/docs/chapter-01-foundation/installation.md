# Guide d'installation et de configuration

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre en cours** : Chapitre 1 - Fondations & Démarrage Rapide
- **⬅️ Précédent** : [Les bases d'AZD](azd-basics.md)
- **➡️ Suivant** : [Votre premier projet](first-project.md)
- **🚀 Chapitre suivant** : [Chapitre 2 : Développement axé IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Ce guide complet vous accompagnera dans l'installation et la configuration de l'Azure Developer CLI (azd) sur votre système. Vous apprendrez plusieurs méthodes d'installation pour différents systèmes d'exploitation, la configuration de l'authentification, ainsi que la configuration initiale pour préparer votre environnement de développement aux déploiements Azure.

## Objectifs d'apprentissage

À la fin de cette leçon, vous serez capable de :
- Installer avec succès Azure Developer CLI sur votre système d'exploitation
- Configurer l'authentification avec Azure en utilisant plusieurs méthodes
- Mettre en place votre environnement de développement avec les prérequis nécessaires
- Comprendre les différentes options d'installation et savoir quand les utiliser
- Résoudre les problèmes courants d'installation et de configuration

## Résultats d'apprentissage

Après avoir terminé cette leçon, vous saurez :
- Installer azd en utilisant la méthode appropriée pour votre plateforme
- Authentifier avec Azure via la commande azd auth login
- Vérifier votre installation et tester les commandes basiques d'azd
- Configurer votre environnement de développement pour une utilisation optimale d'azd
- Résoudre de manière autonome les problèmes courants d'installation

Ce guide vous aidera à installer et configurer Azure Developer CLI sur votre système, quel que soit votre système d'exploitation ou environnement de développement.

## Prérequis

Avant d'installer azd, assurez-vous d'avoir :
- **Abonnement Azure** - [Créez un compte gratuit](https://azure.microsoft.com/free/)
- **Azure CLI** (optionnel) - Pour les exemples qui exécutent explicitement `az` ; azd s'authentifie de manière indépendante
- **Git** - Pour cloner les templates et le contrôle de version
- **Docker** (optionnel) - Pour les applications conteneurisées

## Méthodes d'installation

### Windows

#### Option 1 : Windows Package Manager (Recommandé)
```cmd
winget install microsoft.azd
```

#### Option 2 : Script d'installation PowerShell
```powershell
# Useful when winget is unavailable
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"
```

#### Option 3 : Chocolatey
```cmd
choco install azd
```

#### Option 4 : Installation manuelle
1. Téléchargez la dernière version sur [GitHub](https://github.com/Azure/azure-dev/releases)
2. Extrayez dans `C:\Program Files\azd\`
3. Ajoutez au PATH de la variable d’environnement

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
Téléchargez l’archive pour votre architecture macOS depuis [les assets de la version](https://github.com/Azure/azure-dev/releases), extrayez-la, puis ajoutez le binaire `azd` à votre `PATH`.

### Linux

#### Option 1 : Script d'installation (Recommandé)
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

#### Option 2 : Gestionnaires de paquets

**Installation manuelle depuis les assets de la version :**
```bash
# Download the latest archive for your Linux architecture from:
# https://github.com/Azure/azure-dev/releases
# Then extract it and add the azd binary to your PATH.
```

### GitHub Codespaces

Certains environnements Codespaces et conteneurs dev incluent déjà `azd`, mais vous devriez vérifier plutôt que supposer :

```bash
azd version
```

Si `azd` est absent, installez-le avec le script standard pour l’environnement.

### Docker

```bash
# Run azd in a container
docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest

# Create an alias for easier use
alias azd='docker run --rm -it -v "$(pwd):/workspace" -w /workspace mcr.microsoft.com/azure-dev-cli-tools:latest azd'
```

Ce conteneur éphémère ne conserve pas l’état de connexion entre les exécutions. Pour des déploiements répétés, utilisez la [configuration du conteneur dev](dev-containers.md) ; les builds de conteneur exigent également un daemon Docker accessible depuis l’intérieur du conteneur.

## ✅ Vérification de l'installation

Après l’installation, vérifiez que azd fonctionne correctement :

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
azd version 1.x.x (commit xxxxxx)
```

**Note** : Le numéro de version réel peut varier. Consultez les [releases d'Azure Developer CLI](https://github.com/Azure/azure-dev/releases) pour la version la plus récente.

**✅ Liste de contrôle de réussite de l’installation :**
- [ ] `azd version` affiche le numéro de version sans erreurs
- [ ] `azd --help` affiche la documentation de commande
- [ ] `azd template list` montre les templates disponibles
- [ ] Vous pouvez créer un répertoire test et exécuter `azd init` avec succès

**Si toutes les vérifications sont réussies, vous êtes prêt à passer à [Votre premier projet](first-project.md) !**

## Configuration de l'authentification

### Configuration recommandée pour débutants

Pour les workflows axés AZD, connectez-vous avec `azd auth login`.

```bash
# Required for AZD commands such as azd up
azd auth login

# Verify AZD authentication status
azd auth login --check-status
```

Utilisez la connexion Azure CLI uniquement si vous prévoyez d’exécuter vous-même les commandes `az` durant le cours.

### Authentification Azure CLI (optionnelle)
```bash
# Install Azure CLI if not already installed
# Windows: winget install Microsoft.AzureCLI
# macOS: brew install azure-cli
# Linux: see the Azure CLI install docs for your distribution

# Login to Azure
az login

# Verify authentication
az account show
```

### Quel flux de connexion devez-vous utiliser ?

- Utilisez `azd auth login` si vous suivez la voie débutant AZD et exécutez principalement des commandes `azd`.
- Utilisez `az login` aussi lorsque vous souhaitez exécuter des commandes Azure CLI telles que `az account show` ou inspecter directement des ressources.
- Si un exercice comprend à la fois des commandes `azd` et `az`, exécutez les deux commandes de connexion une fois au début.

### Authentification par code appareil
Si vous êtes sur un système sans interface graphique ou que vous avez des problèmes de navigateur :
```bash
azd auth login --use-device-code
```

### Principal de service (CI/CD)
Pour les environnements automatisés :
```bash
azd auth login \
  --client-id "<client-id>" \
  --client-secret "<client-secret>" \
  --tenant-id "<tenant-id>"
```

### Validez votre configuration complète

Si vous souhaitez un contrôle rapide de préparation avant de commencer le Chapitre 1 :

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
# Set default subscription
azd config set defaults.subscription "<subscription-id>"

# Set default location
azd config set defaults.location eastus2

# View all configuration
azd config show
```

### Variables d'environnement
Ajoutez-les à votre profil shell (`.bashrc`, `.zshrc`, `.profile`) :
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"

# Enable diagnostics per command rather than relying on undocumented variables
azd version --debug
```

## Intégration IDE

### Visual Studio Code
Installez l'extension Azure Developer CLI :
1. Ouvrez VS Code
2. Allez dans Extensions (Ctrl+Maj+X)
3. Recherchez "Azure Developer CLI"
4. Installez l'extension

Fonctions :
- IntelliSense pour azure.yaml
- Commandes terminal intégrées
- Navigation dans les templates
- Surveillance des déploiements

### GitHub Codespaces
Créez un `.devcontainer/devcontainer.json` :
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

#### Problèmes réseau/proxy
```bash
# Configure standard proxy environment variables for the current Bash session
export HTTP_PROXY="http://proxy:8080"
export HTTPS_PROXY="http://proxy:8080"
# Use your organization's trusted CA configuration; do not disable TLS validation.
```

#### Conflits de versions
```bash
# Remove old installations
# Windows: winget uninstall microsoft.azd
# macOS: brew uninstall azd
# Linux: remove the previous azd binary or symlink before reinstalling

# Clean configuration
rm -rf ~/.azd
```

### Obtenir plus d'aide
```bash
# Enable debug logging
azd show --debug

# View current configuration
azd config show

# View current deployment status
azd show
```

## Mise à jour de azd

### Vérification de mise à jour
Azd avertit lorsqu’une version plus récente est disponible, et vous pouvez vérifier votre build actuelle avec :
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

## 💡 Questions fréquemment posées

<details>
<summary><strong>Quelle est la différence entre azd et az CLI ?</strong></summary>

**Azure CLI (az)** : Outil bas niveau pour gérer les ressources Azure individuellement
- `az webapp create`, `az storage account create`
- Une ressource à la fois
- Orienté gestion d'infrastructure

**Azure Developer CLI (azd)** : Outil haut niveau pour les déploiements complets d'applications
- `azd up` déploie l’application entière avec toutes ses ressources
- Workflows basés sur des templates
- Focus productivité développeur

**Ils sont indépendants** : azd utilise par défaut sa propre authentification. Installez et connectez-vous à Azure CLI uniquement pour les commandes `az`, ou optez explicitement pour `azd config set auth.useAzCliAuth true`.
</details>

<details>
<summary><strong>Puis-je utiliser azd avec des ressources Azure existantes ?</strong></summary>

Oui ! Vous pouvez :
1. Importer des ressources existantes dans des environnements azd
2. Référencer des ressources existantes dans vos templates Bicep
3. Utiliser azd pour de nouveaux déploiements en parallèle de l'infrastructure existante

Consultez le [Guide de configuration](../chapter-03-configuration/configuration.md) pour plus de détails.
</details>

<details>
<summary><strong>Est-ce qu'azd fonctionne avec Azure Government ou Azure Chine ?</strong></summary>

Oui, configurez le cloud :
```bash
# Azure Government (azd)
azd config set cloud.name AzureUSGovernment
azd auth login

# Azure China (alternative)
azd config set cloud.name AzureChinaCloud
azd auth login
```

Si vous utilisez aussi Azure CLI, configurez `az cloud set --name ...` séparément. Les services de template et la disponibilité des modèles varient selon le cloud.
</details>

<details>
<summary><strong>Puis-je utiliser azd dans des pipelines CI/CD ?</strong></summary>

Absolument ! azd est conçu pour l'automatisation :
- Intégration GitHub Actions
- Support Azure DevOps
- Authentification principal de service
- Mode non interactif

Consultez le [Guide de déploiement](../chapter-04-infrastructure/deployment-guide.md) pour les patterns CI/CD.
</details>

<details>
<summary><strong>Quel est le coût d'utilisation d'azd ?</strong></summary>

Azd lui-même est **entièrement gratuit** et open-source. Vous ne payez que pour :
- Les ressources Azure que vous déployez
- Les coûts de consommation Azure (calcul, stockage, etc.)

Utilisez `azd provision --preview` pour inspecter les ressources proposées, puis estimez leurs coûts avec le [Calculateur de prix Azure](https://azure.microsoft.com/pricing/calculator/). L'aperçu ne calcule pas les prix.
</details>

## Étapes suivantes

1. **Complétez l'authentification** : Assurez-vous que vous pouvez accéder à votre abonnement Azure
2. **Essayez votre premier déploiement** : Suivez le [Guide du premier projet](first-project.md)
3. **Explorez les templates** : Parcourez les templates disponibles avec `azd template list`
4. **Configurez votre IDE** : Mettez en place votre environnement de développement

## Support

Si vous rencontrez des problèmes :
- [Documentation officielle](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Signaler un problème](https://github.com/Azure/azure-dev/issues)
- [Discussions communautaires](https://github.com/Azure/azure-dev/discussions)
- [Support Azure](https://azure.microsoft.com/support/)
- [**Compétences Agent Azure**](https://skills.sh/microsoft/github-copilot-for-azure) - Obtenez des conseils de commande Azure directement dans votre éditeur avec `npx skills add microsoft/github-copilot-for-azure`

---

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre en cours** : Chapitre 1 - Fondations & Démarrage Rapide
- **⬅️ Précédent** : [Les bases d'AZD](azd-basics.md) 
- **➡️ Suivant** : [Votre premier projet](first-project.md)
- **🚀 Chapitre suivant** : [Chapitre 2 : Développement axé IA](../chapter-02-ai-development/microsoft-foundry-integration.md)

**✅ Installation terminée !** Continuez vers [Votre premier projet](first-project.md) pour commencer à construire avec azd.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->