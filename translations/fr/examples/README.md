<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9768f359e110aa699225468b543c8560",
  "translation_date": "2025-11-19T12:41:51+00:00",
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
> Ce dépôt contient **1 exemple local complet** (Solution multi-agents pour le commerce de détail) avec une implémentation complète.  
> Les exemples supplémentaires sont des **références externes** vers les dépôts Azure-Samples que vous pouvez cloner.

## Introduction

Ce répertoire fournit des exemples pratiques et des références pour vous aider à apprendre Azure Developer CLI grâce à une pratique concrète. Le scénario multi-agents pour le commerce de détail est une implémentation complète et prête pour la production incluse dans ce dépôt. Les exemples supplémentaires font référence aux exemples officiels d'Azure qui démontrent divers modèles AZD.

## 🎯 Contenu de ce dépôt

### ✅ Implémentation locale (prête à l'emploi)

#### [Exemples d'applications conteneurisées](container-app/README.md) 🆕
**Exemples complets de déploiement de conteneurs inclus dans ce dépôt**

- **Emplacement** : `examples/container-app/`
- **Complexité** : ⭐-⭐⭐⭐⭐ (Débutant à avancé)
- **Contenu inclus** :
  - [Guide principal](container-app/README.md) - Vue d'ensemble complète des déploiements de conteneurs
  - [API Flask simple](../../../examples/container-app/simple-flask-api) - Exemple basique d'API REST
  - [Architecture microservices](../../../examples/container-app/microservices) - Déploiement multi-services prêt pour la production
  - Modèles de démarrage rapide, production et avancés
  - Surveillance, sécurité et optimisation des coûts

**Démarrage rapide :**
```bash
# View master guide
cd examples/container-app

# Deploy simple Flask API
cd simple-flask-api
azd up

# Deploy microservices example
cd ../microservices
azd up
```

**Technologies** : Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Solution multi-agents pour le commerce de détail](retail-scenario.md) 🆕
**Implémentation complète prête pour la production incluse dans ce dépôt**

- **Emplacement** : `examples/retail-multiagent-arm-template/`
- **Complexité** : ⭐⭐⭐⭐ (Avancé)
- **Contenu inclus** :
  - Modèle de déploiement ARM complet
  - Architecture multi-agents (Client + Inventaire)
  - Intégration Azure OpenAI
  - Recherche IA avec RAG
  - Surveillance complète
  - Script de déploiement en un clic

**Démarrage rapide :**
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
|:-------|:------|:----------|:---------|
| **API Flask Python** | [Local : simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Local : microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-services, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **API Flask Python conteneurisée** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Comment utiliser :**
```bash
# Clone any example
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Deploy
azd up
```

### Exemples d'applications IA (Chapitres 2, 5, 8)

| Modèle | Dépôt | Complexité | Focus |
|:-------|:------|:----------|:------|
| **Démarrage rapide IA Chat** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Chat IA basique |
| **Agents IA** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework d'agents |
| **Démo Recherche + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Modèle RAG |
| **Chat Contoso** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | IA d'entreprise |

### Base de données & modèles avancés (Chapitres 3-8)

| Modèle | Dépôt | Complexité | Focus |
|:-------|:------|:----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Intégration base de données |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
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
- Déployer divers types d'applications en utilisant Azure Developer CLI en toute confiance
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

### Pour débutants
1. **[Application conteneurisée - API Flask Python](../../../examples/container-app/simple-flask-api)** (Local) - Déployez une API REST simple avec mise à l'échelle à zéro
2. **[Application web simple - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Déployez une application web Node.js Express avec MongoDB
3. **[Site web statique - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Hébergez un site web statique React avec Azure Static Web Apps

### Pour utilisateurs intermédiaires
4. **[Application conteneurisée - Microservices](../../../examples/container-app/microservices)** (Local) - Architecture multi-services prête pour la production
5. **[Application base de données - C# avec Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Application web avec API C# et base de données Azure SQL
6. **[Fonction serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Fonctions Azure Python avec déclencheurs HTTP et Cosmos DB
7. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Application Java multi-services avec Container Apps et passerelle API

### Modèles Azure AI Foundry

1. **[Application Chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Application de chat intelligente avec Azure OpenAI
2. **[Traitement de documents IA](https://github.com/Azure-Samples/azure-ai-document-processing)** - Analyse de documents avec les services Azure AI
3. **[Pipeline Machine Learning](https://github.com/Azure-Samples/mlops-v2)** - Workflow MLOps avec Azure Machine Learning

### Scénarios réels

#### **Solution multi-agents pour le commerce de détail** 🆕
**[Guide d'implémentation complet](./retail-scenario.md)**

Une solution complète et prête pour la production de support client multi-agents qui démontre le déploiement d'applications IA de niveau entreprise avec AZD. Ce scénario fournit :

- **Architecture complète** : Système multi-agents avec agents spécialisés pour le service client et la gestion des stocks
- **Infrastructure de production** : Déploiements Azure OpenAI multi-régions, Recherche IA, Container Apps et surveillance complète
- **Modèle ARM prêt à déployer** : Déploiement en un clic avec plusieurs modes de configuration (Minimal/Standard/Premium)
- **Fonctionnalités avancées** : Validation de sécurité par red teaming, cadre d'évaluation des agents, optimisation des coûts et guides de dépannage
- **Contexte métier réel** : Cas d'utilisation de support client pour les détaillants avec téléchargement de fichiers, intégration de recherche et mise à l'échelle dynamique

**Technologies** : Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexité** : ⭐⭐⭐⭐ (Avancé - Prêt pour la production en entreprise)

**Idéal pour** : Développeurs IA, architectes de solutions et équipes construisant des systèmes multi-agents en production

**Démarrage rapide** : Déployez la solution complète en moins de 30 minutes en utilisant le modèle ARM inclus avec `./deploy.sh -g myResourceGroup`

## 📋 Instructions d'utilisation

### Exécution des exemples en local

1. **Cloner ou copier l'exemple**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Initialiser l'environnement AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Configurer l'environnement**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Déployer**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Adapter les exemples

Chaque exemple inclut :
- **README.md** - Instructions détaillées de configuration et de personnalisation
- **azure.yaml** - Configuration AZD avec commentaires
- **infra/** - Modèles Bicep avec explications des paramètres
- **src/** - Code d'application exemple
- **scripts/** - Scripts d'aide pour les tâches courantes

## 🎯 Objectifs d'apprentissage

### Catégories d'exemples

#### **Déploiements basiques**
- Applications mono-service
- Modèles d'infrastructure simples
- Gestion de configuration basique
- Configurations de développement économiques

#### **Scénarios avancés**
- Architectures multi-services
- Configurations réseau complexes
- Modèles d'intégration de base de données
- Implémentations de sécurité et conformité

#### **Modèles prêts pour la production**
- Configurations haute disponibilité
- Surveillance et observabilité
- Intégration CI/CD
- Configurations de reprise après sinistre

## 📖 Descriptions des exemples

### Application web simple - Node.js Express
**Technologies** : Node.js, Express, MongoDB, Container Apps  
**Complexité** : Débutant  
**Concepts** : Déploiement basique, API REST, intégration base de données NoSQL

### Site web statique - React SPA
**Technologies** : React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexité** : Débutant  
**Concepts** : Hébergement statique, backend serverless, développement web moderne

### Application conteneurisée - Python Flask
**Technologies** : Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexité** : Débutant  
**Concepts** : Conteneurisation, API REST, mise à l'échelle à zéro, sondes de santé, surveillance  
**Emplacement** : [Exemple local](../../../examples/container-app/simple-flask-api)

### Application conteneurisée - Architecture microservices
**Technologies** : Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexité** : Avancé  
**Concepts** : Architecture multi-services, communication entre services, file d'attente de messages, traçage distribué  
**Emplacement** : [Exemple local](../../../examples/container-app/microservices)

### Application base de données - C# avec Azure SQL
**Technologies** : C# ASP.NET Core, Azure SQL Database, App Service  
**Complexité** : Intermédiaire  
**Concepts** : Entity Framework, connexions base de données, développement API web

### Fonction serverless - Python Azure Functions
**Technologies** : Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexité** : Intermédiaire  
**Concepts** : Architecture événementielle, informatique serverless, développement full-stack

### Microservices - Java Spring Boot
**Technologies** : Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexité** : Intermédiaire  
**Concepts** : Communication entre microservices, systèmes distribués, modèles d'entreprise

### Exemples Azure AI Foundry

#### Application Chat Azure OpenAI
**Technologies** : Azure OpenAI, Recherche cognitive, App Service  
**Complexité** : Intermédiaire  
**Concepts** : Architecture RAG, recherche vectorielle, intégration LLM

#### Traitement de documents IA
**Technologies** : Azure AI Document Intelligence, Stockage, Functions  
**Complexité** : Intermédiaire  
**Concepts** : Analyse de documents, OCR, extraction de données

#### Pipeline Machine Learning
**Technologies** : Azure ML, MLOps, Container Registry  
**Complexité** : Avancé  
**Concepts** : Entraînement de modèles, pipelines de déploiement, surveillance

## 🛠 Exemples de configuration

Le répertoire `configurations/` contient des composants réutilisables :

### Configurations d'environnement
- Paramètres d'environnement de développement
- Configurations d'environnement de staging
- Configurations prêtes pour la production
- Configurations de déploiement multi-régions

### Modules Bicep
- Composants d'infrastructure réutilisables  
- Modèles de ressources courants  
- Modèles renforcés en matière de sécurité  
- Configurations optimisées pour les coûts  

### Scripts d'assistance  
- Automatisation de la configuration de l'environnement  
- Scripts de migration de base de données  
- Outils de validation de déploiement  
- Utilitaires de suivi des coûts  

## 🔧 Guide de personnalisation  

### Adapter les exemples à votre cas d'utilisation  

1. **Vérifiez les prérequis**  
   - Consultez les exigences des services Azure  
   - Vérifiez les limites de l'abonnement  
   - Comprenez les implications en termes de coûts  

2. **Modifiez la configuration**  
   - Mettez à jour les définitions de service dans `azure.yaml`  
   - Personnalisez les modèles Bicep  
   - Ajustez les variables d'environnement  

3. **Testez minutieusement**  
   - Déployez d'abord dans un environnement de développement  
   - Validez les fonctionnalités  
   - Testez l'évolutivité et les performances  

4. **Revue de sécurité**  
   - Examinez les contrôles d'accès  
   - Implémentez la gestion des secrets  
   - Activez la surveillance et les alertes  

## 📊 Tableau comparatif  

| Exemple | Services | Base de données | Authentification | Surveillance | Complexité |  
|---------|----------|-----------------|------------------|--------------|------------|  
| **API Python Flask** (Local) | 1 | ❌ | Basique | Complète | ⭐ |  
| **Microservices** (Local) | 5+ | ✅ | Entreprise | Avancée | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Basique | Basique | ⭐ |  
| React SPA + Functions | 3 | ✅ | Basique | Complète | ⭐ |  
| Python Flask Container | 2 | ❌ | Basique | Complète | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Complète | Complète | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Complète | Complète | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | Complète | Complète | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Complète | Complète | ⭐⭐⭐ |  
| Traitement de documents IA | 2 | ❌ | Basique | Complète | ⭐⭐ |  
| Pipeline ML | 4+ | ✅ | Complète | Complète | ⭐⭐⭐⭐ |  
| **Multi-Agent Retail** (Local) | **8+** | **✅** | **Entreprise** | **Avancée** | **⭐⭐⭐⭐** |  

## 🎓 Parcours d'apprentissage  

### Progression recommandée  

1. **Commencez par une application web simple**  
   - Apprenez les concepts de base d'AZD  
   - Comprenez le flux de déploiement  
   - Entraînez-vous à gérer les environnements  

2. **Essayez un site web statique**  
   - Explorez différentes options d'hébergement  
   - Apprenez l'intégration CDN  
   - Comprenez la configuration DNS  

3. **Passez à une application conteneurisée**  
   - Apprenez les bases de la conteneurisation  
   - Comprenez les concepts d'évolutivité  
   - Entraînez-vous avec Docker  

4. **Ajoutez une intégration de base de données**  
   - Apprenez le provisionnement de bases de données  
   - Comprenez les chaînes de connexion  
   - Entraînez-vous à gérer les secrets  

5. **Explorez le serverless**  
   - Comprenez l'architecture pilotée par les événements  
   - Apprenez les déclencheurs et les liaisons  
   - Entraînez-vous avec les API  

6. **Construisez des microservices**  
   - Apprenez la communication entre services  
   - Comprenez les systèmes distribués  
   - Entraînez-vous à des déploiements complexes  

## 🔍 Trouver le bon exemple  

### Par pile technologique  
- **Applications conteneurisées** : [API Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js** : Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)  
- **Python** : [API Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#** : [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, Pipeline ML  
- **Go** : [Microservices User Service (Local)](../../../examples/container-app/microservices)  
- **Java** : Java Spring Boot Microservices  
- **React** : React SPA + Functions  
- **Conteneurs** : [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices  
- **Bases de données** : [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **IA/ML** : Azure OpenAI Chat App, Traitement de documents IA, Pipeline ML, **Solution Multi-Agent Retail**  
- **Systèmes multi-agents** : **Solution Multi-Agent Retail**  
- **Production d'entreprise** : [Microservices (Local)](../../../examples/container-app/microservices), **Solution Multi-Agent Retail**  

### Par modèle d'architecture  
- **API REST simple** : [API Python Flask (Local)](../../../examples/container-app/simple-flask-api)  
- **Monolithique** : Node.js Express Todo, C# Web API + SQL  
- **Statique + Serverless** : React SPA + Functions, Python Functions + SPA  
- **Microservices** : [Microservices de production (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **Conteneurisé** : [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)  
- **Propulsé par l'IA** : Azure OpenAI Chat App, Traitement de documents IA, Pipeline ML, **Solution Multi-Agent Retail**  
- **Architecture multi-agents** : **Solution Multi-Agent Retail**  
- **Multi-services d'entreprise** : [Microservices (Local)](../../../examples/container-app/microservices), **Solution Multi-Agent Retail**  

### Par niveau de complexité  
- **Débutant** : [API Python Flask (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Intermédiaire** : C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, Traitement de documents IA  
- **Avancé** : Pipeline ML  
- **Prêt pour la production d'entreprise** : [Microservices (Local)](../../../examples/container-app/microservices) (Multi-services avec file d'attente de messages), **Solution Multi-Agent Retail** (Système multi-agents complet avec déploiement via modèle ARM)  

## 📚 Ressources supplémentaires  

### Liens vers la documentation  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Modèles AZD Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [Documentation Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centre d'architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Exemples communautaires  
- [Modèles AZD Azure Samples](https://github.com/Azure-Samples/azd-templates)  
- [Modèles Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)  
- [Galerie Azure Developer CLI](https://azure.github.io/awesome-azd/)  
- [Application Todo avec C# et Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Application Todo avec Python et MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Application Todo avec Node.js et PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [Application web React avec API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [Job Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)  
- [Azure Functions avec Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### Bonnes pratiques  
- [Cadre Azure bien architecturé](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [Cadre d'adoption du cloud](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 Contribuer avec des exemples  

Vous avez un exemple utile à partager ? Nous accueillons vos contributions !  

### Directives de soumission  
1. Suivez la structure de répertoire établie  
2. Incluez un README.md complet  
3. Ajoutez des commentaires aux fichiers de configuration  
4. Testez minutieusement avant de soumettre  
5. Incluez des estimations de coûts et des prérequis  

### Structure type d'un exemple  
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

**Astuce Pro** : Commencez par l'exemple le plus simple correspondant à votre pile technologique, puis progressez graduellement vers des scénarios plus complexes. Chaque exemple s'appuie sur les concepts des précédents !  

**Prochaines étapes** :  
- Choisissez un exemple correspondant à votre niveau de compétence  
- Suivez les instructions de configuration dans le README de l'exemple  
- Expérimentez avec des personnalisations  
- Partagez vos apprentissages avec la communauté  

---

**Navigation**  
- **Leçon précédente** : [Guide d'étude](../resources/study-guide.md)  
- **Retour à** : [README principal](../README.md)  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction professionnelle humaine. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->