# AZD Pour Débutants : Un Parcours d'Apprentissage Structuré

![AZD-for-beginners](../../translated_images/fr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traductions Automatiques (Toujours à Jour)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabe](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgare](../bg/README.md) | [Birman (Myanmar)](../my/README.md) | [Chinois (Simplifié)](../zh-CN/README.md) | [Chinois (Traditionnel, Hong Kong)](../zh-HK/README.md) | [Chinois (Traditionnel, Macau)](../zh-MO/README.md) | [Chinois (Traditionnel, Taiwan)](../zh-TW/README.md) | [Croate](../hr/README.md) | [Tchèque](../cs/README.md) | [Danois](../da/README.md) | [Néerlandais](../nl/README.md) | [Estonien](../et/README.md) | [Finnois](../fi/README.md) | [Français](./README.md) | [Allemand](../de/README.md) | [Grec](../el/README.md) | [Hébreu](../he/README.md) | [Hindi](../hi/README.md) | [Hongrois](../hu/README.md) | [Indonésien](../id/README.md) | [Italien](../it/README.md) | [Japonais](../ja/README.md) | [Kannada](../kn/README.md) | [Coréen](../ko/README.md) | [Lituanien](../lt/README.md) | [Malais](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Népalais](../ne/README.md) | [Pidgin Nigérian](../pcm/README.md) | [Norvégien](../no/README.md) | [Persan (Farsi)](../fa/README.md) | [Polonais](../pl/README.md) | [Portugais (Brésil)](../pt-BR/README.md) | [Portugais (Portugal)](../pt-PT/README.md) | [Pendjabi (Gurmukhi)](../pa/README.md) | [Roumain](../ro/README.md) | [Russe](../ru/README.md) | [Serbe (Cyrillique)](../sr/README.md) | [Slovaque](../sk/README.md) | [Slovène](../sl/README.md) | [Espagnol](../es/README.md) | [Swahili](../sw/README.md) | [Suédois](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamoul](../ta/README.md) | [Télougou](../te/README.md) | [Thaï](../th/README.md) | [Turc](../tr/README.md) | [Ukrainien](../uk/README.md) | [Ourdou](../ur/README.md) | [Vietnamien](../vi/README.md)

> **Préférez Cloner Localement ?**

> Ce dépôt inclut plus de 50 traductions ce qui augmente significativement la taille du téléchargement. Pour cloner sans les traductions, utilisez le sparse checkout :
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Cela vous donne tout ce dont vous avez besoin pour compléter le cours avec un téléchargement beaucoup plus rapide.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Qu'est-ce que Azure Developer CLI (azd) ?

**Azure Developer CLI (azd)** est un outil en ligne de commande convivial pour les développeurs qui facilite le déploiement d'applications sur Azure. Au lieu de créer et connecter manuellement des dizaines de ressources Azure, vous pouvez déployer des applications entières avec une seule commande.

### La Magie de `azd up`

```bash
# Cette commande unique fait tout :
# ✅ Crée toutes les ressources Azure
# ✅ Configure la mise en réseau et la sécurité
# ✅ Construit le code de votre application
# ✅ Déploie sur Azure
# ✅ Vous fournit une URL fonctionnelle
azd up
```

**C'est tout !** Pas de clics dans le portail Azure, pas besoin d'apprendre des templates ARM complexes, ni de configuration manuelle - juste des applications fonctionnelles sur Azure.

---

## ❓ Azure Developer CLI vs Azure CLI : Quelle est la différence ?

C'est la question la plus courante que se posent les débutants. Voici la réponse simple :

| Fonctionnalité | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|----------------|----------------------|---------------------------------|
| **Objectif** | Gérer des ressources Azure individuelles | Déployer des applications complètes |
| **Approche** | Axée sur l'infrastructure | Axée sur l'application |
| **Exemple** | `az webapp create --name myapp...` | `azd up` |
| **Courbe d'apprentissage** | Connaître les services Azure | Connaître juste votre app |
| **Idéal pour** | DevOps, Infrastructure | Développeurs, Prototypage |

### Analogie Simple

- **Azure CLI** est comme avoir tous les outils pour construire une maison - marteaux, scies, clous. Vous pouvez tout construire, mais vous devez connaître la construction.
- **Azure Developer CLI** est comme engager un entrepreneur - vous décrivez ce que vous voulez, et il s'occupe de la construction.

### Quand utiliser chacun

| Scénario | Utilisez Ceci |
|----------|--------------|
| "Je veux déployer rapidement mon application web" | `azd up` |
| "Je dois créer juste un compte de stockage" | `az storage account create` |
| "Je construis une application IA complète" | `azd init --template azure-search-openai-demo` |
| "J'ai besoin de déboguer une ressource Azure spécifique" | `az resource show` |
| "Je veux un déploiement prêt pour la production en quelques minutes" | `azd up --environment production` |

### Ils fonctionnent ensemble !

AZD utilise Azure CLI en arrière-plan. Vous pouvez utiliser les deux :
```bash
# Déployez votre application avec AZD
azd up

# Ensuite, affinez des ressources spécifiques avec Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Trouvez des Templates dans Awesome AZD

Ne partez pas de zéro ! **Awesome AZD** est la collection communautaire de templates prêts à être déployés :

| Ressource | Description |
|-----------|-------------|
| 🔗 [**Galerie Awesome AZD**](https://azure.github.io/awesome-azd/) | Parcourez plus de 200 templates avec déploiement en un clic |
| 🔗 [**Soumettre un Template**](https://github.com/Azure/awesome-azd/issues) | Contribuez avec votre propre template à la communauté |
| 🔗 [**Dépôt GitHub**](https://github.com/Azure/awesome-azd) | Étoilez et explorez la source |

### Templates AI Populaires d’Awesome AZD

```bash
# Chat RAG avec Azure OpenAI + AI Search
azd init --template azure-search-openai-demo

# Application de chat IA rapide
azd init --template openai-chat-app-quickstart

# Agents d'IA avec Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Démarrage en 3 Étapes

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

### Étape 2 : Se connecter à Azure

```bash
azd auth login
```

### Étape 3 : Déployez Votre Première Application

```bash
# Initialiser à partir d'un modèle
azd init --template todo-nodejs-mongo

# Déployer sur Azure (crée tout !)
azd up
```

**🎉 C'est tout !** Votre application est maintenant en ligne sur Azure.

### Nettoyage (N'oubliez pas !)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Comment Utiliser Ce Cours

Ce cours est conçu pour un **apprentissage progressif** - commencez là où vous êtes à l'aise et progressez :

| Votre expérience | Commencez ici |
|------------------|--------------|
| **Nouveau sur Azure** | [Chapitre 1 : Fondations](../..) |
| **Connaissance d’Azure, nouveau sur AZD** | [Chapitre 1 : Fondations](../..) |
| **Envie de déployer des applications IA** | [Chapitre 2 : Développement orienté IA](../..) |
| **Envie de pratiquer concrètement** | [🎓 Atelier interactif](workshop/README.md) - laboratoire guidé de 3-4 heures |
| **Besoin de modèles pour la production** | [Chapitre 8 : Production & Entreprise](../..) |

### Configuration rapide

1. **Faites un fork de ce dépôt** : [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonez-le** : `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtenez de l’aide** : [Communauté Discord Azure](https://discord.com/invite/ByRwuEEgH4)

> **Préférez Cloner Localement ?**

> Ce dépôt inclut plus de 50 traductions ce qui augmente significativement la taille du téléchargement. Pour cloner sans les traductions, utilisez le sparse checkout :
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Cela vous donne tout ce dont vous avez besoin pour compléter le cours avec un téléchargement beaucoup plus rapide.


## Aperçu du cours

Maîtrisez Azure Developer CLI (azd) à travers des chapitres structurés conçus pour un apprentissage progressif. **Accent particulier sur le déploiement d'applications IA avec intégration Microsoft Foundry.**

### Pourquoi ce cours est essentiel pour les développeurs modernes

Sur la base des retours de la communauté Discord Microsoft Foundry, **45% des développeurs veulent utiliser AZD pour des charges IA** mais rencontrent des défis avec :
- Des architectures IA complexes multi-services
- Meilleures pratiques de déploiement IA en production  
- Intégration et configuration des services IA Azure
- Optimisation des coûts pour charges IA
- Résolution de problèmes spécifiques au déploiement IA

### Objectifs d’apprentissage

En complétant ce cours structuré, vous allez :
- **Maîtriser les Fondamentaux d’AZD** : concepts de base, installation, configuration
- **Déployer des applications IA** : utiliser AZD avec les services Microsoft Foundry
- **Mettre en œuvre Infrastructure as Code** : gérer les ressources Azure avec des templates Bicep
- **Résoudre les problèmes de déploiement** : diagnostiquer et déboguer les soucis courants
- **Optimiser pour la production** : sécurité, montée en charge, monitoring et gestion des coûts
- **Construire des solutions multi-agent** : déployer des architectures IA complexes

## 🗺️ Carte du cours : Navigation rapide par chapitre

Chaque chapitre a un README dédié avec objectifs d’apprentissage, démarrages rapides et exercices :

| Chapitre | Sujet | Leçons | Durée | Complexité |
|----------|-------|--------|-------|------------|
| **[Ch 1 : Fondations](docs/chapter-01-foundation/README.md)** | Premiers pas | [Bases AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Premier projet](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2 : Développement IA](docs/chapter-02-ai-development/README.md)** | Applications IA priorisées | [Intégration Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agents IA](docs/chapter-02-ai-development/agents.md) &#124; [Déploiement modèle IA](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Atelier](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 h | ⭐⭐ |
| **[Ch 3 : Configuration](docs/chapter-03-configuration/README.md)** | Authentification & Sécurité | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Sécurité](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4 : Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Déploiement | [Guide de déploiement](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionnement](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 h | ⭐⭐⭐ |
| **[Ch 5 : Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Solutions d’agents IA | [Scénario Retail](examples/retail-scenario.md) &#124; [Modèles de coordination](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 h | ⭐⭐⭐⭐ |
| **[Ch 6 : Pré-déploiement](docs/chapter-06-pre-deployment/README.md)** | Planification & Validation | [Vérifications préalables](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planification de capacité](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Sélection de SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 h | ⭐⭐ |
| **[Ch 7 : Dépannage](docs/chapter-07-troubleshooting/README.md)** | Débogage & Correction | [Problèmes courants](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Débogage](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problèmes IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 h | ⭐⭐ |
| **[Ch 8 : Production](docs/chapter-08-production/README.md)** | Modèles d’entreprise | [Pratiques de production](docs/chapter-08-production/production-ai-practices.md) | 2-3 h | ⭐⭐⭐⭐ |
| **[🎓 Atelier](workshop/README.md)** | Laboratoire pratique | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Sélection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Déconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personnalisation](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Démantèlement](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Clôture](workshop/docs/instructions/7-Wrap-up.md) | 3-4 h | ⭐⭐ |

**Durée Totale du Cours :** ~10-14 heures | **Progression des Compétences :** Débutant → Prêt pour la production

---

## 📚 Chapitres d’apprentissage

*Choisissez votre parcours d’apprentissage selon votre niveau et vos objectifs*

### 🚀 Chapitre 1 : Fondations & Démarrage rapide
**Prérequis** : abonnement Azure, connaissances de base en ligne de commande  
**Durée** : 30-45 minutes  
**Complexité** : ⭐

#### Ce que vous apprendrez
- Comprendre les fondamentaux d’Azure Developer CLI
- Installer AZD sur votre plateforme
- Votre premier déploiement réussi

#### Ressources d’apprentissage
- **🎯 Commencez ici** : [Qu’est-ce qu’Azure Developer CLI ?](../..)
- **📖 Théorie** : [Bases d’AZD](docs/chapter-01-foundation/azd-basics.md) - Concepts clés et vocabulaire
- **⚙️ Installation** : [Installation & Configuration](docs/chapter-01-foundation/installation.md) - Guides spécifiques à la plateforme
- **🛠️ Pratique** : [Votre premier projet](docs/chapter-01-foundation/first-project.md) - Tutoriel pas-à-pas
- **📋 Référence rapide** : [Fiche de commandes](resources/cheat-sheet.md)

#### Exercices pratiques
```bash
# Vérification rapide de l'installation
azd version

# Déployez votre première application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Résultat du chapitre** : Déployer avec succès une application web simple sur Azure avec AZD

**✅ Validation de réussite :**
```bash
# Après avoir terminé le Chapitre 1, vous devriez être capable de :
azd version              # Affiche la version installée
azd init --template todo-nodejs-mongo  # Initialise le projet
azd up                  # Déploie sur Azure
azd show                # Affiche l'URL de l'application en cours d'exécution
# L'application s'ouvre dans le navigateur et fonctionne
azd down --force --purge  # Nettoie les ressources
```

**📊 Temps investi :** 30-45 minutes  
**📈 Niveau après** : Peut déployer des applications basiques de façon autonome

**✅ Validation de réussite :**
```bash
# Après avoir terminé le Chapitre 1, vous devriez être capable de :
azd version              # Affiche la version installée
azd init --template todo-nodejs-mongo  # Initialise le projet
azd up                  # Déploie sur Azure
azd show                # Affiche l'URL de l'application en cours d'exécution
# L'application s'ouvre dans le navigateur et fonctionne
azd down --force --purge  # Nettoie les ressources
```

**📊 Temps investi :** 30-45 minutes  
**📈 Niveau après** : Peut déployer des applications basiques de façon autonome

---

### 🤖 Chapitre 2 : Développement IA-centric (Recommandé aux développeurs IA)
**Prérequis** : Chapitre 1 terminé  
**Durée** : 1-2 heures  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Intégration Microsoft Foundry avec AZD
- Déploiement d’applications alimentées par l’IA
- Comprendre les configurations des services IA

#### Ressources d’apprentissage
- **🎯 Commencez ici** : [Intégration Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agents IA** : [Guide des agents IA](docs/chapter-02-ai-development/agents.md) - Déployer des agents intelligents avec AZD
- **📖 Modèles** : [Déploiement de modèles IA](docs/chapter-02-ai-development/ai-model-deployment.md) - Déployer et gérer des modèles IA
- **🛠️ Atelier** : [Atelier IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Préparez vos solutions IA avec AZD
- **🎥 Guide interactif** : [Matériel d’atelier](workshop/README.md) - Apprentissage en navigateur avec MkDocs * Environnement DevContainer
- **📋 Modèles** : [Modèles Microsoft Foundry](../..)
- **📝 Exemples** : [Exemples de déploiement AZD](examples/README.md)

#### Exercices pratiques
```bash
# Déployez votre première application IA
azd init --template azure-search-openai-demo
azd up

# Essayez des modèles IA supplémentaires
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Résultat du chapitre** : Déployer et configurer une application de chat IA avec fonctionnalités RAG

**✅ Validation de réussite :**
```bash
# Après le chapitre 2, vous devriez être capable de :
azd init --template azure-search-openai-demo
azd up
# Tester l'interface de chat IA
# Poser des questions et obtenir des réponses alimentées par l'IA avec sources
# Vérifier que l'intégration de la recherche fonctionne
azd monitor  # Vérifier que Application Insights affiche la télémétrie
azd down --force --purge
```

**📊 Temps investi :** 1-2 heures  
**📈 Niveau après** : Peut déployer et configurer des applications IA prêtes pour la production  
**💰 Sensibilisation aux coûts :** Comprendre 80-150 $/mois en dev, 300-3500 $/mois en prod

#### 💰 Considérations de coûts pour les déploiements IA

**Environnement de développement (Estimation 80-150 $/mois) :**
- Azure OpenAI (paiement à l’usage) : 0-50 $/mois (selon usage de jetons)
- Recherche IA (niveau Basique) : 75 $/mois
- Applications conteneurisées (Consommation) : 0-20 $/mois
- Stockage (Standard) : 1-5 $/mois

**Environnement de production (Estimation 300-3 500+ $/mois) :**
- Azure OpenAI (PTU pour performance constante) : 3 000+ $/mois OU pay-as-you-go en volume élevé
- Recherche IA (niveau Standard) : 250 $/mois
- Applications conteneurisées (Dédié) : 50-100 $/mois
- Application Insights : 5-50 $/mois
- Stockage (Premium) : 10-50 $/mois

**💡 Conseils d’optimisation des coûts :**
- Utilisez le niveau **Gratuit** Azure OpenAI pour l’apprentissage (50 000 jetons/mois inclus)
- Exécutez `azd down` pour désallouer les ressources quand vous ne développez pas activement
- Commencez avec une facturation à la consommation, passez au PTU uniquement en production
- Utilisez `azd provision --preview` pour estimer les coûts avant déploiement
- Activez l’auto-scaling : payez uniquement pour l’usage réel

**Suivi des coûts :**
```bash
# Vérifier les coûts mensuels estimés
azd provision --preview

# Surveiller les coûts réels dans le portail Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapitre 3 : Configuration & Authentification
**Prérequis** : Chapitre 1 terminé  
**Durée** : 45-60 minutes  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Configuration et gestion des environnements
- Meilleures pratiques d’authentification et sécurité
- Nommage et organisation des ressources

#### Ressources d’apprentissage
- **📖 Configuration** : [Guide de configuration](docs/chapter-03-configuration/configuration.md) - Mise en place des environnements
- **🔐 Sécurité** : [Patrons d’authentification et identité gérée](docs/chapter-03-configuration/authsecurity.md) - Modèles d’authentification
- **📝 Exemples** : [Exemple d’application base de données](examples/database-app/README.md) - Exemples AZD base de données

#### Exercices pratiques
- Configurer plusieurs environnements (dev, staging, prod)
- Mettre en place l’authentification avec identité gérée
- Implémenter des configurations spécifiques par environnement

**💡 Résultat du chapitre** : Gérer plusieurs environnements avec authentification et sécurité appropriées

---

### 🏗️ Chapitre 4 : Infrastructure as Code & Déploiement
**Prérequis** : Chapitres 1-3 terminés  
**Durée** : 1-1,5 heure  
**Complexité** : ⭐⭐⭐

#### Ce que vous apprendrez
- Modèles avancés de déploiement
- Infrastructure en tant que code avec Bicep
- Stratégies de provisionnement des ressources

#### Ressources d’apprentissage
- **📖 Déploiement** : [Guide de déploiement](docs/chapter-04-infrastructure/deployment-guide.md) - Workflows complets
- **🏗️ Provisionnement** : [Provisionnement de ressources](docs/chapter-04-infrastructure/provisioning.md) - Gestion des ressources Azure
- **📝 Exemples** : [Exemple d’application conteneurisée](../../examples/container-app) - Déploiements conteneurisés

#### Exercices pratiques
- Créer des templates Bicep personnalisés
- Déployer des applications multi-services
- Implémenter des stratégies de déploiement blue-green

**💡 Résultat du chapitre** : Déployer des applications multi-services complexes avec des templates d’infrastructure personnalisés

---

### 🎯 Chapitre 5 : Solutions IA Multi-Agent (Avancé)
**Prérequis** : Chapitres 1-2 terminés  
**Durée** : 2-3 heures  
**Complexité** : ⭐⭐⭐⭐

#### Ce que vous apprendrez
- Modèles d’architecture multi-agent
- Orchestration et coordination d’agents
- Déploiements IA prêts pour la production

#### Ressources d’apprentissage
- **🤖 Projet phare** : [Solution multi-agent retail](examples/retail-scenario.md) - Implémentation complète
- **🛠️ ARM Templates** : [Package ARM Template](../../examples/retail-multiagent-arm-template) - Déploiement en un clic
- **📖 Architecture** : [Modèles de coordination multi-agent](docs/chapter-06-pre-deployment/coordination-patterns.md) - Modèles

#### Exercices pratiques
```bash
# Déployer la solution complète multi-agent pour la vente au détail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorer les configurations des agents
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Résultat du chapitre** : Déployer et gérer une solution IA multi-agent prête pour la production avec agents Client et Inventaire

---

### 🔍 Chapitre 6 : Validation & Planification Pré-Déploiement
**Prérequis** : Chapitre 4 terminé  
**Durée** : 1 heure  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Planification de capacité et validation des ressources
- Stratégies de sélection de SKU
- Vérifications préalables et automatisation

#### Ressources d’apprentissage
- **📊 Planification** : [Planification de capacité](docs/chapter-06-pre-deployment/capacity-planning.md) - Validation des ressources
- **💰 Sélection** : [Sélection de SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Choix économiques
- **✅ Validation** : [Vérifications préalables](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatisés

#### Exercices pratiques
- Exécuter les scripts de validation de capacité
- Optimiser la sélection des SKU pour le coût
- Implémenter des vérifications préalables automatisées

**💡 Résultat du chapitre** : Valider et optimiser les déploiements avant exécution

---

### 🚨 Chapitre 7 : Dépannage & Débogage
**Prérequis** : Tout chapitre de déploiement terminé  
**Durée** : 1-1,5 heure  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Approches systématiques de débogage
- Problèmes courants et solutions
- Dépannage spécifique aux IA

#### Ressources d’apprentissage
- **🔧 Problèmes courants** : [Problèmes courants](docs/chapter-07-troubleshooting/common-issues.md) - FAQ et solutions
- **🕵️ Débogage** : [Guide de débogage](docs/chapter-07-troubleshooting/debugging.md) - Stratégies pas-à-pas
- **🤖 Problèmes IA** : [Dépannage IA spécifique](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problèmes des services IA

#### Exercices pratiques
- Diagnostiquer les échecs de déploiement
- Résoudre les problèmes d’authentification
- Déboguer la connectivité des services IA

**💡 Résultat du chapitre** : Diagnostiquer et résoudre de façon autonome les problèmes de déploiement courants

---

### 🏢 Chapitre 8 : Production & Modèles d’Entreprise
**Prérequis** : Chapitres 1-4 terminés  
**Durée** : 2-3 heures  
**Complexité** : ⭐⭐⭐⭐

#### Ce que vous apprendrez
- Stratégies de déploiement en production
- Modèles de sécurité pour l’entreprise
- Supervision et optimisation des coûts

#### Ressources d’apprentissage
- **🏭 Production** : [Bonnes pratiques IA en production](docs/chapter-08-production/production-ai-practices.md) - Modèles d’entreprise
- **📝 Exemples** : [Exemple microservices](../../examples/microservices) - Architectures complexes
- **📊 Supervision** : [Intégration Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Exercices pratiques
- Mettre en œuvre des modèles de sécurité d’entreprise
- Configurer une supervision complète
- Déployer en production avec bonne gouvernance

**💡 Résultat du chapitre** : Déployer des applications prêtes pour l’entreprise avec toutes les capacités de production

---

## 🎓 Aperçu de l’atelier : Expérience d’apprentissage pratique

> **⚠️ STATUT DE L’ATELIER : Développement en cours**  
> Les matériaux de l’atelier sont en cours de développement et de perfectionnement. Les modules principaux sont fonctionnels, mais certaines sections avancées sont incomplètes. Nous travaillons activement à terminer tout le contenu. [Suivre la progression →](workshop/README.md)

### Matériel d’atelier interactif
**Apprentissage pratique complet avec outils basés navigateur et exercices guidés**
Nos supports d’atelier offrent une expérience d’apprentissage structurée et interactive qui complète le programme basé sur les chapitres ci-dessus. L’atelier est conçu à la fois pour un apprentissage autonome et des sessions animées par un instructeur.

#### 🛠️ Fonctionnalités de l’atelier
- **Interface basée sur le navigateur** : Atelier complet propulsé par MkDocs avec recherche, copier et thèmes
- **Intégration GitHub Codespaces** : Configuration de l’environnement de développement en un clic
- **Parcours d’apprentissage structuré** : Exercices guidés en 8 modules (3-4 heures au total)
- **Méthodologie progressive** : Introduction → Sélection → Validation → Déconstruction → Configuration → Personnalisation → Démantèlement → Conclusion
- **Environnement DevContainer interactif** : Outils et dépendances préconfigurés

#### 📚 Structure des modules de l’atelier
L’atelier suit une **méthodologie progressive en 8 modules** qui vous conduit de la découverte à la maîtrise du déploiement :

| Module | Sujet | Ce que vous ferez | Durée |
|--------|-------|-------------------|-------|
| **0. Introduction** | Présentation de l’atelier | Comprendre les objectifs d’apprentissage, les prérequis, et la structure de l’atelier | 15 min |
| **1. Sélection** | Découverte des modèles | Explorer les modèles AZD et choisir le bon modèle IA pour votre scénario | 20 min |
| **2. Validation** | Déployer et vérifier | Déployer le modèle avec `azd up` et valider que l’infrastructure fonctionne | 30 min |
| **3. Déconstruction** | Comprendre la structure | Utiliser GitHub Copilot pour explorer l’architecture du modèle, les fichiers Bicep, et l’organisation du code | 30 min |
| **4. Configuration** | Analyse approfondie de azure.yaml | Maîtriser la configuration `azure.yaml`, les hooks de cycle de vie, et les variables d’environnement | 30 min |
| **5. Personnalisation** | Faites-le vôtre | Activer AI Search, le traçage, l’évaluation, et personnaliser pour votre scénario | 45 min |
| **6. Démantèlement** | Nettoyage | Déprovisionner en toute sécurité les ressources avec `azd down --purge` | 15 min |
| **7. Conclusion** | Prochaines étapes | Revoir les réalisations, les concepts clés, et poursuivre votre parcours d’apprentissage | 15 min |

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
# Option 1 : GitHub Codespaces (recommandé)
# Cliquez sur "Code" → "Create codespace on main" dans le dépôt

# Option 2 : Développement local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Suivez les instructions d'installation dans workshop/README.md
```
  
#### 🎯 Résultats d’apprentissage de l’atelier  
En terminant l’atelier, les participants pourront :  
- **Déployer des applications IA en production** : Utiliser AZD avec les services Microsoft Foundry  
- **Maîtriser les architectures multi-agents** : Implémenter des solutions d’agents IA coordonnées  
- **Mettre en œuvre les meilleures pratiques de sécurité** : Configurer l’authentification et le contrôle d’accès  
- **Optimiser à l’échelle** : Concevoir des déploiements performants et économiques  
- **Résoudre les problèmes de déploiement** : Diagnostiquer facilement les problèmes courants  

#### 📖 Ressources de l’atelier  
- **🎥 Guide interactif** : [Supports de l’atelier](workshop/README.md) - Environnement d’apprentissage basé sur le navigateur  
- **📋 Instructions module par module** :  
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Vue d’ensemble et objectifs de l’atelier  
  - [1. Sélection](workshop/docs/instructions/1-Select-AI-Template.md) - Trouver et choisir des modèles IA  
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Déployer et valider les modèles  
  - [3. Déconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorer l’architecture du modèle  
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Maîtrise de azure.yaml  
  - [5. Personnalisation](workshop/docs/instructions/5-Customize-AI-Template.md) - Personnaliser pour votre scénario  
  - [6. Démantèlement](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Nettoyer les ressources  
  - [7. Conclusion](workshop/docs/instructions/7-Wrap-up.md) - Revue et prochaines étapes  
- **🛠️ Laboratoire de l’atelier IA** : [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exercices axés sur l’IA  
- **💡 Démarrage rapide** : [Guide de configuration de l’atelier](workshop/README.md#quick-start) - Configuration de l’environnement  

**Parfait pour** : formations en entreprise, cours universitaires, apprentissage autonome, et bootcamps développeurs.

---

## 📖 Approfondissement : capacités d’AZD

Au-delà des bases, AZD fournit des fonctionnalités puissantes pour les déploiements en production :

- **Déploiements basés sur des modèles** - Utilisez des modèles préconstruits pour des schémas d’applications courants  
- **Infrastructure as Code** - Gérez les ressources Azure avec Bicep ou Terraform  
- **Flux de travail intégrés** - Provisionnez, déployez et surveillez les applications sans couture  
- **Convient aux développeurs** - Optimisé pour la productivité et l’expérience des développeurs  

### **AZD + Microsoft Foundry : parfait pour les déploiements IA**

**Pourquoi AZD pour les solutions IA ?** AZD traite les principaux défis rencontrés par les développeurs IA :

- **Modèles prêts pour l’IA** - Modèles préconfigurés pour Azure OpenAI, Cognitive Services et charges ML  
- **Déploiements IA sécurisés** - Modèles de sécurité intégrés pour les services IA, clés API et points de terminaison des modèles  
- **Schémas IA en production** - Bonnes pratiques pour des déploiements d’applications IA évolutifs et économiques  
- **Flux IA de bout en bout** - Du développement du modèle au déploiement en production avec surveillance adaptée  
- **Optimisation des coûts** - Allocation intelligente des ressources et stratégies de mise à l’échelle des charges IA  
- **Intégration Microsoft Foundry** - Connexion transparente au catalogue et points de terminaison Microsoft Foundry  

---

## 🎯 Bibliothèque de modèles et exemples

### En vedette : Modèles Microsoft Foundry  
**Commencez ici si vous déployez des applications IA !**

> **Note :** Ces modèles démontrent divers schémas IA. Certains sont des exemples Azure externes, d’autres des implémentations locales.

| Modèle | Chapitre | Complexité | Services | Type |
|--------|----------|------------|----------|------|
| [**Démarrer avec le chat IA**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapitre 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externe |
| [**Démarrer avec les agents IA**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapitre 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Externe |
| [**Démo Recherche Azure + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapitre 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Stockage | Externe |
| [**Démarrage rapide OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapitre 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externe |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapitre 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externe |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapitre 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externe |
| [**Solution multi-agent Retail**](examples/retail-scenario.md) | Chapitre 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Stockage + Container Apps + Cosmos DB | **Local** |

### En vedette : Scénarios d’apprentissage complets  
**Modèles d’applications prêts pour la production alignés sur les chapitres d’apprentissage**

| Modèle | Chapitre d’apprentissage | Complexité | Apprentissage clé |
|--------|--------------------------|------------|-------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapitre 2 | ⭐ | Schémas de déploiement IA de base |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapitre 2 | ⭐⭐ | Implémentation RAG avec Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapitre 4 | ⭐⭐ | Intégration Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapitre 5 | ⭐⭐⭐ | Framework d’agents et appels de fonction |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapitre 8 | ⭐⭐⭐ | Orchestration IA en entreprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapitre 5 | ⭐⭐⭐⭐ | Architecture multi-agent avec agents Client et Inventaire |

### Apprentissage par type d’exemple

> **📌 Exemples locaux vs externes :**  
> **Exemples locaux** (dans ce dépôt) = prêts à l’usage immédiat  
> **Exemples externes** (Azure Samples) = cloner depuis des dépôts liés

#### Exemples locaux (prêts à l’emploi)  
- [**Solution multi-agent Retail**](examples/retail-scenario.md) - Implémentation complète prête pour la production avec templates ARM  
  - Architecture multi-agent (agents Client + Inventaire)  
  - Surveillance et évaluation complètes  
  - Déploiement en un clic via template ARM  

#### Exemples locaux - Applications conteneurisées (Chapitres 2-5)  
**Exemples complets de déploiement de conteneurs dans ce dépôt :**  
- [**Exemples d'applications conteneurisées**](examples/container-app/README.md) - Guide complet des déploiements conteneurisés  
  - [API Flask simple](../../examples/container-app/simple-flask-api) - API REST basique avec mise à l’échelle à zéro  
  - [Architecture microservices](../../examples/container-app/microservices) - Déploiement multi-service prêt pour la production  
  - Schémas de démarrage rapide, production, et avancés  
  - Conseils sur la surveillance, la sécurité et l’optimisation des coûts  

#### Exemples externes - Applications simples (Chapitres 1-2)  
**Cloner ces dépôts Azure Samples pour démarrer :**  
- [Application Web simple - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Schémas de déploiement basiques  
- [Site statique - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Déploiement de contenu statique  
- [Application conteneurisée - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Déploiement API REST  

#### Exemples externes - Intégration base de données (Chapitres 3-4)  
- [Application base de données - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Schémas de connectivité base de données  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Workflow de données sans serveur  

#### Exemples externes - Schémas avancés (Chapitres 4-8)  
- [Microservices Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architectures multi-services  
- [Jobs dans Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Traitement en arrière-plan  
- [Pipeline ML en entreprise](https://github.com/Azure-Samples/mlops-v2) - Schémas ML prêts pour la production  

### Collections de modèles externes  
- [**Galerie officielle des modèles AZD**](https://azure.github.io/awesome-azd/) - Collection sélectionnée de modèles officiels et communautaires  
- [**Modèles Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentation Microsoft Learn des modèles  
- [**Répertoire des exemples**](examples/README.md) - Exemples locaux d’apprentissage avec explications détaillées  

---

## 📚 Ressources d’apprentissage & références

### Références rapides  
- [**Fiche de commandes**](resources/cheat-sheet.md) - Commandes azd essentielles organisées par chapitre  
- [**Glossaire**](resources/glossary.md) - Terminologie Azure et azd  
- [**FAQ**](resources/faq.md) - Questions fréquentes par chapitre d’apprentissage  
- [**Guide d’étude**](resources/study-guide.md) - Exercices pratiques complets  

### Ateliers pratiques  
- [**Laboratoire AI Workshop**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendre vos solutions IA déployables avec AZD (2-3 heures)  
- [**Atelier interactif**](workshop/README.md) - Exercices guidés en 8 modules avec MkDocs et GitHub Codespaces  
  - Suit : Introduction → Sélection → Validation → Déconstruction → Configuration → Personnalisation → Démantèlement → Conclusion  

### Ressources d’apprentissage externes  
- [Documentation Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Centre d’architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Calculateur de prix Azure](https://azure.microsoft.com/pricing/calculator/)  
- [Statut Azure](https://status.azure.com/)  

---

## 🔧 Guide rapide de dépannage

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

# Configurer pour l'environnement AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Vérifier
az account show
```
</details>

<details>
<summary><strong>❌ "Quota insuffisant" ou "Quota dépassé"</strong></summary>

```bash
# Essayez différentes régions Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ou utilisez des SKU plus petites en développement
# Modifiez infra/main.parameters.json :
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" échoue en cours d’exécution</strong></summary>
```bash
# Option 1 : Nettoyer et réessayer
azd down --force --purge
azd up

# Option 2 : Réparer uniquement l'infrastructure
azd provision

# Option 3 : Vérifier le statut détaillé
azd show

# Option 4 : Consulter les journaux dans Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Échec de l'authentification" ou "Jeton expiré"</strong></summary>

```bash
# Ré-authentifier
az logout
az login

azd auth logout
azd auth login

# Vérifier l'authentification
az account show
```
</details>

<details>
<summary><strong>❌ "La ressource existe déjà" ou conflits de nom</strong></summary>

```bash
# AZD génère des noms uniques, mais en cas de conflit :
azd down --force --purge

# Puis réessayer avec un nouvel environnement
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Déploiement du modèle trop long</strong></summary>

**Temps d'attente normaux :**
- Application web simple : 5-10 minutes
- Application avec base de données : 10-15 minutes
- Applications IA : 15-25 minutes (la mise à disposition OpenAI est lente)

```bash
# Vérifier la progression
azd show

# Si bloqué >30 minutes, vérifier le portail Azure :
azd monitor
# Rechercher les déploiements échoués
```
</details>

<details>
<summary><strong>❌ "Permission refusée" ou "Interdit"</strong></summary>

```bash
# Vérifiez votre rôle Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Vous avez besoin d'au moins le rôle "Contributeur"
# Demandez à votre administrateur Azure d'accorder :
# - Contributeur (pour les ressources)
# - Administrateur d'accès utilisateur (pour les affectations de rôle)
```
</details>

<details>
<summary><strong>❌ Impossible de trouver l'URL de l'application déployée</strong></summary>

```bash
# Afficher tous les points de terminaison du service
azd show

# Ou ouvrir le portail Azure
azd monitor

# Vérifier un service spécifique
azd env get-values
# Chercher les variables *_URL
```
</details>

### 📚 Ressources complètes de dépannage

- **Guide des problèmes courants :** [Solutions détaillées](docs/chapter-07-troubleshooting/common-issues.md)
- **Problèmes spécifiques à l'IA :** [Dépannage IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guide de débogage :** [Débogage étape par étape](docs/chapter-07-troubleshooting/debugging.md)
- **Obtenir de l'aide :** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Achèvement du cours & Certification

### Suivi des progrès
Suivez votre progression d'apprentissage à travers chaque chapitre :

- [ ] **Chapitre 1** : Fondations & Démarrage rapide ✅
- [ ] **Chapitre 2** : Développement AI-First ✅  
- [ ] **Chapitre 3** : Configuration & Authentification ✅
- [ ] **Chapitre 4** : Infrastructure as Code & Déploiement ✅
- [ ] **Chapitre 5** : Solutions AI multi-agents ✅
- [ ] **Chapitre 6** : Validation & Planification pré-déploiement ✅
- [ ] **Chapitre 7** : Dépannage & Débogage ✅
- [ ] **Chapitre 8** : Modèles production & entreprise ✅

### Vérification de l'apprentissage
Après avoir terminé chaque chapitre, vérifiez vos connaissances en :
1. **Exercice pratique** : Terminer le déploiement pratique du chapitre
2. **Vérification des connaissances** : Revoir la section FAQ de votre chapitre
3. **Discussion communautaire** : Partager votre expérience dans Azure Discord
4. **Chapitre suivant** : Passer au niveau de complexité suivant

### Avantages à la fin du cours
Après avoir terminé tous les chapitres, vous disposerez de :
- **Expérience en production** : Applications IA réelles déployées sur Azure
- **Compétences professionnelles** : Capacités de déploiement prêtes pour l'entreprise  
- **Reconnaissance communautaire** : Membre actif de la communauté des développeurs Azure
- **Avancement de carrière** : Expertise AZD et déploiement IA très demandée

---

## 🤝 Communauté & Support

### Obtenir de l'aide & Support
- **Problèmes techniques** : [Signaler des bugs et demander des fonctionnalités](https://github.com/microsoft/azd-for-beginners/issues)
- **Questions d'apprentissage** : [Communauté Microsoft Azure Discord](https://discord.gg/microsoft-azure) et [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Aide spécifique à l'IA** : Rejoignez le [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation** : [Documentation officielle Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Perspectives communautaires du Microsoft Foundry Discord

**Résultats récents du sondage sur le canal #Azure :**
- **45 %** des développeurs veulent utiliser AZD pour les charges de travail IA
- **Principaux défis** : Déploiements multi-services, gestion des identifiants, préparation à la production  
- **Le plus demandé** : Modèles spécifiques à l'IA, guides de dépannage, bonnes pratiques

**Rejoignez notre communauté pour :**
- Partager vos expériences AZD + IA et obtenir de l'aide
- Accéder aux aperçus précoces de nouveaux modèles IA
- Contribuer aux meilleures pratiques de déploiement IA
- Influencer le développement futur des fonctionnalités IA + AZD

### Contribution au cours
Nous accueillons les contributions ! Veuillez lire notre [Guide de Contribution](CONTRIBUTING.md) pour les détails sur :
- **Améliorations de contenu** : Améliorer les chapitres et exemples existants
- **Nouveaux exemples** : Ajouter des scénarios et modèles concrets  
- **Traduction** : Aider à maintenir le support multilingue
- **Rapports de bugs** : Améliorer la précision et la clarté
- **Normes communautaires** : Respecter nos directives communautaires inclusives

---

## 📄 Informations sur le cours

### Licence
Ce projet est sous licence MIT - voir le fichier [LICENSE](../../LICENSE) pour les détails.

### Ressources d'apprentissage Microsoft associées

Notre équipe produit d'autres cours d'apprentissage complets :

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série IA générative
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Apprentissage Fondamental
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigation du cours

**🚀 Prêt à commencer à apprendre ?**

**Débutants** : Commencez par [Chapitre 1 : Fondations & Démarrage rapide](../..)  

**Développeurs IA** : Aller à [Chapitre 2 : Développement IA en priorité](../..)  
**Développeurs expérimentés** : Commencer par [Chapitre 3 : Configuration & Authentification](../..)

**Étapes suivantes** : [Commencer le Chapitre 1 - Bases AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d’assurer l’exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d’origine doit être considéré comme la source faisant autorité. Pour les informations critiques, une traduction humaine professionnelle est recommandée. Nous ne saurions être tenus responsables des malentendus ou interprétations erronées résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->