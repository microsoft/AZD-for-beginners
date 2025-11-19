<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-19T14:23:29+00:00",
  "source_file": "examples/README.md",
  "language_code": "fr"
}
-->
# Exemples - Modèles et configurations pratiques AZD

**Apprendre par l'exemple - Organisé par chapitre**
- **📚 Accueil du cours** : [AZD pour débutants](../README.md)
- **📖 Correspondance des chapitres** : Exemples organisés par niveau de complexité
- **🚀 Exemple local** : [Solution multi-agents pour le commerce de détail](retail-scenario.md)
- **🤖 Exemples d'IA externes** : Liens vers les dépôts Azure Samples

> **📍 IMPORTANT : Exemples locaux vs externes**  
> Ce dépôt contient **4 exemples locaux complets** avec des implémentations complètes :  
> - **Azure OpenAI Chat** (déploiement GPT-4 avec interface de chat)  
> - **Container Apps** (API Flask simple + microservices)  
> - **Application base de données** (Web + base de données SQL)  
> - **Solution multi-agents pour le commerce de détail** (solution IA d'entreprise)  
>  
> Les exemples supplémentaires sont des **références externes** vers des dépôts Azure-Samples que vous pouvez cloner.

## Introduction

Ce répertoire fournit des exemples pratiques et des références pour vous aider à apprendre Azure Developer CLI grâce à une pratique concrète. Le scénario multi-agents pour le commerce de détail est une implémentation complète et prête à la production incluse dans ce dépôt. Les exemples supplémentaires font référence aux exemples officiels d'Azure qui démontrent divers modèles AZD.

### Légende de la complexité

- ⭐ **Débutant** - Concepts de base, service unique, 15-30 minutes
- ⭐⭐ **Intermédiaire** - Services multiples, intégration de base de données, 30-60 minutes
- ⭐⭐⭐ **Avancé** - Architecture complexe, intégration IA, 1-2 heures
- ⭐⭐⭐⭐ **Expert** - Prêt pour la production, modèles d'entreprise, 2+ heures

## 🎯 Contenu de ce dépôt

### ✅ Implémentation locale (prête à l'emploi)

#### [Application Azure OpenAI Chat](azure-openai-chat/README.md) 🆕
**Déploiement complet de GPT-4 avec interface de chat inclus dans ce dépôt**

- **Emplacement** : `examples/azure-openai-chat/`
- **Complexité** : ⭐⭐ (Intermédiaire)
- **Contenu inclus** :
  - Déploiement complet d'Azure OpenAI (GPT-4)
  - Interface de chat en ligne de commande Python
  - Intégration Key Vault pour des clés API sécurisées
  - Modèles d'infrastructure Bicep
  - Suivi de l'utilisation des tokens et des coûts
  - Limitation de débit et gestion des erreurs

**Démarrage rapide** :
```bash
# Naviguer vers l'exemple
cd examples/azure-openai-chat

# Déployer tout
azd up

# Installer les dépendances et commencer à discuter
pip install -r src/requirements.txt
python src/chat.py
```

**Technologies** : Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Exemples d'applications conteneurisées](container-app/README.md) 🆕
**Exemples complets de déploiement de conteneurs inclus dans ce dépôt**

- **Emplacement** : `examples/container-app/`
- **Complexité** : ⭐-⭐⭐⭐⭐ (Débutant à Expert)
- **Contenu inclus** :
  - [Guide principal](container-app/README.md) - Vue d'ensemble complète des déploiements de conteneurs
  - [API Flask simple](../../../examples/container-app/simple-flask-api) - Exemple d'API REST basique
  - [Architecture microservices](../../../examples/container-app/microservices) - Déploiement multi-services prêt pour la production
  - Modèles de démarrage rapide, production et avancés
  - Surveillance, sécurité et optimisation des coûts

**Démarrage rapide** :
```bash
# Voir le guide principal
cd examples/container-app

# Déployer une API Flask simple
cd simple-flask-api
azd up

# Déployer un exemple de microservices
cd ../microservices
azd up
```

**Technologies** : Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Solution multi-agents pour le commerce de détail](retail-scenario.md) 🆕
**Implémentation complète prête à la production incluse dans ce dépôt**

- **Emplacement** : `examples/retail-multiagent-arm-template/`
- **Complexité** : ⭐⭐⭐⭐ (Avancé)
- **Contenu inclus** :
  - Modèle de déploiement ARM complet
  - Architecture multi-agents (client + inventaire)
  - Intégration Azure OpenAI
  - Recherche IA avec RAG
  - Surveillance complète
  - Script de déploiement en un clic

**Démarrage rapide** :
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologies** : Azure OpenAI, Recherche IA, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Exemples externes Azure Samples (à cloner)

Les exemples suivants sont maintenus dans les dépôts officiels Azure-Samples. Clonez-les pour explorer différents modèles AZD :

### Applications simples (Chapitres 1-2)

| Modèle | Dépôt | Complexité | Services |
|:-------|:------|:-----------|:---------|
| **API Flask Python** | [Local : simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Local : microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-services, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Conteneur Flask Python** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Comment utiliser** :
```bash
# Cloner un exemple
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Déployer
azd up
```

### Exemples d'applications IA (Chapitres 2, 5, 8)

| Modèle | Dépôt | Complexité | Focus |
|:-------|:------|:-----------|:------|
| **Azure OpenAI Chat** | [Local : azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Déploiement GPT-4 |
| **Démarrage rapide IA Chat** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat IA basique |
| **Agents IA** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Cadre d'agents |
| **Démo Recherche + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Modèle RAG |
| **Chat Contoso** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | IA d'entreprise |

### Base de données & modèles avancés (Chapitres 3-8)

| Modèle | Dépôt | Complexité | Focus |
|:-------|:------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Intégration base de données |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL sans serveur |
| **Microservices Java** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-services |
| **Pipeline ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Objectifs d'apprentissage

En travaillant sur ces exemples, vous allez :
- Pratiquer les workflows Azure Developer CLI avec des scénarios d'application réalistes
- Comprendre différentes architectures d'application et leurs implémentations AZD
- Maîtriser les modèles d'Infrastructure as Code pour divers services Azure
- Appliquer des stratégies de gestion de configuration et de déploiement spécifiques à l'environnement
- Implémenter des modèles de surveillance, de sécurité et de mise à l'échelle dans des contextes pratiques
- Acquérir de l'expérience dans le dépannage et le débogage de scénarios de déploiement réels

## Résultats d'apprentissage

Après avoir complété ces exemples, vous serez capable de :
- Déployer différents types d'applications en utilisant Azure Developer CLI en toute confiance
- Adapter les modèles fournis à vos propres besoins applicatifs
- Concevoir et implémenter des modèles d'infrastructure personnalisés en utilisant Bicep
- Configurer des applications multi-services complexes avec des dépendances appropriées
- Appliquer les meilleures pratiques en matière de sécurité, de surveillance et de performance dans des scénarios réels
- Résoudre les problèmes et optimiser les déploiements grâce à une expérience pratique

## Structure du répertoire

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Exemples de démarrage rapide

> **💡 Nouveau sur AZD ?** Commencez par l'exemple n°1 (API Flask) - cela prend ~20 minutes et enseigne les concepts de base.

### Pour débutants
1. **[Application conteneurisée - API Flask Python](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Déployez une API REST simple avec mise à l'échelle à zéro  
   **Temps** : 20-25 minutes | **Coût** : 0-5 $/mois  
   **Vous apprendrez** : Workflow azd de base, conteneurisation, sondes de santé  
   **Résultat attendu** : Point de terminaison API fonctionnel renvoyant "Hello, World!" avec surveillance

2. **[Application Web simple - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Déployez une application web Node.js Express avec MongoDB  
   **Temps** : 25-35 minutes | **Coût** : 10-30 $/mois  
   **Vous apprendrez** : Intégration base de données, variables d'environnement, chaînes de connexion  
   **Résultat attendu** : Application de liste de tâches avec fonctionnalités de création/lecture/mise à jour/suppression

3. **[Site web statique - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hébergez un site web statique React avec Azure Static Web Apps  
   **Temps** : 20-30 minutes | **Coût** : 0-10 $/mois  
   **Vous apprendrez** : Hébergement statique, fonctions sans serveur, déploiement CDN  
   **Résultat attendu** : Interface React avec backend API, SSL automatique, CDN global

### Pour utilisateurs intermédiaires
4. **[Application Azure OpenAI Chat](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Déployez GPT-4 avec interface de chat et gestion sécurisée des clés API  
   **Temps** : 35-45 minutes | **Coût** : 50-200 $/mois  
   **Vous apprendrez** : Déploiement Azure OpenAI, intégration Key Vault, suivi des tokens  
   **Résultat attendu** : Application de chat fonctionnelle avec GPT-4 et surveillance des coûts

5. **[Application conteneurisée - Microservices](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Architecture multi-services prête pour la production  
   **Temps** : 45-60 minutes | **Coût** : 50-150 $/mois  
   **Vous apprendrez** : Communication entre services, file d'attente de messages, traçage distribué  
   **Résultat attendu** : Système à 2 services (API Gateway + Service Produit) avec surveillance

6. **[Application base de données - C# avec Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Application web avec API C# et base de données Azure SQL  
   **Temps** : 30-45 minutes | **Coût** : 20-80 $/mois  
   **Vous apprendrez** : Entity Framework, migrations de base de données, sécurité des connexions  
   **Résultat attendu** : API C# avec backend Azure SQL, déploiement automatique du schéma

7. **[Fonction sans serveur - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Fonctions Azure Python avec déclencheurs HTTP et Cosmos DB  
   **Temps** : 30-40 minutes | **Coût** : 10-40 $/mois  
   **Vous apprendrez** : Architecture événementielle, mise à l'échelle sans serveur, intégration NoSQL  
   **Résultat attendu** : Application fonctionnelle répondant aux requêtes HTTP avec stockage Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Application Java multi-services avec Container Apps et passerelle API  
   **Temps** : 60-90 minutes | **Coût** : 80-200 $/mois  
   **Vous apprendrez** : Déploiement Spring Boot, maillage de services, équilibrage de charge  
   **Résultat attendu** : Système Java multi-services avec découverte et routage des services

### Modèles Azure AI Foundry

1. **[Application Azure OpenAI Chat - Exemple local](../../../examples/azure-openai-chat)** ⭐⭐  
   Déploiement complet de GPT-4 avec interface de chat  
   **Temps** : 35-45 minutes | **Coût** : 50-200 $/mois  
   **Résultat attendu** : Application de chat fonctionnelle avec suivi des tokens et surveillance des coûts

2. **[Démo Azure Search + OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Application de chat intelligente avec architecture RAG  
   **Temps** : 60-90 minutes | **Coût** : 100-300 $/mois  
   **Résultat attendu** : Interface de chat alimentée par RAG avec recherche de documents et citations

3. **[Traitement de documents IA](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analyse de documents avec les services Azure AI  
   **Temps** : 40-60 minutes | **Coût** : 20-80 $/mois  
   **Résultat attendu** : API extrayant texte, tableaux et entités des documents téléchargés

4. **[Pipeline Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Workflow MLOps avec Azure Machine Learning  
   **Temps** : 2-3 heures | **Coût** : 150-500 $/mois  
   **Résultat attendu** : Pipeline ML automatisé avec entraînement, déploiement et surveillance

### Scénarios réels

#### **Solution multi-agents pour le commerce de détail** 🆕
**[Guide d'implémentation complet](./retail-scenario.md)**

Une solution complète et prête à la production pour le support client multi-agents qui démontre le déploiement d'applications IA de niveau entreprise avec AZD. Ce scénario fournit :

- **Architecture complète** : Système multi-agents avec agents spécialisés pour le service client et la gestion des stocks
- **Infrastructure de Production** : Déploiements Azure OpenAI multi-régions, Recherche AI, Applications Conteneurs et surveillance complète  
- **Modèle ARM prêt à déployer** : Déploiement en un clic avec plusieurs modes de configuration (Minimal/Standard/Premium)  
- **Fonctionnalités Avancées** : Validation de sécurité Red Teaming, cadre d'évaluation des agents, optimisation des coûts et guides de dépannage  
- **Contexte Réel d'Entreprise** : Cas d'utilisation pour le support client d'un détaillant avec téléversement de fichiers, intégration de recherche et mise à l'échelle dynamique  

**Technologies** : Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Applications Conteneurs, Cosmos DB, Application Insights, Intelligence Documentaire, API de Recherche Bing  

**Complexité** : ⭐⭐⭐⭐ (Avancé - Prêt pour la Production en Entreprise)  

**Idéal pour** : Développeurs AI, architectes de solutions et équipes construisant des systèmes multi-agents en production  

**Démarrage Rapide** : Déployez la solution complète en moins de 30 minutes avec le modèle ARM inclus en utilisant `./deploy.sh -g myResourceGroup`  

## 📋 Instructions d'Utilisation  

### Prérequis  

Avant d'exécuter un exemple :  
- ✅ Abonnement Azure avec accès Propriétaire ou Contributeur  
- ✅ Azure Developer CLI installé ([Guide d'Installation](../docs/getting-started/installation.md))  
- ✅ Docker Desktop en cours d'exécution (pour les exemples de conteneurs)  
- ✅ Quotas Azure appropriés (vérifiez les exigences spécifiques à l'exemple)  

> **💰 Avertissement sur les Coûts :** Tous les exemples créent des ressources Azure réelles qui entraînent des frais. Consultez les fichiers README individuels pour des estimations de coûts. N'oubliez pas d'exécuter `azd down` une fois terminé pour éviter des coûts continus.  

### Exécution des Exemples en Local  

1. **Cloner ou Copier l'Exemple**  
   ```bash
   # Naviguer vers l'exemple souhaité
   cd examples/simple-web-app
   ```
  
2. **Initialiser l'Environnement AZD**  
   ```bash
   # Initialiser avec le modèle existant
   azd init
   
   # Ou créer un nouvel environnement
   azd env new my-environment
   ```
  
3. **Configurer l'Environnement**  
   ```bash
   # Définir les variables requises
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Déployer**  
   ```bash
   # Déployer l'infrastructure et l'application
   azd up
   ```
  
5. **Vérifier le Déploiement**  
   ```bash
   # Obtenir les points de terminaison du service
   azd env get-values
   
   # Tester le point de terminaison (exemple)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Indicateurs de Succès Attendus :**  
   - ✅ `azd up` s'exécute sans erreurs  
   - ✅ Le point de terminaison du service retourne un HTTP 200  
   - ✅ Le Portail Azure affiche le statut "En cours d'exécution"  
   - ✅ Application Insights reçoit des télémétries  

> **⚠️ Problèmes ?** Consultez [Problèmes Courants](../docs/troubleshooting/common-issues.md) pour le dépannage des déploiements  

### Adapter les Exemples  

Chaque exemple inclut :  
- **README.md** - Instructions détaillées pour la configuration et la personnalisation  
- **azure.yaml** - Configuration AZD avec commentaires  
- **infra/** - Modèles Bicep avec explications des paramètres  
- **src/** - Code d'application exemple  
- **scripts/** - Scripts d'aide pour les tâches courantes  

## 🎯 Objectifs d'Apprentissage  

### Catégories d'Exemples  

#### **Déploiements de Base**  
- Applications à service unique  
- Modèles d'infrastructure simples  
- Gestion de configuration de base  
- Configurations de développement économiques  

#### **Scénarios Avancés**  
- Architectures multi-services  
- Configurations réseau complexes  
- Modèles d'intégration de bases de données  
- Implémentations de sécurité et conformité  

#### **Modèles Prêts pour la Production**  
- Configurations haute disponibilité  
- Surveillance et observabilité  
- Intégration CI/CD  
- Configurations de reprise après sinistre  

## 📖 Descriptions des Exemples  

### Application Web Simple - Node.js Express  
**Technologies** : Node.js, Express, MongoDB, Applications Conteneurs  
**Complexité** : Débutant  
**Concepts** : Déploiement de base, API REST, intégration de base de données NoSQL  

### Site Web Statique - React SPA  
**Technologies** : React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexité** : Débutant  
**Concepts** : Hébergement statique, backend serverless, développement web moderne  

### Application Conteneurisée - Python Flask  
**Technologies** : Python Flask, Docker, Applications Conteneurs, Registre de Conteneurs, Application Insights  
**Complexité** : Débutant  
**Concepts** : Conteneurisation, API REST, mise à l'échelle à zéro, sondes de santé, surveillance  
**Localisation** : [Exemple Local](../../../examples/container-app/simple-flask-api)  

### Application Conteneurisée - Architecture Microservices  
**Technologies** : Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Applications Conteneurs  
**Complexité** : Avancé  
**Concepts** : Architecture multi-services, communication entre services, file d'attente de messages, traçage distribué  
**Localisation** : [Exemple Local](../../../examples/container-app/microservices)  

### Application Base de Données - C# avec Azure SQL  
**Technologies** : C# ASP.NET Core, Base de Données Azure SQL, App Service  
**Complexité** : Intermédiaire  
**Concepts** : Entity Framework, connexions à la base de données, développement d'API web  

### Fonction Serverless - Python Azure Functions  
**Technologies** : Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexité** : Intermédiaire  
**Concepts** : Architecture événementielle, informatique serverless, développement full-stack  

### Microservices - Java Spring Boot  
**Technologies** : Java Spring Boot, Applications Conteneurs, Service Bus, API Gateway  
**Complexité** : Intermédiaire  
**Concepts** : Communication entre microservices, systèmes distribués, modèles d'entreprise  

### Exemples Azure AI Foundry  

#### Application de Chat Azure OpenAI  
**Technologies** : Azure OpenAI, Recherche Cognitive, App Service  
**Complexité** : Intermédiaire  
**Concepts** : Architecture RAG, recherche vectorielle, intégration LLM  

#### Traitement de Documents AI  
**Technologies** : Intelligence Documentaire Azure AI, Stockage, Functions  
**Complexité** : Intermédiaire  
**Concepts** : Analyse de documents, OCR, extraction de données  

#### Pipeline de Machine Learning  
**Technologies** : Azure ML, MLOps, Registre de Conteneurs  
**Complexité** : Avancé  
**Concepts** : Entraînement de modèles, pipelines de déploiement, surveillance  

## 🛠 Exemples de Configuration  

Le répertoire `configurations/` contient des composants réutilisables :  

### Configurations d'Environnement  
- Paramètres d'environnement de développement  
- Configurations d'environnement de préproduction  
- Configurations prêtes pour la production  
- Configurations de déploiement multi-régions  

### Modules Bicep  
- Composants d'infrastructure réutilisables  
- Modèles de ressources courants  
- Modèles renforcés pour la sécurité  
- Configurations optimisées pour les coûts  

### Scripts d'Aide  
- Automatisation de la configuration de l'environnement  
- Scripts de migration de base de données  
- Outils de validation de déploiement  
- Utilitaires de suivi des coûts  

## 🔧 Guide de Personnalisation  

### Adapter les Exemples à Votre Cas d'Utilisation  

1. **Vérifier les Prérequis**  
   - Vérifiez les exigences des services Azure  
   - Vérifiez les limites de l'abonnement  
   - Comprenez les implications des coûts  

2. **Modifier la Configuration**  
   - Mettez à jour les définitions de service dans `azure.yaml`  
   - Personnalisez les modèles Bicep  
   - Ajustez les variables d'environnement  

3. **Tester en Profondeur**  
   - Déployez d'abord dans un environnement de développement  
   - Validez les fonctionnalités  
   - Testez la mise à l'échelle et les performances  

4. **Revue de Sécurité**  
   - Examinez les contrôles d'accès  
   - Implémentez la gestion des secrets  
   - Activez la surveillance et les alertes  

## 📊 Tableau Comparatif  

| Exemple | Services | Base de Données | Auth | Surveillance | Complexité |  
|---------|----------|----------------|------|--------------|------------|  
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | Complet | ⭐⭐ |  
| **Python Flask API** (Local) | 1 | ❌ | Basique | Complet | ⭐ |  
| **Microservices** (Local) | 5+ | ✅ | Entreprise | Avancé | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Basique | Basique | ⭐ |  
| React SPA + Functions | 3 | ✅ | Basique | Complet | ⭐ |  
| Python Flask Conteneur | 2 | ❌ | Basique | Complet | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Complet | Complet | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Complet | Complet | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | Complet | Complet | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Complet | Complet | ⭐⭐⭐ |  
| Traitement de Documents AI | 2 | ❌ | Basique | Complet | ⭐⭐ |  
| Pipeline ML | 4+ | ✅ | Complet | Complet | ⭐⭐⭐⭐ |  
| **Multi-Agent Retail** (Local) | **8+** | **✅** | **Entreprise** | **Avancé** | **⭐⭐⭐⭐** |  

## 🎓 Parcours d'Apprentissage  

### Progression Recommandée  

1. **Commencez avec une Application Web Simple**  
   - Apprenez les concepts de base d'AZD  
   - Comprenez le flux de travail de déploiement  
   - Entraînez-vous à gérer les environnements  

2. **Essayez un Site Web Statique**  
   - Explorez différentes options d'hébergement  
   - Apprenez l'intégration CDN  
   - Comprenez la configuration DNS  

3. **Passez à une Application Conteneurisée**  
   - Apprenez les bases de la conteneurisation  
   - Comprenez les concepts de mise à l'échelle  
   - Entraînez-vous avec Docker  

4. **Ajoutez une Intégration de Base de Données**  
   - Apprenez le provisionnement de bases de données  
   - Comprenez les chaînes de connexion  
   - Entraînez-vous à gérer les secrets  

5. **Explorez le Serverless**  
   - Comprenez l'architecture événementielle  
   - Apprenez les déclencheurs et les liaisons  
   - Entraînez-vous avec les API  

6. **Construisez des Microservices**  
   - Apprenez la communication entre services  
   - Comprenez les systèmes distribués  
   - Entraînez-vous avec des déploiements complexes  

## 🔍 Trouver le Bon Exemple  

### Par Pile Technologique  
- **Applications Conteneurs** : [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js** : Application Todo Node.js Express, [API Gateway Microservices (Local)](../../../examples/container-app/microservices)  
- **Python** : [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Service Produit Microservices (Local)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#** : [Service Commande Microservices (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Application Chat Azure OpenAI, Pipeline ML  
- **Go** : [Service Utilisateur Microservices (Local)](../../../examples/container-app/microservices)  
- **Java** : Microservices Java Spring Boot  
- **React** : React SPA + Functions  
- **Conteneurs** : [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices  
- **Bases de Données** : [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML** : **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Application Chat Azure OpenAI, Traitement de Documents AI, Pipeline ML, **Solution Multi-Agent Retail**  
- **Systèmes Multi-Agents** : **Solution Multi-Agent Retail**  
- **Intégration OpenAI** : **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Solution Multi-Agent Retail  
- **Production en Entreprise** : [Microservices (Local)](../../../examples/container-app/microservices), **Solution Multi-Agent Retail**  

### Par Modèle d'Architecture  
- **API REST Simple** : [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)  
- **Monolithique** : Application Todo Node.js Express, C# Web API + SQL  
- **Statique + Serverless** : React SPA + Functions, Python Functions + SPA  
- **Microservices** : [Microservices de Production (Local)](../../../examples/container-app/microservices), Microservices Java Spring Boot  
- **Conteneurisé** : [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)  
- **Propulsé par l'IA** : **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Application Chat Azure OpenAI, Traitement de Documents AI, Pipeline ML, **Solution Multi-Agent Retail**  
- **Architecture Multi-Agents** : **Solution Multi-Agent Retail**  
- **Multi-Services en Entreprise** : [Microservices (Local)](../../../examples/container-app/microservices), **Solution Multi-Agent Retail**  

### Par Niveau de Complexité  
- **Débutant** : [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Application Todo Node.js Express, React SPA + Functions  
- **Intermédiaire** : **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Microservices Java, Application Chat Azure OpenAI, Traitement de Documents AI  
- **Avancé** : Pipeline ML  
- **Prêt pour la Production en Entreprise** : [Microservices (Local)](../../../examples/container-app/microservices) (Multi-services avec file de messages), **Solution Multi-Agent Retail** (Système multi-agents complet avec déploiement via modèle ARM)  

## 📚 Ressources Supplémentaires  

### Liens de Documentation  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Modèles AZD Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [Documentation Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centre d'Architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Exemples Communautaires  
- [Modèles AZD Azure Samples](https://github.com/Azure-Samples/azd-templates)  
- [Modèles Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [Galerie Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [Application Todo avec C# et Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Application Todo avec Python et MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Application Todo avec Node.js et PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [Application Web React avec API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [Job Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)  
- [Azure Functions avec Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### Bonnes Pratiques  
- [Framework Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [Framework d'Adoption Cloud](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 Contribuer des exemples  

Vous avez un exemple utile à partager ? Nous accueillons vos contributions !  

### Directives de Soumission  
1. Suivez la structure de répertoire établie  
2. Incluez un README.md complet  
3. Ajoutez des commentaires aux fichiers de configuration  
4. Testez minutieusement avant de soumettre  
5. Incluez des estimations de coûts et des prérequis  

### Structure Modèle d'Exemple  
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```
  
---  

**Astuce Pro** : Commencez par l'exemple le plus simple correspondant à votre pile technologique, puis progressez vers des scénarios plus complexes. Chaque exemple s'appuie sur les concepts des précédents !  

## 🚀 Prêt à Commencer ?  

### Votre Parcours d'Apprentissage  

1. **Débutant complet ?** → Commencez par [API Flask](../../../examples/container-app/simple-flask-api) (⭐, 20 min)  
2. **Connaissances de base en AZD ?** → Essayez [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)  
3. **Développez des applications IA ?** → Commencez par [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) ou explorez [Multi-Agent Retail](retail-scenario.md) (⭐⭐⭐⭐, 2+ heures)  
4. **Besoin d'une pile technologique spécifique ?** → Utilisez la section [Trouver le bon exemple](../../../examples) ci-dessus  

### Prochaines Étapes  

- ✅ Consultez les [Prérequis](../../../examples) ci-dessus  
- ✅ Choisissez un exemple correspondant à votre niveau de compétence (voir [Légende de Complexité](../../../examples))  
- ✅ Lisez attentivement le README de l'exemple avant de déployer  
- ✅ Mettez un rappel pour exécuter `azd down` après les tests  
- ✅ Partagez votre expérience via GitHub Issues ou Discussions  

### Besoin d'Aide ?  

- 📖 [FAQ](../resources/faq.md) - Réponses aux questions courantes  
- 🐛 [Guide de Dépannage](../docs/troubleshooting/common-issues.md) - Résolution des problèmes de déploiement  
- 💬 [Discussions GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Posez vos questions à la communauté  
- 📚 [Guide d'Étude](../resources/study-guide.md) - Renforcez vos connaissances  

---  

**Navigation**  
- **📚 Accueil du Cours** : [AZD Pour Débutants](../README.md)  
- **📖 Matériaux d'Étude** : [Guide d'Étude](../resources/study-guide.md) | [Fiche Mémo](../resources/cheat-sheet.md) | [Glossaire](../resources/glossary.md)  
- **🔧 Ressources** : [FAQ](../resources/faq.md) | [Dépannage](../docs/troubleshooting/common-issues.md)  

---  

*Dernière mise à jour : Novembre 2025 | [Signaler des problèmes](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuer des exemples](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->