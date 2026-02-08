# Exemples - Modèles AZD pratiques et configurations

**Apprentissage par l'exemple - Organisé par chapitre**
- **📚 Page d'accueil du cours** : [AZD Pour Débutants](../README.md)
- **📖 Carte des chapitres** : Exemples organisés par complexité d'apprentissage
- **🚀 Exemple local** : [Solution Retail Multi-Agent](retail-scenario.md)
- **🤖 Exemples d'IA externes** : Liens vers les dépôts Azure Samples

> **📍 IMPORTANT : Exemples locaux vs externes**  
> Ce dépôt contient **4 exemples locaux complets** avec des implémentations complètes :  
> - **Azure OpenAI Chat** (déploiement GPT-4 avec interface de chat)  
> - **Container Apps** (API Flask simple + microservices)  
> - **Application Base de Données** (Web + base de données SQL)  
> - **Retail Multi-Agent** (solution IA pour entreprise)  
>  
> Les exemples supplémentaires sont des **références externes** vers les dépôts Azure-Samples que vous pouvez cloner.

## Introduction

Ce répertoire fournit des exemples pratiques et des références pour vous aider à apprendre Azure Developer CLI par la pratique. Le scénario Retail Multi-Agent est une implémentation complète et prête pour la production incluse dans ce dépôt. D'autres exemples référencent des échantillons Azure officiels démontrant divers modèles AZD.

### Légende de la notation de complexité

- ⭐ **Débutant** - Concepts de base, service unique, 15-30 minutes
- ⭐⭐ **Intermédiaire** - Plusieurs services, intégration base de données, 30-60 minutes
- ⭐⭐⭐ **Avancé** - Architecture complexe, intégration IA, 1-2 heures
- ⭐⭐⭐⭐ **Expert** - Prêt pour la production, modèles entreprise, 2+ heures

## 🎯 Ce que contient réellement ce dépôt

### ✅ Implémentation locale (prête à l'emploi)

#### [Application de chat Azure OpenAI](azure-openai-chat/README.md) 🆕  
**Déploiement complet GPT-4 avec interface de chat inclus dans ce dépôt**

- **Emplacement :** `examples/azure-openai-chat/`
- **Complexité :** ⭐⭐ (Intermédiaire)
- **Contenu :**
  - Déploiement complet Azure OpenAI (GPT-4)
  - Interface de chat en ligne de commande Python
  - Intégration Key Vault pour les clés API sécurisées
  - Modèles d’infrastructure Bicep
  - Suivi de l’utilisation des jetons et des coûts
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
  
**Technologies :** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Exemples Container App](container-app/README.md) 🆕  
**Exemples complets de déploiement de conteneurs inclus dans ce dépôt**

- **Emplacement :** `examples/container-app/`
- **Complexité :** ⭐-⭐⭐⭐⭐ (Débutant à Avancé)
- **Contenu :**  
  - [Guide Maître](container-app/README.md) - Vue d’ensemble complète des déploiements conteneurs  
  - [API Flask Simple](../../../examples/container-app/simple-flask-api) - Exemple d’API REST basique  
  - [Architecture Microservices](../../../examples/container-app/microservices) - Déploiement multi-service prêt pour la production  
  - Modèles Démarrage rapide, Production et Avancés  
  - Monitoring, sécurité, optimisation des coûts

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

#### [Solution Retail Multi-Agent](retail-scenario.md) 🆕  
**Implémentation complète prête pour la production incluse dans ce dépôt**

- **Emplacement :** `examples/retail-multiagent-arm-template/`
- **Complexité :** ⭐⭐⭐⭐ (Avancé)
- **Contenu :**
  - Modèle ARM complet pour déploiement
  - Architecture multi-agent (Client + Inventaire)
  - Intégration Azure OpenAI
  - Recherche IA avec RAG
  - Monitoring complet
  - Script de déploiement en un clic

**Démarrage rapide :**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Technologies :** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Azure Samples externes (À cloner pour utilisation)

Les exemples suivants sont maintenus dans les dépôts officiels Azure-Samples. Clonez-les pour explorer différents modèles AZD :

### Applications simples (Chapitres 1-2)

| Modèle | Dépôt | Complexité | Services |
|:---------|:-----------|:-----------|:---------|
| **API Python Flask** | [Local : simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Local : microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Container Flask Python** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Comment utiliser :**  
```bash
# Cloner n'importe quel exemple
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Déployer
azd up
```
  
### Exemples d’applications IA (Chapitres 2, 5, 8)

| Modèle | Dépôt | Complexité | Focus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Local : azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Déploiement GPT-4 |
| **Démarrage rapide IA Chat** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat IA basique |
| **Agents IA** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework d’agents |
| **Démo Recherche + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Modèle RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | IA d’entreprise |

### Base de données & modèles avancés (Chapitres 3-8)

| Modèle | Dépôt | Complexité | Focus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Intégration base de données |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Microservices Java** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **Pipeline ML** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Objectifs d’apprentissage

En travaillant avec ces exemples, vous allez :  
- Pratiquer les workflows Azure Developer CLI avec des scénarios d’application réalistes  
- Comprendre différentes architectures applicatives et leurs implémentations azd  
- Maîtriser les modèles Infrastructure as Code pour divers services Azure  
- Appliquer la gestion de configuration et les stratégies de déploiement spécifiques à l’environnement  
- Implémenter des modèles de monitoring, sécurité, et montée en charge dans des contextes pratiques  
- Acquérir de l’expérience dans le dépannage et le débogage de scénarios de déploiement réels

## Résultats d’apprentissage

À l’issue de ces exemples, vous serez capable de :  
- Déployer divers types d’applications avec Azure Developer CLI en toute confiance  
- Adapter les modèles fournis aux besoins de vos propres applications  
- Concevoir et implémenter des modèles infrastructurels personnalisés avec Bicep  
- Configurer des applications multi-services complexes avec dépendances adéquates  
- Appliquer les meilleures pratiques de sécurité, surveillance et performance en conditions réelles  
- Résoudre et optimiser les déploiements en vous basant sur l’expérience pratique

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

> **💡 Nouveau sur AZD ?** Commencez par l’exemple #1 (API Flask) - environ 20 minutes pour apprendre les concepts clés.

### Pour débutants  
1. **[Container App - API Python Flask](../../../examples/container-app/simple-flask-api)** (Local) ⭐  
   Déployez une API REST simple avec mise à l’échelle à zéro  
   **Durée :** 20-25 minutes | **Coût :** 0-5 $/mois  
   **Ce que vous apprendrez :** Workflow azd basique, containerisation, probes de santé  
   **Résultat attendu :** Endpoint API fonctionnel retournant "Hello, World!" avec monitoring

2. **[Application Web Simple - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Déployez une application web Node.js Express avec MongoDB  
   **Durée :** 25-35 minutes | **Coût :** 10-30 $/mois  
   **Ce que vous apprendrez :** Intégration base de données, variables d’environnement, chaînes de connexion  
   **Résultat attendu :** Application liste de tâches avec création/lecture/mise à jour/suppression

3. **[Site statique - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hébergez un site statique React avec Azure Static Web Apps  
   **Durée :** 20-30 minutes | **Coût :** 0-10 $/mois  
   **Ce que vous apprendrez :** Hébergement statique, fonctions serverless, déploiement CDN  
   **Résultat attendu :** Interface React avec backend API, SSL automatique, CDN global

### Pour utilisateurs intermédiaires  
4. **[Application de chat Azure OpenAI](../../../examples/azure-openai-chat)** (Local) ⭐⭐  
   Déployez GPT-4 avec interface chat et gestion sécurisée des clés API  
   **Durée :** 35-45 minutes | **Coût :** 50-200 $/mois  
   **Ce que vous apprendrez :** Déploiement Azure OpenAI, intégration Key Vault, suivi des jetons  
   **Résultat attendu :** Application chat fonctionnelle avec GPT-4 et monitoring des coûts

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Local) ⭐⭐⭐⭐  
   Architecture multi-service prête pour production  
   **Durée :** 45-60 minutes | **Coût :** 50-150 $/mois  
   **Ce que vous apprendrez :** Communication des services, file d’attente de messages, traçabilité distribuée  
   **Résultat attendu :** Système 2 services (API Gateway + service produit) avec monitoring

6. **[Application Base de Données - C# avec Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Application web avec API C# et base Azure SQL  
   **Durée :** 30-45 minutes | **Coût :** 20-80 $/mois  
   **Ce que vous apprendrez :** Entity Framework, migrations base de données, sécurité des connexions  
   **Résultat attendu :** API C# avec backend Azure SQL, déploiement automatique du schéma

7. **[Fonction Serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Azure Functions en Python avec triggers HTTP et Cosmos DB  
   **Durée :** 30-40 minutes | **Coût :** 10-40 $/mois  
   **Ce que vous apprendrez :** Architecture événementielle, scalabilité serverless, intégration NoSQL  
   **Résultat attendu :** Application fonction répondant aux requêtes HTTP avec stockage Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Application Java multi-service avec Container Apps et passerelle API  
   **Durée :** 60-90 minutes | **Coût :** 80-200 $/mois  
   **Ce que vous apprendrez :** Déploiement Spring Boot, maillage de services, équilibrage de charge  
   **Résultat attendu :** Système Java multi-services avec découverte et routage

### Modèles Microsoft Foundry

1. **[Application chat Azure OpenAI - Exemple local](../../../examples/azure-openai-chat)** ⭐⭐  
   Déploiement complet GPT-4 avec interface chat  
   **Durée :** 35-45 minutes | **Coût :** 50-200 $/mois  
   **Résultat attendu :** Application chat fonctionnelle avec suivi des jetons et monitorage des coûts

2. **[Démo Azure Search + OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Application de chat intelligente avec architecture RAG  
   **Durée :** 60-90 minutes | **Coût :** 100-300 $/mois  
   **Résultat attendu :** Interface chat pilotée par RAG avec recherche documentaire et citations

3. **[Traitement de documents IA](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analyse de documents avec services Azure AI  
   **Durée :** 40-60 minutes | **Coût :** 20-80 $/mois  
   **Résultat attendu :** API extrayant texte, tables, entités depuis documents uploadés

4. **[Pipeline Machine Learning](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Workflow MLOps avec Azure Machine Learning  
   **Durée :** 2-3 heures | **Coût :** 150-500 $/mois  
   **Résultat attendu :** Pipeline ML automatisé avec entraînement, déploiement et surveillance

### Scénarios réels

#### **Solution Retail Multi-Agent** 🆕  
**[Guide d’implémentation complet](./retail-scenario.md)**

Une solution complète et prête pour la production de support client multi-agent démontrant le déploiement d’une application IA de niveau entreprise avec AZD. Ce scénario offre :

- **Architecture complète** : système multi-agent avec agents spécialisés pour service client et gestion des stocks
- **Infrastructure de production** : déploiements Azure OpenAI multi-régions, AI Search, Container Apps et surveillance complète  
- **Modèle ARM prêt à déployer** : déploiement en un clic avec plusieurs modes de configuration (Minimal/Standard/Premium)  
- **Fonctionnalités avancées** : validation de sécurité red teaming, cadre d’évaluation des agents, optimisation des coûts et guides de dépannage  
- **Contexte métier réel** : cas d’utilisation du support client pour détaillants avec téléversements de fichiers, intégration de recherche et mise à l’échelle dynamique  

**Technologies** : Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Complexité** : ⭐⭐⭐⭐ (Avancé - Prêt pour la production entreprise)  

**Idéal pour** : développeurs IA, architectes de solutions et équipes construisant des systèmes multi-agents en production  

**Démarrage rapide** : déployez la solution complète en moins de 30 minutes avec le modèle ARM inclus via `./deploy.sh -g myResourceGroup`  

## 📋 Instructions d’utilisation

### Prérequis

Avant d’exécuter un exemple :  
- ✅ Abonnement Azure avec accès Propriétaire ou Contributeur  
- ✅ Azure Developer CLI installé ([Guide d’installation](../docs/chapter-01-foundation/installation.md))  
- ✅ Docker Desktop en cours d’exécution (pour les exemples de conteneurs)  
- ✅ Quotas Azure appropriés (vérifiez les exigences spécifiques à chaque exemple)  

> **💰 Avertissement sur les coûts :** Tous les exemples créent de véritables ressources Azure soumises à facturation. Consultez les fichiers README individuels pour les estimations de coûts. Pensez à exécuter `azd down` une fois terminé pour éviter des coûts continus.  

### Exécution des exemples localement

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
   - ✅ Endpoint du service retourne HTTP 200  
   - ✅ Le portail Azure affiche le statut "Running"  
   - ✅ Application Insights reçoit de la télémétrie  

> **⚠️ Problèmes ?** Consultez [Problèmes courants](../docs/chapter-07-troubleshooting/common-issues.md) pour le dépannage du déploiement  

### Adapter les exemples

Chaque exemple comprend :  
- **README.md** - instructions détaillées d’installation et personnalisation  
- **azure.yaml** - configuration AZD avec commentaires  
- **infra/** - templates Bicep avec explications des paramètres  
- **src/** - code d’application exemple  
- **scripts/** - scripts d’assistance pour les tâches courantes  

## 🎯 Objectifs d’apprentissage

### Catégories d’exemples

#### **Déploiements basiques**  
- Applications single-service  
- Modèles d’infrastructure simples  
- Gestion de la configuration basique  
- Configurations développement économiques  

#### **Scénarios avancés**  
- Architectures multi-services  
- Configurations réseau complexes  
- Modèles d’intégration base de données  
- Implémentations sécurité et conformité  

#### **Modèles prêts pour la production**  
- Configurations haute disponibilité  
- Surveillance et observabilité  
- Intégration CI/CD  
- Plans de reprise après sinistre  

## 📖 Descriptions des exemples

### Application web simple - Node.js Express  
**Technologies** : Node.js, Express, MongoDB, Container Apps  
**Complexité** : Débutant  
**Concepts** : Déploiement basique, API REST, intégration base NoSQL  

### Site web statique - React SPA  
**Technologies** : React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexité** : Débutant  
**Concepts** : Hébergement statique, backend serverless, développement web moderne  

### Container App - Python Flask  
**Technologies** : Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexité** : Débutant  
**Concepts** : Conteneurisation, API REST, scale-to-zero, probes santé, monitoring  
**Localisation** : [Exemple local](../../../examples/container-app/simple-flask-api)  

### Container App - Architecture microservices  
**Technologies** : Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexité** : Avancé  
**Concepts** : Architecture multi-services, communication interservices, file d’attente de messages, traçage distribué  
**Localisation** : [Exemple local](../../../examples/container-app/microservices)  

### Application base de données - C# avec Azure SQL  
**Technologies** : C# ASP.NET Core, Azure SQL Database, App Service  
**Complexité** : Intermédiaire  
**Concepts** : Entity Framework, connexions base de données, développement API Web  

### Fonction serverless - Python Azure Functions  
**Technologies** : Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexité** : Intermédiaire  
**Concepts** : Architecture événementielle, calcul sans serveur, développement full-stack  

### Microservices - Java Spring Boot  
**Technologies** : Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexité** : Intermédiaire  
**Concepts** : Communication microservices, systèmes distribués, modèles d’entreprise  

### Exemples Microsoft Foundry

#### Azure OpenAI Chat App  
**Technologies** : Azure OpenAI, Cognitive Search, App Service  
**Complexité** : Intermédiaire  
**Concepts** : Architecture RAG, recherche vectorielle, intégration LLM  

#### Traitement de documents IA  
**Technologies** : Azure AI Document Intelligence, Storage, Functions  
**Complexité** : Intermédiaire  
**Concepts** : Analyse de documents, OCR, extraction de données  

#### Pipeline Machine Learning  
**Technologies** : Azure ML, MLOps, Container Registry  
**Complexité** : Avancé  
**Concepts** : Entraînement de modèles, pipelines de déploiement, surveillance  

## 🛠 Exemples de configuration

Le répertoire `configurations/` contient des composants réutilisables :  

### Configurations d’environnement  
- Paramètres pour environnement de développement  
- Configurations d’environnement de pré-production  
- Configurations prêtes pour la production  
- Déploiement multi-régions  

### Modules Bicep  
- Composants d’infrastructure réutilisables  
- Modèles de ressources courantes  
- Templates sécurisés  
- Configurations optimisées pour les coûts  

### Scripts d’assistance  
- Automatisation de la configuration des environnements  
- Scripts de migration base de données  
- Outils de validation de déploiement  
- Utilitaires de surveillance des coûts  

## 🔧 Guide de personnalisation

### Adapter les exemples à votre cas d’usage

1. **Vérifier les prérequis**  
   - Examiner les exigences des services Azure  
   - Confirmer les limites de l’abonnement  
   - Comprendre les implications en termes de coûts  

2. **Modifier la configuration**  
   - Mettre à jour les définitions de service dans `azure.yaml`  
   - Personnaliser les templates Bicep  
   - Ajuster les variables d’environnement  

3. **Tester minutieusement**  
   - Déployer d’abord en environnement de développement  
   - Valider les fonctionnalités  
   - Tester la montée en charge et les performances  

4. **Révision sécurité**  
   - Passer en revue les contrôles d’accès  
   - Mettre en place la gestion des secrets  
   - Activer la surveillance et les alertes  

## 📊 Matrice de comparaison

| Exemple                          | Services | Base de données | Authentification | Surveillance | Complexité       |
|---------------------------------|----------|-----------------|------------------|--------------|------------------|
| **Azure OpenAI Chat** (Local)    | 2        | ❌              | Key Vault        | Complète    | ⭐⭐               |
| **Python Flask API** (Local)     | 1        | ❌              | Basique          | Complète    | ⭐                |
| **Microservices** (Local)        | 5+       | ✅              | Entreprise       | Avancé      | ⭐⭐⭐⭐             |
| Node.js Express Todo             | 2        | ✅              | Basique          | Basique     | ⭐                |
| React SPA + Functions            | 3        | ✅              | Basique          | Complète    | ⭐                |
| Python Flask Container           | 2        | ❌              | Basique          | Complète    | ⭐                |
| C# Web API + SQL                | 2        | ✅              | Complète         | Complète    | ⭐⭐               |
| Python Functions + SPA           | 3        | ✅              | Complète         | Complète    | ⭐⭐               |
| Java Microservices               | 5+       | ✅              | Complète         | Complète    | ⭐⭐               |
| Azure OpenAI Chat                | 3        | ✅              | Complète         | Complète    | ⭐⭐⭐              |
| AI Document Processing           | 2        | ❌              | Basique          | Complète    | ⭐⭐               |
| ML Pipeline                     | 4+       | ✅              | Complète         | Complète    | ⭐⭐⭐⭐             |
| **Retail Multi-Agent** (Local)   | **8+**   | **✅**          | **Entreprise**   | **Avancé**  | **⭐⭐⭐⭐**          |

## 🎓 Parcours d’apprentissage

### Progression recommandée

1. **Commencer par une application web simple**  
   - Apprendre les concepts de base AZD  
   - Comprendre le workflow de déploiement  
   - Pratiquer la gestion des environnements  

2. **Essayer un site statique**  
   - Explorer différentes options d’hébergement  
   - Découvrir l’intégration CDN  
   - Comprendre la configuration DNS  

3. **Passer à Container App**  
   - Apprendre les bases de la conteneurisation  
   - Comprendre la mise à l’échelle  
   - Pratiquer avec Docker  

4. **Ajouter l’intégration base de données**  
   - Apprendre le provisioning base de données  
   - Comprendre les chaînes de connexion  
   - Pratiquer la gestion des secrets  

5. **Explorer le serverless**  
   - Comprendre l’architecture événementielle  
   - Apprendre sur les triggers et bindings  
   - Pratiquer avec des API  

6. **Construire des microservices**  
   - Apprendre la communication inter-services  
   - Comprendre les systèmes distribués  
   - Pratiquer des déploiements complexes  

## 🔍 Trouver l’exemple adapté

### Par stack technologique  
- **Container Apps** : [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js** : Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)  
- **Python** : [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#** : [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Go** : [Microservices User Service (Local)](../../../examples/container-app/microservices)  
- **Java** : Java Spring Boot Microservices  
- **React** : React SPA + Functions  
- **Conteneurs** : [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices  
- **Bases de données** : [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **IA/ML** : **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Systèmes multi-agents** : **Retail Multi-Agent Solution**  
- **Intégration OpenAI** : **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Production entreprise** : [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Par modèle d’architecture  
- **API REST simple** : [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)  
- **Monolithique** : Node.js Express Todo, C# Web API + SQL  
- **Statique + Serverless** : React SPA + Functions, Python Functions + SPA  
- **Microservices** : [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **Conteneurisé** : [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)  
- **IA intégrée** : **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Architecture multi-agents** : **Retail Multi-Agent Solution**  
- **Multi-service entreprise** : [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Par niveau de complexité  
- **Débutant** : [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Intermédiaire** : **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing  
- **Avancé** : ML Pipeline  
- **Prêt pour production entreprise** : [Microservices (Local)](../../../examples/container-app/microservices) (multi-service avec file d’attente de messages), **Retail Multi-Agent Solution** (système multi-agents complet avec déploiement par template ARM)  

## 📚 Ressources complémentaires

### Liens documentation  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Documentation Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Exemples communautaires  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  
- [Todo App avec C# et Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App avec Python et MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Application Todo avec Node.js et PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [Application Web React avec API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Job Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions avec Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Meilleures Pratiques
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribution d'Exemples

Vous avez un exemple utile à partager ? Nous accueillons les contributions !

### Directives de Soumission
1. Suivez la structure de répertoire établie
2. Incluez un README.md complet
3. Ajoutez des commentaires aux fichiers de configuration
4. Testez minutieusement avant de soumettre
5. Incluez des estimations de coûts et les prérequis

### Structure Type d'Exemple
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

**Astuce Pro** : Commencez par l'exemple le plus simple qui correspond à votre pile technologique, puis progressez graduellement vers des scénarios plus complexes. Chaque exemple s'appuie sur les concepts des précédents !

## 🚀 Prêt à Commencer ?

### Votre Parcours d'Apprentissage

1. **Débutant Complet ?** → Commencez par [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 mins)
2. **Connaissances de base AZD ?** → Essayez [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 mins)
3. **Création d'Applications IA ?** → Commencez par [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 mins) ou explorez [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ heures)
4. **Besoin d'une Pile Technologique Spécifique ?** → Utilisez la section [Trouver l'Exemple Approprié](../../../examples) ci-dessus

### Prochaines Étapes

- ✅ Consultez les [Prérequis](../../../examples) ci-dessus
- ✅ Choisissez un exemple correspondant à votre niveau de compétence (voir la [Légende de Complexité](../../../examples))
- ✅ Lisez attentivement le README de l'exemple avant le déploiement
- ✅ Programmez un rappel pour exécuter `azd down` après les tests
- ✅ Partagez votre expérience via GitHub Issues ou Discussions

### Besoin d'Aide ?

- 📖 [FAQ](../resources/faq.md) - Réponses aux questions fréquentes
- 🐛 [Guide de Dépannage](../docs/chapter-07-troubleshooting/common-issues.md) - Résoudre les problèmes de déploiement
- 💬 [Discussions GitHub](https://github.com/microsoft/AZD-for-beginners/discussions) - Posez vos questions à la communauté
- 📚 [Guide d'Étude](../resources/study-guide.md) - Renforcez votre apprentissage

---

**Navigation**
- **📚 Accueil du Cours** : [AZD Pour Débutants](../README.md)
- **📖 Matériel d'Étude** : [Guide d'Étude](../resources/study-guide.md) | [Fiche de Révision](../resources/cheat-sheet.md) | [Glossaire](../resources/glossary.md)
- **🔧 Ressources** : [FAQ](../resources/faq.md) | [Dépannage](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Dernière mise à jour : novembre 2025 | [Signaler un problème](https://github.com/microsoft/AZD-for-beginners/issues) | [Contribuer des exemples](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçons d’assurer l’exactitude, veuillez noter que les traductions automatiques peuvent comporter des erreurs ou des inexactitudes. Le document original dans sa langue d’origine doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction professionnelle réalisée par un humain est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->