# Exemples - Modèles et configurations AZD pratiques

**Apprendre par l'exemple - Organisé par chapitre**
- **📚 Page du cours** : [AZD For Beginners](../README.md)
- **📖 Cartographie des chapitres** : Exemples organisés par complexité d'apprentissage
- **🚀 Exemple local** : [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 Exemples externes d'IA** : Liens vers les dépôts Azure Samples

> **📍 IMPORTANT : Exemples locaux vs externes**  
> Ce dépôt contient **4 exemples locaux complets** avec des implémentations complètes :  
> - **Microsoft Foundry Models Chat** (déploiement gpt-4.1 avec interface de chat)  
> - **Container Apps** (API Flask simple + microservices)  
> - **Database App** (Web + base de données SQL)  
> - **Retail Multi-Agent** (solution Enterprise AI)  
>   
> Des exemples supplémentaires sont des **références externes** vers des dépôts Azure-Samples que vous pouvez cloner.

## Introduction

Ce répertoire fournit des exemples pratiques et des références pour vous aider à apprendre Azure Developer CLI par la pratique. Le scénario Retail Multi-Agent est une implémentation complète prête pour la production incluse dans ce dépôt. Des exemples supplémentaires renvoient aux Azure Samples officiels qui démontrent divers modèles AZD.

### Légende de la difficulté

- ⭐ **Débutant** - Concepts de base, service unique, 15-30 minutes
- ⭐⭐ **Intermédiaire** - Plusieurs services, intégration de base de données, 30-60 minutes
- ⭐⭐⭐ **Avancé** - Architecture complexe, intégration d'IA, 1-2 heures
- ⭐⭐⭐⭐ **Expert** - Prêt pour la production, modèles d'entreprise, 2+ heures

## 🎯 Ce que contient réellement ce dépôt

### ✅ Implémentation locale (prête à l'emploi)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Déploiement complet gpt-4.1 avec interface de chat inclus dans ce dépôt**

- **Emplacement :** `examples/azure-openai-chat/`
- **Complexité :** ⭐⭐ (Intermédiaire)
- **Ce qui est inclus :**
  - Déploiement complet Microsoft Foundry Models (gpt-4.1)
  - Interface de chat en ligne de commande Python
  - Intégration Key Vault pour les clés API sécurisées
  - Modèles d'infrastructure Bicep
  - Suivi de l'utilisation des jetons et des coûts
  - Limitation de débit et gestion des erreurs

**Démarrage rapide :**
```bash
# Accédez à l'exemple
cd examples/azure-openai-chat

# Déployez tout
azd up

# Installez les dépendances et commencez à discuter
pip install -r src/requirements.txt
python src/chat.py
```

**Technologies :** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Exemples Container App](container-app/README.md) 🆕
**Exemples complets de déploiement de conteneurs inclus dans ce dépôt**

- **Emplacement :** `examples/container-app/`
- **Complexité :** ⭐-⭐⭐⭐⭐ (Débutant à Avancé)
- **Ce qui est inclus :**
  - [Guide principal](container-app/README.md) - Vue d'ensemble complète des déploiements de conteneurs
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Exemple d'API REST de base
  - [Microservices Architecture](../../../examples/container-app/microservices) - Déploiement multi-service prêt pour la production
  - Modèles Démarrage rapide, Production et Avancés
  - Surveillance, sécurité et optimisation des coûts

**Démarrage rapide :**
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

**Technologies :** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Implémentation complète prête pour la production incluse dans ce dépôt**

- **Emplacement :** `examples/retail-multiagent-arm-template/`
- **Complexité :** ⭐⭐⭐⭐ (Avancé)
- **Ce qui est inclus :**
  - Modèle de déploiement ARM complet
  - Architecture multi-agent (Customer + Inventory)
  - Intégration Microsoft Foundry Models
  - AI Search avec RAG
  - Surveillance complète
  - Script de déploiement en un clic

**Démarrage rapide :**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologies :** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Azure Samples externes (cloner pour utiliser)

Les exemples suivants sont maintenus dans des dépôts officiels Azure-Samples. Clonez-les pour explorer différents modèles AZD :

### Applications simples (Chapitres 1-2)

| Modèle | Dépôt | Complexité | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local : simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Local : microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Comment les utiliser :**
```bash
# Cloner n'importe quel exemple
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Déployer
azd up
```

### Exemples d'applications IA (Chapitres 2, 5, 8)

| Modèle | Dépôt | Complexité | Focus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Local : azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | déploiement gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat IA de base |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Cadre d'agents |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Modèle RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | IA d'entreprise |

### Base de données et modèles avancés (Chapitres 3-8)

| Modèle | Dépôt | Complexité | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Intégration base de données |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Objectifs d'apprentissage

En travaillant sur ces exemples, vous allez :
- Vous exercer aux workflows Azure Developer CLI avec des scénarios d'application réalistes
- Comprendre différentes architectures d'application et leurs implémentations azd
- Maîtriser les modèles Infrastructure as Code pour divers services Azure
- Appliquer la gestion de configuration et des stratégies de déploiement spécifiques à l'environnement
- Mettre en œuvre des modèles de surveillance, de sécurité et de montée en charge dans des contextes pratiques
- Acquérir de l'expérience en dépannage et débogage de scénarios de déploiement réels

## Résultats d'apprentissage

Une fois ces exemples terminés, vous serez capable de :
- Déployer différents types d'applications en toute confiance avec Azure Developer CLI
- Adapter les modèles fournis aux exigences de vos propres applications
- Concevoir et implémenter des modèles d'infrastructure personnalisés en utilisant Bicep
- Configurer des applications multi-service complexes avec des dépendances appropriées
- Appliquer les bonnes pratiques de sécurité, de surveillance et de performance dans des scénarios réels
- Dépanner et optimiser les déploiements sur la base d'une expérience pratique

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

> **💡 Nouveau sur AZD ?** Commencez par l'exemple n°1 (Flask API) - il prend ~20 minutes et enseigne les concepts de base.

### Pour les débutants
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Déployez une API REST simple avec scale-to-zero  
   **Durée :** 20-25 minutes | **Coût :** $0-5/month  
   **Vous apprendrez :** Flux de travail azd de base, containerisation, probes de santé  
   **Résultat attendu :** Endpoint API fonctionnel renvoyant "Hello, World!" avec surveillance

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Déployez une application web Node.js Express avec MongoDB  
   **Durée :** 25-35 minutes | **Coût :** $10-30/month  
   **Vous apprendrez :** Intégration de base de données, variables d'environnement, chaînes de connexion  
   **Résultat attendu :** Application Todo avec fonctionnalités create/read/update/delete

3. **[Site statique - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hébergez un site React statique avec Azure Static Web Apps  
   **Durée :** 20-30 minutes | **Coût :** $0-10/month  
   **Vous apprendrez :** Hébergement statique, fonctions serverless, déploiement CDN  
   **Résultat attendu :** UI React avec backend API, SSL automatique, CDN global

### Pour utilisateurs intermédiaires
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Déployez gpt-4.1 avec interface de chat et gestion sécurisée des clés API  
   **Durée :** 35-45 minutes | **Coût :** $50-200/month  
   **Vous apprendrez :** Déploiement Microsoft Foundry Models, intégration Key Vault, suivi des jetons  
   **Résultat attendu :** Application de chat fonctionnelle avec gpt-4.1 et suivi des coûts

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Architecture multi-service prête pour la production  
   **Durée :** 45-60 minutes | **Coût :** $50-150/month  
   **Vous apprendrez :** Communication entre services, mise en file de messages, traçage distribué  
   **Résultat attendu :** Système à 2 services (API Gateway + Product Service) avec surveillance

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Application web avec API C# et base de données Azure SQL  
   **Durée :** 30-45 minutes | **Coût :** $20-80/month  
   **Vous apprendrez :** Entity Framework, migrations de base de données, sécurité des connexions  
   **Résultat attendu :** API C# avec backend Azure SQL, déploiement de schéma automatique

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions avec triggers HTTP et Cosmos DB  
   **Durée :** 30-40 minutes | **Coût :** $10-40/month  
   **Vous apprendrez :** Architecture pilotée par les événements, mise à l'échelle serverless, intégration NoSQL  
   **Résultat attendu :** Function app répondant aux requêtes HTTP avec stockage dans Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Application Java multi-service avec Container Apps et API gateway  
   **Durée :** 60-90 minutes | **Coût :** $80-200/month  
   **Vous apprendrez :** Déploiement Spring Boot, service mesh, équilibrage de charge  
   **Résultat attendu :** Système Java multi-service avec découverte de services et routage

### Modèles Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Exemple local](../../../examples/azure-openai-chat)** ⭐⭐  
   Déploiement complet gpt-4.1 avec interface de chat  
   **Durée :** 35-45 minutes | **Coût :** $50-200/month  
   **Résultat attendu :** Application de chat fonctionnelle avec suivi des jetons et surveillance des coûts

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Application de chat intelligente avec architecture RAG  
   **Durée :** 60-90 minutes | **Coût :** $100-300/month  
   **Résultat attendu :** Interface de chat RAG avec recherche de documents et citations

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analyse de documents utilisant les services Azure AI  
   **Durée :** 40-60 minutes | **Coût :** $20-80/month  
   **Résultat attendu :** API extrayant texte, tableaux et entités à partir de documents téléchargés

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Flux MLOps avec Azure Machine Learning  
   **Durée :** 2-3 heures | **Coût :** $150-500/month  
   **Résultat attendu :** Pipeline ML automatisé avec entraînement, déploiement et surveillance

### Scénarios réels

#### **Retail Multi-Agent Solution** 🆕
**[Guide d'implémentation complet](./retail-scenario.md)**

Une solution multi-agent complète et prête pour la production de support client qui démontre le déploiement d'applications IA de niveau entreprise avec AZD. Ce scénario fournit :
- **Architecture complète** : Système multi-agent avec des agents spécialisés pour le service client et la gestion des stocks
- **Infrastructure de production** : Déploiements multi-régions Microsoft Foundry Models, Azure AI Search, Container Apps, et surveillance complète
- **Modèle ARM prêt à déployer** : Déploiement en un clic avec plusieurs modes de configuration (Minimal/Standard/Premium)
- **Fonctionnalités avancées** : Validation de sécurité par red teaming, cadre d'évaluation des agents, optimisation des coûts et guides de dépannage
- **Contexte commercial réel** : Cas d'assistance client pour un détaillant avec téléversement de fichiers, intégration de recherche et mise à l'échelle dynamique

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexité**: ⭐⭐⭐⭐ (Avancé - Prêt pour la production en entreprise)

**Parfait pour**: développeurs IA, architectes de solutions, et équipes construisant des systèmes multi-agents en production

**Démarrage rapide**: Déployez la solution complète en moins de 30 minutes en utilisant le modèle ARM inclus avec `./deploy.sh -g myResourceGroup`

## 📋 Instructions d'utilisation

### Prérequis

Avant d'exécuter un exemple :
- ✅ Abonnement Azure avec accès Propriétaire ou Contributeur
- ✅ Azure Developer CLI installé ([Guide d'installation](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop en cours d'exécution (pour les exemples en conteneur)
- ✅ Quotas Azure appropriés (vérifiez les exigences spécifiques à chaque exemple)

> **💰 Avertissement sur les coûts :** Tous les exemples créent de réelles ressources Azure qui entraînent des frais. Consultez les fichiers README individuels pour des estimations de coûts. Pensez à exécuter `azd down` lorsque vous avez fini pour éviter des frais continus.

### Exécution des exemples localement

1. **Cloner ou copier l'exemple**
   ```bash
   # Accédez à l'exemple souhaité
   cd examples/simple-web-app
   ```

2. **Initialiser l'environnement AZD**
   ```bash
   # Initialiser à partir d'un modèle existant
   azd init
   
   # Ou créer un nouvel environnement
   azd env new my-environment
   ```

3. **Configurer l'environnement**
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

5. **Vérifier le déploiement**
   ```bash
   # Obtenir les points de terminaison du service
   azd env get-values
   
   # Tester le point de terminaison (exemple)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Indicateurs de réussite attendus :**
   - ✅ `azd up` se termine sans erreurs
   - ✅ Le point de terminaison du service renvoie HTTP 200
   - ✅ Le portail Azure affiche le statut "Running"
   - ✅ Application Insights reçoit la télémétrie

> **⚠️ Problèmes ?** Voir [Problèmes courants](../docs/chapter-07-troubleshooting/common-issues.md) pour le dépannage du déploiement

### Adapter les exemples

Chaque exemple inclut :
- **README.md** - Instructions détaillées d'installation et de personnalisation
- **azure.yaml** - Configuration AZD avec commentaires
- **infra/** - Templates Bicep avec explications des paramètres
- **src/** - Code d'exemple de l'application
- **scripts/** - Scripts d'assistance pour les tâches courantes

## 🎯 Objectifs d'apprentissage

### Catégories d'exemples

#### **Déploiements de base**
- Applications à service unique
- Patrons d'infrastructure simples
- Gestion de configuration basique
- Configurations de développement économiques

#### **Scénarios avancés**
- Architectures multi-service
- Configurations réseau complexes
- Patrons d'intégration de base de données
- Implémentations de sécurité et de conformité

#### **Modèles prêts pour la production**
- Configurations haute disponibilité
- Surveillance et observabilité
- Intégration CI/CD
- Plans de reprise après sinistre

## 📖 Descriptions des exemples

### Simple Web App - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexité**: Débutant  
**Concepts**: Déploiement basique, API REST, intégration base de données NoSQL

### Static Website - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexité**: Débutant  
**Concepts**: Hébergement statique, backend serverless, développement web moderne

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexité**: Débutant  
**Concepts**: Conteneurisation, API REST, scale-to-zero, probes de santé, surveillance  
**Emplacement**: [Exemple local](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexité**: Avancé  
**Concepts**: Architecture multi-service, communication entre services, mise en file de messages, traçage distribué  
**Emplacement**: [Exemple local](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexité**: Intermédiaire  
**Concepts**: Entity Framework, connexions à la base de données, développement d'API web

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexité**: Intermédiaire  
**Concepts**: Architecture pilotée par les événements, computing serverless, développement full-stack

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexité**: Intermédiaire  
**Concepts**: Communication microservices, systèmes distribués, patrons d'entreprise

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Cognitive Search, App Service  
**Complexité**: Intermédiaire  
**Concepts**: Architecture RAG, recherche vectorielle, intégration LLM

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexité**: Intermédiaire  
**Concepts**: Analyse de documents, OCR, extraction de données

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexité**: Avancé  
**Concepts**: Entraînement de modèles, pipelines de déploiement, surveillance

## 🛠 Exemples de configuration

Le répertoire `configurations/` contient des composants réutilisables :

### Configurations d'environnement
- Paramètres pour l'environnement de développement
- Configurations pour l'environnement de staging
- Configurations prêtes pour la production
- Configurations de déploiement multi-régions

### Modules Bicep
- Composants d'infrastructure réutilisables
- Patrons de ressources courants
- Templates renforcés pour la sécurité
- Configurations optimisées pour les coûts

### Scripts d'aide
- Automatisation de la configuration d'environnement
- Scripts de migration de base de données
- Outils de validation de déploiement
- Utilitaires de suivi des coûts

## 🔧 Guide de personnalisation

### Adapter les exemples à votre cas d'utilisation

1. **Revoir les prérequis**
   - Vérifier les exigences des services Azure
   - Vérifier les limites de l'abonnement
   - Comprendre les implications en termes de coûts

2. **Modifier la configuration**
   - Mettre à jour les définitions de service dans `azure.yaml`
   - Personnaliser les templates Bicep
   - Ajuster les variables d'environnement

3. **Tester soigneusement**
   - Déployer d'abord sur l'environnement de développement
   - Valider les fonctionnalités
   - Tester la montée en charge et les performances

4. **Revue de sécurité**
   - Revoir les contrôles d'accès
   - Mettre en œuvre la gestion des secrets
   - Activer la surveillance et les alertes

## 📊 Matrice de comparaison

| Exemple | Services | Base de données | Auth | Surveillance | Complexité |
|---------|----------|-----------------|------|--------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Complet | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basique | Complet | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Avancé | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basique | Basique | ⭐ |
| React SPA + Functions | 3 | ✅ | Basique | Complet | ⭐ |
| Python Flask Container | 2 | ❌ | Basique | Complet | ⭐ |
| C# Web API + SQL | 2 | ✅ | Complet | Complet | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Complet | Complet | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Complet | Complet | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Complet | Complet | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basique | Complet | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Complet | Complet | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Entreprise** | **Avancé** | **⭐⭐⭐⭐** |

## 🎓 Parcours d'apprentissage

### Progression recommandée

1. **Commencer par l'Application Web simple**
   - Apprendre les concepts AZD de base
   - Comprendre le workflow de déploiement
   - S'exercer à la gestion des environnements

2. **Essayer le site statique**
   - Explorer différentes options d'hébergement
   - En apprendre davantage sur l'intégration CDN
   - Comprendre la configuration DNS

3. **Passer à Container App**
   - Apprendre les bases de la conteneurisation
   - Comprendre les concepts de mise à l'échelle
   - S'exercer avec Docker

4. **Ajouter l'intégration de base de données**
   - Apprendre le provisionnement de bases de données
   - Comprendre les chaînes de connexion
   - S'entraîner à la gestion des secrets

5. **Explorer le serverless**
   - Comprendre l'architecture pilotée par les événements
   - Découvrir les triggers et bindings
   - S'exercer avec des API

6. **Construire des microservices**
   - Apprendre la communication entre services
   - Comprendre les systèmes distribués
   - S'entraîner aux déploiements complexes

## 🔍 Trouver le bon exemple

### Par pile technologique
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Bases de données**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Systèmes multi-agents**: **Retail Multi-Agent Solution**
- **Intégration OpenAI**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Production entreprise**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Par modèle d'architecture
- **API REST simple**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolithique**: Node.js Express Todo, C# Web API + SQL
- **Statique + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Conteneurisé**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **Propulsé par l'IA**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Architecture multi-agent**: **Retail Multi-Agent Solution**
- **Entreprise multi-service**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Par niveau de complexité
- **Débutant**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Intermédiaire**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Avancé**: ML Pipeline
- **Prêt pour la production en entreprise**: [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service avec mise en file de messages), **Retail Multi-Agent Solution** (Système multi-agent complet avec déploiement via template ARM)

## 📚 Ressources supplémentaires

### Liens de documentation
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Exemples communautaires
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Meilleures pratiques
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuer des exemples

Vous avez un exemple utile à partager ? Nous accueillons les contributions !

### Consignes de soumission
1. Suivez la structure de répertoire établie
2. Incluez un README.md complet
3. Ajoutez des commentaires aux fichiers de configuration
4. Testez minutieusement avant de soumettre
5. Incluez des estimations de coût et les prérequis

### Structure du modèle d'exemple
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

**Astuce pro** : Commencez par l'exemple le plus simple correspondant à votre stack technologique, puis progressez progressivement vers des scénarios plus complexes. Chaque exemple s'appuie sur les concepts des précédents !

## 🚀 Prêt à commencer ?

### Votre parcours d'apprentissage

1. **Débutant complet ?** → Commencez par [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Connaissances de base d'AZD ?** → Essayez [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Développez des applications IA ?** → Commencez par [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) ou explorez [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ heures)
4. **Besoin d'une stack technologique spécifique ?** → Utilisez la section [Trouver le bon exemple](../../../examples) ci-dessus

### Étapes suivantes

- ✅ Vérifiez les [Prérequis](../../../examples) ci-dessus
- ✅ Choisissez un exemple correspondant à votre niveau (voir la [Légende de complexité](../../../examples))
- ✅ Lisez attentivement le README de l'exemple avant de déployer
- ✅ Programmez un rappel pour exécuter `azd down` après les tests
- ✅ Partagez votre expérience via GitHub Issues ou Discussions

### Besoin d'aide ?

- 📖 [FAQ](../resources/faq.md) - Réponses aux questions courantes
- 🐛 [Guide de dépannage](../docs/chapter-07-troubleshooting/common-issues.md) - Résoudre les problèmes de déploiement
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Demandez à la communauté
- 📚 [Guide d'étude](../resources/study-guide.md) - Renforcez votre apprentissage

---

**Navigation**
- **📚 Accueil du cours**: [AZD For Beginners](../README.md)
- **📖 Matériel d'étude**: [Guide d'étude](../resources/study-guide.md) | [Aide-mémoire](../resources/cheat-sheet.md) | [Glossaire](../resources/glossary.md)
- **🔧 Ressources**: [FAQ](../resources/faq.md) | [Dépannage](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Dernière mise à jour : November 2025 | [Signaler des problèmes](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuer des exemples](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Clause de non-responsabilité** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->