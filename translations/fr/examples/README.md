# Exemples - Modèles et Configurations AZD Pratiques

**Apprentissage par l'Exemple - Organisé par Chapitre**  
- **📚 Accueil du Cours** : [AZD Pour Débutants](../README.md)  
- **📖 Cartographie des Chapitres** : Exemples organisés par complexité d'apprentissage  
- **🚀 Exemple Local** : [Solution Multi-Agent Retail](retail-scenario.md)  
- **🤖 Exemples IA Externes** : Liens vers les dépôts Azure Samples  

> **📍 IMPORTANT : Exemples Locaux vs Externes**  
> Ce dépôt contient **4 exemples locaux complets** avec des implémentations intégrales :  
> - **Microsoft Foundry Models Chat** (déploiement gpt-4.1 avec interface de chat)  
> - **Container Apps** (API Flask simple + microservices)  
> - **Application Base de Données** (Web + base de données SQL)  
> - **Retail Multi-Agent** (Solution IA d'entreprise)  
>  
> D'autres exemples sont des **références externes** vers des dépôts Azure-Samples que vous pouvez cloner.

## Introduction

Ce répertoire propose des exemples pratiques et des références pour vous aider à apprendre Azure Developer CLI grâce à la pratique. Le scénario Retail Multi-Agent est une implémentation complète et prête pour la production incluse dans ce dépôt. D'autres exemples font référence aux Azure Samples officiels qui démontrent divers modèles AZD.

### Légende de la Complexité

- ⭐ **Débutant** - Concepts basiques, service unique, 15-30 minutes  
- ⭐⭐ **Intermédiaire** - Services multiples, intégration base de données, 30-60 minutes  
- ⭐⭐⭐ **Avancé** - Architecture complexe, intégration IA, 1-2 heures  
- ⭐⭐⭐⭐ **Expert** - Prêt pour la production, modèles d'entreprise, 2+ heures  

## 🎯 Ce Que Ce Dépôt Contient Réellement

### ✅ Implémentation Locale (Prête à l'Usage)

#### [Application de Chat Microsoft Foundry Models](azure-openai-chat/README.md) 🆕  
**Déploiement complet gpt-4.1 avec interface de chat inclus dans ce dépôt**

- **Emplacement :** `examples/azure-openai-chat/`  
- **Complexité :** ⭐⭐ (Intermédiaire)  
- **Inclus :**  
  - Déploiement complet Microsoft Foundry Models (gpt-4.1)  
  - Interface chat en ligne de commande Python  
  - Intégration Key Vault pour clés API sécurisées  
  - Modèles d’infrastructure Bicep  
  - Suivi de l’utilisation des tokens et des coûts  
  - Limitation de débit et gestion des erreurs  

**Démarrage rapide :**  
```bash
# Naviguer vers exemple
cd examples/azure-openai-chat

# Déployer tout
azd up

# Installer les dépendances et commencer à discuter
pip install -r src/requirements.txt
python src/chat.py
```
  
**Technologies :** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep  

#### [Exemples Container App](container-app/README.md) 🆕  
**Exemples complets de déploiement de conteneurs inclus dans ce dépôt**

- **Emplacement :** `examples/container-app/`  
- **Complexité :** ⭐-⭐⭐⭐⭐ (Débutant à Avancé)  
- **Inclus :**  
  - [Guide Principal](container-app/README.md) - Vue d’ensemble complète des déploiements de conteneurs  
  - [API Flask Simple](../../../examples/container-app/simple-flask-api) - Exemple basique d’API REST  
  - [Architecture Microservices](../../../examples/container-app/microservices) - Déploiement multi-service prêt pour la production  
  - Modèles Démarrage rapide, Production et Avancé  
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

#### [Solution Multi-Agent Retail](retail-scenario.md) 🆕  
**Implémentation complète prête pour la production incluse dans ce dépôt**

- **Emplacement :** `examples/retail-multiagent-arm-template/`  
- **Complexité :** ⭐⭐⭐⭐ (Avancé)  
- **Inclus :**  
  - Modèle de déploiement ARM complet  
  - Architecture multi-agent (Client + Inventaire)  
  - Intégration Microsoft Foundry Models  
  - Recherche IA avec RAG  
  - Surveillance complète  
  - Script de déploiement en un clic  

**Démarrage rapide :**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Technologies :** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 Azure Samples Externes (Cloner pour Utiliser)

Les exemples suivants sont maintenus dans les dépôts officiels Azure-Samples. Clonez-les pour explorer différents modèles AZD :

### Applications Simples (Chapitres 1-2)

| Modèle | Dépôt | Complexité | Services |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Local : simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Local : microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Comment utiliser :**  
```bash
# Cloner n'importe quel exemple
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Déployer
azd up
```
  
### Exemples d’Applications IA (Chapitres 2, 5, 8)

| Modèle | Dépôt | Complexité | Focus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Local : azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Déploiement gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat IA basique |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework agent |
| **Recherche + OpenAI Démo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Modèle RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | IA d’entreprise |

### Base de Données & Modèles Avancés (Chapitres 3-8)

| Modèle | Dépôt | Complexité | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Intégration base de données |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Microservices Java** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **Pipeline ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Objectifs d'Apprentissage

En travaillant avec ces exemples, vous allez :  
- Pratiquer les workflows Azure Developer CLI avec des scénarios d’application réalistes  
- Comprendre différentes architectures applicatives et leurs implémentations azd  
- Maîtriser les modèles Infrastructure as Code pour divers services Azure  
- Appliquer la gestion de configuration et les stratégies de déploiement spécifiques aux environnements  
- Implémenter des modèles de surveillance, sécurité, et mise à l’échelle dans des contextes pratiques  
- Acquérir de l’expérience dans le dépannage et le débogage de scénarios de déploiement réels  

## Résultats d’Apprentissage

Après avoir complété ces exemples, vous serez capable de :  
- Déployer en toute confiance divers types d’applications avec Azure Developer CLI  
- Adapter les modèles fournis aux besoins spécifiques de votre application  
- Concevoir et implémenter des modèles d’infrastructure personnalisés avec Bicep  
- Configurer des applications complexes multi-services avec dépendances appropriées  
- Appliquer les meilleures pratiques de sécurité, surveillance et performance en situations réelles  
- Diagnostiquer et optimiser les déploiements sur la base d’expériences pratiques  

## Structure du Répertoire

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
  
## Exemples Démarrage Rapide

> **💡 Nouveau sur AZD ?** Commencez par l’exemple #1 (Flask API) - environ 20 minutes pour apprendre les concepts de base.

### Pour Débutants  
1. **[Container App - API Python Flask](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Déployez une API REST simple avec mise à l’échelle à zéro  
   **Durée :** 20-25 minutes | **Coût :** 0-5 $ / mois  
   **Ce que vous apprenez :** Workflow azd basique, containerisation, probes de santé  
   **Résultat attendu :** Endpoint API fonctionnel retournant "Hello, World!" avec surveillance  

2. **[Application Web Simple - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Déployez une application web Node.js Express avec MongoDB  
   **Durée :** 25-35 minutes | **Coût :** 10-30 $ / mois  
   **Ce que vous apprenez :** Intégration base de données, variables d’environnement, chaînes de connexion  
   **Résultat attendu :** Application de liste de tâches avec création/lecture/mise à jour/suppression  

3. **[Site Statique - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hébergez un site statique React avec Azure Static Web Apps  
   **Durée :** 20-30 minutes | **Coût :** 0-10 $ / mois  
   **Ce que vous apprenez :** Hébergement statique, fonctions serverless, déploiement CDN  
   **Résultat attendu :** UI React avec backend API, SSL automatique, CDN global  

### Pour Utilisateurs Intermédiaires  
4. **[Application de Chat Microsoft Foundry Models](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Déployez gpt-4.1 avec interface chat et gestion sécurisée des clés API  
   **Durée :** 35-45 minutes | **Coût :** 50-200 $ / mois  
   **Ce que vous apprenez :** Déploiement Microsoft Foundry Models, intégration Key Vault, suivi des tokens  
   **Résultat attendu :** Application chat fonctionnelle avec gpt-4.1 et suivi des coûts  

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Architecture multi-service prête pour la production  
   **Durée :** 45-60 minutes | **Coût :** 50-150 $ / mois  
   **Ce que vous apprenez :** Communication entre services, gestion file de messages, traçage distribué  
   **Résultat attendu :** Système à 2 services (API Gateway + Service Produit) avec surveillance  

6. **[Application Base de Données - C# avec Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Application web avec API C# et base Azure SQL  
   **Durée :** 30-45 minutes | **Coût :** 20-80 $ / mois  
   **Ce que vous apprenez :** Entity Framework, migrations de base, sécurité des connexions  
   **Résultat attendu :** API C# avec backend Azure SQL, déploiement de schéma automatique  

7. **[Fonction Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Azure Functions Python avec déclencheurs HTTP et Cosmos DB  
   **Durée :** 30-40 minutes | **Coût :** 10-40 $ / mois  
   **Ce que vous apprenez :** Architecture événementielle, mise à l’échelle serverless, intégration NoSQL  
   **Résultat attendu :** Application fonction répondant aux requêtes HTTP avec stockage Cosmos DB  

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Application Java multi-service avec Container Apps et API gateway  
   **Durée :** 60-90 minutes | **Coût :** 80-200 $ / mois  
   **Ce que vous apprenez :** Déploiement Spring Boot, service mesh, répartition de charge  
   **Résultat attendu :** Système Java multi-service avec découverte et routage de services  

### Modèles Microsoft Foundry

1. **[Application Chat Microsoft Foundry Models - Exemple Local](../../../examples/azure-openai-chat)** ⭐⭐  
   Déploiement complet gpt-4.1 avec interface chat  
   **Durée :** 35-45 minutes | **Coût :** 50-200 $ / mois  
   **Résultat attendu :** Application chat fonctionnelle avec suivi des tokens et des coûts  

2. **[Azure Search + OpenAI Démo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Application chat intelligente avec architecture RAG  
   **Durée :** 60-90 minutes | **Coût :** 100-300 $ / mois  
   **Résultat attendu :** Interface chat alimentée en RAG avec recherche documentaire et citations  

3. **[Traitement de Documents IA](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analyse documentaire avec les services Azure AI  
   **Durée :** 40-60 minutes | **Coût :** 20-80 $ / mois  
   **Résultat attendu :** API extrayant texte, tableaux et entités de documents téléchargés  

4. **[Pipeline Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Workflow MLOps avec Azure Machine Learning  
   **Durée :** 2-3 heures | **Coût :** 150-500 $ / mois  
   **Résultat attendu :** Pipeline ML automatisé avec entraînement, déploiement et surveillance  

### Scénarios Réels

#### **Solution Multi-Agent Retail** 🆕  
**[Guide d’Implémentation Complète](./retail-scenario.md)**

Une solution complète, prête pour la production, de support client multi-agent qui démontre le déploiement d’une application IA d'entreprise avec AZD. Ce scénario fournit :

- **Architecture Complète** : Système multi-agent avec agents spécialisés support client et gestion des stocks
- **Infrastructure de production** : Déploiements multi-régions des modèles Microsoft Foundry, Azure AI Search, Container Apps et surveillance complète  
- **Modèle ARM prêt à déployer** : Déploiement en un clic avec plusieurs modes de configuration (Minimal/Standard/Premium)  
- **Fonctionnalités avancées** : Validation de sécurité Red Teaming, cadre d’évaluation des agents, optimisation des coûts et guides de dépannage  
- **Contexte métier réel** : Cas d’usage support client retail avec téléchargement de fichiers, intégration de recherche et mise à l’échelle dynamique  

**Technologies** : Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Complexité** : ⭐⭐⭐⭐ (Avancé - Prêt pour production entreprise)  

**Parfait pour** : Développeurs IA, architectes solutions et équipes construisant des systèmes multi-agents en production  

**Démarrage rapide** : Déployez la solution complète en moins de 30 minutes avec le modèle ARM inclus via `./deploy.sh -g myResourceGroup`  

## 📋 Instructions d’utilisation  

### Prérequis  

Avant d’exécuter un exemple :  
- ✅ Abonnement Azure avec accès Propriétaire ou Contributeur  
- ✅ Azure Developer CLI installé ([Guide d’installation](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop en fonctionnement (pour les exemples conteneurisés)  
- ✅ Quotas Azure appropriés (vérifiez les exigences spécifiques à chaque exemple)  

> **💰 Avertissement coûts :** Tous les exemples créent de véritables ressources Azure générant des frais. Consultez les README spécifiques pour les estimations. N’oubliez pas d’exécuter `azd down` à la fin pour éviter les coûts continus.  

### Exécution locale des exemples  

1. **Cloner ou copier l’exemple**  
   ```bash
   # Naviguer vers l'exemple souhaité
   cd examples/simple-web-app
   ```
  
2. **Initialiser l’environnement AZD**  
   ```bash
   # Initialiser avec le modèle existant
   azd init
   
   # Ou créer un nouvel environnement
   azd env new my-environment
   ```
  
3. **Configurer l’environnement**  
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
  
   **Indicateurs de succès attendus :**  
   - ✅ `azd up` se termine sans erreurs  
   - ✅ Point de terminaison du service répond HTTP 200  
   - ✅ Portail Azure affiche le statut "En cours d’exécution"  
   - ✅ Application Insights reçoit la télémétrie  

> **⚠️ Problèmes ?** Consultez [Problèmes courants](../docs/chapter-07-troubleshooting/common-issues.md) pour le dépannage du déploiement  

### Adapter les exemples  

Chaque exemple comprend :  
- **README.md** - Instructions détaillées de mise en place et personnalisation  
- **azure.yaml** - Configuration AZD commentée  
- **infra/** - Modèles Bicep avec explications des paramètres  
- **src/** - Code d’application exemple  
- **scripts/** - Scripts d’aide pour tâches courantes  

## 🎯 Objectifs d’apprentissage  

### Catégories d’exemples  

#### **Déploiements basiques**  
- Applications mono-service  
- Modèles d’infrastructure simples  
- Gestion de configuration basique  
- Configurations développement économiques  

#### **Scénarios avancés**  
- Architectures multi-services  
- Configurations réseau complexes  
- Modèles d’intégration base de données  
- Implémentations sécurité et conformité  

#### **Modèles prêts pour production**  
- Configurations haute disponibilité  
- Surveillance et observabilité  
- Intégration CI/CD  
- Plans de reprise après sinistre  

## 📖 Descriptions des exemples  

### Application web simple - Node.js Express  
**Technologies** : Node.js, Express, MongoDB, Container Apps  
**Complexité** : Débutant  
**Concepts** : Déploiement basique, API REST, intégration base NoSQL  

### Site web statique - SPA React  
**Technologies** : React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexité** : Débutant  
**Concepts** : Hébergement statique, backend serverless, développement web moderne  

### Container App - Python Flask  
**Technologies** : Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexité** : Débutant  
**Concepts** : Conteneurisation, API REST, scale-to-zero, sondes de santé, monitoring  
**Emplacement** : [Exemple local](../../../examples/container-app/simple-flask-api)  

### Container App - Architecture microservices  
**Technologies** : Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexité** : Avancé  
**Concepts** : Architecture multi-services, communication inter-services, file d’attente de messages, traçage distribué  
**Emplacement** : [Exemple local](../../../examples/container-app/microservices)  

### Application base de données - C# avec Azure SQL  
**Technologies** : C# ASP.NET Core, base de données Azure SQL, App Service  
**Complexité** : Intermédiaire  
**Concepts** : Entity Framework, connexions base, développement d’API web  

### Fonction serverless - Python Azure Functions  
**Technologies** : Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexité** : Intermédiaire  
**Concepts** : Architecture pilotée événements, calcul serverless, développement full-stack  

### Microservices - Java Spring Boot  
**Technologies** : Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexité** : Intermédiaire  
**Concepts** : Communication microservices, systèmes distribués, modèles d’entreprise  

### Exemples Microsoft Foundry  

#### Application chat Microsoft Foundry Models  
**Technologies** : Microsoft Foundry Models, Azure AI Search, App Service  
**Complexité** : Intermédiaire  
**Concepts** : Architecture RAG, recherche vectorielle, intégration LLM  

#### Traitement de documents IA  
**Technologies** : Azure AI Document Intelligence, Stockage, Functions  
**Complexité** : Intermédiaire  
**Concepts** : Analyse de documents, OCR, extraction de données  

#### Pipeline machine learning  
**Technologies** : Azure ML, MLOps, Container Registry  
**Complexité** : Avancé  
**Concepts** : Entraînement de modèles, pipelines de déploiement, monitoring  

## 🛠 Exemples de configuration  

Le répertoire `configurations/` contient des composants réutilisables :  

### Configurations d’environnement  
- Paramètres environnement développement  
- Configurations staging  
- Configurations prêtes pour production  
- Déploiements multi-régions  

### Modules Bicep  
- Composants infrastructure réutilisables  
- Modèles courants de ressources  
- Templates renforcés sécurité  
- Configurations optimisées coûts  

### Scripts d’aide  
- Automatisation mise en place environnement  
- Scripts migration base de données  
- Outils validation déploiement  
- Utilities surveillance coûts  

## 🔧 Guide de personnalisation  

### Adapter les exemples à votre cas d’usage  

1. **Revoir les prérequis**  
   - Vérifier exigences services Azure  
   - Confirmer limites abonnement  
   - Comprendre implications coûts  

2. **Modifier la configuration**  
   - Mettre à jour définitions services dans `azure.yaml`  
   - Personnaliser modèles Bicep  
   - Ajuster variables d’environnement  

3. **Tester minutieusement**  
   - Déployer d’abord en environnement dev  
   - Valider fonctionnalité  
   - Tester montée en charge et performance  

4. **Revue sécurité**  
   - Vérifier contrôles d’accès  
   - Implémenter gestion des secrets  
   - Activer monitoring et alertes  

## 📊 Matrice de comparaison  

| Exemple                          | Services | Base de données | Auth | Monitoring | Complexité  |  
|---------------------------------|----------|-----------------|------|------------|-------------|  
| **Microsoft Foundry Models Chat** (Local) | 2        | ❌              | Key Vault | Complet    | ⭐⭐          |  
| **Python Flask API** (Local)    | 1        | ❌              | Basique | Complet    | ⭐           |  
| **Microservices** (Local)       | 5+       | ✅              | Entreprise | Avancé    | ⭐⭐⭐⭐         |  
| Node.js Express Todo            | 2        | ✅              | Basique | Basique    | ⭐           |  
| React SPA + Functions           | 3        | ✅              | Basique | Complet    | ⭐           |  
| Python Flask Container          | 2        | ❌              | Basique | Complet    | ⭐           |  
| C# Web API + SQL               | 2        | ✅              | Complet | Complet    | ⭐⭐          |  
| Python Functions + SPA          | 3        | ✅              | Complet | Complet    | ⭐⭐          |  
| Java Microservices              | 5+       | ✅              | Complet | Complet    | ⭐⭐          |  
| Microsoft Foundry Models Chat   | 3        | ✅              | Complet | Complet    | ⭐⭐⭐         |  
| AI Document Processing          | 2        | ❌              | Basique | Complet    | ⭐⭐          |  
| ML Pipeline                    | 4+       | ✅              | Complet | Complet    | ⭐⭐⭐⭐         |  
| **Retail Multi-Agent** (Local) | **8+**   | **✅**          | **Entreprise** | **Avancé** | **⭐⭐⭐⭐**    |  

## 🎓 Parcours d’apprentissage  

### Progression recommandée  

1. **Commencer par Application Web Simple**  
   - Apprendre concepts AZD de base  
   - Comprendre workflow de déploiement  
   - Pratiquer gestion environnements  

2. **Essayer Site statique**  
   - Explorer options d’hébergement  
   - Découvrir intégration CDN  
   - Comprendre configuration DNS  

3. **Passer à Container App**  
   - Apprendre bases de la conteneurisation  
   - Comprendre concepts de scale  
   - Pratiquer avec Docker  

4. **Ajouter intégration base de données**  
   - Apprendre provisionnement base  
   - Comprendre chaînes de connexion  
   - Pratiquer gestion secrets  

5. **Explorer Serverless**  
   - Comprendre architecture pilotée événements  
   - Découvrir triggers et bindings  
   - Pratiquer APIs  

6. **Construire Microservices**  
   - Apprendre communication services  
   - Comprendre systèmes distribués  
   - Pratiquer déploiements complexes  

## 🔍 Trouver l’exemple adapté  

### Par stack technologique  
- **Container Apps** : [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js** : Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)  
- **Python** : [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#** : [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go** : [Microservices User Service (Local)](../../../examples/container-app/microservices)  
- **Java** : Java Spring Boot Microservices  
- **React** : React SPA + Functions  
- **Conteneurs** : [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices  
- **Bases de données** : [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **IA/ML** : **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Systèmes multi-agents** : **Retail Multi-Agent Solution**  
- **Intégration OpenAI** : **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Production entreprise** : [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Par patron d’architecture  
- **API REST simple** : [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)  
- **Monolithique** : Node.js Express Todo, C# Web API + SQL  
- **Statique + Serverless** : React SPA + Functions, Python Functions + SPA  
- **Microservices** : [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **Conteneurisé** : [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)  
- **IA intégrée** : **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Architecture multi-agent** : **Retail Multi-Agent Solution**  
- **Multi-service Entreprise** : [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Par niveau de complexité  
- **Débutant** : [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Intermédiaire** : **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing  
- **Avancé** : ML Pipeline  
- **Prêt pour production en entreprise** : [Microservices (Local)](../../../examples/container-app/microservices) (Multi-service avec file d’attente de messages), **Retail Multi-Agent Solution** (Système multi-agent complet avec déploiement modèle ARM)  

## 📚 Ressources supplémentaires  

### Liens documentation  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Documentation Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centre d’architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Exemples communautaires  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Galerie Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [Todo App avec C# et Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App avec Python et MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Todo App avec Node.js et PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Application Web React avec API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions avec Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Meilleures Pratiques
- [Cadre Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cadre d’Adoption du Cloud](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuer des Exemples

Vous avez un exemple utile à partager ? Nous accueillons les contributions !

### Directives de Soumission
1. Suivez la structure de répertoire établie
2. Incluez un README.md complet
3. Ajoutez des commentaires aux fichiers de configuration
4. Testez soigneusement avant de soumettre
5. Incluez des estimations de coûts et des prérequis

### Structure Modèle d’Exemple
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

**Conseil Pro** : Commencez par l’exemple le plus simple correspondant à votre stack technologique, puis progressez progressivement vers des scénarios plus complexes. Chaque exemple s’appuie sur les concepts du précédent !

## 🚀 Prêt à Commencer ?

### Votre Parcours d’Apprentissage

1. **Débutant Complet ?** → Commencez par [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 mins)
2. **Connaissances AZD de Base ?** → Essayez [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 mins)
3. **Créer des Apps d’IA ?** → Commencez par [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 mins) ou explorez [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ heures)
4. **Besoin d’une Stack Tech Spécifique ?** → Utilisez la section [Trouver l’Exemple Adapté](#-finding-the-right-example) ci-dessus

### Prochaines Étapes

- ✅ Passez en revue les [Pré-requis](#prérequis) ci-dessus
- ✅ Choisissez un exemple adapté à votre niveau de compétence (voir la [Légende de Complexité](#légende-de-la-complexité))
- ✅ Lisez attentivement le README de l’exemple avant de déployer
- ✅ Programmez un rappel pour exécuter `azd down` après les tests
- ✅ Partagez votre expérience via GitHub Issues ou Discussions

### Besoin d’Aide ?

- 📖 [FAQ](../resources/faq.md) - Questions fréquentes répondues
- 🐛 [Guide de Dépannage](../docs/chapter-07-troubleshooting/common-issues.md) - Résoudre les problèmes de déploiement
- 💬 [Discussions GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Interrogez la communauté
- 📚 [Guide d’Étude](../resources/study-guide.md) - Renforcez vos connaissances

---

**Navigation**
- **📚 Page d’Accueil du Cours** : [AZD Pour Débutants](../README.md)
- **📖 Matériel d’Étude** : [Guide d’Étude](../resources/study-guide.md) | [Fiche Résumé](../resources/cheat-sheet.md) | [Glossaire](../resources/glossary.md)
- **🔧 Ressources** : [FAQ](../resources/faq.md) | [Dépannage](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Dernière Mise à Jour : Novembre 2025 | [Signaler un Problème](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuer des Exemples](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->