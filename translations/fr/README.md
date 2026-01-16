<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T07:38:00+00:00",
  "source_file": "README.md",
  "language_code": "fr"
}
-->
# AZD Pour Débutants : Un Parcours d'Apprentissage Structuré

![AZD-for-beginners](../../../../translated_images/fr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Commencer avec ce Cours

Suivez ces étapes pour démarrer votre parcours d'apprentissage AZD :

1. **Forkez le Répertoire** : Cliquez sur [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonez le Répertoire** : `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Rejoignez la Communauté** : [Communautés Discord Azure](https://discord.com/invite/ByRwuEEgH4) pour un support expert
4. **Choisissez Votre Parcours d'Apprentissage** : Sélectionnez un chapitre ci-dessous qui correspond à votre niveau d'expérience

### Support Multilingue

#### Traductions Automatisées (Toujours à jour)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](./README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Vous préférez cloner localement ?**

> Ce dépôt inclut plus de 50 traductions de langues ce qui augmente significativement la taille du téléchargement. Pour cloner sans traductions, utilisez le sparse checkout :
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Cela vous donne tout ce dont vous avez besoin pour suivre le cours avec un téléchargement beaucoup plus rapide.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Aperçu du Cours

Maîtrisez Azure Developer CLI (azd) à travers des chapitres structurés conçus pour un apprentissage progressif. **Accent particulier sur le déploiement d'applications IA avec intégration Microsoft Foundry.**

### Pourquoi ce Cours est Essentiel pour les Développeurs Modernes

Basé sur les retours de la communauté Discord Microsoft Foundry, **45% des développeurs veulent utiliser AZD pour des charges de travail IA** mais rencontrent des défis avec :
- Des architectures IA multi-services complexes
- Les meilleures pratiques de déploiement IA en production  
- L'intégration et configuration des services Azure IA
- L'optimisation des coûts pour les charges IA
- La résolution des problèmes spécifiques au déploiement IA

### Objectifs d'Apprentissage

En complétant ce cours structuré, vous allez :
- **Maîtriser les bases d'AZD** : Concepts clés, installation et configuration
- **Déployer des applications IA** : Utiliser AZD avec les services Microsoft Foundry
- **Implémenter Infrastructure as Code** : Gérer les ressources Azure avec des templates Bicep
- **Résoudre les problèmes de déploiement** : Dépanner et corriger les erreurs courantes
- **Optimiser pour la production** : Sécurité, mise à l’échelle, supervision et gestion des coûts
- **Construire des solutions multi-agents** : Déployer des architectures IA complexes

## 📚 Chapitres d'Apprentissage

*Sélectionnez votre parcours en fonction de votre expérience et vos objectifs*

### 🚀 Chapitre 1 : Fondations & Démarrage Rapide
**Prérequis** : Abonnement Azure, connaissances de base en ligne de commande  
**Durée** : 30-45 minutes  
**Complexité** : ⭐

#### Ce que vous apprendrez
- Comprendre les fondamentaux de Azure Developer CLI
- Installer AZD sur votre plateforme
- Votre premier déploiement réussi

#### Ressources d'apprentissage
- **🎯 Démarrer ici** : [Qu'est-ce que Azure Developer CLI ?](../..)
- **📖 Théorie** : [Bases d'AZD](docs/getting-started/azd-basics.md) - Concepts et terminologie de base
- **⚙️ Installation** : [Installation & Configuration](docs/getting-started/installation.md) - Guides spécifiques à la plateforme
- **🛠️ Pratique** : [Votre Premier Projet](docs/getting-started/first-project.md) - Tutoriel pas à pas
- **📋 Référence Rapide** : [Cheat Sheet des Commandes](resources/cheat-sheet.md)

#### Exercices Pratiques
```bash
# Vérification rapide de l'installation
azd version

# Déployez votre première application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Résultat du chapitre** : Déployer avec succès une application web simple sur Azure avec AZD

**✅ Validation de la réussite :**
```bash
# Après avoir terminé le Chapitre 1, vous devriez être capable de :
azd version              # Affiche la version installée
azd init --template todo-nodejs-mongo  # Initialise le projet
azd up                  # Déploie sur Azure
azd show                # Affiche l'URL de l'application en cours d'exécution
# L'application s'ouvre dans le navigateur et fonctionne
azd down --force --purge  # Nettoie les ressources
```

**📊 Temps estimé :** 30-45 minutes  
**📈 Niveau de compétence après :** Capable de déployer des applications de base de manière autonome

**✅ Validation de la réussite :**
```bash
# Après avoir terminé le chapitre 1, vous devriez être capable de :
azd version              # Affiche la version installée
azd init --template todo-nodejs-mongo  # Initialise le projet
azd up                  # Déploie sur Azure
azd show                # Affiche l'URL de l'application en cours d'exécution
# L'application s'ouvre dans le navigateur et fonctionne
azd down --force --purge  # Nettoie les ressources
```

**📊 Temps estimé :** 30-45 minutes  
**📈 Niveau de compétence après :** Capable de déployer des applications de base de manière autonome

---

### 🤖 Chapitre 2 : Développement AI-First (Recommandé pour Développeurs IA)
**Prérequis** : Chapitre 1 complété  
**Durée** : 1-2 heures  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Intégration Microsoft Foundry avec AZD
- Déploiement d'applications alimentées par IA
- Compréhension des configurations de services IA

#### Ressources d'apprentissage
- **🎯 Démarrer ici** : [Intégration Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Modèles** : [Déploiement de Modèles IA](docs/microsoft-foundry/ai-model-deployment.md) - Déployer et gérer des modèles IA
- **🛠️ Atelier** : [Lab d'Atelier IA](docs/microsoft-foundry/ai-workshop-lab.md) - Préparez vos solutions IA avec AZD
- **🎥 Guide Interactif** : [Matériel de l'atelier](workshop/README.md) - Apprentissage navigateur avec MkDocs * Environnement DevContainer
- **📋 Templates** : [Templates Microsoft Foundry](../..)
- **📝 Exemples** : [Exemples de déploiement AZD](examples/README.md)

#### Exercices Pratiques
```bash
# Déployez votre première application IA
azd init --template azure-search-openai-demo
azd up

# Essayez des modèles IA supplémentaires
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Résultat du chapitre** : Déployer et configurer une application de chat IA avec capacités RAG

**✅ Validation de la réussite :**
```bash
# Après le chapitre 2, vous devriez être capable de :
azd init --template azure-search-openai-demo
azd up
# Tester l'interface de chat IA
# Poser des questions et obtenir des réponses alimentées par l'IA avec des sources
# Vérifier que l'intégration de la recherche fonctionne
azd monitor  # Vérifier que Application Insights affiche la télémétrie
azd down --force --purge
```

**📊 Temps estimé :** 1-2 heures  
**📈 Niveau de compétence après :** Capable de déployer et configurer des applications IA prêtes pour la production  
**💰 Sensibilisation aux coûts :** Comprendre des coûts de dev entre 80$-150$/mois, coûts production 300$-3500$/mois

#### 💰 Considérations de Coûts pour les Déploiements IA

**Environnement de Développement (Estimé 80$-150$/mois) :**
- Azure OpenAI (Paiement à l’usage) : 0-50$/mois (basé sur l’usage de tokens)
- AI Search (Niveau basique) : 75$/mois
- Container Apps (Consommation) : 0-20$/mois
- Stockage (Standard) : 1-5$/mois

**Environnement de Production (Estimé 300$-3,500+$/mois) :**
- Azure OpenAI (PTU pour performance constante) : 3,000+$/mois OU Paiement à l’usage avec un volume élevé
- AI Search (Niveau Standard) : 250$/mois
- Container Apps (Dédié) : 50-100$/mois
- Application Insights : 5-50$/mois
- Stockage (Premium) : 10-50$/mois

**💡 Conseils d’Optimisation des Coûts :**
- Utilisez **le niveau gratuit** Azure OpenAI pour l’apprentissage (50 000 tokens/mois inclus)
- Lancez `azd down` pour désallouer les ressources quand vous ne développez pas activement
- Commencez avec la facturation à consommation, passez au PTU seulement en production
- Utilisez `azd provision --preview` pour estimer les coûts avant un déploiement
- Activez l’auto-scaling : ne payez que pour votre usage réel

**Surveillance des coûts :**
```bash
# Vérifier les coûts mensuels estimés
azd provision --preview

# Surveiller les coûts réels dans le portail Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapitre 3 : Configuration & Authentification
**Prérequis** : Chapitre 1 complété  
**Durée** : 45-60 minutes  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Configuration et gestion des environnements
- Authentification et meilleures pratiques de sécurité
- Nomination et organisation des ressources

#### Ressources d'apprentissage
- **📖 Configuration** : [Guide de Configuration](docs/getting-started/configuration.md) - Mise en place des environnements
- **🔐 Sécurité** : [Schémas d'authentification et identité gérée](docs/getting-started/authsecurity.md) - Modèles d’authentification
- **📝 Exemples** : [Exemple d’Application Base de Données](examples/database-app/README.md) - Exemples AZD avec base de données

#### Exercices Pratiques
- Configurer plusieurs environnements (dev, staging, prod)
- Mettre en place une authentification via identité gérée
- Implémenter des configurations spécifiques à chaque environnement

**💡 Résultat du chapitre** : Gérer plusieurs environnements avec une authentification et une sécurité adaptées

---

### 🏗️ Chapitre 4 : Infrastructure as Code & Déploiement
**Prérequis** : Chapitres 1-3 complétés  
**Durée** : 1-1.5 heures  
**Complexité** : ⭐⭐⭐

#### Ce que vous apprendrez
- Modèles avancés de déploiement
- Infrastructure as Code avec Bicep
- Stratégies de provisionnement des ressources

#### Ressources d'apprentissage
- **📖 Déploiement** : [Guide de Déploiement](docs/deployment/deployment-guide.md) - Workflows complets
- **🏗️ Provisionnement** : [Provisionner les Ressources](docs/deployment/provisioning.md) - Gestion des ressources Azure
- **📝 Exemples** : [Exemple Container App](../../examples/container-app) - Déploiements conteneurisés

#### Exercices Pratiques
- Créer des templates Bicep personnalisés
- Déployer des applications multi-services
- Implémenter des stratégies de déploiement blue-green

**💡 Résultat du chapitre** : Déployer des applications multi-services complexes utilisant des templates d’infrastructure personnalisés

---

### 🎯 Chapitre 5 : Solutions Multi-Agents IA (Avancé)
**Prérequis** : Chapitres 1-2 complétés  
**Durée** : 2-3 heures  
**Complexité** : ⭐⭐⭐⭐

#### Ce que vous apprendrez
- Modèles d’architecture multi-agent

- Orchestration et coordination des agents  
- Déploiements IA prêts pour la production

#### Ressources d’apprentissage  
- **🤖 Projet en vedette** : [Solution Multi-Agent Retail](examples/retail-scenario.md) – Implémentation complète  
- **🛠️ Modèles ARM** : [Package de modèles ARM](../../examples/retail-multiagent-arm-template) – Déploiement en un clic  
- **📖 Architecture** : [Modèles de coordination multi-agents](/docs/pre-deployment/coordination-patterns.md) – Modèles

#### Exercices pratiques  
```bash
# Déployer la solution complète multi-agent pour le commerce de détail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorer les configurations des agents
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Objectif du chapitre** : Déployer et gérer une solution IA multi-agent prête pour la production avec des agents Client et Inventaire

---

### 🔍 Chapitre 6 : Validation & Planification avant déploiement  
**Prérequis** : Chapitre 4 terminé  
**Durée** : 1 heure  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez  
- Planification de capacité et validation des ressources  
- Stratégies de sélection des SKU  
- Vérifications préalables et automatisation

#### Ressources d’apprentissage  
- **📊 Planification** : [Planification de capacité](docs/pre-deployment/capacity-planning.md) – Validation des ressources  
- **💰 Sélection** : [Sélection des SKU](docs/pre-deployment/sku-selection.md) – Choix économiques  
- **✅ Validation** : [Vérifications préalables](docs/pre-deployment/preflight-checks.md) – Scripts automatisés

#### Exercices pratiques  
- Exécuter des scripts de validation de capacité  
- Optimiser les sélections de SKU pour les coûts  
- Implémenter des vérifications automatisées avant déploiement

**💡 Objectif du chapitre** : Valider et optimiser les déploiements avant exécution

---

### 🚨 Chapitre 7 : Résolution de problèmes & Débogage  
**Prérequis** : Tout chapitre de déploiement terminé  
**Durée** : 1 à 1,5 heure  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez  
- Approches systématiques pour le débogage  
- Problèmes courants et solutions  
- Dépannage spécifique à l’IA

#### Ressources d’apprentissage  
- **🔧 Problèmes courants** : [Problèmes courants](docs/troubleshooting/common-issues.md) – FAQ et solutions  
- **🕵️ Débogage** : [Guide de débogage](docs/troubleshooting/debugging.md) – Stratégies étape par étape  
- **🤖 Problèmes IA** : [Dépannage spécifique à l’IA](docs/troubleshooting/ai-troubleshooting.md) – Problèmes des services IA

#### Exercices pratiques  
- Diagnostiquer les échecs de déploiement  
- Résoudre les problèmes d’authentification  
- Déboguer la connectivité aux services IA

**💡 Objectif du chapitre** : Diagnostiquer et résoudre de manière autonome les problèmes courants de déploiement

---

### 🏢 Chapitre 8 : Modèles de production & d’entreprise  
**Prérequis** : Chapitres 1 à 4 terminés  
**Durée** : 2 à 3 heures  
**Complexité** : ⭐⭐⭐⭐

#### Ce que vous apprendrez  
- Stratégies de déploiement en production  
- Modèles de sécurité d’entreprise  
- Surveillance et optimisation des coûts

#### Ressources d’apprentissage  
- **🏭 Production** : [Bonnes pratiques IA en production](docs/microsoft-foundry/production-ai-practices.md) – Modèles d’entreprise  
- **📝 Exemples** : [Exemple microservices](../../examples/microservices) – Architectures complexes  
- **📊 Surveillance** : [Intégration Application Insights](docs/pre-deployment/application-insights.md) – Surveillance

#### Exercices pratiques  
- Implémenter des modèles de sécurité d’entreprise  
- Mettre en place une surveillance complète  
- Déployer en production avec une gouvernance appropriée

**💡 Objectif du chapitre** : Déployer des applications prêtes pour l’entreprise avec toutes les capacités de production

---

## 🎓 Aperçu de l’atelier : expérience d’apprentissage pratique

> **⚠️ ETAT DE L’ATELIER : Développement actif**  
> Les matériels de l’atelier sont actuellement en cours de développement et de finition. Les modules principaux sont fonctionnels, mais certaines sections avancées sont incomplètes. Nous travaillons activement à la complétion de tous les contenus. [Suivre la progression →](workshop/README.md)

### Matériels interactifs de l’atelier  
**Apprentissage pratique complet avec outils basés sur navigateur et exercices guidés**

Nos matériels d’atelier offrent une expérience d’apprentissage interactive et structurée qui complète le programme par chapitres ci-dessus. L’atelier est conçu pour l’auto-apprentissage et les sessions dirigées par un instructeur.

#### 🛠️ Fonctionnalités de l’atelier  
- **Interface basée sur navigateur** : Atelier complet propulsé par MkDocs avec fonctions de recherche, copie et thèmes  
- **Intégration GitHub Codespaces** : Configuration de l’environnement de développement en un clic  
- **Parcours d’apprentissage structuré** : 7 exercices guidés (3,5 heures au total)  
- **Découverte → Déploiement → Personnalisation** : Méthodologie progressive  
- **Environnement DevContainer interactif** : Outils et dépendances préconfigurés

#### 📚 Structure de l’atelier  
L’atelier suit une méthodologie **Découverte → Déploiement → Personnalisation** :

1. **Phase de découverte** (45 minutes)  
   - Explorer les modèles et services Microsoft Foundry  
   - Comprendre les modèles d’architecture multi-agent  
   - Passer en revue les exigences et prérequis de déploiement

2. **Phase de déploiement** (2 heures)  
   - Déploiement pratique d’applications IA avec AZD  
   - Configurer les services Azure IA et points de terminaison  
   - Implémenter les modèles de sécurité et d’authentification

3. **Phase de personnalisation** (45 minutes)  
   - Modifier les applications pour des cas d’usage spécifiques  
   - Optimiser pour le déploiement en production  
   - Implémenter la surveillance et la gestion des coûts

#### 🚀 Démarrer l’atelier  
```bash
# Option 1 : GitHub Codespaces (Recommandé)
# Cliquez sur "Code" → "Créer un codespace sur main" dans le dépôt

# Option 2 : Développement local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Suivez les instructions d'installation dans workshop/README.md
```
  
#### 🎯 Résultats d’apprentissage de l’atelier  
En complétant l’atelier, les participants pourront :  
- **Déployer des applications IA en production** : Utiliser AZD avec les services Microsoft Foundry  
- **Maîtriser les architectures multi-agents** : Implémenter des solutions coordonnées d’agents IA  
- **Implémenter les meilleures pratiques de sécurité** : Configurer l’authentification et les contrôles d’accès  
- **Optimiser pour le scaling** : Concevoir des déploiements performants et économiques  
- **Résoudre les problèmes de déploiement** : Dépanner les problèmes courants de manière autonome

#### 📖 Ressources de l’atelier  
- **🎥 Guide interactif** : [Matériels de l’atelier](workshop/README.md) – Environnement d’apprentissage basé sur navigateur  
- **📋 Instructions étape par étape** : [Exercices guidés](../../workshop/docs/instructions) – Parcours détaillé  
- **🛠️ Laboratoire IA** : [Laboratoire IA](docs/microsoft-foundry/ai-workshop-lab.md) – Exercices centrés IA  
- **💡 Démarrage rapide** : [Guide d’installation de l’atelier](workshop/README.md#quick-start) – Configuration de l’environnement

**Idéal pour** : Formations en entreprise, cours universitaires, apprentissage autonome, bootcamps développeurs.

---

## 📖 Qu’est-ce que Azure Developer CLI ?

Azure Developer CLI (azd) est une interface en ligne de commande orientée développeur qui accélère le processus de création et de déploiement d’applications sur Azure. Il offre :

- **Déploiements basés sur des modèles** – Utilisation de modèles préfabriqués pour les schémas d’application courants  
- **Infrastructure as Code** – Gestion des ressources Azure avec Bicep ou Terraform  
- **Flux de travail intégrés** – Provisionnement, déploiement et surveillance fluide des applications  
- **Convivial pour développeurs** – Optimisé pour la productivité et l’expérience développeur

### **AZD + Microsoft Foundry : l’idéal pour les déploiements IA**

**Pourquoi AZD pour les solutions IA ?** AZD répond aux principaux défis rencontrés par les développeurs IA :

- **Modèles prêts pour l’IA** – Modèles préconfigurés pour Azure OpenAI, Cognitive Services et charges de travail ML  
- **Déploiements IA sécurisés** – Modèles de sécurité intégrés pour les services IA, clés API, points de terminaison modèles  
- **Modèles IA en production** – Bonnes pratiques pour déploiements IA extensibles et économiques  
- **Flux IA de bout en bout** – Du développement du modèle au déploiement en production avec surveillance adaptée  
- **Optimisation des coûts** – Allocation intelligente des ressources et stratégies de montée en charge pour IA  
- **Intégration Microsoft Foundry** – Connexion fluide au catalogue et points de terminaison de modèles Microsoft Foundry

---

## 🎯 Bibliothèque de modèles & exemples

### En vedette : Modèles Microsoft Foundry  
**Commencez ici si vous déployez des applications IA !**

> **Note :** Ces modèles illustrent divers modèles IA. Certains sont des exemples Azure externes, d’autres des implémentations locales.

| Modèle | Chapitre | Complexité | Services | Type |
|--------|----------|------------|----------|------|
| [**Commencer avec chat IA**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapitre 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externe |
| [**Commencer avec agents IA**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapitre 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Externe |
| [**Démo Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapitre 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externe |
| [**Démarrage rapide OpenAI Chat App**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapitre 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externe |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapitre 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externe |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapitre 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externe |
| [**Solution Multi-Agent Retail**](examples/retail-scenario.md) | Chapitre 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Locale** |

### En vedette : Scénarios d’apprentissage complets  
**Modèles d’applications prêts pour la production associés aux chapitres d’apprentissage**

| Modèle | Chapitre d’apprentissage | Complexité | Apprentissage clé |
|--------|--------------------------|------------|-------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapitre 2 | ⭐ | Modèles de déploiement IA de base |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapitre 2 | ⭐⭐ | Implémentation RAG avec Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapitre 4 | ⭐⭐ | Intégration Intelligence Documentaire |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapitre 5 | ⭐⭐⭐ | Framework agent et appels de fonctions |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapitre 8 | ⭐⭐⭐ | Orchestration IA d’entreprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapitre 5 | ⭐⭐⭐⭐ | Architecture multi-agent avec agents Client et Inventaire |

### Apprentissage par type d’exemple

> **📌 Exemples locaux vs externes :**  
> **Exemples locaux** (dans ce dépôt) = Prêts à l’usage immédiatement  
> **Exemples externes** (Azure Samples) = À cloner depuis les dépôts liés

#### Exemples locaux (prêts à l’usage)  
- [**Solution Multi-Agent Retail**](examples/retail-scenario.md) – Implémentation complète prête pour la production avec modèles ARM  
  - Architecture multi-agent (agents Client + Inventaire)  
  - Surveillance et évaluation complètes  
  - Déploiement en un clic via modèle ARM

#### Exemples locaux – Applications conteneurisées (chapitres 2-5)  
**Exemples complets de déploiement de conteneurs dans ce dépôt :**  
- [**Exemples Container App**](examples/container-app/README.md) – Guide complet pour déploiements conteneurisés  
  - [API Flask simple](../../examples/container-app/simple-flask-api) – API REST basique avec scale-to-zero  
  - [Architecture microservices](../../examples/container-app/microservices) – Déploiement multi-service prêt pour la production  
  - Modèles de démarrage rapide, production et avancés  
  - Guide de surveillance, sécurité et optimisation des coûts

#### Exemples externes – Applications simples (chapitres 1-2)  
**Clonez ces dépôts Azure Samples pour commencer :**  
- [Application Web Simple - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) – Modèles de déploiement basiques  
- [Site statique - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) – Déploiement contenu statique  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) – Déploiement API REST

#### Exemples externes – Intégration base de données (chapitres 3-4)  
- [Application base de données - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) – Modèles connectivité base de données  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) – Flux de données serverless

#### Exemples externes – Modèles avancés (chapitres 4-8)  
- [Microservices Java](https://github.com/Azure-Samples/java-microservices-aca-lab) – Architectures multi-services  
- [Jobs Container Apps](https://github.com/Azure-Samples/container-apps-jobs) – Traitement en arrière-plan  
- [Pipeline ML d’entreprise](https://github.com/Azure-Samples/mlops-v2) – Modèles ML prêts pour la production

### Collections de modèles externes  
- [**Galerie officielle des modèles AZD**](https://azure.github.io/awesome-azd/) – Collection triée de modèles officiels et communautaires  
- [**Modèles Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) – Documentation des modèles Microsoft Learn
- [**Répertoire des exemples**](examples/README.md) - Exemples locaux d’apprentissage avec explications détaillées

---

## 📚 Ressources d’apprentissage & Références

### Références rapides
- [**Fiche mémo des commandes**](resources/cheat-sheet.md) - Commandes azd essentielles organisées par chapitre
- [**Glossaire**](resources/glossary.md) - Terminologie Azure et azd  
- [**FAQ**](resources/faq.md) - Questions fréquentes organisées par chapitre d’apprentissage
- [**Guide d’étude**](resources/study-guide.md) - Exercices pratiques complets

### Ateliers pratiques
- [**Laboratoire d’atelier IA**](docs/microsoft-foundry/ai-workshop-lab.md) - Rendez vos solutions IA déployables avec AZD (2-3 heures)
- [**Guide d’atelier interactif**](workshop/README.md) - Atelier basé sur navigateur avec MkDocs et environnement DevContainer
- [**Parcours d’apprentissage structuré**](../../workshop/docs/instructions) - Exercices guidés en 7 étapes (Découverte → Déploiement → Personnalisation)
- [**Atelier AZD pour débutants**](workshop/README.md) - Matériel complet d’atelier pratique avec intégration GitHub Codespaces

### Ressources d’apprentissage externes
- Documentation Azure Developer CLI ([https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/))
- Centre d’architecture Azure ([https://learn.microsoft.com/en-us/azure/architecture/](https://learn.microsoft.com/en-us/azure/architecture/))
- Calculateur de prix Azure ([https://azure.microsoft.com/pricing/calculator/](https://azure.microsoft.com/pricing/calculator/))
- Statut Azure ([https://status.azure.com/](https://status.azure.com/))

---

## 🔧 Guide rapide de dépannage

**Problèmes courants rencontrés par les débutants et solutions immédiates :**

### ❌ "azd : commande introuvable"

```bash
# Installez AZD d'abord
# Windows (PowerShell) :
winget install microsoft.azd

# macOS :
brew tap azure/azd && brew install azd

# Linux :
curl -fsSL https://aka.ms/install-azd.sh | bash

# Vérifiez l'installation
azd version
```

### ❌ "Aucune souscription trouvée" ou "Souscription non configurée"

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

### ❌ "Quota insuffisant" ou "Quota dépassé"

```bash
# Essayez une autre région Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ou utilisez des SKU plus petits en développement
# Modifiez infra/main.parameters.json :
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ Échec de la commande "azd up" à mi-parcours

```bash
# Option 1 : Nettoyer et réessayer
azd down --force --purge
azd up

# Option 2 : Réparer uniquement l'infrastructure
azd provision

# Option 3 : Vérifier les journaux détaillés
azd show
azd logs
```

### ❌ "Échec d’authentification" ou "Jeton expiré"

```bash
# Ré-authentifier
az logout
az login

azd auth logout
azd auth login

# Vérifier l'authentification
az account show
```

### ❌ "Ressource déjà existante" ou conflits de nommage

```bash
# AZD génère des noms uniques, mais en cas de conflit :
azd down --force --purge

# Ensuite, réessayez avec un nouvel environnement
azd env new dev-v2
azd up
```

### ❌ Déploiement de modèle trop long

**Temps d’attente normaux :**
- Application web simple : 5-10 minutes
- Application avec base de données : 10-15 minutes
- Applications IA : 15-25 minutes (approvisionnement OpenAI lent)

```bash
# Vérifier la progression
azd show

# Si bloqué >30 minutes, vérifier le portail Azure :
azd monitor
# Chercher les déploiements échoués
```

### ❌ "Permission refusée" ou "Interdit"

```bash
# Vérifiez votre rôle Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Vous avez besoin d'au moins le rôle "Collaborateur"
# Demandez à votre administrateur Azure d'accorder :
# - Collaborateur (pour les ressources)
# - Administrateur d'accès utilisateur (pour les affectations de rôle)
```

### ❌ Impossible de trouver l’URL de l’application déployée

```bash
# Afficher tous les points de terminaison de service
azd show

# Ou ouvrir le portail Azure
azd monitor

# Vérifier un service spécifique
azd env get-values
# Rechercher les variables *_URL
```

### 📚 Ressources complètes de dépannage

- **Guide des problèmes courants :** [Solutions détaillées](docs/troubleshooting/common-issues.md)
- **Problèmes spécifiques à l’IA :** [Dépannage IA](docs/troubleshooting/ai-troubleshooting.md)
- **Guide de débogage :** [Débogage étape par étape](docs/troubleshooting/debugging.md)
- **Obtenir de l’aide :** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

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
<summary><strong>❌ "Aucune souscription trouvée" ou "Souscription non configurée"</strong></summary>

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
# Essayez une autre région Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ou utilisez des SKU plus petits en développement
# Modifiez infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ Échec de la commande "azd up" à mi-parcours</strong></summary>

```bash
# Option 1 : Nettoyer et réessayer
azd down --force --purge
azd up

# Option 2 : Réparer uniquement l'infrastructure
azd provision

# Option 3 : Vérifier les journaux détaillés
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Échec d’authentification" ou "Jeton expiré"</strong></summary>

```bash
# Se réauthentifier
az logout
az login

azd auth logout
azd auth login

# Vérifier l'authentification
az account show
```
</details>

<details>
<summary><strong>❌ "Ressource déjà existante" ou conflits de nommage</strong></summary>

```bash
# AZD génère des noms uniques, mais en cas de conflit :
azd down --force --purge

# Ensuite, réessayez avec un nouvel environnement
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Déploiement de modèle trop long</strong></summary>

**Temps d’attente normaux :**
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
# - Administrateur de l'accès utilisateur (pour les affectations de rôle)
```
</details>

<details>
<summary><strong>❌ Impossible de trouver l’URL de l’application déployée</strong></summary>

```bash
# Afficher tous les points de terminaison de service
azd show

# Ou ouvrir le portail Azure
azd monitor

# Vérifier le service spécifique
azd env get-values
# Rechercher les variables *_URL
```
</details>

### 📚 Ressources complètes de dépannage

- **Guide des problèmes courants :** [Solutions détaillées](docs/troubleshooting/common-issues.md)
- **Problèmes spécifiques à l’IA :** [Dépannage IA](docs/troubleshooting/ai-troubleshooting.md)
- **Guide de débogage :** [Débogage étape par étape](docs/troubleshooting/debugging.md)
- **Obtenir de l’aide :** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Achèvement du cours & Certification

### Suivi des progrès
Suivez votre progression d’apprentissage à travers chaque chapitre :

- [ ] **Chapitre 1** : Fondations & Démarrage rapide ✅
- [ ] **Chapitre 2** : Développement AI-First ✅  
- [ ] **Chapitre 3** : Configuration & Authentification ✅
- [ ] **Chapitre 4** : Infrastructure as Code & Déploiement ✅
- [ ] **Chapitre 5** : Solutions IA multi-agents ✅
- [ ] **Chapitre 6** : Validation & planification pré-déploiement ✅
- [ ] **Chapitre 7** : Dépannage & débogage ✅
- [ ] **Chapitre 8** : Modèles de production & entreprise ✅

### Vérification des connaissances
Après chaque chapitre, vérifiez vos connaissances en :
1. **Exercice pratique** : Terminer le déploiement pratique du chapitre
2. **Contrôle des connaissances** : Réviser la section FAQ de votre chapitre
3. **Discussion communautaire** : Partager votre expérience dans Azure Discord
4. **Chapitre suivant** : Passer au niveau de complexité suivant

### Avantages de la fin du cours
Après avoir terminé tous les chapitres, vous disposerez de :
- **Expérience en production** : Déploiement réel d’applications IA dans Azure
- **Compétences professionnelles** : Capacités de déploiement prêtes pour l’entreprise  
- **Reconnaissance communautaire** : Membres actifs de la communauté des développeurs Azure
- **Avancement de carrière** : Expertise recherchée AZD et déploiement IA

---

## 🤝 Communauté & Support

### Obtenir de l’aide & Support
- **Problèmes techniques** : [Signaler des bugs et demander des fonctionnalités](https://github.com/microsoft/azd-for-beginners/issues)
- **Questions d’apprentissage** : [Communauté Microsoft Azure Discord](https://discord.gg/microsoft-azure) et [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Aide spécifique IA** : Rejoignez le [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation** : [Documentation officielle Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Avis de la communauté depuis Microsoft Foundry Discord

**Résultats récents du sondage dans le canal #Azure :**
- **45 %** des développeurs souhaitent utiliser AZD pour les charges IA
- **Principaux défis** : Déploiements multi-services, gestion des identifiants, préparation à la production  
- **Demandes principales** : Modèles spécifiques à l’IA, guides de dépannage, meilleures pratiques

**Rejoignez notre communauté pour :**
- Partager vos expériences AZD + IA et obtenir de l’aide
- Accéder aux avant-premières des nouveaux modèles IA
- Contribuer aux meilleures pratiques de déploiement IA
- Influencer le développement futur des fonctionnalités IA + AZD

### Contributions au cours
Nous acceptons les contributions ! Veuillez lire notre [Guide de contribution](CONTRIBUTING.md) pour les détails sur :
- **Améliorations de contenu** : Améliorer les chapitres et exemples existants
- **Nouveaux exemples** : Ajouter des scénarios et modèles réels  
- **Traduction** : Aider à maintenir le support multilingue
- **Signalement de bugs** : Améliorer précision et clarté
- **Normes communautaires** : Respecter nos directives inclusives

---

## 📄 Informations sur le cours

### Licence
Ce projet est sous licence MIT - voir le fichier [LICENSE](../../LICENSE) pour plus de détails.

### Ressources d’apprentissage Microsoft associées

Notre équipe produit d’autres cours d’apprentissage complets :

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j pour débutants](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js pour débutants](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

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
 
### Apprentissage de base
[![ML pour débutants](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science pour débutants](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![IA pour débutants](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersécurité pour débutants](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Développement web pour débutants](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pour débutants](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Développement XR pour débutants](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot pour la programmation assistée par IA](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pour C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventure Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigation du cours

**🚀 Prêt à commencer à apprendre ?**

**Débutants** : Commencez par [Chapitre 1 : Fondations & Démarrage rapide](../..)  
**Développeurs IA** : Passez à [Chapitre 2 : Développement IA d'abord](../..)  
**Développeurs expérimentés** : Commencez par [Chapitre 3 : Configuration & Authentification](../..)

**Étapes suivantes** : [Commencez le Chapitre 1 - Bases AZD](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçons d’assurer l’exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d’origine doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de faire appel à une traduction professionnelle réalisée par un humain. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->