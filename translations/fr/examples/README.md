<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T13:28:53+00:00",
  "source_file": "examples/README.md",
  "language_code": "fr"
}
-->
# Exemples - Modèles et configurations pratiques AZD

**Apprendre par l'exemple - Organisé par chapitre**
- **📚 Accueil du cours** : [AZD pour débutants](../README.md)
- **📖 Correspondance des chapitres** : Exemples organisés par niveau de complexité
- **🚀 Commencez simplement** : [Exemples du chapitre 1](../../../examples)
- **🤖 Exemples IA** : [Solutions IA des chapitres 2 & 5](../../../examples)

## Introduction

Ce répertoire contient des exemples pratiques, des modèles et des scénarios réels pour vous aider à apprendre Azure Developer CLI grâce à une pratique concrète. Chaque exemple fournit du code fonctionnel complet, des modèles d'infrastructure et des instructions détaillées pour différentes architectures d'applications et modèles de déploiement.

## Objectifs d'apprentissage

En travaillant sur ces exemples, vous allez :
- Pratiquer les workflows Azure Developer CLI avec des scénarios d'application réalistes
- Comprendre différentes architectures d'applications et leurs implémentations avec AZD
- Maîtriser les modèles d'Infrastructure as Code pour divers services Azure
- Appliquer des stratégies de gestion de configuration et de déploiement spécifiques à l'environnement
- Mettre en œuvre des modèles de surveillance, de sécurité et de mise à l'échelle dans des contextes pratiques
- Acquérir de l'expérience en dépannage et en débogage de scénarios de déploiement réels

## Résultats d'apprentissage

Une fois ces exemples terminés, vous serez capable de :
- Déployer différents types d'applications en toute confiance avec Azure Developer CLI
- Adapter les modèles fournis à vos propres besoins applicatifs
- Concevoir et implémenter des modèles d'infrastructure personnalisés avec Bicep
- Configurer des applications complexes multi-services avec des dépendances appropriées
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
1. **[Application Web simple - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Déployez une application web Node.js Express avec MongoDB
2. **[Site web statique - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Hébergez un site web statique React avec Azure Static Web Apps
3. **[Application conteneurisée - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Déployez une application Python Flask conteneurisée

### Pour utilisateurs intermédiaires
4. **[Application avec base de données - C# avec Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Application web avec API C# et base de données Azure SQL
5. **[Fonction serverless - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Fonctions Azure Python avec déclencheurs HTTP et Cosmos DB
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Application Java multi-services avec Container Apps et passerelle API

### Modèles Azure AI Foundry

1. **[Application de chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Application de chat intelligente avec Azure OpenAI
2. **[Traitement de documents IA](https://github.com/Azure-Samples/azure-ai-document-processing)** - Analyse de documents avec les services Azure AI
3. **[Pipeline de machine learning](https://github.com/Azure-Samples/mlops-v2)** - Workflow MLOps avec Azure Machine Learning

### Scénarios réels

#### **Solution multi-agents pour le commerce de détail** 🆕
**[Guide complet de mise en œuvre](./retail-scenario.md)**

Une solution complète et prête pour la production, dédiée au support client multi-agents, qui démontre le déploiement d'applications IA de niveau entreprise avec AZD. Ce scénario propose :

- **Architecture complète** : Système multi-agents avec agents spécialisés pour le service client et la gestion des stocks
- **Infrastructure de production** : Déploiements Azure OpenAI multi-régions, recherche IA, Container Apps et surveillance complète
- **Modèle ARM prêt à déployer** : Déploiement en un clic avec plusieurs modes de configuration (Minimal/Standard/Premium)
- **Fonctionnalités avancées** : Validation de sécurité par red teaming, cadre d'évaluation des agents, optimisation des coûts et guides de dépannage
- **Contexte métier réel** : Cas d'utilisation pour le support client d'un détaillant avec téléversement de fichiers, intégration de recherche et mise à l'échelle dynamique

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
- **README.md** - Instructions détaillées pour la configuration et la personnalisation
- **azure.yaml** - Configuration AZD avec commentaires
- **infra/** - Modèles Bicep avec explications des paramètres
- **src/** - Code d'application exemple
- **scripts/** - Scripts d'aide pour les tâches courantes

## 🎯 Objectifs d'apprentissage

### Catégories d'exemples

#### **Déploiements de base**
- Applications mono-service
- Modèles d'infrastructure simples
- Gestion de configuration basique
- Configurations de développement économiques

#### **Scénarios avancés**
- Architectures multi-services
- Configurations réseau complexes
- Modèles d'intégration de bases de données
- Implémentations de sécurité et conformité

#### **Modèles prêts pour la production**
- Configurations haute disponibilité
- Surveillance et observabilité
- Intégration CI/CD
- Configurations de reprise après sinistre

## 📖 Descriptions des exemples

### Application Web simple - Node.js Express
**Technologies** : Node.js, Express, MongoDB, Container Apps  
**Complexité** : Débutant  
**Concepts** : Déploiement basique, API REST, intégration de base de données NoSQL

### Site web statique - React SPA
**Technologies** : React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexité** : Débutant  
**Concepts** : Hébergement statique, backend serverless, développement web moderne

### Application conteneurisée - Python Flask
**Technologies** : Python Flask, Docker, Container Apps, Container Registry  
**Complexité** : Débutant  
**Concepts** : Conteneurisation, architecture microservices, développement d'API

### Application avec base de données - C# avec Azure SQL
**Technologies** : C# ASP.NET Core, base de données Azure SQL, App Service  
**Complexité** : Intermédiaire  
**Concepts** : Entity Framework, connexions de base de données, développement d'API web

### Fonction serverless - Python Azure Functions
**Technologies** : Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexité** : Intermédiaire  
**Concepts** : Architecture événementielle, informatique serverless, développement full-stack

### Microservices - Java Spring Boot
**Technologies** : Java Spring Boot, Container Apps, Service Bus, passerelle API  
**Complexité** : Intermédiaire  
**Concepts** : Communication entre services, systèmes distribués, modèles d'entreprise

### Exemples Azure AI Foundry

#### Application de chat Azure OpenAI
**Technologies** : Azure OpenAI, Cognitive Search, App Service  
**Complexité** : Intermédiaire  
**Concepts** : Architecture RAG, recherche vectorielle, intégration LLM

#### Traitement de documents IA
**Technologies** : Azure AI Document Intelligence, Stockage, Functions  
**Complexité** : Intermédiaire  
**Concepts** : Analyse de documents, OCR, extraction de données

#### Pipeline de machine learning
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
- Modèles sécurisés
- Configurations optimisées pour les coûts

### Scripts d'aide
- Automatisation de la configuration de l'environnement
- Scripts de migration de base de données
- Outils de validation de déploiement
- Utilitaires de surveillance des coûts

## 🔧 Guide de personnalisation

### Adapter les exemples à votre cas d'utilisation

1. **Vérifiez les prérequis**
   - Vérifiez les exigences des services Azure
   - Confirmez les limites de votre abonnement
   - Comprenez les implications des coûts

2. **Modifiez la configuration**
   - Mettez à jour les définitions de service dans `azure.yaml`
   - Personnalisez les modèles Bicep
   - Ajustez les variables d'environnement

3. **Testez minutieusement**
   - Déployez d'abord dans un environnement de développement
   - Validez les fonctionnalités
   - Testez la mise à l'échelle et les performances

4. **Revue de sécurité**
   - Vérifiez les contrôles d'accès
   - Implémentez la gestion des secrets
   - Activez la surveillance et les alertes

## 📊 Tableau comparatif

| Exemple | Services | Base de données | Authentification | Surveillance | Complexité |
|---------|----------|-----------------|------------------|--------------|------------|
| Node.js Express Todo | 2 | ✅ | Basique | Basique | ⭐ |
| React SPA + Functions | 3 | ✅ | Basique | Complète | ⭐ |
| Python Flask Container | 2 | ❌ | Basique | Complète | ⭐ |
| C# Web API + SQL | 2 | ✅ | Complète | Complète | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Complète | Complète | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Complète | Complète | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Complète | Complète | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basique | Complète | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Complète | Complète | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Entreprise** | **Avancée** | **⭐⭐⭐⭐** |

## 🎓 Parcours d'apprentissage

### Progression recommandée

1. **Commencez par l'application web simple**
   - Apprenez les concepts de base d'AZD
   - Comprenez le workflow de déploiement
   - Pratiquez la gestion des environnements

2. **Essayez le site web statique**
   - Explorez différentes options d'hébergement
   - Apprenez l'intégration CDN
   - Comprenez la configuration DNS

3. **Passez à l'application conteneurisée**
   - Apprenez les bases de la conteneurisation
   - Comprenez les concepts de mise à l'échelle
   - Pratiquez avec Docker

4. **Ajoutez l'intégration de base de données**
   - Apprenez le provisionnement de bases de données
   - Comprenez les chaînes de connexion
   - Pratiquez la gestion des secrets

5. **Explorez le serverless**
   - Comprenez l'architecture événementielle
   - Apprenez les déclencheurs et les liaisons
   - Pratiquez avec les APIs

6. **Construisez des microservices**
   - Apprenez la communication entre services
   - Comprenez les systèmes distribués
   - Pratiquez les déploiements complexes

## 🔍 Trouver le bon exemple

### Par stack technologique
- **Node.js** : Application Todo Node.js Express
- **Python** : Application conteneurisée Python Flask, Python Functions + SPA
- **C#** : API web C# + base de données SQL, Application de chat Azure OpenAI, Pipeline ML
- **Java** : Microservices Java Spring Boot
- **React** : React SPA + Functions
- **Conteneurs** : Application conteneurisée Python Flask, Microservices Java
- **Bases de données** : Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **IA/ML** : Application de chat Azure OpenAI, Traitement de documents IA, Pipeline ML, **Solution multi-agents pour le commerce de détail**
- **Systèmes multi-agents** : **Solution multi-agents pour le commerce de détail**
- **Production en entreprise** : **Solution multi-agents pour le commerce de détail**

### Par modèle d'architecture
- **Monolithique** : Node.js Express Todo, API web C# + SQL
- **Statique + Serverless** : React SPA + Functions, Python Functions + SPA
- **Microservices** : Microservices Java Spring Boot
- **Conteneurisé** : Application conteneurisée Python Flask
- **IA-Powered** : Application de chat Azure OpenAI, Traitement de documents IA, Pipeline ML, **Solution multi-agents pour le commerce de détail**
- **Architecture multi-agents** : **Solution multi-agents pour le commerce de détail**
- **Multi-services en entreprise** : **Solution multi-agents pour le commerce de détail**

### Par niveau de complexité
- **Débutant** : Node.js Express Todo, React SPA + Functions, Application conteneurisée Python Flask
- **Intermédiaire** : API web C# + SQL, Python Functions + SPA, Microservices Java, Application de chat Azure OpenAI, Traitement de documents IA
- **Avancé** : Pipeline ML
- **Prêt pour la production en entreprise** : **Solution multi-agents pour le commerce de détail** (Système multi-agents complet avec déploiement via modèle ARM)

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
- [Application Web React avec API C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [Job Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)  
- [Azure Functions avec Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### Bonnes pratiques  
- [Framework Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [Framework d'adoption du cloud](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 Contribuer des exemples  

Vous avez un exemple utile à partager ? Nous accueillons vos contributions avec plaisir !  

### Directives de soumission  
1. Respectez la structure de répertoire établie  
2. Incluez un fichier README.md complet  
3. Ajoutez des commentaires dans les fichiers de configuration  
4. Testez minutieusement avant de soumettre  
5. Fournissez des estimations de coûts et des prérequis  

### Structure de modèle d'exemple  
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

**Prochaines étapes** :  
- Choisissez un exemple adapté à votre niveau de compétence  
- Suivez les instructions de configuration dans le README de l'exemple  
- Expérimentez des personnalisations  
- Partagez vos apprentissages avec la communauté  

---  

**Navigation**  
- **Leçon précédente** : [Guide d'étude](../resources/study-guide.md)  
- **Retour à** : [README principal](../README.md)  

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.