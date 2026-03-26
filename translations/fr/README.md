# AZD Pour Débutants : Un Parcours d'Apprentissage Structuré

![AZD-for-beginners](../../translated_images/fr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traductions Automatisées (Toujours à Jour)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](./README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Préférez Cloner Localement ?**
>
> Ce dépôt comprend plus de 50 traductions de langues, ce qui augmente significativement la taille du téléchargement. Pour cloner sans les traductions, utilisez le sparse checkout :
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
> Cela vous fournit tout ce dont vous avez besoin pour compléter le cours avec un téléchargement beaucoup plus rapide.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Quoi de Neuf dans azd Aujourd’hui

Azure Developer CLI a dépassé les applications web et APIs traditionnelles. Aujourd’hui, azd est l’outil unique pour déployer **n’importe quelle** application sur Azure — y compris les applications alimentées par l’IA et les agents intelligents.

Voici ce que cela signifie pour vous :

- **Les agents IA sont désormais des charges de travail azd de premier plan.** Vous pouvez initialiser, déployer et gérer des projets d’agents IA en utilisant le même flux `azd init` → `azd up` que vous connaissez déjà.
- **L’intégration Microsoft Foundry** apporte le déploiement de modèles, l’hébergement d’agents et la configuration des services IA directement dans l’écosystème des modèles azd.
- **Le flux de travail principal n’a pas changé.** Que vous déployiez une application de tâches, un microservice, ou une solution IA multi-agent, les commandes restent les mêmes.

Si vous avez déjà utilisé azd, le support IA est une extension naturelle — pas un outil séparé ni une voie avancée. Si vous commencez, vous apprendrez un seul flux qui fonctionne pour tout.

---

## 🚀 Qu’est-ce que Azure Developer CLI (azd) ?

**Azure Developer CLI (azd)** est un outil en ligne de commande convivial qui facilite le déploiement d’applications sur Azure. Au lieu de créer et connecter manuellement des dizaines de ressources Azure, vous pouvez déployer des applications entières avec une seule commande.

### La Magie de `azd up`

```bash
# Cette seule commande fait tout :
# ✅ Crée toutes les ressources Azure
# ✅ Configure le réseau et la sécurité
# ✅ Construit le code de votre application
# ✅ Déploie sur Azure
# ✅ Vous fournit une URL fonctionnelle
azd up
```

**C’est tout !** Pas de clics sur le portail Azure, pas besoin d’apprendre des templates ARM complexes, pas de configuration manuelle – juste des applications fonctionnelles sur Azure.

---

## ❓ Azure Developer CLI vs Azure CLI : Quelle est la Différence ?

C’est la question la plus fréquente chez les débutants. Voici la réponse simple :

| Fonctionnalité | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|----------------|----------------------|---------------------------------|
| **But** | Gérer des ressources Azure individuelles | Déployer des applications complètes |
| **Approche** | Orienté infrastructure | Orienté application |
| **Exemple** | `az webapp create --name myapp...` | `azd up` |
| **Courbe d’apprentissage** | Connaître les services Azure | Connaître votre application |
| **Idéal pour** | DevOps, Infrastructure | Développeurs, Prototypage |

### Analogie Simple

- **Azure CLI** est comme avoir tous les outils pour construire une maison – marteaux, scies, clous. Vous pouvez tout construire, mais vous devez connaître la construction.
- **Azure Developer CLI** est comme engager un entrepreneur – vous décrivez ce que vous voulez, et il s’occupe de la construction.

### Quand Utiliser Chaque Outil

| Scénario | Utilisez Ceci |
|----------|--------------|
| « Je veux déployer mon application web rapidement » | `azd up` |
| « Je dois juste créer un compte de stockage » | `az storage account create` |
| « Je construis une application IA complète » | `azd init --template azure-search-openai-demo` |
| « Je dois déboguer une ressource Azure spécifique » | `az resource show` |
| « Je veux un déploiement prêt pour la production en quelques minutes » | `azd up --environment production` |

### Ils Fonctionnent Ensemble !

AZD utilise Azure CLI en arrière-plan. Vous pouvez utiliser les deux :
```bash
# Déployez votre application avec AZD
azd up

# Ensuite, affinez des ressources spécifiques avec Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Trouvez des Modèles dans Awesome AZD

Ne commencez pas de zéro ! **Awesome AZD** est la collection communautaire de modèles prêts à déployer :

| Ressource | Description |
|-----------|-------------|
| 🔗 [**Galerie Awesome AZD**](https://azure.github.io/awesome-azd/) | Parcourez plus de 200 modèles avec déploiement en un clic |
| 🔗 [**Soumettre un Modèle**](https://github.com/Azure/awesome-azd/issues) | Contribuez votre propre modèle pour la communauté |
| 🔗 [**Dépôt GitHub**](https://github.com/Azure/awesome-azd) | Étoilez et explorez la source |

### Modèles IA Populaires de Awesome AZD

```bash
# Chat RAG avec les modèles Microsoft Foundry + recherche IA
azd init --template azure-search-openai-demo

# Application de chat IA rapide
azd init --template openai-chat-app-quickstart

# Agents d'IA avec les agents Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Démarrer en 3 Étapes

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

### Étape 2 : Se Connecter à Azure

```bash
azd auth login
```

### Étape 3 : Déployer Votre Première Application

```bash
# Initialiser à partir d'un modèle
azd init --template todo-nodejs-mongo

# Déployer sur Azure (crée tout !)
azd up
```

**🎉 C’est tout !** Votre application est maintenant en ligne sur Azure.

### Nettoyage (N’oubliez pas !)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Comment Utiliser Ce Cours

Ce cours est conçu pour un **apprentissage progressif** – commencez où vous êtes à l’aise et progressez :

| Votre Expérience | Commencez Ici |
|-----------------|---------------|
| **Débutant complet sur Azure** | [Chapitre 1 : Fondations](#-chapter-1-foundation--quick-start) |
| **Connaît Azure, nouveau sur AZD** | [Chapitre 1 : Fondations](#-chapter-1-foundation--quick-start) |
| **Veut déployer des applications IA** | [Chapitre 2 : Développement IA-Premier](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Veut de la pratique concrète** | [🎓 Atelier Interactif](workshop/README.md) – laboratoire guidé de 3-4 heures |
| **Besoin de modèles pour la production** | [Chapitre 8 : Production & Entreprise](#-chapter-8-production--enterprise-patterns) |

### Installation Rapide

1. **Forkez ce dépôt** : [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonez-le** : `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtenez de l’aide** : [Communauté Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Préférez Cloner Localement ?**

> Ce dépôt comprend plus de 50 traductions de langues, ce qui augmente significativement la taille du téléchargement. Pour cloner sans les traductions, utilisez le sparse checkout :
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Cela vous fournit tout ce dont vous avez besoin pour compléter le cours avec un téléchargement beaucoup plus rapide.


## Aperçu du Cours

Maîtrisez Azure Developer CLI (azd) grâce à des chapitres structurés conçus pour un apprentissage progressif. **Focus spécial sur le déploiement d’applications IA avec intégration Microsoft Foundry.**

### Pourquoi Ce Cours est Essentiel pour les Développeurs Modernes

Basé sur les retours de la communauté Microsoft Foundry Discord, **45% des développeurs souhaitent utiliser AZD pour les charges de travail IA** mais rencontrent des difficultés avec :
- Architectures IA multi-services complexes
- Bonnes pratiques pour le déploiement IA en production  
- Intégration et configuration des services Azure IA
- Optimisation des coûts pour charges IA
- Résolution de problèmes spécifiques au déploiement IA

### Objectifs d’Apprentissage

En complétant ce cours structuré, vous allez :
- **Maîtriser les Fondamentaux d’AZD** : Concepts clés, installation, configuration
- **Déployer des Applications IA** : Utiliser AZD avec les services Microsoft Foundry
- **Implémenter Infrastructure as Code** : Gérer les ressources Azure avec des templates Bicep
- **Résoudre les Problèmes de Déploiement** : Traiter les erreurs courantes et déboguer
- **Optimiser pour la Production** : Sécurité, montée en charge, surveillance, gestion des coûts
- **Construire des Solutions Multi-Agent** : Déployer des architectures IA complexes

## 🗺️ Carte du Cours : Navigation Rapide par Chapitre

Chaque chapitre a un README dédié avec objectifs d’apprentissage, démarrages rapides et exercices :

| Chapitre | Sujet | Leçons | Durée | Complexité |
|----------|-------|---------|-------|------------|
| **[Ch 1 : Fondations](docs/chapter-01-foundation/README.md)** | Premiers Pas | [Bases d’AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Premier Projet](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2 : Développement IA](docs/chapter-02-ai-development/README.md)** | Applications AI-First | [Intégration Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agents IA](docs/chapter-02-ai-development/agents.md) &#124; [Déploiement de Modèle](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Atelier](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 h | ⭐⭐ |
| **[Ch 3 : Configuration](docs/chapter-03-configuration/README.md)** | Authentification & Sécurité | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Authentification & Sécurité](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4 : Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Déploiement | [Guide de Déploiement](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 h | ⭐⭐⭐ |
| **[Ch 5 : Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Solutions Agents IA | [Scénario Retail](examples/retail-scenario.md) &#124; [Modèles de Coordination](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 h | ⭐⭐⭐⭐ |
| **[Ch 6 : Pré-Déploiement](docs/chapter-06-pre-deployment/README.md)** | Planification & Validation | [Vérifications Préliminaires](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planification de Capacité](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Sélection SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 h | ⭐⭐ |
| **[Ch 7 : Dépannage](docs/chapter-07-troubleshooting/README.md)** | Debug & Correction | [Problèmes Courants](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problèmes IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 h | ⭐⭐ |
| **[Ch 8 : Production](docs/chapter-08-production/README.md)** | Modèles Entreprise | [Pratiques de Production](docs/chapter-08-production/production-ai-practices.md) | 2-3 h | ⭐⭐⭐⭐ |
| **[🎓 Atelier](workshop/README.md)** | Laboratoire Pratique | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Sélection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Déconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personnalisation](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Démantèlement](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Conclusion](workshop/docs/instructions/7-Wrap-up.md) | 3-4 h | ⭐⭐ |

**Durée Totale du Cours :** ~10-14 heures | **Progression de Compétences :** Débutant → Prêt pour la Production

---

## 📚 Chapitres d'Apprentissage

*Sélectionnez votre parcours d’apprentissage selon votre niveau d’expérience et vos objectifs*

### 🚀 Chapitre 1 : Fondations & Démarrage Rapide  
**Prérequis** : Abonnement Azure, connaissances de base en ligne de commande  
**Durée** : 30-45 minutes  
**Complexité** : ⭐

#### Ce que vous apprendrez  
- Comprendre les fondamentaux d’Azure Developer CLI  
- Installer AZD sur votre plateforme  
- Votre premier déploiement réussi  

#### Ressources d’apprentissage  
- **🎯 Commencez ici** : [Qu’est-ce que Azure Developer CLI ?](#what-is-azure-developer-cli)  
- **📖 Théorie** : [Bases d’AZD](docs/chapter-01-foundation/azd-basics.md) - Concepts et terminologie clés  
- **⚙️ Installation** : [Installation & Configuration](docs/chapter-01-foundation/installation.md) - Guides spécifiques à la plateforme  
- **🛠️ Pratique** : [Votre Premier Projet](docs/chapter-01-foundation/first-project.md) - Tutoriel pas à pas  
- **📋 Référence Rapide** : [Fiche Référence Commandes](resources/cheat-sheet.md)

#### Exercices Pratiques  
```bash
# Vérification rapide de l'installation
azd version

# Déployez votre première application
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 Résultat du Chapitre** : Déployer avec succès une application web simple sur Azure avec AZD

**✅ Validation de la Réussite :**  
```bash
# Après avoir terminé le Chapitre 1, vous devriez être capable de :
azd version              # Affiche la version installée
azd init --template todo-nodejs-mongo  # Initialise le projet
azd up                  # Déploie sur Azure
azd show                # Affiche l'URL de l'application en cours d'exécution
# L'application s'ouvre dans le navigateur et fonctionne
azd down --force --purge  # Nettoie les ressources
```
  
**📊 Temps Investi :** 30-45 minutes  
**📈 Niveau de Compétence Après :** Capable de déployer des applications basiques de manière autonome

---

### 🤖 Chapitre 2 : Développement AI-First (Recommandé pour développeurs IA)  
**Prérequis** : Chapitre 1 terminé  
**Durée** : 1-2 heures  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez  
- Intégration Microsoft Foundry avec AZD  
- Déploiement d’applications alimentées par IA  
- Comprendre les configurations des services IA  

#### Ressources d’apprentissage  
- **🎯 Commencez ici** : [Intégration Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 Agents IA** : [Guide des Agents IA](docs/chapter-02-ai-development/agents.md) - Déployer des agents intelligents avec AZD  
- **📖 Modèles** : [Déploiement de Modèles IA](docs/chapter-02-ai-development/ai-model-deployment.md) - Déployer et gérer des modèles IA  
- **🛠️ Atelier** : [Laboratoire AI](docs/chapter-02-ai-development/ai-workshop-lab.md) - Préparer vos solutions IA pour AZD  
- **🎥 Guide Interactif** : [Matériel de l’Atelier](workshop/README.md) - Apprentissage navigateur avec MkDocs * Environnement DevContainer  
- **📋 Templates** : [Templates Microsoft Foundry](#ressources-de-latelier)  
- **📝 Exemples** : [Exemples de Déploiement AZD](examples/README.md)

#### Exercices Pratiques  
```bash
# Déployez votre première application IA
azd init --template azure-search-openai-demo
azd up

# Essayez des modèles d'IA supplémentaires
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 Résultat du Chapitre** : Déployer et configurer une application de chat alimentée par IA avec capacités RAG

**✅ Validation de la Réussite :**  
```bash
# Après le Chapitre 2, vous devriez être capable de :
azd init --template azure-search-openai-demo
azd up
# Tester l'interface de chat IA
# Poser des questions et obtenir des réponses alimentées par IA avec sources
# Vérifier que l'intégration de la recherche fonctionne
azd monitor  # Vérifier qu'Application Insights affiche la télémétrie
azd down --force --purge
```
  
**📊 Temps Investi :** 1-2 heures  
**📈 Niveau de Compétence Après :** Capable de déployer et configurer des applications IA prêtes pour la production  
**💰 Conscience des Coûts :** Comprendre les coûts dev de 80-150$/mois, coûts production de 300-3500$/mois

#### 💰 Considérations de Coût pour les Déploiements IA

**Environnement de Développement (Estimé à 80-150$/mois) :**  
- Modèles Microsoft Foundry (Paiement à l’usage) : 0-50$/mois (selon usage tokens)  
- Recherche IA (niveau basique) : 75$/mois  
- Container Apps (Consommation) : 0-20$/mois  
- Stockage (standard) : 1-5$/mois

**Environnement de Production (Estimé à 300-3500+$/mois) :**  
- Modèles Microsoft Foundry (PTU pour performance constante) : 3000+$/mois OU paiement à l’usage haut volume  
- Recherche IA (niveau standard) : 250$/mois  
- Container Apps (dédié) : 50-100$/mois  
- Application Insights : 5-50$/mois  
- Stockage (premium) : 10-50$/mois

**💡 Astuces d’Optimisation des Coûts :**  
- Utilisez les modèles Microsoft Foundry en **niveau gratuit** pour apprendre (Azure OpenAI 50 000 tokens/mois inclus)  
- Lancez `azd down` pour désallouer les ressources quand vous ne développez pas activement  
- Commencez par une facturation à la consommation, passez au PTU uniquement en production  
- Utilisez `azd provision --preview` pour estimer les coûts avant déploiement  
- Activez l’auto-scaling : payez seulement l’usage réel  

**Suivi des Coûts :**  
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
- Bonnes pratiques d’authentification et sécurité  
- Nomination et organisation des ressources  

#### Ressources d’apprentissage  
- **📖 Configuration** : [Guide de Configuration](docs/chapter-03-configuration/configuration.md) - Mise en place d’environnement  
- **🔐 Sécurité** : [Modèles d’authentification et identité gérée](docs/chapter-03-configuration/authsecurity.md) - Modèles d’authentification  
- **📝 Exemples** : [Exemple d’Application Base de Données](examples/database-app/README.md) - Exemples de bases de données AZD

#### Exercices Pratiques  
- Configurer plusieurs environnements (dev, staging, prod)  
- Mettre en place l’authentification par identité gérée  
- Implémenter des configurations spécifiques à l’environnement  

**💡 Résultat du Chapitre** : Gérer plusieurs environnements avec authentification et sécurité appropriées

---

### 🏗️ Chapitre 4 : Infrastructure en tant que Code & Déploiement  
**Prérequis** : Chapitres 1-3 terminés  
**Durée** : 1-1,5 heures  
**Complexité** : ⭐⭐⭐

#### Ce que vous apprendrez  
- Modèles avancés de déploiement  
- Infrastructure as Code avec Bicep  
- Stratégies de provisionnement de ressources  

#### Ressources d’apprentissage  
- **📖 Déploiement** : [Guide de Déploiement](docs/chapter-04-infrastructure/deployment-guide.md) - Flux complets  
- **🏗️ Provisioning** : [Provisionnement des Ressources](docs/chapter-04-infrastructure/provisioning.md) - Gestion Azure resources  
- **📝 Exemples** : [Exemple Container App](../../examples/container-app) - Déploiements containerisés

#### Exercices Pratiques  
- Créer des templates Bicep personnalisés  
- Déployer des applications multi-services  
- Implémenter des stratégies de déploiement blue-green  

**💡 Résultat du Chapitre** : Déployer des applications complexes multi-services avec des templates infrastructure personnalisés

---

### 🎯 Chapitre 5 : Solutions Multi-Agent IA (Avancé)  
**Prérequis** : Chapitres 1-2 terminés  
**Durée** : 2-3 heures  
**Complexité** : ⭐⭐⭐⭐

#### Ce que vous apprendrez  
- Modèles d’architecture multi-agent  
- Orchestration et coordination des agents  
- Déploiements IA prêts pour production  

#### Ressources d’apprentissage  
- **🤖 Projet Mis en avant** : [Solution Multi-Agent Retail](examples/retail-scenario.md) - Implémentation complète  
- **🛠️ Templates ARM** : [Package Template ARM](../../examples/retail-multiagent-arm-template) - Déploiement en un clic  
- **📖 Architecture** : [Modèles de coordination multi-agent](docs/chapter-06-pre-deployment/coordination-patterns.md) - Modèles

#### Exercices Pratiques  
```bash
# Déployer la solution multi-agent complète pour le commerce de détail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorer les configurations des agents
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Résultat du Chapitre** : Déployer et gérer une solution IA multi-agent prête pour la production avec agents Client et Inventaire

---

### 🔍 Chapitre 6 : Validation & Planification Pré-Déploiement  
**Prérequis** : Chapitre 4 terminé  
**Durée** : 1 heure  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez  
- Planification de capacité et validation des ressources  
- Stratégies de sélection SKU  
- Vérifications préalables et automatisation  

#### Ressources d’apprentissage  
- **📊 Planification** : [Planification de Capacité](docs/chapter-06-pre-deployment/capacity-planning.md) - Validation des ressources  
- **💰 Sélection** : [Sélection SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Choix rentables  
- **✅ Validation** : [Vérifications Préliminaires](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatisés

#### Exercices Pratiques  
- Exécuter des scripts de validation de capacité  
- Optimiser la sélection des SKU pour réduire les coûts  
- Implémenter des vérifications préalables automatisées  

**💡 Résultat du Chapitre** : Valider et optimiser les déploiements avant exécution

---

### 🚨 Chapitre 7 : Dépannage & Debugging  
**Prérequis** : Tout chapitre de déploiement terminé  
**Durée** : 1-1,5 heures  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez  
- Approches systématiques de débogage  
- Problèmes courants et solutions  
- Dépannage spécifique aux services IA  

#### Ressources d’apprentissage  
- **🔧 Problèmes Courants** : [Problèmes Courants](docs/chapter-07-troubleshooting/common-issues.md) - FAQ et solutions  
- **🕵️ Débogage** : [Guide de Debugging](docs/chapter-07-troubleshooting/debugging.md) - Stratégies pas à pas  
- **🤖 Problèmes IA** : [Dépannage IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problèmes de service IA

#### Exercices Pratiques  
- Diagnostiquer les échecs de déploiement  
- Résoudre les problèmes d’authentification  
- Debugger la connectivité des services IA  

**💡 Résultat du Chapitre** : Diagnostiquer et résoudre de manière autonome les problèmes courants de déploiement

---

### 🏢 Chapitre 8 : Production & Modèles d’Entreprise  
**Prérequis** : Chapitres 1-4 terminés  
**Durée** : 2-3 heures  
**Complexité** : ⭐⭐⭐⭐

#### Ce que vous apprendrez  
- Stratégies de déploiement en production  
- Modèles de sécurité entreprise  
- Surveillance et optimisation des coûts  

#### Ressources d’apprentissage
- **🏭 Production** : [Bonnes pratiques de production en IA](docs/chapter-08-production/production-ai-practices.md) - Modèles d'entreprise
- **📝 Exemples** : [Exemple de microservices](../../examples/microservices) - Architectures complexes  
- **📊 Surveillance** : [Intégration Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Surveillance

#### Exercices pratiques  
- Mettre en œuvre des modèles de sécurité d'entreprise  
- Configurer une surveillance complète  
- Déployer en production avec une gouvernance appropriée

**💡 Résultat du chapitre** : Déployer des applications prêtes pour l'entreprise avec toutes les capacités de production

---

## 🎓 Aperçu de l'atelier : Expérience d'apprentissage pratique

> **⚠️ STATUT DE L'ATELIER : Développement actif**  
> Les supports de l'atelier sont en cours de développement et de perfectionnement. Les modules principaux sont fonctionnels, mais certaines sections avancées sont incomplètes. Nous travaillons activement à terminer tout le contenu. [Suivez les progrès →](workshop/README.md)

### Matériel interactif de l'atelier  
**Apprentissage pratique complet avec des outils basés sur navigateur et des exercices guidés**

Nos supports d'atelier offrent une expérience d'apprentissage structurée et interactive qui complète le programme par chapitre présenté ci-dessus. L'atelier est conçu aussi bien pour l'apprentissage autonome que pour les sessions dirigées par un instructeur.

#### 🛠️ Fonctionnalités de l'atelier  
- **Interface basée sur navigateur** : Atelier complet propulsé par MkDocs avec recherche, copie et thèmes  
- **Intégration GitHub Codespaces** : Configuration de l'environnement de développement en un clic  
- **Parcours d'apprentissage structuré** : 8 modules d'exercices guidés (3-4 heures au total)  
- **Méthodologie progressive** : Introduction → Sélection → Validation → Déconstruction → Configuration → Personnalisation → Nettoyage → Conclusion  
- **Environnement DevContainer interactif** : Outils et dépendances préconfigurés

#### 📚 Structure du module de l'atelier  
L'atelier suit une **méthodologie progressive en 8 modules** qui vous guide de la découverte à la maîtrise du déploiement :

| Module | Sujet | Ce que vous ferez | Durée |
|--------|-------|-------------------|-------|
| **0. Introduction** | Aperçu de l'atelier | Comprendre les objectifs d'apprentissage, les prérequis et la structure de l'atelier | 15 min |
| **1. Sélection** | Découverte de modèles | Explorer les modèles AZD et sélectionner le bon modèle IA pour votre scénario | 20 min |
| **2. Validation** | Déployer et vérifier | Déployer le modèle avec `azd up` et valider que l'infrastructure fonctionne | 30 min |
| **3. Déconstruction** | Comprendre la structure | Utiliser GitHub Copilot pour explorer l’architecture du modèle, les fichiers Bicep et l'organisation du code | 30 min |
| **4. Configuration** | Analyse approfondie de azure.yaml | Maîtriser la configuration `azure.yaml`, les hooks du cycle de vie et les variables d’environnement | 30 min |
| **5. Personnalisation** | Rendez-le vôtre | Activer la recherche IA, le traçage, l’évaluation, et personnaliser selon votre scénario | 45 min |
| **6. Nettoyage** | Nettoyer | Déprovisionner en toute sécurité les ressources avec `azd down --purge` | 15 min |
| **7. Conclusion** | Étapes suivantes | Revoir les réalisations, concepts clés, et poursuivre votre parcours d'apprentissage | 15 min |

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
# Option 1 : GitHub Codespaces (Recommandé)
# Cliquez sur "Code" → "Créer un espace de codes sur main" dans le dépôt

# Option 2 : Développement local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Suivez les instructions d'installation dans workshop/README.md
```
  
#### 🎯 Résultats d’apprentissage de l’atelier  
En complétant l’atelier, les participants pourront :  
- **Déployer des applications IA en production** : Utiliser AZD avec les services Microsoft Foundry  
- **Maîtriser les architectures multi-agents** : Mettre en œuvre des solutions coordonnées d’agents IA  
- **Appliquer les meilleures pratiques de sécurité** : Configurer authentification et contrôle d’accès  
- **Optimiser pour la montée en charge** : Concevoir des déploiements performants et économiques  
- **Résoudre les problèmes de déploiement** : Diagnostiquer et corriger les problèmes courants de manière autonome

#### 📖 Ressources de l'atelier  
- **🎥 Guide interactif** : [Matériel de l’atelier](workshop/README.md) - Environnement d’apprentissage basé sur navigateur  
- **📋 Instructions module par module** :  
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Aperçu et objectifs  
  - [1. Sélection](workshop/docs/instructions/1-Select-AI-Template.md) - Trouver et choisir des modèles IA  
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Déployer et valider les modèles  
  - [3. Déconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorer l’architecture des modèles  
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Maîtriser azure.yaml  
  - [5. Personnalisation](workshop/docs/instructions/5-Customize-AI-Template.md) - Personnaliser selon votre scénario  
  - [6. Nettoyage](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Nettoyer les ressources  
  - [7. Conclusion](workshop/docs/instructions/7-Wrap-up.md) - Revue et prochaines étapes  
- **🛠️ Laboratoire d’atelier IA** : [Laboratoire d’atelier IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exercices focalisés sur l’IA  
- **💡 Démarrage rapide** : [Guide de configuration de l’atelier](workshop/README.md#quick-start) - Configuration de l’environnement

**Idéal pour** : Formation en entreprise, cours universitaires, apprentissage autonome, bootcamps pour développeurs.

---

## 📖 Approfondissement : Capacités d’AZD

Au-delà des bases, AZD offre des fonctionnalités puissantes pour les déploiements en production :

- **Déploiements basés sur des modèles** - Utiliser des modèles préconstruits pour les motifs applicatifs courants  
- **Infrastructure as Code** - Gérer les ressources Azure avec Bicep ou Terraform  
- **Flux de travail intégrés** - Provisionner, déployer et surveiller les applications de manière fluide  
- **Orientation développeur** - Optimisé pour la productivité et l’expérience des développeurs

### **AZD + Microsoft Foundry : Parfait pour les déploiements IA**

**Pourquoi AZD pour les solutions IA ?** AZD répond aux principaux défis des développeurs IA :

- **Modèles prêts pour l’IA** - Modèles préconfigurés pour Microsoft Foundry Models, Cognitive Services et charges de travail ML  
- **Déploiements IA sécurisés** - Modèles de sécurité intégrés pour les services IA, clés API, et points d'extrémité de modèles  
- **Modèles de production IA** - Meilleures pratiques pour les déploiements d’applications IA évolutifs et économiques  
- **Flux de travail IA de bout en bout** - Du développement du modèle au déploiement en production avec surveillance appropriée  
- **Optimisation des coûts** - Stratégies intelligentes d’allocation et de montée en charge des ressources IA  
- **Intégration Microsoft Foundry** - Connexion transparente au catalogue de modèles et points d’extrémité Microsoft Foundry

---

## 🎯 Bibliothèque de modèles et d’exemples

### À la une : Modèles Microsoft Foundry  
**Commencez ici si vous déployez des applications IA !**

> **Note :** Ces modèles montrent divers motifs IA. Certains sont des exemples Azure externes, d’autres des implémentations locales.

| Modèle | Chapitre | Complexité | Services | Type |
|--------|----------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapitre 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externe |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapitre 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Externe |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapitre 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Stockage | Externe |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapitre 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externe |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapitre 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externe |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapitre 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externe |
| [**Solution multi-agent Retail**](examples/retail-scenario.md) | Chapitre 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Stockage + Container Apps + Cosmos DB | **Local** |

### À la une : Scénarios d’apprentissage complets  
**Modèles d’applications prêtes pour la production associées aux chapitres d’apprentissage**

| Modèle | Chapitre d’apprentissage | Complexité | Apprentissage clé |
|--------|--------------------------|------------|-------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapitre 2 | ⭐ | Motifs de déploiement IA de base |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapitre 2 | ⭐⭐ | Implémentation RAG avec Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapitre 4 | ⭐⭐ | Intégration Intelligence documentaire |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapitre 5 | ⭐⭐⭐ | Framework agent et appels de fonction |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapitre 8 | ⭐⭐⭐ | Orchestration IA d’entreprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapitre 5 | ⭐⭐⭐⭐ | Architecture multi-agent avec agents client et inventaire |

### Apprentissage par type d’exemple

> **📌 Exemples locaux vs externes :**  
> **Exemples locaux** (dans ce dépôt) = Prêts à l’emploi  
> **Exemples externes** (Azure Samples) = À cloner depuis les dépôts liés

#### Exemples locaux (prêts à l’usage)  
- [**Solution multi-agent Retail**](examples/retail-scenario.md) - Implémentation complète prête pour la production avec modèles ARM  
  - Architecture multi-agent (agents Client + Inventaire)  
  - Surveillance et évaluation complètes  
  - Déploiement en un clic via modèle ARM

#### Exemples locaux - Applications conteneurisées (Chapitres 2-5)  
**Exemples complets de déploiements conteneurisés dans ce dépôt :**  
- [**Exemples d’applications conteneurisées**](examples/container-app/README.md) - Guide complet du déploiement en conteneur  
  - [API Flask simple](../../examples/container-app/simple-flask-api) - API REST de base avec montée en charge à zéro  
  - [Architecture microservices](../../examples/container-app/microservices) - Déploiement multi-service prêt pour la production  
  - Motifs de démarrage rapide, production et avancés  
  - Guidance pour surveillance, sécurité et optimisation des coûts

#### Exemples externes - Applications simples (Chapitres 1-2)  
**Clonez ces dépôts Azure Samples pour commencer :**  
- [Application Web simple - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Modèles de déploiement basiques  
- [Site statique - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Déploiement de contenu statique  
- [Application conteneurisée - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Déploiement API REST

#### Exemples externes - Intégration base de données (Chapitres 3-4)  
- [Application base de données - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Modèles de connectivité base de données  
- [Fonctions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flux de travail données serverless

#### Exemples externes - Modèles avancés (Chapitres 4-8)  
- [Microservices Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architectures multi-service  
- [Jobs Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Traitement en arrière-plan  
- [Pipeline ML d’entreprise](https://github.com/Azure-Samples/mlops-v2) - Modèles ML prêts pour la production

### Collections de modèles externes  
- [**Galerie officielle des modèles AZD**](https://azure.github.io/awesome-azd/) - Collection sélectionnée de modèles officiels et communautaires  
- [**Modèles Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentation des modèles Microsoft Learn  
- [**Répertoire des exemples**](examples/README.md) - Exemples d’apprentissage locaux avec explications détaillées

---

## 📚 Ressources d’apprentissage & références

### Références rapides  
- [**Cheat Sheet des commandes**](resources/cheat-sheet.md) - Commandes azd essentielles organisées par chapitre  
- [**Glossaire**](resources/glossary.md) - Terminologie Azure et azd  
- [**FAQ**](resources/faq.md) - Questions fréquentes organisées par chapitre d’apprentissage  
- [**Guide d’étude**](resources/study-guide.md) - Exercices pratiques complets

### Ateliers pratiques  
- [**Laboratoire d’atelier IA**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendre vos solutions IA déployables avec AZD (2-3 heures)  
- [**Atelier interactif**](workshop/README.md) - 8 modules d’exercices guidés avec MkDocs et GitHub Codespaces  
  - Suivi : Introduction → Sélection → Validation → Déconstruction → Configuration → Personnalisation → Nettoyage → Conclusion

### Ressources externes d’apprentissage
- [Documentation Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centre d'architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculateur de prix Azure](https://azure.microsoft.com/pricing/calculator/)
- [Statut Azure](https://status.azure.com/)

### Compétences des agents IA pour votre éditeur
- [**Compétences Microsoft Azure sur skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 compétences ouvertes pour agents Azure AI, Foundry, déploiement, diagnostics, optimisation des coûts, et plus encore. Installez-les dans GitHub Copilot, Cursor, Claude Code, ou tout agent supporté :
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guide rapide de dépannage

**Problèmes fréquents rencontrés par les débutants et solutions immédiates :**

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

# Ou utilisez des SKU plus petits en développement
# Modifiez infra/main.parameters.json :
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ Échec de "azd up" en cours d'exécution</strong></summary>

```bash
# Option 1 : Nettoyer et réessayer
azd down --force --purge
azd up

# Option 2 : Corriger uniquement l'infrastructure
azd provision

# Option 3 : Vérifier le statut détaillé
azd show

# Option 4 : Vérifier les journaux dans Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Échec d'authentification" ou "Jeton expiré"</strong></summary>

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
<summary><strong>❌ "La ressource existe déjà" ou conflits de noms</strong></summary>

```bash
# AZD génère des noms uniques, mais en cas de conflit :
azd down --force --purge

# Ensuite, réessayez avec un nouvel environnement
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Déploiement du template trop long</strong></summary>

**Temps d'attente normaux :**
- Application web simple : 5-10 minutes
- Application avec base de données : 10-15 minutes
- Applications IA : 15-25 minutes (approvisionnement OpenAI lent)

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
# - Administrateur d'accès utilisateur (pour les attributions de rôle)
```
</details>

<details>
<summary><strong>❌ URL de l'application déployée introuvable</strong></summary>

```bash
# Afficher tous les points de terminaison du service
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
- **Guide de débogage :** [Débogage étape par étape](docs/chapter-07-troubleshooting/debugging.md)
- **Obtenir de l’aide :** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Fin de cours & Certification

### Suivi de progression
Suivez votre progression d’apprentissage à travers chaque chapitre :

- [ ] **Chapitre 1** : Fondations & Démarrage rapide ✅
- [ ] **Chapitre 2** : Développement Prioritaire IA ✅  
- [ ] **Chapitre 3** : Configuration & Authentification ✅
- [ ] **Chapitre 4** : Infrastructure as Code & Déploiement ✅
- [ ] **Chapitre 5** : Solutions IA multi-agents ✅
- [ ] **Chapitre 6** : Validation & Planification pré-déploiement ✅
- [ ] **Chapitre 7** : Dépannage & Débogage ✅
- [ ] **Chapitre 8** : Modèles de production & entreprise ✅

### Vérification des connaissances
Après chaque chapitre, vérifiez vos acquis en :
1. **Exercice pratique** : Réaliser le déploiement manuel du chapitre
2. **Contrôle des connaissances** : Consulter la FAQ du chapitre
3. **Discussion communautaire** : Partager votre expérience sur Azure Discord
4. **Chapitre suivant** : Passer au niveau de complexité suivant

### Avantages à la fin du cours
Une fois tous les chapitres terminés, vous aurez :
- **Expérience en production** : Déployé de véritables applications IA sur Azure
- **Compétences professionnelles** : Capacités de déploiement prêtes pour l’entreprise  
- **Reconnaissance communautaire** : Membre actif de la communauté des développeurs Azure
- **Avancement de carrière** : Expertise AZD et IA en demande

---

## 🤝 Communauté & Support

### Obtenir de l’aide & Support
- **Problèmes techniques** : [Signaler bugs et demander des fonctionnalités](https://github.com/microsoft/azd-for-beginners/issues)
- **Questions d’apprentissage** : [Communauté Microsoft Azure Discord](https://discord.gg/microsoft-azure) et [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Aide spécifique IA** : Rejoignez le [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation** : [Documentation officielle Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Aperçus communautaires du Discord Microsoft Foundry

**Résultats récents du sondage sur le canal #Azure :**
- **45 %** des développeurs veulent utiliser AZD pour les charges de travail IA
- **Principaux défis** : Déploiements multi-services, gestion des identifiants, préparation en production  
- **Plus demandés** : Templates IA, guides de dépannage, meilleures pratiques

**Rejoignez notre communauté pour :**
- Partager vos expériences AZD + IA et obtenir de l’aide
- Accéder aux aperçus anticipés des nouveaux templates IA
- Contribuer aux meilleures pratiques de déploiement IA
- Influencer le développement futur des fonctionnalités IA + AZD

### Contribution au cours
Nous accueillons les contributions ! Veuillez lire notre [Guide de Contribution](CONTRIBUTING.md) pour plus de détails sur :
- **Améliorations de contenu** : Améliorer chapitres et exemples existants
- **Nouveaux exemples** : Ajouter des scénarios réels et des templates  
- **Traduction** : Aider à maintenir le support multilingue
- **Rapports de bugs** : Améliorer précision et clarté
- **Normes communautaires** : Respecter nos directives inclusives

---

## 📄 Informations sur le cours

### Licence
Ce projet est sous licence MIT - voir le fichier [LICENSE](../../LICENSE) pour plus de détails.

### Ressources Microsoft Learning associées

Notre équipe produit d’autres cours d’apprentissage complets :

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
 
### Apprentissages de base
[![ML pour débutants](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Science des données pour débutants](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![IA pour débutants](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersécurité pour débutants](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Développement web pour débutants](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pour débutants](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Développement XR pour débutants](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigation du cours

**🚀 Prêt à commencer à apprendre ?**

**Débutants** : Commencez par [Chapitre 1 : Fondations et démarrage rapide](#-chapter-1-foundation--quick-start)  
**Développeurs IA** : Passez à [Chapitre 2 : Développement IA en priorité](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Développeurs expérimentés** : Commencez par [Chapitre 3 : Configuration et authentification](#️-chapter-3-configuration--authentication)

**Étapes suivantes** : [Commencer le Chapitre 1 - Notions de base AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Clause de non-responsabilité** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d’assurer l’exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, une traduction professionnelle humaine est recommandée. Nous ne sommes pas responsables des malentendus ou des erreurs d’interprétation résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->