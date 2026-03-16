# AZD pour débutants : un parcours d'apprentissage structuré

![AZD-pour-débutants](../../translated_images/fr/azdbeginners.5527441dd9f74068.webp) 

[![Observateurs GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forks GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Étoiles GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traductions automatisées (toujours à jour)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabe](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgare](../bg/README.md) | [Birman (Myanmar)](../my/README.md) | [Chinois (simplifié)](../zh-CN/README.md) | [Chinois (traditionnel, Hong Kong)](../zh-HK/README.md) | [Chinois (traditionnel, Macao)](../zh-MO/README.md) | [Chinois (traditionnel, Taïwan)](../zh-TW/README.md) | [Croate](../hr/README.md) | [Tchèque](../cs/README.md) | [Danois](../da/README.md) | [Néerlandais](../nl/README.md) | [Estonien](../et/README.md) | [Finnois](../fi/README.md) | [Français](./README.md) | [Allemand](../de/README.md) | [Grec](../el/README.md) | [Hébreu](../he/README.md) | [Hindi](../hi/README.md) | [Hongrois](../hu/README.md) | [Indonésien](../id/README.md) | [Italien](../it/README.md) | [Japonais](../ja/README.md) | [Kannada](../kn/README.md) | [Coréen](../ko/README.md) | [Lituanien](../lt/README.md) | [Malais](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Népalais](../ne/README.md) | [Pidgin nigérian](../pcm/README.md) | [Norvégien](../no/README.md) | [Persan (Farsi)](../fa/README.md) | [Polonais](../pl/README.md) | [Portugais (Brésil)](../pt-BR/README.md) | [Portugais (Portugal)](../pt-PT/README.md) | [Pendjabi (Gurmukhi)](../pa/README.md) | [Roumain](../ro/README.md) | [Russe](../ru/README.md) | [Serbe (cyrillique)](../sr/README.md) | [Slovaque](../sk/README.md) | [Slovène](../sl/README.md) | [Espagnol](../es/README.md) | [Swahili](../sw/README.md) | [Suédois](../sv/README.md) | [Tagalog (philippin)](../tl/README.md) | [Tamoul](../ta/README.md) | [Télougou](../te/README.md) | [Thaï](../th/README.md) | [Turc](../tr/README.md) | [Ukrainien](../uk/README.md) | [Ourdou](../ur/README.md) | [Vietnamien](../vi/README.md)

> **Préférez cloner localement ?**
>
> Ce dépôt contient plus de 50 traductions, ce qui augmente considérablement la taille du téléchargement. Pour cloner sans les traductions, utilisez le sparse checkout :
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Cela vous donne tout ce dont vous avez besoin pour suivre le cours avec un téléchargement beaucoup plus rapide.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Quoi de neuf dans azd aujourd'hui

Azure Developer CLI a évolué au-delà des applications web et des API traditionnelles. Aujourd'hui, azd est l'outil unique pour déployer n'importe quelle application sur Azure — y compris des applications alimentées par l'IA et des agents intelligents.

Voici ce que cela signifie pour vous :

- **Les agents IA sont désormais des charges de travail azd de première classe.** Vous pouvez initialiser, déployer et gérer des projets d'agents IA en utilisant le même workflow `azd init` → `azd up` que vous connaissez déjà.
- **L'intégration Microsoft Foundry** apporte le déploiement de modèles, l'hébergement d'agents et la configuration des services IA directement dans l'écosystème de templates azd.
- **Le workflow de base n'a pas changé.** Que vous déployiez une application de type todo, un microservice ou une solution IA multi-agents, les commandes restent les mêmes.

Si vous avez déjà utilisé azd, la prise en charge de l'IA est une extension naturelle — pas un outil séparé ni une voie avancée. Si vous commencez tout juste, vous apprendrez un seul workflow qui fonctionne pour tout.

---

## 🚀 Qu'est-ce que Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** est un outil en ligne de commande convivial pour les développeurs qui facilite le déploiement d'applications sur Azure. Au lieu de créer et connecter manuellement des dizaines de ressources Azure, vous pouvez déployer des applications entières avec une seule commande.

### La magie de `azd up`

```bash
# Cette commande unique fait tout :
# ✅ Crée toutes les ressources Azure
# ✅ Configure le réseau et la sécurité
# ✅ Compile votre code applicatif
# ✅ Déploie sur Azure
# ✅ Vous fournit une URL fonctionnelle
azd up
```

**C'est tout !** Plus besoin de cliquer dans le portail Azure, pas de modèles ARM complexes à apprendre en premier, pas de configuration manuelle — juste des applications fonctionnelles sur Azure.

---

## ❓ Azure Developer CLI vs Azure CLI : quelle est la différence ?

C'est la question la plus courante posée par les débutants. Voici la réponse simple :

| Fonctionnalité | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Objectif** | Gérer des ressources Azure individuelles | Déployer des applications complètes |
| **Approche** | Axé sur l'infrastructure | Axé sur l'application |
| **Exemple** | `az webapp create --name myapp...` | `azd up` |
| **Courbe d'apprentissage** | Nécessite de connaître les services Azure | Connaître simplement votre application |
| **Idéal pour** | DevOps, Infrastructure | Développeurs, Prototypage |

### Analogie simple

- **Azure CLI** est comme avoir tous les outils pour construire une maison - marteaux, scies, clous. Vous pouvez tout construire, mais vous devez connaître la construction.
- **Azure Developer CLI** est comme engager un entrepreneur - vous décrivez ce que vous voulez, et il s'occupe de la construction.

### Quand utiliser l'un ou l'autre

| Scénario | Utiliser |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Ils fonctionnent ensemble !

AZD utilise Azure CLI en interne. Vous pouvez utiliser les deux :
```bash
# Déployez votre application avec AZD
azd up

# Puis affinez des ressources spécifiques avec Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Trouvez des modèles dans Awesome AZD

Ne partez pas de zéro ! **Awesome AZD** est la collection communautaire de modèles prêts à être déployés :

| Ressource | Description |
|----------|-------------|
| 🔗 [**Galerie Awesome AZD**](https://azure.github.io/awesome-azd/) | Parcourez plus de 200 modèles avec un déploiement en un clic |
| 🔗 [**Soumettre un modèle**](https://github.com/Azure/awesome-azd/issues) | Contribuez votre propre modèle à la communauté |
| 🔗 [**Dépôt GitHub**](https://github.com/Azure/awesome-azd) | Mettez une étoile et explorez la source |

### Modèles IA populaires d'Awesome AZD

```bash
# Chat RAG avec les modèles Microsoft Foundry + Recherche IA
azd init --template azure-search-openai-demo

# Application de chat IA rapide
azd init --template openai-chat-app-quickstart

# Agents IA avec les agents Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Démarrer en 3 étapes

### Étape 1: Installer AZD (2 minutes)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Étape 2: Se connecter à Azure

```bash
azd auth login
```

### Étape 3: Déployez votre première application

```bash
# Initialiser à partir d'un modèle
azd init --template todo-nodejs-mongo

# Déployer sur Azure (crée tout !)
azd up
```

**🎉 C'est tout !** Votre application est maintenant en ligne sur Azure.

### Nettoyage (n'oubliez pas !)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Comment utiliser ce cours

Ce cours est conçu pour un **apprentissage progressif** - commencez là où vous êtes à l'aise et progressez :

| Votre expérience | Commencez ici |
|-----------------|------------|
| **Tout nouveau sur Azure** | [Chapitre 1 : Fondations](../..) |
| **Vous connaissez Azure, nouveau sur AZD** | [Chapitre 1 : Fondations](../..) |
| **Souhaitez déployer des applications d'IA** | [Chapitre 2 : Développement axé IA](../..) |
| **Envie de mise en pratique** | [🎓 Atelier interactif](workshop/README.md) - labo guidé de 3-4 heures |
| **Besoin de modèles de production** | [Chapitre 8 : Production et entreprise](../..) |

### Configuration rapide

1. **Forkez ce dépôt**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonez-le**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtenez de l'aide**: [Communauté Discord Azure](https://discord.com/invite/ByRwuEEgH4)

> **Préférez cloner localement ?**
>
> Ce dépôt contient plus de 50 traductions, ce qui augmente considérablement la taille du téléchargement. Pour cloner sans les traductions, utilisez le sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Cela vous donne tout ce dont vous avez besoin pour suivre le cours avec un téléchargement beaucoup plus rapide.


## Aperçu du cours

Maîtrisez Azure Developer CLI (azd) à travers des chapitres structurés conçus pour un apprentissage progressif. **Focus spécial sur le déploiement d'applications IA avec l'intégration Microsoft Foundry.**

### Pourquoi ce cours est essentiel pour les développeurs modernes

D'après la communauté Discord Microsoft Foundry, **45 % des développeurs souhaitent utiliser AZD pour des charges de travail IA** mais rencontrent des difficultés avec :
- Des architectures IA multi-services complexes
- Les meilleures pratiques de déploiement IA en production  
- L'intégration et la configuration des services IA Azure
- L'optimisation des coûts pour les charges de travail IA
- Le dépannage des problèmes de déploiement spécifiques à l'IA

### Objectifs d'apprentissage

En complétant ce cours structuré, vous allez :
- **Maîtriser les fondamentaux d'AZD** : concepts de base, installation et configuration
- **Déployer des applications IA** : utiliser AZD avec les services Microsoft Foundry
- **Implémenter l'infrastructure en tant que code** : gérer les ressources Azure avec des modèles Bicep
- **Dépanner les déploiements** : résoudre les problèmes courants et déboguer
- **Optimiser pour la production** : sécurité, mise à l'échelle, surveillance et gestion des coûts
- **Construire des solutions multi‑agents** : déployer des architectures IA complexes

## 🗺️ Carte du cours : navigation rapide par chapitre

Chaque chapitre a un README dédié avec objectifs d'apprentissage, démarrages rapides et exercices :

| Chapitre | Sujet | Leçons | Durée | Complexité |
|---------|-------|---------|----------|------------|
| **[Ch 1 : Fondations](docs/chapter-01-foundation/README.md)** | Premiers pas | [Notions de base d'AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Premier projet](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2 : Développement orienté IA](docs/chapter-02-ai-development/README.md)** | Applications axées IA | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 heures | ⭐⭐ |
| **[Ch 3 : Configuration](docs/chapter-03-configuration/README.md)** | Authentification & Sécurité | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Authentification & Sécurité](docs/chapter-03-configuration/authsecurity.md) | 45-60 minutes | ⭐⭐ |
| **[Ch 4 : Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Déploiement | [Guide de déploiement](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 heures | ⭐⭐⭐ |
| **[Ch 5 : Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Solutions d'agents IA | [Scénario Commerce de détail](examples/retail-scenario.md) &#124; [Modèles de coordination](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 heures | ⭐⭐⭐⭐ |
| **[Ch 6 : Pré-déploiement](docs/chapter-06-pre-deployment/README.md)** | Planification & Validation | [Vérifications préalables](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planification de capacité](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Sélection de SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 heure | ⭐⭐ |
| **[Ch 7 : Dépannage](docs/chapter-07-troubleshooting/README.md)** | Débogage & Correction | [Problèmes courants](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Débogage](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problèmes d'IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 heures | ⭐⭐ |
| **[Ch 8 : Production](docs/chapter-08-production/README.md)** | Modèles d'entreprise | [Pratiques de production](docs/chapter-08-production/production-ai-practices.md) | 2-3 heures | ⭐⭐⭐⭐ |
| **[🎓 Atelier](workshop/README.md)** | Laboratoire pratique | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Sélection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Déconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personnalisation](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Démontage de l'infrastructure](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Conclusion](workshop/docs/instructions/7-Wrap-up.md) | 3-4 heures | ⭐⭐ |

**Durée totale du cours :** ~10-14 heures | **Progression des compétences :** Débutant → Prêt pour la production

---

## 📚 Chapitres d'apprentissage

*Sélectionnez votre parcours d'apprentissage en fonction de votre niveau d'expérience et de vos objectifs*

### 🚀 Chapitre 1 : Fondations et démarrage rapide
**Prérequis**: abonnement Azure, connaissances de base en ligne de commande  
**Durée**: 30-45 minutes  
**Complexité**: ⭐

#### Ce que vous apprendrez
- Comprendre les fondamentaux de l'Azure Developer CLI
- Installer AZD sur votre plateforme
- Votre premier déploiement réussi

#### Ressources d'apprentissage
- **🎯 Commencez ici**: [Qu'est-ce que l'Azure Developer CLI ?](../..)
- **📖 Théorie**: [Notions de base AZD](docs/chapter-01-foundation/azd-basics.md) - Concepts et terminologie de base
- **⚙️ Installation**: [Installation & Configuration](docs/chapter-01-foundation/installation.md) - Guides spécifiques à la plateforme
- **🛠️ Pratique**: [Votre premier projet](docs/chapter-01-foundation/first-project.md) - Tutoriel pas à pas
- **📋 Référence rapide**: [Fiche récapitulative des commandes](resources/cheat-sheet.md)

#### Exercices pratiques
```bash
# Vérification rapide de l'installation
azd version

# Déployez votre première application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Résultat du chapitre**: Déployer avec succès une application web simple sur Azure en utilisant AZD

**✅ Validation du succès:**
```bash
# Après avoir terminé le chapitre 1, vous devriez être capable de :
azd version              # Affiche la version installée
azd init --template todo-nodejs-mongo  # Initialise le projet
azd up                  # Déploie sur Azure
azd show                # Affiche l'URL de l'application en cours d'exécution
# L'application s'ouvre dans le navigateur et fonctionne
azd down --force --purge  # Nettoie les ressources
```

**📊 Temps investi:** 30-45 minutes  
**📈 Niveau de compétence après :** Peut déployer des applications de base de façon autonome
**📈 Niveau de compétence après :** Peut déployer des applications de base de façon autonome

---

### 🤖 Chapitre 2 : Développement orienté IA (Recommandé pour les développeurs IA)
**Prérequis**: Chapitre 1 terminé  
**Durée**: 1-2 heures  
**Complexité**: ⭐⭐

#### Ce que vous apprendrez
- Intégration de Microsoft Foundry avec AZD
- Déployer des applications alimentées par l'IA
- Comprendre les configurations des services d'IA

#### Ressources d'apprentissage
- **🎯 Commencez ici**: [Intégration Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agents IA**: [Guide des agents IA](docs/chapter-02-ai-development/agents.md) - Déployer des agents intelligents avec AZD
- **📖 Modèles**: [Déploiement de modèles IA](docs/chapter-02-ai-development/ai-model-deployment.md) - Déployer et gérer des modèles d'IA
- **🛠️ Atelier**: [Atelier AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Préparez vos solutions IA pour AZD
- **🎥 Guide interactif**: [Matériel de l'atelier](workshop/README.md) - Apprentissage en navigateur avec MkDocs * DevContainer Environment
- **📋 Modèles**: [Templates Microsoft Foundry](../..)
- **📝 Exemples**: [Exemples de déploiement AZD](examples/README.md)

#### Exercices pratiques
```bash
# Déployez votre première application d'IA
azd init --template azure-search-openai-demo
azd up

# Essayez d'autres modèles d'IA
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Résultat du chapitre**: Déployer et configurer une application de chat alimentée par l'IA avec des capacités RAG

**✅ Validation du succès:**
```bash
# Après le chapitre 2, vous devriez être capable de :
azd init --template azure-search-openai-demo
azd up
# Tester l'interface de chat IA
# Poser des questions et obtenir des réponses alimentées par l'IA avec des sources
# Vérifier que l'intégration de la recherche fonctionne
azd monitor  # Vérifier qu'Application Insights affiche la télémétrie
azd down --force --purge
```

**📊 Temps investi:** 1-2 heures  
**📈 Niveau de compétence après :** Peut déployer et configurer des applications IA prêtes pour la production  
**💰 Conscience des coûts:** Comprendre les coûts de développement de 80-150 $/mois, coûts de production de 300-3 500 $/mois

#### 💰 Considérations de coût pour les déploiements IA

**Environnement de développement (est. 80-150 $/mois):**
- Microsoft Foundry Models (paiement à l'utilisation) : 0-50 $/mois (basé sur l'utilisation des tokens)
- AI Search (niveau Basic) : 75 $/mois
- Container Apps (consommation) : 0-20 $/mois
- Stockage (Standard) : 1-5 $/mois

**Environnement de production (est. 300-3 500+ $/mois):**
- Microsoft Foundry Models (PTU pour performance constante) : 3 000+ $/mois OU paiement à l'utilisation en cas de volume élevé
- AI Search (niveau Standard) : 250 $/mois
- Container Apps (dédiés) : 50-100 $/mois
- Application Insights : 5-50 $/mois
- Stockage (Premium) : 10-50 $/mois

**💡 Conseils d'optimisation des coûts :**
- Utilisez les modèles Microsoft Foundry **Free Tier** pour l'apprentissage (Azure OpenAI 50,000 tokens/mois inclus)
- Exécutez `azd down` pour désallouer les ressources lorsque vous ne développez pas activement
- Commencez par une facturation à la consommation, passez au PTU uniquement pour la production
- Utilisez `azd provision --preview` pour estimer les coûts avant le déploiement
- Activez l'auto-scaling : ne payez que pour l'utilisation réelle

**Surveillance des coûts:**
```bash
# Vérifier les coûts mensuels estimés
azd provision --preview

# Surveiller les coûts réels dans le portail Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapitre 3 : Configuration et authentification
**Prérequis**: Chapitre 1 terminé  
**Durée**: 45-60 minutes  
**Complexité**: ⭐⭐

#### Ce que vous apprendrez
- Configuration et gestion des environnements
- Authentification et bonnes pratiques de sécurité
- Nommage et organisation des ressources

#### Ressources d'apprentissage
- **📖 Configuration**: [Guide de configuration](docs/chapter-03-configuration/configuration.md) - Configuration de l'environnement
- **🔐 Sécurité**: [Modèles d'authentification et identité gérée](docs/chapter-03-configuration/authsecurity.md) - Modèles d'authentification
- **📝 Exemples**: [Exemple d'application de base de données](examples/database-app/README.md) - Exemples de base de données AZD

#### Exercices pratiques
- Configurer plusieurs environnements (dev, staging, prod)
- Mettre en place l'authentification par identité gérée
- Implémenter des configurations spécifiques à l'environnement

**💡 Résultat du chapitre**: Gérer plusieurs environnements avec une authentification et une sécurité appropriées

---

### 🏗️ Chapitre 4 : Infrastructure as Code et déploiement
**Prérequis**: Chapitres 1 à 3 terminés  
**Durée**: 1-1.5 heures  
**Complexité**: ⭐⭐⭐

#### Ce que vous apprendrez
- Modèles de déploiement avancés
- Infrastructure as Code avec Bicep
- Stratégies de provisioning des ressources

#### Ressources d'apprentissage
- **📖 Déploiement**: [Guide de déploiement](docs/chapter-04-infrastructure/deployment-guide.md) - Workflows complets
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Gestion des ressources Azure
- **📝 Exemples**: [Container App Example](../../examples/container-app) - Déploiements conteneurisés

#### Exercices pratiques
- Créer des templates Bicep personnalisés
- Déployer des applications multi-services
- Implémenter des stratégies de déploiement blue-green

**💡 Résultat du chapitre**: Déployer des applications multi-services complexes en utilisant des templates d'infrastructure personnalisés

---

### 🎯 Chapitre 5 : Solutions IA multi-agents (Avancé)
**Prérequis**: Chapitres 1 et 2 terminés  
**Durée**: 2-3 heures  
**Complexité**: ⭐⭐⭐⭐

#### Ce que vous apprendrez
- Modèles d'architecture multi-agents
- Orchestration et coordination des agents
- Déploiements IA prêts pour la production

#### Ressources d'apprentissage
- **🤖 Projet présenté**: [Solution multi-agent pour le commerce de détail](examples/retail-scenario.md) - Implémentation complète
- **🛠️ Templates ARM**: [Package de templates ARM](../../examples/retail-multiagent-arm-template) - Déploiement en un clic
- **📖 Architecture**: [Modèles de coordination multi-agents](docs/chapter-06-pre-deployment/coordination-patterns.md) - Modèles

#### Exercices pratiques
```bash
# Déployer la solution multi-agent complète pour le commerce de détail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorer les configurations des agents
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Résultat du chapitre**: Déployer et gérer une solution IA multi-agents prête pour la production avec des agents Client et Inventaire

---

### 🔍 Chapitre 6 : Validation et planification pré-déploiement
**Prérequis**: Chapitre 4 terminé  
**Durée**: 1 heure  
**Complexité**: ⭐⭐

#### Ce que vous apprendrez
- Planification de capacité et validation des ressources
- Stratégies de sélection de SKU
- Vérifications préalables et automatisation

#### Ressources d'apprentissage
- **📊 Planification**: [Planification de capacité](docs/chapter-06-pre-deployment/capacity-planning.md) - Validation des ressources
- **💰 Sélection**: [Sélection de SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Choix rentables
- **✅ Validation**: [Vérifications préalables](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatisés

#### Exercices pratiques
- Exécuter des scripts de validation de capacité
- Optimiser les sélections de SKU pour le coût
- Implémenter des contrôles automatisés pré-déploiement

**💡 Résultat du chapitre**: Valider et optimiser les déploiements avant leur exécution

---

### 🚨 Chapitre 7 : Dépannage et débogage
**Prérequis**: N'importe quel chapitre de déploiement terminé  
**Durée**: 1-1.5 heures  
**Complexité**: ⭐⭐

#### Ce que vous apprendrez
- Approches systématiques de débogage
- Problèmes courants et solutions
- Dépannage spécifique à l'IA

#### Ressources d'apprentissage
- **🔧 Problèmes courants**: [Problèmes courants](docs/chapter-07-troubleshooting/common-issues.md) - FAQ et solutions
- **🕵️ Débogage**: [Guide de débogage](docs/chapter-07-troubleshooting/debugging.md) - Stratégies pas à pas
- **🤖 Problèmes d'IA**: [Dépannage spécifique à l'IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problèmes des services d'IA

#### Exercices pratiques
- Diagnostiquer les échecs de déploiement
- Résoudre les problèmes d'authentification
- Déboguer la connectivité des services d'IA

**💡 Résultat du chapitre**: Diagnostiquer et résoudre de manière autonome les problèmes courants de déploiement

---

### 🏢 Chapitre 8 : Production et modèles d'entreprise
**Prérequis**: Chapitres 1 à 4 terminés  
**Durée**: 2-3 heures  
**Complexité**: ⭐⭐⭐⭐

#### Ce que vous apprendrez
- Stratégies de déploiement en production
- Modèles de sécurité d'entreprise
- Surveillance et optimisation des coûts

#### Ressources d'apprentissage
- **🏭 Production**: [Bonnes pratiques IA pour la production](docs/chapter-08-production/production-ai-practices.md) - Patrons d'entreprise
- **📝 Exemples**: [Exemple de microservices](../../examples/microservices) - Architectures complexes
- **📊 Surveillance**: [Intégration Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Surveillance

#### Exercices pratiques
- Mettre en œuvre des patrons de sécurité d'entreprise
- Mettre en place une surveillance complète
- Déployer en production avec une gouvernance appropriée

**💡 Objectif du chapitre** : Déployer des applications prêtes pour l'entreprise avec des capacités de production complètes

---

## 🎓 Aperçu de l'atelier : Expérience d'apprentissage pratique

> **⚠️ STATUT DE L'ATELIER : Développement actif**  
> Les supports de l'atelier sont en cours de développement et d'affinage. Les modules principaux sont fonctionnels, mais certaines sections avancées sont incomplètes. Nous travaillons activement à compléter l'ensemble du contenu. [Suivre l'avancement →](workshop/README.md)

### Matériel interactif de l'atelier
**Apprentissage pratique complet avec des outils basés sur le navigateur et des exercices guidés**

Nos supports d'atelier fournissent une expérience d'apprentissage structurée et interactive qui complète le programme par chapitres ci-dessus. L'atelier est conçu pour l'apprentissage autonome comme pour les sessions animées par un instructeur.

#### 🛠️ Fonctionnalités de l'atelier
- **Interface basée sur le navigateur**: Atelier complet propulsé par MkDocs avec recherche, copie et fonctions de thème
- **Intégration GitHub Codespaces**: Configuration de l'environnement de développement en un clic
- **Parcours d'apprentissage structuré**: Exercices guidés en 8 modules (3-4 heures au total)
- **Méthodologie progressive**: Introduction → Sélection → Validation → Déconstruction → Configuration → Personnalisation → Démantèlement → Conclusion
- **Environnement DevContainer interactif**: Outils et dépendances préconfigurés

#### 📚 Structure des modules de l'atelier
L'atelier suit une **méthodologie progressive en 8 modules** qui vous emmène de la découverte à la maîtrise du déploiement :

| Module | Sujet | Ce que vous ferez | Durée |
|--------|-------|-------------------|-------|
| **0. Introduction** | Aperçu de l'atelier | Comprendre les objectifs d'apprentissage, les prérequis, et la structure de l'atelier | 15 min |
| **1. Sélection** | Découverte des modèles | Explorer les modèles AZD et sélectionner le modèle IA adapté à votre scénario | 20 min |
| **2. Validation** | Déployer & Vérifier | Déployer le modèle avec `azd up` et valider que l'infrastructure fonctionne | 30 min |
| **3. Déconstruction** | Comprendre la structure | Utiliser GitHub Copilot pour explorer l'architecture du modèle, les fichiers Bicep et l'organisation du code | 30 min |
| **4. Configuration** | Exploration approfondie d'azure.yaml | Maîtriser la configuration `azure.yaml`, les hooks du cycle de vie et les variables d'environnement | 30 min |
| **5. Personnalisation** | Personnalisez-le | Activer AI Search, le traçage, l'évaluation, et personnaliser pour votre scénario | 45 min |
| **6. Démantèlement** | Nettoyage | Supprimer en toute sécurité les ressources avec `azd down --purge` | 15 min |
| **7. Conclusion** | Étapes suivantes | Revoir les réalisations, les concepts clés, et poursuivre votre parcours d'apprentissage | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Démarrage de l'atelier
```bash
# Option 1 : GitHub Codespaces (recommandé)
# Cliquez sur "Code" → "Create codespace on main" dans le dépôt

# Option 2 : Développement local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Suivez les instructions d'installation dans workshop/README.md
```

#### 🎯 Objectifs d'apprentissage de l'atelier
En complétant l'atelier, les participants seront capables de :
- **Déployer des applications IA en production** : Utiliser AZD avec les services Microsoft Foundry
- **Maîtriser les architectures multi-agents** : Implémenter des solutions d'agents IA coordonnées
- **Mettre en œuvre les meilleures pratiques de sécurité** : Configurer l'authentification et le contrôle d'accès
- **Optimiser pour la scalabilité** : Concevoir des déploiements performants et économiques
- **Dépanner les déploiements** : Résoudre les problèmes courants de manière autonome

#### 📖 Ressources de l'atelier
- **🎥 Guide interactif**: [Matériel de l'atelier](workshop/README.md) - Environnement d'apprentissage basé sur le navigateur
- **📋 Instructions module par module**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Aperçu de l'atelier et objectifs
  - [1. Sélection](workshop/docs/instructions/1-Select-AI-Template.md) - Trouver et sélectionner des modèles IA
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Déployer et vérifier les modèles
  - [3. Déconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorer l'architecture des modèles
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Maîtriser azure.yaml
  - [5. Personnalisation](workshop/docs/instructions/5-Customize-AI-Template.md) - Personnaliser pour votre scénario
  - [6. Démantèlement](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Nettoyer les ressources
  - [7. Conclusion](workshop/docs/instructions/7-Wrap-up.md) - Revue et étapes suivantes
- **🛠️ Laboratoire d'atelier IA**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exercices axés sur l'IA
- **💡 Démarrage rapide**: [Guide de configuration de l'atelier](workshop/README.md#quick-start) - Configuration de l'environnement

**Parfait pour** : Formation en entreprise, cours universitaires, apprentissage autonome, et bootcamps pour développeurs.

---

## 📖 Approfondissement : capacités d'AZD

Au-delà des bases, AZD offre des fonctionnalités puissantes pour les déploiements en production :

- **Déploiements basés sur des modèles** - Utiliser des modèles préconstruits pour des patrons d'application courants
- **Infrastructure en tant que code** - Gérer les ressources Azure avec Bicep ou Terraform  
- **Flux de travail intégrés** - Provisionner, déployer et surveiller les applications sans couture
- **Orienté développeur** - Optimisé pour la productivité et l'expérience des développeurs

### **AZD + Microsoft Foundry : Idéal pour les déploiements IA**

**Pourquoi AZD pour les solutions IA ?** AZD répond aux principaux défis auxquels sont confrontés les développeurs IA :

- **Modèles prêts pour l'IA** - Modèles préconfigurés pour Microsoft Foundry Models, Cognitive Services et charges de travail ML
- **Déploiements IA sécurisés** - Patrons de sécurité intégrés pour les services IA, les clés API et les points de terminaison des modèles  
- **Patrons IA pour la production** - Meilleures pratiques pour des déploiements d'applications IA évolutifs et rentables
- **Flux de travail IA de bout en bout** - Du développement du modèle au déploiement en production avec une surveillance appropriée
- **Optimisation des coûts** - Allocation intelligente des ressources et stratégies de mise à l'échelle pour les charges de travail IA
- **Intégration Microsoft Foundry** - Connexion transparente au catalogue de modèles Microsoft Foundry et aux points de terminaison

---

## 🎯 Bibliothèque de modèles et d'exemples

### En vedette : modèles Microsoft Foundry
**Commencez ici si vous déployez des applications IA !**

> **Remarque :** Ces modèles démontrent divers patrons IA. Certains sont des Azure Samples externes, d'autres sont des implémentations locales.

| Modèle | Chapitre | Complexité | Services | Type |
|----------|---------|------------|----------|------|
| [**Démarrer avec le chat IA**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapitre 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externe |
| [**Démarrer avec les agents IA**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapitre 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externe |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapitre 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externe |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapitre 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externe |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapitre 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externe |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapitre 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externe |
| [**Solution multi-agents Retail**](examples/retail-scenario.md) | Chapitre 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Locale** |

### En vedette : scénarios d'apprentissage complets
**Modèles d'applications prêts pour la production mappés aux chapitres d'apprentissage**

| Modèle | Chapitre d'apprentissage | Complexité | Principaux apprentissages |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapitre 2 | ⭐ | Modèles de déploiement IA de base |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapitre 2 | ⭐⭐ | Implémentation RAG avec Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapitre 4 | ⭐⭐ | Intégration Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapitre 5 | ⭐⭐⭐ | Framework d'agents et appels de fonctions |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapitre 8 | ⭐⭐⭐ | Orchestration IA d'entreprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapitre 5 | ⭐⭐⭐⭐ | Architecture multi-agents avec agents Client et Inventaire |

### Apprendre par type d'exemple

> **📌 Exemples locaux vs externes :**  
> **Exemples locaux** (dans ce dépôt) = Prêts à l'emploi immédiatement  
> **Exemples externes** (Azure Samples) = Cloner depuis les dépôts liés

#### Exemples locaux (prêts à l'emploi)
- [**Solution multi-agents Retail**](examples/retail-scenario.md) - Implémentation complète prête pour la production avec modèles ARM
  - Architecture multi-agents (agents Client + Inventaire)
  - Surveillance et évaluation complètes
  - Déploiement en un clic via un modèle ARM

#### Exemples locaux - Applications conteneurisées (chapitres 2-5)
**Exemples complets de déploiement de conteneurs dans ce dépôt :**
- [**Exemples d'applications conteneurisées**](examples/container-app/README.md) - Guide complet des déploiements conteneurisés
  - [API Flask simple](../../examples/container-app/simple-flask-api) - API REST basique avec mise à l'échelle vers zéro
  - [Architecture microservices](../../examples/container-app/microservices) - Déploiement multi-services prêt pour la production
  - Modèles Démarrage rapide, Production et Avancé
  - Conseils pour la surveillance, la sécurité et l'optimisation des coûts

#### Exemples externes - Applications simples (chapitres 1-2)
**Clonez ces dépôts Azure Samples pour commencer :**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Modèles de déploiement de base
- [Site statique - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Déploiement de contenu statique
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Déploiement d'API REST

#### Exemples externes - Intégration de base de données (chapitres 3-4)  
- [Application base de données - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Patrons de connectivité aux bases de données
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flux de données serverless

#### Exemples externes - Patrons avancés (chapitres 4-8)
- [Microservices Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architectures multi-services
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Traitement en arrière-plan  
- [Pipeline ML d'entreprise](https://github.com/Azure-Samples/mlops-v2) - Patrons ML prêts pour la production

### Collections de modèles externes
- [**Galerie officielle des modèles AZD**](https://azure.github.io/awesome-azd/) - Collection sélectionnée de modèles officiels et communautaires
- [**Modèles Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentation des modèles Microsoft Learn
- [**Répertoire Examples**](examples/README.md) - Exemples d'apprentissage locaux avec explications détaillées

---

## 📚 Ressources d'apprentissage et références

### Références rapides
- [**Fiche de commandes**](resources/cheat-sheet.md) - Commandes azd essentielles organisées par chapitre
- [**Glossaire**](resources/glossary.md) - Terminologie Azure et azd  
- [**FAQ**](resources/faq.md) - Questions fréquentes organisées par chapitre d'apprentissage
- [**Guide d'étude**](resources/study-guide.md) - Exercices pratiques complets

### Ateliers pratiques
- [**Laboratoire d'atelier IA**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendre vos solutions IA déployables avec AZD (2-3 heures)
- [**Atelier interactif**](workshop/README.md) - Exercices guidés en 8 modules avec MkDocs et GitHub Codespaces
  - Suit : Introduction → Sélection → Validation → Déconstruction → Configuration → Personnalisation → Démantèlement → Conclusion

### Ressources d'apprentissage externes
- [Documentation d'Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centre d'architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculateur de prix Azure](https://azure.microsoft.com/pricing/calculator/)
- [Statut Azure](https://status.azure.com/)

### Compétences d'agents IA pour votre éditeur
- [**Microsoft Azure Skills sur skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 compétences d'agents ouvertes pour Azure AI, Foundry, déploiement, diagnostic, optimisation des coûts, et plus. Installez-les dans GitHub Copilot, Cursor, Claude Code, ou tout agent pris en charge:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guide de dépannage rapide

**Problèmes courants rencontrés par les débutants et solutions immédiates :**

<details>
<summary><strong>❌ "azd : commande introuvable"</strong></summary>

```bash
# Installer d'abord AZD
# Windows (PowerShell) :
winget install microsoft.azd

# macOS :
brew tap azure/azd && brew install azd

# Linux :
curl -fsSL https://aka.ms/install-azd.sh | bash

# Vérifier l'installation
azd version
```
</details>

<details>
<summary><strong>❌ "Aucun abonnement trouvé" ou "Abonnement non défini"</strong></summary>

```bash
# Lister les abonnements disponibles
az account list --output table

# Définir l'abonnement par défaut
az account set --subscription "<subscription-id-or-name>"

# Définir pour l'environnement AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Vérifier
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota dépassé"</strong></summary>

```bash
# Essayez une autre région Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ou utilisez des SKUs plus petits en développement
# Modifiez infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" échoue à mi-parcours</strong></summary>

```bash
# Option 1: Nettoyer et réessayer
azd down --force --purge
azd up

# Option 2: Réparer simplement l'infrastructure
azd provision

# Option 3: Vérifier le statut détaillé
azd show

# Option 4: Vérifier les journaux dans Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Échec de l'authentification" ou "Jeton expiré"</strong></summary>

```bash
# Réauthentifier
az logout
az login

azd auth logout
azd auth login

# Vérifier l'authentification
az account show
```
</details>

<details>
<summary><strong>❌ "La ressource existe déjà" ou conflits de nommage</strong></summary>

```bash
# AZD génère des noms uniques, mais en cas de conflit :
azd down --force --purge

# Ensuite, réessayez avec un nouvel environnement
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
# Vérifier l'avancement
azd show

# Si bloqué pendant plus de 30 minutes, consultez le Portail Azure :
azd monitor
# Recherchez les déploiements ayant échoué
```
</details>

<details>
<summary><strong>❌ "Permission refusée" ou "Interdit"</strong></summary>

```bash
# Vérifiez votre rôle Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Vous avez besoin au minimum du rôle "Contributeur"
# Demandez à votre administrateur Azure d'accorder :
# - Contributeur (pour les ressources)
# - Administrateur d'accès utilisateur (pour les attributions de rôle)
```
</details>

<details>
<summary><strong>❌ Impossible de trouver l'URL de l'application déployée</strong></summary>

```bash
# Afficher tous les points de terminaison des services
azd show

# Ou ouvrir le portail Azure
azd monitor

# Vérifier un service spécifique
azd env get-values
# Rechercher les variables *_URL
```
</details>

### 📚 Ressources complètes de dépannage

- **Guide des problèmes courants :** [Solutions détaillées](docs/chapter-07-troubleshooting/common-issues.md)
- **Problèmes spécifiques à l'IA :** [Dépannage IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guide de débogage :** [Débogage pas à pas](docs/chapter-07-troubleshooting/debugging.md)
- **Obtenir de l'aide :** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Achèvement du cours et certification

### Suivi de progression
Suivez votre progression d'apprentissage à travers chaque chapitre :

- [ ] **Chapitre 1** : Fondations & Démarrage rapide ✅
- [ ] **Chapitre 2** : Développement axé sur l'IA ✅  
- [ ] **Chapitre 3** : Configuration & Authentification ✅
- [ ] **Chapitre 4** : Infrastructure en tant que code & Déploiement ✅
- [ ] **Chapitre 5** : Solutions IA multi-agents ✅
- [ ] **Chapitre 6** : Validation et planification pré-déploiement ✅
- [ ] **Chapitre 7** : Dépannage & Débogage ✅
- [ ] **Chapitre 8** : Modèles de production et d'entreprise ✅

### Vérification des connaissances
Après avoir terminé chaque chapitre, vérifiez vos connaissances en :
1. **Exercice pratique** : Effectuez le déploiement pratique du chapitre
2. **Vérification des connaissances** : Consultez la section FAQ de votre chapitre
3. **Discussion communautaire** : Partagez votre expérience sur Discord Azure
4. **Chapitre suivant** : Passez au niveau de complexité suivant

### Avantages à la fin du cours
Une fois tous les chapitres terminés, vous aurez :
- **Expérience en production** : Déploiement d'applications IA réelles sur Azure
- **Compétences professionnelles** : Capacités de déploiement prêtes pour l'entreprise  
- **Reconnaissance communautaire** : Membre actif de la communauté des développeurs Azure
- **Avancement professionnel** : Expertise recherchée en déploiement AZD et IA

---

## 🤝 Communauté & support

### Obtenir de l'aide et du support
- **Problèmes techniques** : [Signaler des bugs et demander des fonctionnalités](https://github.com/microsoft/azd-for-beginners/issues)
- **Questions d'apprentissage** : [Communauté Discord Microsoft Azure](https://discord.gg/microsoft-azure) et [![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Aide spécifique à l'IA** : Rejoignez le [![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation** : [Documentation officielle d'Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Aperçus communautaires du Discord Microsoft Foundry

**Résultats récents du sondage du canal #Azure :**
- **45%** des développeurs souhaitent utiliser AZD pour des charges de travail IA
- **Principaux défis** : déploiements multi-services, gestion des identifiants, préparation à la production  
- **Les plus demandés** : modèles spécifiques à l'IA, guides de dépannage, meilleures pratiques

**Rejoignez notre communauté pour :**
- Partager vos expériences AZD + IA et obtenir de l'aide
- Accéder aux aperçus anticipés des nouveaux modèles IA
- Contribuer aux meilleures pratiques de déploiement IA
- Influencer le développement futur des fonctionnalités AI + AZD

### Contribuer au cours
Nous accueillons les contributions ! Veuillez lire notre [Guide de contribution](CONTRIBUTING.md) pour les détails sur :
- **Améliorations de contenu** : Améliorez les chapitres et exemples existants
- **Nouveaux exemples** : Ajoutez des scénarios et modèles réels  
- **Traduction** : Aidez à maintenir le support multilingue
- **Rapports de bugs** : Améliorez la précision et la clarté
- **Normes communautaires** : Respectez nos directives communautaires inclusives

---

## 📄 Informations sur le cours

### Licence
Ce projet est sous licence MIT - voir le fichier [LICENSE](../../LICENSE) pour les détails.

### Ressources d'apprentissage Microsoft associées

Notre équipe produit d'autres cours d'apprentissage complets :

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j pour débutants](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js pour débutants](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain pour débutants](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD pour débutants](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI pour débutants](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP pour débutants](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Agents IA pour débutants](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série IA générative
[![IA générative pour débutants](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![IA générative (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![IA générative (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![IA générative (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Formations de base
[![ML pour débutants](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Science des données pour débutants](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![IA pour débutants](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersécurité pour débutants](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Développement Web pour débutants](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pour débutants](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Développement XR pour débutants](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot pour la programmation en binôme avec l'IA](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pour C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventure Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigation du cours

**🚀 Prêt à commencer à apprendre ?**

**Débutants**: Commencez par [Chapitre 1 : Fondations & Démarrage rapide](../..)  
**Développeurs d'IA**: Passez à [Chapitre 2 : Développement axé sur l'IA](../..)  
**Développeurs expérimentés**: Commencez par [Chapitre 3 : Configuration & Authentification](../..)

**Étapes suivantes**: [Commencer le Chapitre 1 - Notions de base AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Clause de non-responsabilité :
Ce document a été traduit à l'aide du service de traduction par IA [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un traducteur humain. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->