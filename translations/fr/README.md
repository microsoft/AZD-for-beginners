<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1caf5e63f84a4cdffbeb8d0fe5fa3fa8",
  "translation_date": "2025-12-21T10:23:47+00:00",
  "source_file": "README.md",
  "language_code": "fr"
}
-->
# AZD pour débutants : Un parcours d'apprentissage structuré

![AZD pour débutants](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.fr.png) 

[![Observateurs GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Forks GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Étoiles GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Démarrage de ce cours

Suivez ces étapes pour commencer votre parcours d'apprentissage AZD :

1. **Créez un fork du dépôt**: Cliquez [![Forks GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonez le dépôt**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Rejoignez la communauté**: [Communautés Discord Azure](https://discord.com/invite/ByRwuEEgH4) pour un support d'experts
4. **Choisissez votre parcours d'apprentissage**: Sélectionnez un chapitre ci-dessous qui correspond à votre niveau d'expérience

### Prise en charge multilingue

#### Traductions automatiques (toujours à jour)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabe](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgare](../bg/README.md) | [Birman (Myanmar)](../my/README.md) | [Chinois (simplifié)](../zh/README.md) | [Chinois (traditionnel, Hong Kong)](../hk/README.md) | [Chinois (traditionnel, Macao)](../mo/README.md) | [Chinois (traditionnel, Taïwan)](../tw/README.md) | [Croate](../hr/README.md) | [Tchèque](../cs/README.md) | [Danois](../da/README.md) | [Néerlandais](../nl/README.md) | [Estonien](../et/README.md) | [Finnois](../fi/README.md) | [Français](./README.md) | [Allemand](../de/README.md) | [Grec](../el/README.md) | [Hébreu](../he/README.md) | [Hindi](../hi/README.md) | [Hongrois](../hu/README.md) | [Indonésien](../id/README.md) | [Italien](../it/README.md) | [Japonais](../ja/README.md) | [Kannada](../kn/README.md) | [Coréen](../ko/README.md) | [Lituanien](../lt/README.md) | [Malais](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Népalais](../ne/README.md) | [Pidgin nigérian](../pcm/README.md) | [Norvégien](../no/README.md) | [Persan (Farsi)](../fa/README.md) | [Polonais](../pl/README.md) | [Portugais (Brésil)](../br/README.md) | [Portugais (Portugal)](../pt/README.md) | [Pendjabi (Gurmukhi)](../pa/README.md) | [Roumain](../ro/README.md) | [Russe](../ru/README.md) | [Serbe (cyrillique)](../sr/README.md) | [Slovaque](../sk/README.md) | [Slovène](../sl/README.md) | [Espagnol](../es/README.md) | [Swahili](../sw/README.md) | [Suédois](../sv/README.md) | [Tagalog (philippin)](../tl/README.md) | [Tamoul](../ta/README.md) | [Telugu](../te/README.md) | [Thaï](../th/README.md) | [Turc](../tr/README.md) | [Ukrainien](../uk/README.md) | [Ourdou](../ur/README.md) | [Vietnamien](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Aperçu du cours

Maîtrisez Azure Developer CLI (azd) grâce à des chapitres structurés conçus pour un apprentissage progressif. **Accent particulier sur le déploiement d'applications IA avec l'intégration de Microsoft Foundry.**

### Pourquoi ce cours est essentiel pour les développeurs modernes

D'après les retours de la communauté Microsoft Foundry sur Discord, **45 % des développeurs souhaitent utiliser AZD pour des charges de travail IA** mais rencontrent des difficultés avec :
- Architectures IA multi-services complexes
- Bonnes pratiques de déploiement d'IA en production  
- Intégration et configuration des services Azure IA
- Optimisation des coûts pour les charges IA
- Résolution des problèmes de déploiement spécifiques à l'IA

### Objectifs d'apprentissage

En complétant ce cours structuré, vous allez :
- **Maîtriser les bases d'AZD** : concepts fondamentaux, installation et configuration
- **Déployer des applications IA** : utiliser AZD avec les services Microsoft Foundry
- **Mettre en œuvre l'infrastructure en tant que code** : gérer les ressources Azure avec des modèles Bicep
- **Dépanner des déploiements** : résoudre les problèmes courants et déboguer
- **Optimiser pour la production** : sécurité, mise à l'échelle, supervision et gestion des coûts
- **Construire des solutions multi-agents** : déployer des architectures IA complexes

## 📚 Chapitres d'apprentissage

*Sélectionnez votre parcours d'apprentissage en fonction de votre niveau d'expérience et de vos objectifs*

### 🚀 Chapitre 1 : Fondations et démarrage rapide
**Prérequis** : abonnement Azure, notions de base de la ligne de commande  
**Durée**: 30-45 minutes  
**Complexité**: ⭐

#### Ce que vous apprendrez
- Comprendre les fondamentaux d'Azure Developer CLI
- Installer AZD sur votre plateforme
- Votre premier déploiement réussi

#### Ressources d'apprentissage
- **🎯 Commencez ici**: [Qu'est-ce que Azure Developer CLI ?](../..)
- **📖 Théorie**: [Notions de base d'AZD](docs/getting-started/azd-basics.md) - Principes de base et terminologie
- **⚙️ Installation**: [Installation & Setup](docs/getting-started/installation.md) - Guides spécifiques à la plateforme
- **🛠️ Pratique**: [Votre premier projet](docs/getting-started/first-project.md) - Tutoriel étape par étape
- **📋 Référence rapide**: [Fiche de référence des commandes](resources/cheat-sheet.md)

#### Exercices pratiques
```bash
# Vérification rapide de l'installation
azd version

# Déployez votre première application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Résultat du chapitre**: Déployer avec succès une application web simple sur Azure à l'aide d'AZD

**✅ Validation de réussite:**
```bash
# Après avoir terminé le chapitre 1, vous devriez être capable de :
azd version              # Affiche la version installée
azd init --template todo-nodejs-mongo  # Initialise le projet
azd up                  # Déploie sur Azure
azd show                # Affiche l'URL de l'application en cours d'exécution
# L'application s'ouvre dans le navigateur et fonctionne
azd down --force --purge  # Nettoie les ressources
```

**📊 Investissement en temps:** 30-45 minutes  
**📈 Niveau de compétence après:** Peut déployer des applications basiques de manière autonome

**✅ Validation de réussite:**
```bash
# Après avoir terminé le Chapitre 1, vous devriez être capable de :
azd version              # Affiche la version installée
azd init --template todo-nodejs-mongo  # Initialise le projet
azd up                  # Déploie sur Azure
azd show                # Affiche l'URL de l'application en cours d'exécution
# L'application s'ouvre dans le navigateur et fonctionne
azd down --force --purge  # Nettoie les ressources
```

**📊 Investissement en temps:** 30-45 minutes  
**📈 Niveau de compétence après:** Peut déployer des applications basiques de manière autonome

---

### 🤖 Chapitre 2 : Développement axé IA (Recommandé pour les développeurs IA)
**Prérequis**: Chapitre 1 terminé  
**Durée**: 1-2 heures  
**Complexité**: ⭐⭐

#### Ce que vous apprendrez
- Intégration de Microsoft Foundry avec AZD
- Déploiement d'applications alimentées par l'IA
- Comprendre les configurations des services IA

#### Ressources d'apprentissage
- **🎯 Commencez ici**: [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Modèles**: [Déploiement de modèles IA](docs/microsoft-foundry/ai-model-deployment.md) - Déployer et gérer des modèles IA
- **🛠️ Atelier**: [Atelier IA](docs/microsoft-foundry/ai-workshop-lab.md) - Préparez vos solutions IA pour AZD
- **🎥 Guide interactif**: [Matériel de l'atelier](workshop/README.md) - Apprentissage basé sur le navigateur avec MkDocs * DevContainer Environment
- **📋 Modèles**: [Microsoft Foundry Templates](../..)
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

**✅ Validation de réussite:**
```bash
# Après le chapitre 2, vous devriez être capable de :
azd init --template azure-search-openai-demo
azd up
# Tester l'interface de chat de l'IA
# Poser des questions et obtenir des réponses générées par l'IA avec des sources
# Vérifier que l'intégration de recherche fonctionne
azd monitor  # Vérifier qu'Application Insights affiche la télémétrie
azd down --force --purge
```

**📊 Investissement en temps:** 1-2 heures  
**📈 Niveau de compétence après:** Peut déployer et configurer des applications IA prêtes pour la production  
**💰 Sensibilisation aux coûts:** Comprendre 80 $-150 $/mois pour le développement, 300 $-3 500 $/mois pour la production

#### 💰 Considérations de coûts pour les déploiements IA

**Environnement de développement (estimé 80 $-150 $/mois):**
- Azure OpenAI (paiement à l'utilisation) : 0 $-50 $/mois (basé sur l'utilisation des jetons)
- AI Search (niveau de base) : 75 $/mois
- Container Apps (consommation) : 0 $-20 $/mois
- Stockage (standard) : 1 $-5 $/mois

**Environnement de production (estimé 300 $-3 500 $+/mois):**
- Azure OpenAI (PTU pour des performances constantes) : 3 000 $+/mois OU paiement à l'utilisation en cas de volume élevé
- AI Search (niveau standard) : 250 $/mois
- Container Apps (dédié) : 50 $-100 $/mois
- Application Insights : 5 $-50 $/mois
- Stockage (premium) : 10 $-50 $/mois

**💡 Conseils d'optimisation des coûts:**
- Utilisez le niveau gratuit d'Azure OpenAI pour l'apprentissage (50 000 jetons/mois inclus)
- Exécutez `azd down` pour désallouer les ressources lorsque vous ne développez pas activement
- Commencez avec une facturation à la consommation, passez au PTU uniquement pour la production
- Utilisez `azd provision --preview` pour estimer les coûts avant le déploiement
- Activez l'auto-scaling : payez uniquement pour l'utilisation réelle

**Surveillance des coûts:**
```bash
# Vérifier les coûts mensuels estimés
azd provision --preview

# Surveiller les coûts réels dans le portail Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapitre 3 : Configuration et authentification
**Prérequis**: Chapitre 1 terminé  
**Durée**: 45-60 minutes  
**Complexité**: ⭐⭐

#### Ce que vous apprendrez
- Configuration et gestion des environnements
- Authentification et meilleures pratiques de sécurité
- Nommage et organisation des ressources

#### Ressources d'apprentissage
- **📖 Configuration**: [Guide de configuration](docs/getting-started/configuration.md) - Configuration des environnements
- **🔐 Sécurité**: [Modèles d'authentification et identité gérée](docs/getting-started/authsecurity.md) - Modèles d'authentification
- **📝 Exemples**: [Exemple d'application de base de données](examples/database-app/README.md) - Exemples de bases de données AZD

#### Exercices pratiques
- Configurer plusieurs environnements (dev, staging, prod)
- Mettre en place une authentification par identité gérée
- Implémenter des configurations spécifiques à chaque environnement

**💡 Résultat du chapitre**: Gérer plusieurs environnements avec authentification et sécurité appropriées

---

### 🏗️ Chapitre 4 : Infrastructure en tant que code et déploiement
**Prérequis**: Chapitres 1-3 terminés  
**Durée**: 1-1,5 heures  
**Complexité**: ⭐⭐⭐

#### Ce que vous apprendrez
- Modèles de déploiement avancés
- Infrastructure en tant que code avec Bicep
- Stratégies de provisionnement des ressources

#### Ressources d'apprentissage
- **📖 Déploiement**: [Guide de déploiement](docs/deployment/deployment-guide.md) - Flux de travail complets
- **🏗️ Provisionnement**: [Provisionnement des ressources](docs/deployment/provisioning.md) - Gestion des ressources Azure
- **📝 Exemples**: [Exemple d'application Container](../../examples/container-app) - Déploiements conteneurisés

#### Exercices pratiques
- Créer des modèles Bicep personnalisés
- Déployer des applications multi-services
- Mettre en œuvre des stratégies de déploiement blue-green

**💡 Résultat du chapitre**: Déployer des applications multi-services complexes en utilisant des modèles d'infrastructure personnalisés

---

### 🎯 Chapitre 5 : Solutions IA multi-agents (Avancé)
**Prérequis**: Chapitres 1 et 2 terminés  
**Durée**: 2-3 heures  
**Complexité**: ⭐⭐⭐⭐

#### Ce que vous apprendrez
- Modèles d'architecture multi-agent
- Orchestration et coordination des agents
- Déploiements IA prêts pour la production

#### Ressources d'apprentissage
- **🤖 Projet en vedette**: [Solution multi-agent pour le commerce de détail](examples/retail-scenario.md) - Implémentation complète
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Déploiement en un clic
- **📖 Architecture**: [Multi-agent coordination patterns](/docs/pre-deployment/coordination-patterns.md) - Modèles

#### Practical Exercises
```bash
# Déployer la solution multi-agents complète pour le commerce de détail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorer les configurations des agents
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Chapter Outcome**: Déployer et gérer une solution multi-agents prête pour la production avec des agents Customer et Inventory

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**Prerequisites**: Chapter 4 completed  
**Duration**: 1 hour  
**Complexity**: ⭐⭐

#### What You'll Learn
- Capacity planning and resource validation
- SKU selection strategies
- Pre-flight checks and automation

#### Learning Resources
- **📊 Planning**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Resource validation
- **💰 Selection**: [SKU Selection](docs/pre-deployment/sku-selection.md) - Cost-effective choices
- **✅ Validation**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automated scripts

#### Practical Exercises
- Run capacity validation scripts
- Optimize SKU selections for cost
- Implement automated pre-deployment checks

**💡 Chapter Outcome**: Valider et optimiser les déploiements avant l'exécution

---

### 🚨 Chapter 7: Troubleshooting & Debugging
**Prerequisites**: Any deployment chapter completed  
**Duration**: 1-1.5 hours  
**Complexity**: ⭐⭐

#### What You'll Learn
- Systematic debugging approaches
- Common issues and solutions
- AI-specific troubleshooting

#### Learning Resources
- **🔧 Common Issues**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ and solutions
- **🕵️ Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - Step-by-step strategies
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - AI service problems

#### Practical Exercises
- Diagnose deployment failures
- Resolve authentication issues
- Debug AI service connectivity

**💡 Chapter Outcome**: Diagnostiquer et résoudre de manière autonome les problèmes de déploiement courants

---

### 🏢 Chapter 8: Production & Enterprise Patterns
**Prerequisites**: Chapters 1-4 completed  
**Duration**: 2-3 hours  
**Complexity**: ⭐⭐⭐⭐

#### What You'll Learn
- Production deployment strategies
- Enterprise security patterns
- Monitoring and cost optimization

#### Learning Resources
- **🏭 Production**: [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Enterprise patterns
- **📝 Examples**: [Microservices Example](../../examples/microservices) - Complex architectures
- **📊 Monitoring**: [Application Insights integration](docs/pre-deployment/application-insights.md) - Monitoring

#### Practical Exercises
- Implement enterprise security patterns
- Set up comprehensive monitoring
- Deploy to production with proper governance

**💡 Chapter Outcome**: Déployer des applications prêtes pour l'entreprise avec des capacités complètes de production

---

## 🎓 Workshop Overview: Hands-On Learning Experience

> **⚠️ WORKSHOP STATUS: Active Development**  
> The workshop materials are currently being developed and refined. Core modules are functional, but some advanced sections are incomplete. We're actively working to complete all content. [Track progress →](workshop/README.md)

### Interactive Workshop Materials
**Comprehensive hands-on learning with browser-based tools and guided exercises**

Our workshop materials provide a structured, interactive learning experience that complements the chapter-based curriculum above. The workshop is designed for both self-paced learning and instructor-led sessions.

#### 🛠️ Workshop Features
- **Browser-Based Interface**: Complete MkDocs-powered workshop with search, copy, and theme features
- **GitHub Codespaces Integration**: One-click development environment setup
- **Structured Learning Path**: 7-step guided exercises (3.5 hours total)
- **Discovery → Deployment → Customization**: Progressive methodology
- **Interactive DevContainer Environment**: Pre-configured tools and dependencies

#### 📚 Workshop Structure
The workshop follows a **Discovery → Deployment → Customization** methodology:

1. **Discovery Phase** (45 mins)
   - Explore Microsoft Foundry templates and services
   - Understand multi-agent architecture patterns
   - Review deployment requirements and prerequisites

2. **Deployment Phase** (2 hours)
   - Hands-on deployment of AI applications with AZD
   - Configure Azure AI services and endpoints
   - Implement security and authentication patterns

3. **Customization Phase** (45 mins)
   - Modify applications for specific use cases
   - Optimize for production deployment
   - Implement monitoring and cost management

#### 🚀 Getting Started with the Workshop
```bash
# Option 1 : GitHub Codespaces (Recommandé)
# Cliquez sur "Code" → "Créer un codespace sur main" dans le dépôt

# Option 2 : Développement local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Suivez les instructions de configuration dans workshop/README.md
```

#### 🎯 Workshop Learning Outcomes
By completing the workshop, participants will:
- **Deploy Production AI Applications**: Use AZD with Microsoft Foundry services
- **Master Multi-Agent Architectures**: Implement coordinated AI agent solutions
- **Implement Security Best Practices**: Configure authentication and access control
- **Optimize for Scale**: Design cost-effective, performant deployments
- **Troubleshoot Deployments**: Resolve common issues independently

#### 📖 Workshop Resources
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning environment
- **📋 Step-by-Step Instructions**: [Guided Exercises](../../workshop/docs/instructions) - Detailed walkthroughs
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-focused exercises
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Environment configuration

**Perfect for**: Corporate training, university courses, self-paced learning, and developer bootcamps.

---

## 📖 What is Azure Developer CLI?

Azure Developer CLI (azd) is a developer-centric command-line interface that accelerates the process of building and deploying applications to Azure. It provides:

- **Template-based deployments** - Use pre-built templates for common application patterns
- **Infrastructure as Code** - Manage Azure resources using Bicep or Terraform  
- **Integrated workflows** - Seamlessly provision, deploy, and monitor applications
- **Developer-friendly** - Optimized for developer productivity and experience

### **AZD + Microsoft Foundry: Perfect for AI Deployments**

**Why AZD for AI Solutions?** AZD addresses the top challenges AI developers face:

- **AI-Ready Templates** - Pre-configured templates for Azure OpenAI, Cognitive Services, and ML workloads
- **Secure AI Deployments** - Built-in security patterns for AI services, API keys, and model endpoints  
- **Production AI Patterns** - Best practices for scalable, cost-effective AI application deployments
- **End-to-End AI Workflows** - From model development to production deployment with proper monitoring
- **Cost Optimization** - Smart resource allocation and scaling strategies for AI workloads
- **Microsoft Foundry Integration** - Seamless connection to Microsoft Foundry model catalog and endpoints

---

## 🎯 Templates & Examples Library

### Featured: Microsoft Foundry Templates
**Start here if you're deploying AI applications!**

> **Note:** These templates demonstrate various AI patterns. Some are external Azure Samples, others are local implementations.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapitre 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externe |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapitre 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externe |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapitre 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externe |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapitre 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externe |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapitre 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externe |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapitre 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externe |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapitre 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Featured: Complete Learning Scenarios
**Production-ready application templates mapped to learning chapters**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapitre 2 | ⭐ | Modèles de déploiement IA de base |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapitre 2 | ⭐⭐ | Mise en œuvre RAG avec Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapitre 4 | ⭐⭐ | Intégration Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapitre 5 | ⭐⭐⭐ | Framework d'agents et appels de fonctions |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapitre 8 | ⭐⭐⭐ | Orchestration IA en entreprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapitre 5 | ⭐⭐⭐⭐ | Architecture multi-agents avec agents Customer et Inventory |

### Learning by Example Type

> **📌 Local vs. External Examples:**  
> **Local Examples** (in this repo) = Ready to use immediately  
> **External Examples** (Azure Samples) = Clone from linked repositories

#### Local Examples (Ready to Use)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Implémentation complète prête pour la production avec ARM templates
  - Architecture multi-agents (agents Customer + Inventory)
  - Surveillance et évaluation complètes
  - Déploiement en un clic via un template ARM

#### Local Examples - Container Applications (Chapters 2-5)
**Comprehensive container deployment examples in this repository:**
- [**Container App Examples**](examples/container-app/README.md) - Guide complet pour les déploiements conteneurisés
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - API REST basique avec scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Déploiement multi-services prêt pour la production
  - Quick Start, Production, and Advanced deployment patterns
  - Monitoring, security, and cost optimization guidance

#### External Examples - Simple Applications (Chapters 1-2)
**Clone these Azure Samples repositories to get started:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basic deployment patterns
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Static content deployment
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API deployment

#### External Examples - Database Integration (Chapter 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Database connectivity patterns
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless data workflow

#### External Examples - Advanced Patterns (Chapters 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service architectures
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Background processing  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Production-ready ML patterns

### External Template Collections
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Curated collection of official and community templates
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn template documentation
- [**Examples Directory**](examples/README.md) - Local learning examples with detailed explanations

---

## 📚 Learning Resources & References

### Quick References
- [**Fiche de commandes**](resources/cheat-sheet.md) - Commandes azd essentielles organisées par chapitre
- [**Glossaire**](resources/glossary.md) - Terminologie Azure et azd  
- [**FAQ**](resources/faq.md) - Questions fréquentes organisées par chapitre d'apprentissage
- [**Guide d'étude**](resources/study-guide.md) - Exercices pratiques complets

### Ateliers pratiques
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Rendez vos solutions IA déployables avec AZD (2-3 heures)
- [**Guide d'atelier interactif**](workshop/README.md) - Atelier basé sur le navigateur avec MkDocs et environnement DevContainer
- [**Structured Learning Path**](../../workshop/docs/instructions) -exercices guidés en 7 étapes (Découverte → Déploiement → Personnalisation)
- [**AZD For Beginners Workshop**](workshop/README.md) - Matériel complet d'atelier pratique avec intégration GitHub Codespaces

### Ressources d'apprentissage externes
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Guide de dépannage rapide

**Problèmes courants rencontrés par les débutants et solutions immédiates :**

### ❌ "azd: command not found"

```bash
# Installez d'abord AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Vérifiez l'installation
azd version
```

### ❌ "No subscription found" or "Subscription not set"

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

### ❌ "InsufficientQuota" or "Quota exceeded"

```bash
# Essayez une autre région Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ou utilisez des SKU plus petits pour le développement
# Modifiez infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" fails halfway through

```bash
# Option 1: Nettoyer et réessayer
azd down --force --purge
azd up

# Option 2: Réparer simplement l'infrastructure
azd provision

# Option 3: Vérifier les journaux détaillés
azd show
azd logs
```

### ❌ "Authentication failed" or "Token expired"

```bash
# Se réauthentifier
az logout
az login

azd auth logout
azd auth login

# Vérifier l'authentification
az account show
```

### ❌ "Resource already exists" or naming conflicts

```bash
# AZD génère des noms uniques, mais en cas de conflit :
azd down --force --purge

# Puis réessayez avec un nouvel environnement
azd env new dev-v2
azd up
```

### ❌ Template deployment taking too long

**Temps d'attente normaux :**
- Application web simple : 5-10 minutes
- Application avec base de données : 10-15 minutes
- Applications IA : 15-25 minutes (Le provisionnement d'OpenAI est lent)

```bash
# Vérifier l'avancement
azd show

# Si bloqué plus de 30 minutes, vérifiez le Portail Azure :
azd monitor
# Recherchez les déploiements ayant échoué
```

### ❌ "Permission denied" or "Forbidden"

```bash
# Vérifiez votre rôle Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Vous devez au moins avoir le rôle "Contributor"
# Demandez à votre administrateur Azure d'accorder :
# - Contributor (pour les ressources)
# - User Access Administrator (pour les affectations de rôle)
```

### ❌ Can't find deployed application URL

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
- **Problèmes spécifiques à l'IA :** [Dépannage IA](docs/troubleshooting/ai-troubleshooting.md)
- **Guide de débogage :** [Débogage étape par étape](docs/troubleshooting/debugging.md)
- **Obtenir de l'aide :** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Guide de dépannage rapide

**Problèmes courants rencontrés par les débutants et solutions immédiates :**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Installez d'abord AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Vérifiez l'installation
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Essayez une autre région Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ou utilisez des SKUs plus petits en développement
# Éditez infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

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
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD génère des noms uniques, mais en cas de conflit :
azd down --force --purge

# Puis réessayez avec un nouvel environnement
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Temps d'attente normaux :**
- Application web simple : 5-10 minutes
- Application avec base de données : 10-15 minutes
- Applications IA : 15-25 minutes (Le provisionnement d'OpenAI est lent)

```bash
# Vérifier l'avancement
azd show

# Si bloqué pendant plus de 30 minutes, consultez le portail Azure :
azd monitor
# Recherchez les déploiements échoués
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

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
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Afficher tous les points de terminaison des services
azd show

# Ou ouvrez le portail Azure
azd monitor

# Vérifier un service spécifique
azd env get-values
# Recherchez les variables *_URL
```
</details>

### 📚 Ressources complètes de dépannage

- **Guide des problèmes courants :** [Solutions détaillées](docs/troubleshooting/common-issues.md)
- **Problèmes spécifiques à l'IA :** [Dépannage IA](docs/troubleshooting/ai-troubleshooting.md)
- **Guide de débogage :** [Débogage étape par étape](docs/troubleshooting/debugging.md)
- **Obtenir de l'aide :** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Achèvement du cours & Certification

### Suivi de progression
Suivez votre progression d'apprentissage à travers chaque chapitre :

- [ ] **Chapitre 1** : Fondations & démarrage rapide ✅
- [ ] **Chapitre 2** : Développement axé IA ✅  
- [ ] **Chapitre 3** : Configuration & Authentification ✅
- [ ] **Chapitre 4** : Infrastructure as Code & Déploiement ✅
- [ ] **Chapitre 5** : Solutions IA multi-agents ✅
- [ ] **Chapitre 6** : Validation & planification avant déploiement ✅
- [ ] **Chapitre 7** : Dépannage & débogage ✅
- [ ] **Chapitre 8** : Patterns de production & entreprise ✅

### Vérification des connaissances
Après avoir terminé chaque chapitre, vérifiez vos acquis en :
1. **Exercice pratique** : Effectuer le déploiement pratique du chapitre
2. **Contrôle des connaissances** : Consultez la section FAQ de votre chapitre
3. **Discussion communautaire** : Partagez votre expérience sur Azure Discord
4. **Chapitre suivant** : Passez au niveau de complexité suivant

### Avantages à la fin du cours
Après avoir terminé tous les chapitres, vous aurez :
- **Expérience en production** : Déployé de véritables applications IA sur Azure
- **Compétences professionnelles** : Capacités de déploiement prêtes pour l'entreprise  
- **Reconnaissance communautaire** : Membre actif de la communauté des développeurs Azure
- **Avancement de carrière** : Expertise recherchée en AZD et déploiement IA

---

## 🤝 Communauté et assistance

### Obtenir de l'aide et du support
- **Problèmes techniques** : [Signaler des bugs et demander des fonctionnalités](https://github.com/microsoft/azd-for-beginners/issues)
- **Questions d'apprentissage** : [Communauté Microsoft Azure Discord](https://discord.gg/microsoft-azure) et [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Aide spécifique à l'IA** : Rejoignez le [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation** : [Documentation officielle du Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Aperçu de la communauté depuis Microsoft Foundry Discord

**Résultats récents du sondage depuis le canal #Azure :**
- **45%** des développeurs souhaitent utiliser AZD pour des charges de travail IA
- **Principaux défis** : déploiements multi-services, gestion des identifiants, préparation à la production  
- **Les plus demandés** : templates spécifiques à l'IA, guides de dépannage, meilleures pratiques

**Rejoignez notre communauté pour :**
- Partager vos expériences AZD + IA et obtenir de l'aide
- Accéder aux aperçus anticipés des nouveaux templates IA
- Contribuer aux meilleures pratiques de déploiement IA
- Influencer le développement futur des fonctionnalités IA + AZD

### Contribuer au cours
Nous accueillons les contributions ! Veuillez lire notre [Contributing Guide](CONTRIBUTING.md) pour les détails sur :
- **Améliorations de contenu** : Améliorer les chapitres et exemples existants
- **Nouveaux exemples** : Ajouter des scénarios et templates réels  
- **Traduction** : Aider à maintenir le support multilingue
- **Rapports de bugs** : Améliorer la précision et la clarté
- **Normes communautaires** : Suivre nos directives inclusives

---

## 📄 Informations sur le cours

### Licence
Ce projet est sous licence MIT - voir le fichier [LICENSE](../../LICENSE) pour les détails.

### Ressources d'apprentissage Microsoft associées

Notre équipe propose d'autres cours complets :

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

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
 
### Apprentissage de base
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![IA pour débutants](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersécurité pour débutants](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Développement Web pour débutants](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pour débutants](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Développement XR pour débutants](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot pour programmation en binôme IA](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pour C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventure Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigation du cours

**🚀 Prêt à commencer à apprendre ?**

**Débutants**: Commencez par [Chapitre 1: Fondations & Démarrage rapide](../..)  
**Développeurs IA**: Accédez à [Chapitre 2: Développement axé IA](../..)  
**Développeurs expérimentés**: Commencez par [Chapitre 3: Configuration & Authentification](../..)

**Étapes suivantes**: [Commencer le Chapitre 1 - Bases d'AZD](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Avertissement :
Ce document a été traduit à l'aide du service de traduction automatique Co‑op Translator (https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'être précis, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction professionnelle réalisée par un traducteur humain est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->