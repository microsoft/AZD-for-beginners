# AZD pour Débutants : Un Parcours d’Apprentissage Structuré

![AZD-pour-débutants](../../translated_images/fr/azdbeginners.5527441dd9f74068.webp) 

[![Suiveurs GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://github.com/microsoft/AZD-for-beginners)
[![Forks GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Étoiles GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://github.com/microsoft/AZD-for-beginners)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traductions Automatisées (Toujours à Jour)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabe](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgare](../bg/README.md) | [Birman (Myanmar)](../my/README.md) | [Chinois (Simplifié)](../zh-CN/README.md) | [Chinois (Traditionnel, Hong Kong)](../zh-HK/README.md) | [Chinois (Traditionnel, Macao)](../zh-MO/README.md) | [Chinois (Traditionnel, Taïwan)](../zh-TW/README.md) | [Croate](../hr/README.md) | [Tchèque](../cs/README.md) | [Danois](../da/README.md) | [Néerlandais](../nl/README.md) | [Estonien](../et/README.md) | [Finnois](../fi/README.md) | [Français](./README.md) | [Allemand](../de/README.md) | [Grec](../el/README.md) | [Hébreu](../he/README.md) | [Hindi](../hi/README.md) | [Hongrois](../hu/README.md) | [Indonésien](../id/README.md) | [Italien](../it/README.md) | [Japonais](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Coréen](../ko/README.md) | [Lituanien](../lt/README.md) | [Malais](../ms/README.md) | [Malayalam](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Marathi](../mr/README.md) | [Népalais](../ne/README.md) | [Pidgin Nigérian](../pcm/README.md) | [Norvégien](../no/README.md) | [Persan (Farsi)](../fa/README.md) | [Polonais](../pl/README.md) | [Portugais (Brésil)](../pt-BR/README.md) | [Portugais (Portugal)](../pt-PT/README.md) | [Pendjabi (Gurmukhi)](../pa/README.md) | [Roumain](../ro/README.md) | [Russe](../ru/README.md) | [Serbe (Cyrillique)](../sr/README.md) | [Slovaque](../sk/README.md) | [Slovène](../sl/README.md) | [Espagnol](../es/README.md) | [Swahili](../sw/README.md) | [Suédois](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamoul](../ta/README.md) | [Télougou](../te/README.md) | [Thaï](../th/README.md) | [Turc](../tr/README.md) | [Ukrainien](../uk/README.md) | [Ourdou](../ur/README.md) | [Vietnamien](../vi/README.md)

> **Préférez-vous Cloner Localement ?**
>
> Ce dépôt inclut plus de 50 traductions de langues ce qui augmente significativement la taille de téléchargement. Pour cloner sans les traductions, utilisez le checkout éparse :
>
> **Bash / macOS / Linux :**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows) :**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Cela vous donne tout ce dont vous avez besoin pour compléter le cours avec un téléchargement beaucoup plus rapide.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Quoi de Neuf dans azd Aujourd’hui

> 📌 **Revue de la version AI CLI (2026-11-04) :** La guidance a été vérifiée par rapport à la documentation/source publiée de **`azd 1.37.2`**, **agents `1.0.0-beta.23`**, et **évaluations `1.0.0-beta.2`**. Utilisez `azd >= 1.37.0` pour le flux de travail combiné. Lancez `azd version` et [mettez à jour le CLI central](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) avant les extensions. Voir [changements et corrections de la version](docs/chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Ce n’est pas une validation de déploiement en direct de tout le cours.

Azure Developer CLI supporte de nombreux types d’applications, y compris les applications web, les API et les agents AI, via des hôtes, modèles et extensions pris en charge.

Voici ce que cela signifie pour vous :

- **Les agents AI sont désormais des charges de travail azd de première classe.** Vous pouvez initialiser, déployer et gérer des projets d’agents AI avec le même flux de travail `azd init` → `azd up` que vous connaissez déjà.
- **Un cycle de vie des agents réparti sur deux extensions.** Utilisez `azure.ai.agents` pour initialiser, invoquer, optimiser et retirer des agents. Installez **`azure.ai.evaluations`** séparément pour `azd ai eval init`, `generate`, et `run start`. Agents beta.22 a remplacé l’ancien flux d’évaluation et changé la configuration d’optimisation ; suivez le [guide de migration](docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks).
- **Plus de blocs de construction AI.** De nouvelles extensions en aperçu—`azure.ai.skills` et `azure.ai.connections`—vous permettent de gérer des compétences d’agent réutilisables et des connexions Foundry directement avec azd.
- **L’intégration Microsoft Foundry** apporte le déploiement de modèles, l’hébergement d’agents et la configuration des services AI directement dans l’écosystème des modèles azd.
- **Des fondamentaux plus fluides au quotidien.** Les versions récentes ont rendu `azd init` idempotent (sécurisé à relancer), ont fait que `azd auth login` nettoie automatiquement les jetons périmés, et ont ajouté une invite conviviale `azd tool` au premier lancement.
- **Le flux de travail principal n’a pas changé.** Que vous déployiez une application todo, un microservice, ou une solution AI multi-agents, les commandes sont les mêmes.

> **Note pour les utilisateurs d’Aspire :** Microsoft désigne désormais le produit simplement comme **Aspire** (anciennement ".NET Aspire"). Le support d’Aspire dans azd n’a pas changé—seulement le nom a été mis à jour.

Si vous avez déjà utilisé azd, le support AI est une extension naturelle—pas un outil séparé ni une piste avancée. Si vous débutez, vous apprendrez un flux de travail qui fonctionne pour tout.

---

## 🚀 Qu’est-ce que Azure Developer CLI (azd) ?

**Azure Developer CLI (azd)** est un outil en ligne de commande convivial pour les développeurs qui simplifie le déploiement d’applications sur Azure. Au lieu de créer et connecter manuellement des dizaines de ressources Azure, vous pouvez déployer des applications complètes avec une seule commande.

### La Magie de `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

Le modèle fournit la configuration de l’application et de l’infrastructure. Un déploiement réussi nécessite toujours des services/modèles supportés, un quota et des permissions suffisants, des entrées correctes, et une vérification de l’application déployée. `azd up` ne rend pas automatiquement un modèle sécurisé, conforme ou prêt pour la production.

---

## ❓ Azure Developer CLI vs Azure CLI : Quelle est la différence ?

C’est la question la plus fréquente posée par les débutants. Voici la réponse simple :

| Fonctionnalité | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **But** | Gérer des ressources Azure individuelles | Déployer des applications complètes |
| **Mentalité** | Axé sur l’infrastructure | Axé sur l’application |
| **Exemple** | `az webapp create --name myapp...` | `azd up` |
| **Courbe d’apprentissage** | Doit connaître les services Azure | Il suffit de connaître votre application |
| **Idéal pour** | DevOps, Infrastructure | Développeurs, Prototypage |

### Analogie Simple

- **Azure CLI** est comme avoir tous les outils pour construire une maison - marteaux, scies, clous. Vous pouvez tout construire, mais vous devez connaître la construction.
- **Azure Developer CLI** est comme engager un entrepreneur - vous décrivez ce que vous voulez, et il gère la construction.

### Quand Utiliser Chaque Outil

| Scénario | Utilisez ceci |
|----------|----------|
| "Je veux déployer mon application web rapidement" | `azd up` |
| "Je dois créer juste un compte de stockage" | `az storage account create` |
| "Je construis une application AI complète" | `azd init --template azure-search-openai-demo` |
| "Je dois déboguer une ressource Azure spécifique" | `az resource show` |
| "Je veux déployer dans mon environnement de production configuré" | Vérifiez la configuration, l’accès, le coût et les contrôles opérationnels avant `azd up --environment production` |

### Ils Fonctionnent Ensemble !

AZD et Azure CLI ont une authentification et une configuration séparées. Utilisez `azd auth login` pour AZD, et `az login` quand une commande hook ou de diagnostic nécessite explicitement Azure CLI. Vous pouvez utiliser les deux :
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Trouver des Modèles dans Awesome AZD

Ne commencez pas de zéro ! **Awesome AZD** est la collection communautaire de modèles prêts à déployer :

| Ressource | Description |
|----------|-------------|
| 🔗 [**Galerie Awesome AZD**](https://azure.github.io/awesome-azd/) | Parcourez plus de 200 modèles avec déploiement en un clic |
| 🔗 [**Soumettre un Modèle**](https://github.com/Azure/awesome-azd/issues) | Contribuez votre propre modèle à la communauté |
| 🔗 [**Dépôt GitHub**](https://github.com/Azure/awesome-azd) | Ajoutez une étoile et explorez la source |

### Modèles AI Populaires d’Awesome AZD

Choisissez un modèle dans son propre répertoire vide ; les commandes ci-dessous sont des alternatives. Le `.` final initialise ce répertoire.

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo .

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart .

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents .
```

---

## 🎯 Commencer en 3 Étapes

Avant de commencer, assurez-vous que votre machine est prête pour le modèle que vous souhaitez déployer :

**Windows :**
```powershell
.\validate-setup.ps1
```

**macOS / Linux :**
```bash
bash ./validate-setup.sh
```

Si un contrôle obligatoire échoue, corrigez-le d’abord puis continuez avec le démarrage rapide.

### Étape 1 : Installer AZD (2 minutes)

**Windows :**
```powershell
winget install microsoft.azd
```

**macOS :**
```bash
brew tap azure/azd && brew install azd
```

**Linux :**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Étape 2 : Authentifiez-vous pour AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Si vous ne savez pas lequel choisir, suivez le flux complet d’installation dans [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Étape 3 : Déployez votre première application

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo .

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Voilà !** Votre application est maintenant en ligne sur Azure.

### Nettoyage (N’Oubliez Pas !)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Comment Utiliser Ce Cours

Ce cours est conçu pour un **apprentissage progressif** - commencez là où vous êtes à l’aise et progressez :

| Votre Expérience | Commencez Ici |
|-----------------|------------|
| **Tout nouveau chez Azure** | [Chapitre 1 : Fondations](#-chapter-1-foundation--quick-start) |
| **Connaissez Azure, nouveau avec AZD** | [Chapitre 1 : Fondations](#-chapter-1-foundation--quick-start) |
| **Voulez déployer des applis AI** | [Chapitre 2 : Développement AI Prioritaire](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Voulez pratiquer activement** | [🎓 Atelier Interactif](workshop/README.md) - labo guidé de 3-4 heures |
| **Besoin de modèles pour la production** | [Chapitre 8 : Production & Entreprise](#-chapter-8-production--enterprise-patterns) |

### Installation Rapide

1. **Forkez Ce Dépôt** : [![Forks GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonez-le** : `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtenez de l’aide** : [Communauté Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Préférez-vous Cloner Localement ?**

> Ce dépôt inclut plus de 50 traductions de langues ce qui augmente significativement la taille de téléchargement. Pour cloner sans les traductions, utilisez le checkout éparse :
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Cela vous donne tout ce dont vous avez besoin pour terminer le cours avec un téléchargement beaucoup plus rapide.


## Aperçu du cours

Maîtrisez Azure Developer CLI (azd) à travers des chapitres structurés conçus pour un apprentissage progressif. **Focus spécial sur le déploiement d'applications IA avec intégration Microsoft Foundry.**

### Pourquoi ce cours est essentiel pour les développeurs modernes

Les développeurs déployant des charges de travail IA ont souvent besoin de conseils sur :
- Architectures IA complexes multi-services
- Meilleures pratiques de déploiement IA en production  
- Intégration et configuration des services IA Azure
- Optimisation des coûts pour les charges de travail IA
- Résolution des problèmes spécifiques au déploiement IA

### Objectifs d'apprentissage

En suivant ce cours structuré, vous allez :
- **Maîtriser les fondamentaux AZD** : Concepts clés, installation et configuration
- **Déployer des applications IA** : Utiliser AZD avec les services Microsoft Foundry
- **Implémenter l'infrastructure en tant que code** : Gérer les ressources Azure avec des templates Bicep
- **Dépanner les déploiements** : Résoudre les problèmes courants et déboguer
- **Optimiser pour la production** : Sécurité, mise à l'échelle, surveillance et gestion des coûts
- **Construire des solutions multi-agents** : Déployer des architectures IA complexes

## Avant de commencer : Comptes, accès et hypothèses

Avant de commencer le Chapitre 1, assurez-vous d'avoir les éléments suivants en place. Les étapes d'installation plus tard dans ce guide supposent que les bases sont déjà gérées.

- **Un abonnement Azure** : Vous pouvez utiliser un abonnement existant de votre travail ou personnel, ou créer un [essai gratuit](https://aka.ms/azurefreetrial) pour commencer.
- **Permission de créer des ressources Azure** : Pour la plupart des exercices, vous devriez avoir au moins un accès **Contributeur** sur l'abonnement ou le groupe de ressources cible. Certains chapitres peuvent aussi supposer que vous pouvez créer des groupes de ressources, identités gérées et affectations RBAC.
- [**Un compte GitHub**](https://github.com) : Utile pour forker le dépôt, suivre vos propres modifications et utiliser GitHub Codespaces pour l'atelier.
- **Prérequis d'exécution des templates** : Certains templates nécessitent des outils locaux comme Node.js, Python, Java ou Docker. Lancez le validateur d'installation avant de commencer pour détecter tôt tout outil manquant.
- **Familiarité basique avec le terminal** : Vous n'avez pas besoin d'être expert, mais vous devriez être à l'aise pour exécuter des commandes telles que `git clone`, `azd auth login`, et `azd up`.

> **Travaillez-vous dans un abonnement d'entreprise ?**
> Si votre environnement Azure est géré par un administrateur, confirmez à l'avance que vous pouvez déployer des ressources dans l'abonnement ou groupe de ressources que vous comptez utiliser. Sinon, demandez un abonnement bac à sable ou un accès Contributeur avant de commencer.

> **Nouveau sur Azure ?**
> Commencez avec votre propre abonnement d'essai Azure ou pay-as-you-go sur https://aka.ms/azurefreetrial pour pouvoir réaliser les exercices de bout en bout sans attendre des validations au niveau du tenant.

## 🗺️ Plan du cours : Navigation rapide par chapitre

Chaque chapitre dispose d'un README dédié avec objectifs d'apprentissage, démarrages rapides et exercices :

| Chapitre | Sujet | Leçons | Durée | Complexité |
|---------|-------|---------|----------|------------|
| **[Ch 1 : Fondations](docs/chapter-01-foundation/README.md)** | Premiers pas | [Bases AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Premier projet](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2 : Développement IA](docs/chapter-02-ai-development/README.md)** | Applications IA priorisées | [Intégration Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agents IA](docs/chapter-02-ai-development/agents.md) &#124; [Déploiement de modèles](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Atelier](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 heures | ⭐⭐ |
| **[Ch 3 : Configuration](docs/chapter-03-configuration/README.md)** | Authentification & Sécurité | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Sécurité](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4 : Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Déploiement | [Guide de déploiement](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 heures | ⭐⭐⭐ |
| **[Ch 5 : Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Solutions Agents IA | [Scénario retail](examples/retail-scenario.md) &#124; [Patterns de coordination](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 heures | ⭐⭐⭐⭐ |
| **[Ch 6 : Pré-déploiement](docs/chapter-06-pre-deployment/README.md)** | Planification & Validation | [Vérifications pré-vol](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planification de capacité](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Sélection SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 heure | ⭐⭐ |
| **[Ch 7 : Dépannage](docs/chapter-07-troubleshooting/README.md)** | Débogage & Correction | [Problèmes courants](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Débogage](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problèmes IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 heures | ⭐⭐ |
| **[Ch 8 : Production](docs/chapter-08-production/README.md)** | Patterns entreprise | [Pratiques de Production](docs/chapter-08-production/production-ai-practices.md) | 2-3 heures | ⭐⭐⭐⭐ |
| **[🎓 Atelier](workshop/README.md)** | Laboratoire pratique | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Sélection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Déconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personnalisation](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Démontage](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Conclusion](workshop/docs/instructions/7-Wrap-up.md) | 3-4 heures | ⭐⭐ |

**Durée totale du cours:** ~10-14 heures | **Progression des compétences:** Débutant → Prêt pour la production

---

## 📚 Chapitres d'apprentissage

*Sélectionnez votre parcours d'apprentissage selon votre niveau d'expérience et vos objectifs*

### 🚀 Chapitre 1 : Fondations & Démarrage rapide
**Prérequis** : Abonnement Azure, connaissances basiques en ligne de commande  
**Durée** : 30-45 minutes  
**Complexité** : ⭐

#### Ce que vous apprendrez
- Comprendre les fondamentaux d'Azure Developer CLI
- Installer AZD sur votre plateforme
- Votre premier déploiement réussi

#### Ressources d'apprentissage
- **🎯 Commencez ici** : [Qu'est-ce qu'Azure Developer CLI ?](#-what-is-azure-developer-cli-azd)
- **📖 Théorie** : [Bases AZD](docs/chapter-01-foundation/azd-basics.md) - Concepts clés et terminologie
- **⚙️ Installation** : [Installation & Configuration](docs/chapter-01-foundation/installation.md) - Guides spécifiques à la plateforme
- **🛠️ Pratique** : [Votre premier projet](docs/chapter-01-foundation/first-project.md) - Tutoriel pas à pas
- **📋 Référence rapide** : [Fiche de commande](resources/cheat-sheet.md)

#### Exercices pratiques
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo .
azd up
```

**💡 Objectif du chapitre** : Déployer avec succès une simple application web sur Azure en utilisant AZD

**✅ Critères de réussite :**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Temps d'investissement :** 30-45 minutes  
**📈 Niveau de compétence après :** Capable de déployer des applications basiques de manière autonome

---

### 🤖 Chapitre 2 : Développement IA priorisé (Recommandé pour développeurs IA)
**Prérequis** : Chapitre 1 terminé  
**Durée** : 1-2 heures  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Intégration Microsoft Foundry avec AZD
- Déployer des applications alimentées par IA
- Comprendre les configurations des services IA

#### Ressources d'apprentissage
- **🎯 Commencez ici** : [Intégration Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agents IA** : [Guide des agents IA](docs/chapter-02-ai-development/agents.md) - Déployer des agents intelligents avec AZD
- **📖 Modèles** : [Déploiement de modèles IA](docs/chapter-02-ai-development/ai-model-deployment.md) - Déployer et gérer des modèles IA
- **🛠️ Atelier** : [Atelier IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Préparez vos solutions IA avec AZD
- **🎥 Guide interactif** : [Matériel de l'atelier](workshop/README.md) - Apprentissage dans le navigateur avec MkDocs * Environnement DevContainer
- **📋 Templates** : [Templates Microsoft Foundry](#featured-microsoft-foundry-templates)
- **📝 Exemples** : [Exemples de déploiement AZD](examples/README.md)

#### Exercices pratiques
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo .
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart .
azd init --template agent-openai-python-prompty .
```

**💡 Objectif du chapitre** : Déployer et configurer une application de chat alimentée par IA avec capacités RAG

**✅ Critères de réussite :**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo .
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 Temps d'investissement :** 1-2 heures  
**📈 Niveau de compétence après :** Capable de déployer des applications d'apprentissage IA et détecter des besoins additionnels pour la production
**💰 Sensibilisation aux coûts :** Comprendre les coûts de 80-150 $/mois en dev, 300-3500 $/mois en production

#### 💰 Considérations sur les coûts pour les déploiements IA

**Environnement de développement (estimé à 80-150 $/mois) :**
- Modèles Microsoft Foundry (Paiement à l'usage) : 0-50 $/mois (selon l'utilisation des tokens)
- Recherche IA (niveau basique) : 75 $/mois
- Container Apps (consommation) : 0-20 $/mois
- Stockage (standard) : 1-5 $/mois

**Environnement de production (estimé à 300-3 500+ $/mois) :**
- Modèles Microsoft Foundry (PTU pour performance constante) : 3 000+ $/mois OU Paiement à l'usage avec volume élevé
- Recherche IA (niveau standard) : 250 $/mois
- Container Apps (dédié) : 50-100 $/mois
- Application Insights : 5-50 $/mois
- Stockage (premium) : 10-50 $/mois

**💡 Conseils d'optimisation des coûts :**
- Vérifiez les tarifs d'inférence modèle et les crédits spécifiques au compte ; Azure OpenAI ne comprend pas une allocation mensuelle universelle gratuite de 50 000 tokens
- Exécutez `azd down` pour supprimer les ressources quand elles ne sont plus nécessaires, après avoir revu l'environnement sélectionné
- Commencez par la facturation à la consommation, passez au PTU uniquement en production
- Utilisez `azd provision --preview` pour inspecter l'infrastructure planifiée, puis estimez le coût des ressources avec le Calculateur de prix Azure
- Activez l'auto-scaling : payez uniquement pour l'utilisation réelle

**Surveillance des coûts :**
```bash
# Inspect planned resources (this does not calculate prices)
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapitre 3 : Configuration & Authentification
**Prérequis** : Chapitre 1 terminé  
**Durée** : 45-60 minutes  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Configuration et gestion des environnements
- Meilleures pratiques d'authentification et de sécurité
- Nomination et organisation des ressources

#### Ressources d'apprentissage
- **📖 Configuration** : [Guide de configuration](docs/chapter-03-configuration/configuration.md) - Mise en place de l'environnement
- **🔐 Sécurité** : [Patterns d'authentification et identité gérée](docs/chapter-03-configuration/authsecurity.md) - Modèles d'authentification
- **📝 Exemples** : [Exemple d'application base de données](examples/database-app/README.md) - Exemples AZD base de données

#### Exercices pratiques
- Configurer plusieurs environnements (dev, staging, prod)
- Mise en place de l'authentification par identité gérée
- Implémenter des configurations spécifiques pour chaque environnement

**💡 Objectif du chapitre** : Gérer plusieurs environnements avec une authentification et une sécurité adaptées

---

### 🏗️ Chapitre 4 : Infrastructure en tant que Code & Déploiement
**Prérequis** : Chapitres 1-3 terminés  
**Durée** : 1-1,5 heures  
**Complexité** : ⭐⭐⭐

#### Ce que vous apprendrez
- Patterns avancés de déploiement
- Infrastructure en tant que code avec Bicep
- Stratégies de provisioning des ressources

#### Ressources d'apprentissage
- **📖 Déploiement** : [Guide de déploiement](docs/chapter-04-infrastructure/deployment-guide.md) - Flux de travail complets
- **🏗️ Provisioning** : [Provisionnement des ressources](docs/chapter-04-infrastructure/provisioning.md) - Gestion des ressources Azure
- **📝 Exemples** : [Exemple d'application containerisée](../../examples/container-app) - Déploiements conteneurisés

#### Exercices pratiques
- Créez des templates Bicep personnalisés
- Déployez des applications multi-services
- Implémentez des stratégies de déploiement blue-green

**💡 Objectif du chapitre** : Déployer des applications complexes multi-services avec des templates d'infrastructure personnalisés

---

### 🎯 Chapitre 5 : Solutions IA multi-agents (Avancé)
**Prérequis** : Chapitres 1-2 terminés  
**Durée** : 2-3 heures  
**Complexité** : ⭐⭐⭐⭐

#### Ce que vous apprendrez
- Patterns d'architecture multi-agent
- Orchestration et coordination des agents
- Déploiements IA prêts pour la production

#### Ressources d'apprentissage
- **🤖 Design mis en avant** : [Solution Multi-Agent Retail](examples/retail-scenario.md) - Plan d'architecture, pas une application complète
- **🛠️ Modèles ARM** : [Package de modèle ARM](../../examples/retail-multiagent-arm-template) - Échafaudage d'infrastructure ; revoir les prérequis et composants applicatifs manquants
- **📖 Architecture** : [Modèles de coordination multi-agents](docs/chapter-06-pre-deployment/coordination-patterns.md) - Modèles

#### Exercices pratiques
```bash
# Inspect the retail infrastructure scaffold before choosing to deploy it
cd examples/retail-multiagent-arm-template
cat README.md

# After an intentional deployment, inspect infrastructure state
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Résultat du chapitre** : Comprendre la conception multi-agent et identifier le travail d’implémentation, de validation et d’exploitation nécessaire au-delà d’un échafaudage d’infrastructure

---

### 🔍 Chapitre 6 : Validation et planification avant déploiement
**Prérequis** : Chapitre 4 terminé  
**Durée** : 1 heure  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Planification de capacité et validation des ressources
- Stratégies de sélection des SKU
- Vérifications préliminaires et automatisation

#### Ressources d’apprentissage
- **📊 Planification** : [Planification de capacité](docs/chapter-06-pre-deployment/capacity-planning.md) - Validation des ressources
- **💰 Sélection** : [Sélection de SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Choix économiques
- **✅ Validation** : [Vérifications préalables](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatisés

#### Exercices pratiques
- Exécuter les scripts de validation de capacité
- Optimiser la sélection des SKU pour le coût
- Implémenter des vérifications automatisées avant déploiement

**💡 Résultat du chapitre** : Valider et optimiser les déploiements avant exécution

---

### 🚨 Chapitre 7 : Dépannage et débogage
**Prérequis** : Chapitre de déploiement quelconque terminé  
**Durée** : 1 à 1,5 heure  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Approches systématiques de débogage
- Problèmes courants et solutions
- Dépannage spécifique à l’IA

#### Ressources d’apprentissage
- **🔧 Problèmes courants** : [Problèmes courants](docs/chapter-07-troubleshooting/common-issues.md) - FAQ et solutions
- **🕵️ Débogage** : [Guide de débogage](docs/chapter-07-troubleshooting/debugging.md) - Stratégies étape par étape
- **🤖 Problèmes IA** : [Dépannage spécifique à l’IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problèmes des services IA

#### Exercices pratiques
- Diagnostiquer les échecs de déploiement
- Résoudre les problèmes d’authentification
- Déboguer la connectivité des services IA

**💡 Résultat du chapitre** : Diagnostiquer et résoudre de manière autonome les problèmes courants de déploiement

---

### 🏢 Chapitre 8 : Modèles de production et d’entreprise
**Prérequis** : Chapitres 1–4 terminés  
**Durée** : 2 à 3 heures  
**Complexité** : ⭐⭐⭐⭐

#### Ce que vous apprendrez
- Stratégies de déploiement en production
- Modèles de sécurité d’entreprise
- Surveillance et optimisation des coûts

#### Ressources d’apprentissage
- **🏭 Production** : [Bonnes pratiques IA en production](docs/chapter-08-production/production-ai-practices.md) - Modèles d’entreprise
- **📝 Exemples** : [Exemple de microservices](../../examples/microservices) - Architectures complexes
- **📊 Surveillance** : [Intégration Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Surveillance

#### Exercices pratiques
- Implémenter des modèles de sécurité d’entreprise
- Mettre en place une surveillance complète
- Déployer en production avec une gouvernance adaptée

**💡 Résultat du chapitre** : Déployer des applications prêtes pour l’entreprise avec toutes les capacités de production

---

## 🎓 Aperçu de l’atelier : Expérience d’apprentissage pratique

> **⚠️ STATUT DE L’ATELIER : Développement actif**  
> Les matériaux de l’atelier sont en cours de développement et d’affinement. Les modules principaux sont fonctionnels, mais certaines sections avancées sont incomplètes. Nous travaillons activement à la complétion de tout le contenu. [Suivez les progrès →](workshop/README.md)

### Matériaux interactifs de l’atelier
**Apprentissage pratique complet avec outils basés sur navigateur et exercices guidés**

Nos matériaux d’atelier offrent une expérience d’apprentissage structurée et interactive qui complète le programme par chapitres ci-dessus. L’atelier est conçu pour l’apprentissage autonome comme pour les sessions dirigées par un instructeur.

#### 🛠️ Caractéristiques de l’atelier
- **Interface basée sur navigateur** : Atelier complet propulsé par MkDocs avec recherche, copie et fonctionnalités de thème
- **Intégration GitHub Codespaces** : Mise en place d’environnement de développement en un clic
- **Parcours d’apprentissage structuré** : 8 modules d’exercices guidés (3 à 4 heures au total)
- **Méthodologie progressive** : Introduction → Sélection → Validation → Déconstruction → Configuration → Personnalisation → Démontage → Conclusion
- **Environnement DevContainer interactif** : Outils et dépendances préconfigurés

#### 📚 Structure du module d’atelier
L’atelier suit une **méthodologie progressive en 8 modules** qui vous emmène de la découverte à la maîtrise du déploiement :

| Module | Sujet | Ce que vous ferez | Durée |
|--------|-------|------------------|--------|
| **0. Introduction** | Aperçu de l’atelier | Comprendre les objectifs d’apprentissage, les prérequis et la structure de l’atelier | 15 min |
| **1. Sélection** | Découverte de modèles | Explorer les modèles AZD et sélectionner le modèle IA adapté à votre scénario | 20 min |
| **2. Validation** | Déployer & vérifier | Déployer le modèle avec `azd up` et valider l’infrastructure | 30 min |
| **3. Déconstruction** | Comprendre la structure | Utiliser GitHub Copilot pour explorer l’architecture du modèle, les fichiers Bicep et l’organisation du code | 30 min |
| **4. Configuration** | Exploration approfondie de azure.yaml | Maîtriser la configuration `azure.yaml`, les hooks de cycle de vie et les variables d’environnement | 30 min |
| **5. Personnalisation** | Faites-le vôtre | Activer la recherche IA, le traçage, l’évaluation, et personnaliser pour votre scénario | 45 min |
| **6. Démontage** | Nettoyer | Déprovisionner en toute sécurité les ressources avec `azd down --purge` | 15 min |
| **7. Conclusion** | Prochaines étapes | Revoir les accomplissements, concepts clés, et poursuivre votre parcours d’apprentissage | 15 min |

**Déroulement de l’atelier :**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Démarrer l’atelier
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Résultats d’apprentissage de l’atelier
En complétant l’atelier, les participants seront capables de :
- **Déployer des applications IA en production** : Utiliser AZD avec les services Microsoft Foundry
- **Maîtriser les architectures multi-agents** : Implémenter des solutions de coordination d’agents IA
- **Mettre en œuvre les meilleures pratiques de sécurité** : Configurer l’authentification et le contrôle d’accès
- **Optimiser à l’échelle** : Concevoir des déploiements performants et économiques
- **Résoudre les problèmes de déploiement** : Corriger de manière autonome les problèmes courants

#### 📖 Ressources de l’atelier
- **🎥 Guide interactif** : [Matériaux de l’atelier](workshop/README.md) - Environnement d’apprentissage basé sur navigateur
- **📋 Instructions module par module** :
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Aperçu et objectifs de l’atelier
  - [1. Sélection](workshop/docs/instructions/1-Select-AI-Template.md) - Trouver et sélectionner des modèles IA
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Déployer et vérifier des modèles
  - [3. Déconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorer l’architecture du modèle
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Maîtriser azure.yaml
  - [5. Personnalisation](workshop/docs/instructions/5-Customize-AI-Template.md) - Personnaliser pour votre scénario
  - [6. Démontage](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Nettoyer les ressources
  - [7. Conclusion](workshop/docs/instructions/7-Wrap-up.md) - Révision et prochaines étapes
- **🛠️ Laboratoire d’atelier IA** : [Laboratoire d’atelier IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exercices centrés sur l’IA
- **💡 Démarrage rapide** : [Guide d’installation de l’atelier](workshop/README.md#browser-based-guide) - Configuration de l’environnement

**Parfait pour** : Formations en entreprise, cours universitaires, apprentissage autonome, et bootcamps développeurs.

---

## 📖 Approfondissement : Capacités AZD

Au-delà des bases, AZD fournit des fonctionnalités puissantes pour les déploiements en production :

- **Déploiements basés sur des modèles** - Utilisez des modèles préconstruits pour des schémas d’application courants
- **Infrastructure as Code** - Gérer les ressources Azure avec Bicep ou Terraform  
- **Flux de travail intégrés** - Provisionnez, déployez et surveillez vos applications sans interruption
- **Conçu pour les développeurs** - Optimisé pour la productivité et l'expérience des développeurs

### **AZD + Microsoft Foundry : Parfait pour les déploiements IA**

**Pourquoi AZD pour les solutions IA ?** AZD répond aux principaux défis rencontrés par les développeurs IA :

- **Modèles prêts pour l’IA** - Modèles préconfigurés pour Microsoft Foundry Models, services IA Azure et charges de travail ML
- **Déploiements IA sécurisés** - Modèles de sécurité intégrés pour services IA, clés API et points de terminaison de modèles  
- **Modèles IA en production** - Bonnes pratiques pour des déploiements IA scalables et économiques
- **Flux de travail IA de bout en bout** - Du développement du modèle au déploiement en production avec surveillance adaptée
- **Optimisation des coûts** - Allocation intelligente des ressources et stratégies de montée en charge pour charges IA
- **Intégration Microsoft Foundry** - Connexion fluide au catalogue et aux points de terminaison des modèles Foundry

---

## 🎯 Bibliothèque de modèles et exemples

### En vedette : Modèles Microsoft Foundry
**Commencez ici si vous déployez des applications IA !**

> **Note :** Ces modèles illustrent divers schémas IA. Certains sont des exemples Azure externes, d’autres des implémentations locales.

| Modèle | Chapitre | Complexité | Services | Type |
|----------|---------|------------|----------|------|
| [**Démarrage avec le chat IA**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapitre 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externe |
| [**Démarrage avec agents IA**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapitre 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Externe |
| [**Démonstration Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapitre 2 | ⭐⭐ | Azure OpenAI + Azure AI Search + Container Apps (par défaut) + Stockage | Externe |
| [**Démarrage rapide OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapitre 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externe |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapitre 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externe |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapitre 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externe |
| [**Solution multi-agent retail**](examples/retail-scenario.md) | Chapitre 5 | ⭐⭐⭐⭐ | Architecture proposée et échafaudage d’infrastructure ; implémentation applicative requise | **Plan local** |

### En vedette : Scénarios d’apprentissage complets
**Modèles d’application prêts pour la production mappés aux chapitres d’apprentissage**

| Modèle | Chapitre d’apprentissage | Complexité | Apprentissage clé |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapitre 2 | ⭐ | Modèles de déploiement IA de base |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapitre 2 | ⭐⭐ | Implémentation RAG avec Azure AI Search |
| [**get-started-with-ai-agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapitre 2 | ⭐⭐ | Chat basé agents et tests d’évaluation spécifiques |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapitre 5 | ⭐⭐⭐ | Framework agent et appels de fonction |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapitre 8 | ⭐⭐⭐ | Orchestration IA d’entreprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapitre 5 | ⭐⭐⭐⭐ | Architecture multi-agent avec agents Client et Inventaire |

### Apprentissage par type d’exemple

> **📌 Exemples locaux vs externes :**  
> **Exemples locaux** (dans ce dépôt) = Consultez le README de l’exemple pour l’état d’implémentation et les prérequis
> **Exemples externes** (Exemples Azure) = Clonez depuis les dépôts liés

#### Exemples locaux (prêts à l’emploi)
- [**Solution multi-agent retail**](examples/retail-scenario.md) - Plan d’architecture avec échafaudage ARM d’infrastructure
  - Rôles proposés pour agents Client et Inventaire
  - Surveillance, évaluation et code applicatif doivent être implémentés et vérifiés
  - La simple provision de ressources ne produit pas une application retail fonctionnelle

#### Exemples locaux - Applications conteneurisées (Chapitres 2-5)
**Exemples complets de déploiements conteneurisés dans ce dépôt :**
- [**Exemples d’applications conteneurisées**](examples/container-app/README.md) - Guide complet des déploiements conteneurisés
  - [API Flask simple](../../examples/container-app/simple-flask-api) - API REST de base avec mise à l’échelle à zéro
  - [Architecture microservices](../../examples/container-app/microservices) - Exemple d’apprentissage à deux services ; sécurisation en production est un travail supplémentaire
  - Modèles de déploiement démarrage rapide, production et avancés
  - Conseils de surveillance, sécurité et optimisation des coûts

#### Exemples externes - Applications simples (Chapitres 1-2)
**Clonez ces dépôts Exemples Azure pour démarrer :**
- [Application web simple - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Modèles de déploiement basiques
- [Site statique - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Déploiement de contenu statique
- [Application conteneurisée - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Déploiement API REST

#### Exemples externes - Intégration base de données (Chapitres 3-4)  
- [Application Base de Données - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Modèles de connectivité à la base de données
- [Fonctions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flux de travail de données sans serveur

#### Exemples Externes - Modèles Avancés (Chapitres 4-8)
- [Microservices Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architectures multi-services
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Traitement en arrière-plan  
- [Pipeline Enterprise ML](https://github.com/Azure/mlops-v2) - Modèles de référence MLOps ; pas un modèle AZD prêt à l'emploi

### Collections de Modèles Externes
- [**Galerie Officielle de Modèles AZD**](https://azure.github.io/awesome-azd/) - Collection sélectionnée de modèles officiels et communautaires
- [**Modèles CLI Développeur Azure**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentation des modèles Microsoft Learn
- [**Répertoire d'Exemples**](examples/README.md) - Exemples locaux d'apprentissage avec explications détaillées

---

## 📚 Ressources d'Apprentissage & Références

### Références Rapides
- [**Fiche de Commandes**](resources/cheat-sheet.md) - Commandes azd essentielles organisées par chapitre
- [**Glossaire**](resources/glossary.md) - Terminologie Azure et azd  
- [**FAQ**](resources/faq.md) - Questions fréquentes organisées par chapitre d'apprentissage
- [**Guide d'Étude**](resources/study-guide.md) - Exercices pratiques complets

### Ateliers Pratiques
- [**Atelier AI**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendez vos solutions IA déployables avec AZD (2-3 heures)
- [**Atelier Interactif**](workshop/README.md) - Exercices guidés en 8 modules avec MkDocs et GitHub Codespaces
  - Suit : Introduction → Sélection → Validation → Déconstruction → Configuration → Personnalisation → Démontage → Conclusion

### Ressources d'Apprentissage Externes
- [Documentation Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centre d'Architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculateur de Prix Azure](https://azure.microsoft.com/pricing/calculator/)
- [Statut Azure](https://status.azure.com/)

### Compétences Agents IA pour Votre Éditeur
- [**Compétences Microsoft Azure sur skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 compétences d'agents ouvertes pour Azure AI, Foundry, déploiement, diagnostics, optimisation des coûts, et plus encore. Installez-les dans GitHub Copilot, Cursor, Claude Code, ou tout agent pris en charge :
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guide Rapide de Dépannage

**Problèmes courants rencontrés par les débutants et solutions immédiates :**

<details>
<summary><strong>❌ "azd : commande introuvable"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "Aucun abonnement trouvé" ou "Abonnement non défini"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "Quota insuffisant" ou "Quota dépassé"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" échoue en cours d'exécution</strong></summary>

```bash
# Option 1: Inspect the error and retry after correcting its cause
azd show
azd up --debug

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Échec d'authentification" ou "Jeton expiré"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "La ressource existe déjà" ou conflits de nommage</strong></summary>

```bash
# Inspect the conflicting resource before changing or deleting anything.
# For an isolated new deployment, create a separate environment:
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Le déploiement du modèle prend trop de temps</strong></summary>

**Temps d'attente normaux :**
- Application web simple : 5-10 minutes
- Application avec base de données : 10-15 minutes
- Applications IA : 15-25 minutes (le provisionnement OpenAI est lent)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Permission refusée" ou "Interdit"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Impossible de trouver l'URL de l'application déployée</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Ressources Complètes de Dépannage

- **Guide des Problèmes Courants :** [Solutions Détaillées](docs/chapter-07-troubleshooting/common-issues.md)
- **Problèmes Spécifiques à l'IA :** [Dépannage IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guide de Débogage :** [Débogage pas à pas](docs/chapter-07-troubleshooting/debugging.md)
- **Obtenez de l'Aide :** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Achèvement du Cours & Certification

### Suivi de Progression
Suivez votre progression à travers chaque chapitre :

- [ ] **Chapitre 1** : Fondations & Démarrage Rapide ✅
- [ ] **Chapitre 2** : Développement axé IA ✅  
- [ ] **Chapitre 3** : Configuration & Authentification ✅
- [ ] **Chapitre 4** : Infrastructure as Code & Déploiement ✅
- [ ] **Chapitre 5** : Solutions Multi-Agents IA ✅
- [ ] **Chapitre 6** : Validation & Planification avant Déploiement ✅
- [ ] **Chapitre 7** : Dépannage & Débogage ✅
- [ ] **Chapitre 8** : Modèles de Production & d'Entreprise ✅

### Vérification des Acquis
Après chaque chapitre, vérifiez vos connaissances par :
1. **Exercice Pratique** : Terminer le déploiement pratique du chapitre
2. **Contrôle des Connaissances** : Réviser la section FAQ du chapitre
3. **Discussion Communautaire** : Partagez votre expérience sur Discord Azure
4. **Chapitre Suivant** : Passez au niveau de complexité suivant

### Avantages de l'Achèvement du Cours
Une fois tous les chapitres terminés, vous aurez :
- **Expérience en Production** : Déployé de vraies applications IA sur Azure
- **Compétences Professionnelles** : Capacités de déploiement prêtes pour l'entreprise  
- **Reconnaissance Communautaire** : Membre actif de la communauté développeur Azure
- **Avancement de Carrière** : Expertise AZD et IA très recherchée

---

## 🤝 Communauté & Support

### Obtenir de l'Aide & du Support
- **Problèmes Techniques** : [Signaler des bugs et demander des fonctionnalités](https://github.com/microsoft/azd-for-beginners/issues)
- **Questions d'Apprentissage** : [Communauté Microsoft Azure Discord](https://discord.gg/microsoft-azure) et [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Aide Spécifique IA** : Rejoignez le [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation** : [Documentation officielle Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insights Communautaires depuis Microsoft Foundry Discord

**Sujets discutés par la communauté :**
- Déploiements multi-services, gestion des identifiants, et préparation à la production
- Modèles spécifiques à l'IA, guides de dépannage, et meilleures pratiques

**Rejoignez notre communauté pour :**
- Partager vos expériences AZD + IA et obtenir de l'aide
- Accéder aux aperçus anticipés des nouveaux modèles IA
- Contribuer aux meilleures pratiques de déploiement IA
- Influencer le développement futur des fonctionnalités IA + AZD

### Contribution au Cours
Vos contributions sont les bienvenues ! Merci de lire notre [Guide de Contribution](CONTRIBUTING.md) pour les détails sur :
- **Amélioration du Contenu** : Améliorer les chapitres et exemples existants
- **Nouveaux Exemples** : Ajouter des scénarios et modèles du monde réel  
- **Traduction** : Aider à maintenir le support multilingue
- **Rapports de Bugs** : Améliorer la précision et la clarté
- **Standards Communautaires** : Respecter nos directives communautaires inclusives

---

## 📄 Informations sur le Cours

### Licence
Ce projet est sous licence MIT - voir le fichier [LICENSE](../../LICENSE) pour plus de détails.

### Ressources Microsoft Learning Associées

Notre équipe produit d'autres cours d'apprentissage complets :

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j pour Débutants](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js pour Débutants](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain pour Débutants](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD pour Débutants](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI pour Débutants](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP pour Débutants](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Agents IA pour Débutants](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série IA Générative
[![IA Générative pour Débutants](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![IA Générative (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![IA Générative (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![IA Générative (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Apprentissage Fondamental
[![ML pour Débutants](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science pour Débutants](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![IA pour Débutants](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersécurité pour Débutants](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Développement Web pour Débutants](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pour Débutants](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Développement XR pour Débutants](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot pour Programmation Assistée IA](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pour C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventure Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigation du Cours

**🚀 Prêt à commencer à apprendre ?**

**Débutants** : Commencez avec [Chapitre 1 : Fondations & Démarrage Rapide](#-chapter-1-foundation--quick-start)  
**Développeurs IA** : Passez à [Chapitre 2 : Développement axé IA](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Développeurs expérimentés** : Commencez par [Chapitre 3 : Configuration & Authentification](#️-chapter-3-configuration--authentication)

**Étapes suivantes** : [Commencer Chapitre 1 - Bases AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->