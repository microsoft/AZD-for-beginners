# Guide d'étude - Objectifs d'apprentissage complets

**Navigation du parcours d'apprentissage**
- **📚 Accueil du cours** : [AZD pour débutants](../README.md)
- **📖 Commencer à apprendre** : [Chapitre 1 : Fondations & Démarrage rapide](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Suivi des progrès** : [Achèvement du cours](../README.md#-course-completion--certification)

## Introduction

Ce guide d'étude complet propose des objectifs d'apprentissage structurés, des concepts clés, des exercices pratiques et des matériaux d'évaluation pour vous aider à maîtriser Azure Developer CLI (azd). Utilisez ce guide pour suivre vos progrès et vous assurer d'avoir couvert tous les sujets essentiels.

## Objectifs d'apprentissage

En complétant ce guide d'étude, vous serez capable de :
- Maîtriser tous les concepts fondamentaux et avancés d'Azure Developer CLI
- Développer des compétences pratiques dans le déploiement et la gestion d'applications Azure
- Acquérir de la confiance dans le dépannage et l'optimisation des déploiements
- Comprendre les pratiques de déploiement prêtes pour la production et les considérations de sécurité

## Résultats d'apprentissage

Après avoir terminé toutes les sections de ce guide d'étude, vous serez capable de :
- Concevoir, déployer et gérer des architectures d'applications complètes avec azd
- Mettre en œuvre des stratégies de surveillance, de sécurité et d'optimisation des coûts
- Résoudre de manière autonome des problèmes complexes de déploiement
- Créer des modèles personnalisés et contribuer à la communauté azd

## Structure d'apprentissage en 8 chapitres

### Chapitre 1 : Fondations & Démarrage rapide (Semaine 1)
**Durée** : 30-45 minutes | **Complexité** : ⭐

#### Objectifs d'apprentissage
- Comprendre les concepts de base et la terminologie d'Azure Developer CLI
- Installer et configurer AZD avec succès sur votre plateforme de développement
- Déployer votre première application en utilisant un modèle existant
- Naviguer efficacement dans l'interface en ligne de commande AZD

#### Concepts clés à maîtriser
- Structure et composants des projets AZD (azure.yaml, infra/, src/)
- Flux de travail de déploiement basés sur des modèles
- Bases de la configuration des environnements
- Gestion des groupes de ressources et des abonnements

#### Exercices pratiques
1. **Vérification de l'installation** : Installer AZD et vérifier avec `azd version`
2. **Premier déploiement** : Déployer le modèle todo-nodejs-mongo avec succès
3. **Configuration de l'environnement** : Configurer vos premières variables d'environnement
4. **Exploration des ressources** : Naviguer dans les ressources déployées sur le portail Azure

#### Questions d'évaluation
- Quels sont les composants principaux d'un projet AZD ?
- Comment initialiser un nouveau projet à partir d'un modèle ?
- Quelle est la différence entre `azd up` et `azd deploy` ?
- Comment gérer plusieurs environnements avec AZD ?

---

### Chapitre 2 : Développement axé sur l'IA (Semaine 2)
**Durée** : 1-2 heures | **Complexité** : ⭐⭐

#### Objectifs d'apprentissage
- Intégrer les services Microsoft Foundry aux flux de travail AZD
- Déployer et configurer des applications alimentées par l'IA
- Comprendre les modèles d'implémentation RAG (Retrieval-Augmented Generation)
- Gérer les déploiements de modèles IA et leur mise à l'échelle

#### Concepts clés à maîtriser
- Intégration du service Azure OpenAI et gestion des API
- Configuration de la recherche IA et indexation vectorielle
- Stratégies de déploiement de modèles et planification de la capacité
- Surveillance des applications IA et optimisation des performances

#### Exercices pratiques
1. **Déploiement de chat IA** : Déployer le modèle azure-search-openai-demo
2. **Implémentation RAG** : Configurer l'indexation et la récupération de documents
3. **Configuration des modèles** : Configurer plusieurs modèles IA avec des objectifs différents
4. **Surveillance IA** : Mettre en œuvre Application Insights pour les charges de travail IA

#### Questions d'évaluation
- Comment configurer les services Azure OpenAI dans un modèle AZD ?
- Quels sont les composants clés d'une architecture RAG ?
- Comment gérer la capacité et la mise à l'échelle des modèles IA ?
- Quels métriques de surveillance sont importantes pour les applications IA ?

---

### Chapitre 3 : Configuration & Authentification (Semaine 3)
**Durée** : 45-60 minutes | **Complexité** : ⭐⭐

#### Objectifs d'apprentissage
- Maîtriser les stratégies de configuration et de gestion des environnements
- Mettre en œuvre des modèles d'authentification sécurisés et des identités gérées
- Organiser les ressources avec des conventions de nommage appropriées
- Configurer des déploiements multi-environnements (dev, staging, prod)

#### Concepts clés à maîtriser
- Hiérarchie des environnements et priorité des configurations
- Authentification par identité gérée et principal de service
- Intégration de Key Vault pour la gestion des secrets
- Gestion des paramètres spécifiques à l'environnement

#### Exercices pratiques
1. **Configuration multi-environnements** : Configurer les environnements dev, staging et prod
2. **Configuration de la sécurité** : Mettre en œuvre l'authentification par identité gérée
3. **Gestion des secrets** : Intégrer Azure Key Vault pour les données sensibles
4. **Gestion des paramètres** : Créer des configurations spécifiques à l'environnement

#### Questions d'évaluation
- Comment configurer différents environnements avec AZD ?
- Quels sont les avantages d'utiliser une identité gérée par rapport aux principaux de service ?
- Comment gérer les secrets des applications de manière sécurisée ?
- Quelle est la hiérarchie de configuration dans AZD ?

---

### Chapitre 4 : Infrastructure en tant que code & Déploiement (Semaine 4-5)
**Durée** : 1-1.5 heures | **Complexité** : ⭐⭐⭐

#### Objectifs d'apprentissage
- Créer et personnaliser des modèles d'infrastructure Bicep
- Mettre en œuvre des modèles de déploiement avancés et des flux de travail
- Comprendre les stratégies de provisionnement des ressources
- Concevoir des architectures multi-services évolutives

- Déployer des applications conteneurisées en utilisant Azure Container Apps et AZD

#### Concepts clés à maîtriser
- Structure des modèles Bicep et bonnes pratiques
- Dépendances des ressources et ordre de déploiement
- Fichiers de paramètres et modularité des modèles
- Hooks personnalisés et automatisation des déploiements
- Modèles de déploiement d'applications conteneurisées (démarrage rapide, production, microservices)

#### Exercices pratiques
1. **Création de modèles personnalisés** : Construire un modèle d'application multi-services
2. **Maîtrise de Bicep** : Créer des composants d'infrastructure modulaires et réutilisables
3. **Automatisation des déploiements** : Mettre en œuvre des hooks avant/après déploiement
4. **Conception d'architecture** : Déployer une architecture complexe de microservices
5. **Déploiement d'applications conteneurisées** : Déployer les exemples [Simple Flask API](../../../examples/container-app/simple-flask-api) et [Microservices Architecture](../../../examples/container-app/microservices) en utilisant AZD

#### Questions d'évaluation
- Comment créer des modèles Bicep personnalisés pour AZD ?
- Quelles sont les meilleures pratiques pour organiser le code d'infrastructure ?
- Comment gérer les dépendances des ressources dans les modèles ?
- Quels modèles de déploiement permettent des mises à jour sans interruption ?

---

### Chapitre 5 : Solutions IA multi-agents (Semaine 6-7)
**Durée** : 2-3 heures | **Complexité** : ⭐⭐⭐⭐

#### Objectifs d'apprentissage
- Concevoir et mettre en œuvre des architectures IA multi-agents
- Orchestrer la coordination et la communication entre agents
- Déployer des solutions IA prêtes pour la production avec surveillance
- Comprendre la spécialisation des agents et les modèles de flux de travail
- Intégrer des microservices conteneurisés dans des solutions multi-agents

#### Concepts clés à maîtriser
- Modèles d'architecture multi-agents et principes de conception
- Protocoles de communication entre agents et flux de données
- Stratégies de mise à l'échelle et d'équilibrage de charge pour les agents IA
- Surveillance en production pour les systèmes multi-agents
- Communication service-à-service dans des environnements conteneurisés

#### Exercices pratiques
1. **Déploiement de solution retail** : Déployer le scénario retail complet multi-agents
2. **Personnalisation des agents** : Modifier les comportements des agents Client et Inventaire
3. **Mise à l'échelle de l'architecture** : Mettre en œuvre l'équilibrage de charge et l'auto-scaling
4. **Surveillance en production** : Configurer une surveillance et des alertes complètes
5. **Intégration des microservices** : Étendre l'exemple [Microservices Architecture](../../../examples/container-app/microservices) pour prendre en charge les flux de travail basés sur les agents

#### Questions d'évaluation
- Comment concevoir des modèles de communication efficaces entre agents ?
- Quels sont les principaux éléments à considérer pour la mise à l'échelle des charges de travail des agents IA ?
- Comment surveiller et déboguer les systèmes IA multi-agents ?
- Quels modèles de production garantissent la fiabilité des agents IA ?

---

### Chapitre 6 : Validation & Planification avant déploiement (Semaine 8)
**Durée** : 1 heure | **Complexité** : ⭐⭐

#### Objectifs d'apprentissage
- Effectuer une planification de capacité et une validation des ressources complètes
- Sélectionner les SKUs Azure optimaux pour une rentabilité maximale
- Mettre en œuvre des vérifications automatisées avant déploiement
- Planifier les déploiements avec des stratégies d'optimisation des coûts

#### Concepts clés à maîtriser
- Quotas de ressources Azure et limitations de capacité
- Critères de sélection des SKUs et optimisation des coûts
- Scripts de validation automatisés et tests
- Planification des déploiements et évaluation des risques

#### Exercices pratiques
1. **Analyse de capacité** : Analyser les besoins en ressources pour vos applications
2. **Optimisation des SKUs** : Comparer et sélectionner des niveaux de service rentables
3. **Automatisation de la validation** : Mettre en œuvre des scripts de vérification avant déploiement
4. **Planification des coûts** : Créer des estimations de coûts et des budgets de déploiement

#### Questions d'évaluation
- Comment valider la capacité Azure avant un déploiement ?
- Quels facteurs influencent les décisions de sélection des SKUs ?
- Comment automatiser la validation avant déploiement ?
- Quelles stratégies permettent d'optimiser les coûts de déploiement ?

---

### Chapitre 7 : Dépannage & Débogage (Semaine 9)
**Durée** : 1-1.5 heures | **Complexité** : ⭐⭐

#### Objectifs d'apprentissage
- Développer des approches systématiques de débogage pour les déploiements AZD
- Résoudre les problèmes courants de déploiement et de configuration
- Déboguer les problèmes spécifiques à l'IA et les problèmes de performance
- Mettre en œuvre la surveillance et les alertes pour une détection proactive des problèmes

#### Concepts clés à maîtriser
- Techniques de diagnostic et stratégies de journalisation
- Modèles d'échec courants et leurs solutions
- Surveillance des performances et optimisation
- Procédures de réponse aux incidents et de récupération

#### Exercices pratiques
1. **Compétences en diagnostic** : S'entraîner avec des déploiements volontairement défectueux
2. **Analyse des journaux** : Utiliser Azure Monitor et Application Insights efficacement
3. **Optimisation des performances** : Optimiser les applications lentes
4. **Procédures de récupération** : Mettre en œuvre des sauvegardes et des plans de reprise après sinistre

#### Questions d'évaluation
- Quels sont les échecs de déploiement AZD les plus courants ?
- Comment déboguer les problèmes d'authentification et de permissions ?
- Quelles stratégies de surveillance aident à prévenir les problèmes en production ?
- Comment optimiser les performances des applications dans Azure ?

---

### Chapitre 8 : Modèles de production & d'entreprise (Semaine 10-11)
**Durée** : 2-3 heures | **Complexité** : ⭐⭐⭐⭐

#### Objectifs d'apprentissage
- Mettre en œuvre des stratégies de déploiement de niveau entreprise
- Concevoir des modèles de sécurité et des cadres de conformité
- Établir la surveillance, la gouvernance et la gestion des coûts
- Créer des pipelines CI/CD évolutifs avec intégration AZD
- Appliquer les meilleures pratiques pour les déploiements d'applications conteneurisées en production (sécurité, surveillance, coût, CI/CD)

#### Concepts clés à maîtriser
- Exigences de sécurité et de conformité de niveau entreprise
- Cadres de gouvernance et mise en œuvre des politiques
- Surveillance avancée et gestion des coûts
- Intégration CI/CD et pipelines de déploiement automatisés
- Stratégies de déploiement blue-green et canary pour les charges de travail conteneurisées

#### Exercices pratiques
1. **Sécurité d'entreprise** : Mettre en œuvre des modèles de sécurité complets
2. **Cadre de gouvernance** : Configurer Azure Policy et la gestion des ressources
3. **Surveillance avancée** : Créer des tableaux de bord et des alertes automatisées
4. **Intégration CI/CD** : Construire des pipelines de déploiement automatisés
5. **Applications conteneurisées en production** : Appliquer la sécurité, la surveillance et l'optimisation des coûts à l'exemple [Microservices Architecture](../../../examples/container-app/microservices)

#### Questions d'évaluation
- Comment mettre en œuvre la sécurité d'entreprise dans les déploiements AZD ?
- Quels modèles de gouvernance garantissent la conformité et le contrôle des coûts ?
- Comment concevoir une surveillance évolutive pour les systèmes en production ?
- Quels modèles CI/CD fonctionnent le mieux avec les flux de travail AZD ?

#### Objectifs d'apprentissage
- Comprendre les fondamentaux et les concepts clés d'Azure Developer CLI
- Installer et configurer azd avec succès dans votre environnement de développement
- Réaliser votre premier déploiement en utilisant un modèle existant
- Naviguer dans la structure des projets azd et comprendre les composants clés

#### Concepts clés à maîtriser
- Modèles, environnements et services
- Structure de configuration azure.yaml
- Commandes de base azd (init, up, down, deploy)
- Principes d'Infrastructure en tant que Code
- Authentification et autorisation Azure

#### Exercices pratiques

**Exercice 1.1 : Installation et configuration**
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Exercice 1.2 : Premier déploiement**
```bash
# Deploy a simple web application:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Exercice 1.3 : Analyse de la structure du projet**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Questions d'auto-évaluation
1. Quels sont les trois concepts clés de l'architecture azd ?
2. Quel est le rôle du fichier azure.yaml ?
3. Comment les environnements aident-ils à gérer différents cibles de déploiement ?
4. Quelles méthodes d'authentification peuvent être utilisées avec azd ?
5. Que se passe-t-il lorsque vous exécutez `azd up` pour la première fois ?

---

## Suivi des progrès et cadre d'évaluation
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Exercice 2.2 : Configuration avancée**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Exercice 2.3 : Configuration de la sécurité**
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Questions d'auto-évaluation
1. Comment azd gère-t-il la priorité des variables d'environnement ?
2. Que sont les hooks de déploiement et quand devriez-vous les utiliser ?
3. Comment configurer différents SKUs pour différents environnements ?
4. Quelles sont les implications de sécurité des différentes méthodes d'authentification ?
5. Comment gérer les secrets et les données de configuration sensibles ?

### Module 3 : Déploiement et provisionnement (Semaine 4)

#### Objectifs d'apprentissage
- Maîtriser les flux de travail de déploiement et les meilleures pratiques
- Comprendre l'Infrastructure en tant que Code avec les modèles Bicep
- Mettre en œuvre des architectures multi-services complexes
- Optimiser les performances et la fiabilité des déploiements

#### Concepts clés à maîtriser
- Structure des modèles Bicep et modules
- Dépendances des ressources et ordre
- Stratégies de déploiement (blue-green, mises à jour progressives)
- Déploiements multi-régions
- Migrations de bases de données et gestion des données

#### Exercices pratiques

**Exercice 3.1 : Infrastructure personnalisée**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Exercice 3.2 : Application multi-services**
```bash
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Exercice 3.3 : Intégration de base de données**
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Questions d'auto-évaluation
1. Quels sont les avantages d'utiliser Bicep par rapport aux modèles ARM ?
2. Comment gérer les migrations de bases de données dans les déploiements azd ?
3. Quelles stratégies existent pour des déploiements sans interruption ?
4. Comment gérer les dépendances entre services ?
5. Quelles sont les considérations pour les déploiements multi-régions ?

### Module 4 : Validation avant déploiement (Semaine 5)

#### Objectifs d'apprentissage
- Mettre en œuvre des vérifications complètes avant déploiement
- Maîtriser la planification de capacité et la validation des ressources
- Comprendre la sélection des SKU et l'optimisation des coûts
- Construire des pipelines de validation automatisés

#### Concepts clés à maîtriser
- Quotas et limites des ressources Azure
- Critères de sélection des SKU et implications sur les coûts
- Scripts et outils de validation automatisés
- Méthodologies de planification de capacité
- Tests de performance et optimisation

#### Exercices pratiques

**Exercice 4.1 : Planification de capacité**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**Exercice 4.2 : Validation pré-déploiement**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```
  
**Exercice 4.3 : Optimisation des SKU**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```
  

#### Questions d'auto-évaluation
1. Quels facteurs doivent influencer les décisions de sélection des SKU ?
2. Comment valider la disponibilité des ressources Azure avant le déploiement ?
3. Quels sont les composants clés d'un système de vérification pré-déploiement ?
4. Comment estimer et contrôler les coûts de déploiement ?
5. Quelle surveillance est essentielle pour la planification de capacité ?

### Module 5 : Résolution de problèmes et débogage (Semaine 6)

#### Objectifs d'apprentissage
- Maîtriser les méthodologies systématiques de résolution de problèmes
- Développer une expertise dans le débogage des problèmes complexes de déploiement
- Mettre en œuvre une surveillance et des alertes complètes
- Construire des procédures de réponse et de récupération en cas d'incident

#### Concepts clés à maîtriser
- Modèles courants d'échec de déploiement
- Techniques d'analyse et de corrélation des journaux
- Surveillance et optimisation des performances
- Détection et réponse aux incidents de sécurité
- Récupération après sinistre et continuité des activités

#### Exercices pratiques

**Exercice 5.1 : Scénarios de résolution de problèmes**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**Exercice 5.2 : Mise en œuvre de la surveillance**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**Exercice 5.3 : Réponse aux incidents**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  

#### Questions d'auto-évaluation
1. Quelle est l'approche systématique pour résoudre les problèmes de déploiement azd ?
2. Comment corréler les journaux entre plusieurs services et ressources ?
3. Quels indicateurs de surveillance sont les plus critiques pour détecter les problèmes tôt ?
4. Comment mettre en œuvre des procédures efficaces de récupération après sinistre ?
5. Quels sont les composants clés d'un plan de réponse aux incidents ?

### Module 6 : Sujets avancés et meilleures pratiques (Semaines 7-8)

#### Objectifs d'apprentissage
- Mettre en œuvre des modèles de déploiement de niveau entreprise
- Maîtriser l'intégration et l'automatisation CI/CD
- Développer des modèles personnalisés et contribuer à la communauté
- Comprendre les exigences avancées en matière de sécurité et de conformité

#### Concepts clés à maîtriser
- Modèles d'intégration des pipelines CI/CD
- Développement et distribution de modèles personnalisés
- Gouvernance et conformité d'entreprise
- Configurations avancées de réseau et de sécurité
- Optimisation des performances et gestion des coûts

#### Exercices pratiques

**Exercice 6.1 : Intégration CI/CD**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```
  
**Exercice 6.2 : Développement de modèles personnalisés**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**Exercice 6.3 : Mise en œuvre en entreprise**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  

#### Questions d'auto-évaluation
1. Comment intégrer azd dans des workflows CI/CD existants ?
2. Quelles sont les considérations clés pour le développement de modèles personnalisés ?
3. Comment mettre en œuvre la gouvernance et la conformité dans les déploiements azd ?
4. Quelles sont les meilleures pratiques pour les déploiements à grande échelle en entreprise ?
5. Comment contribuer efficacement à la communauté azd ?

## Projets pratiques

### Projet 1 : Site web de portfolio personnel  
**Complexité** : Débutant  
**Durée** : 1-2 semaines  

Créer et déployer un site web de portfolio personnel en utilisant :  
- Hébergement de site web statique sur Azure Storage  
- Configuration de domaine personnalisé  
- Intégration CDN pour des performances globales  
- Pipeline de déploiement automatisé  

**Livrables** :  
- Site web fonctionnel déployé sur Azure  
- Modèle azd personnalisé pour les déploiements de portfolio  
- Documentation du processus de déploiement  
- Recommandations d'analyse et d'optimisation des coûts  

### Projet 2 : Application de gestion de tâches  
**Complexité** : Intermédiaire  
**Durée** : 2-3 semaines  

Créer une application de gestion de tâches full-stack avec :  
- Frontend React déployé sur App Service  
- Backend API Node.js avec authentification  
- Base de données PostgreSQL avec migrations  
- Surveillance avec Application Insights  

**Livrables** :  
- Application complète avec authentification utilisateur  
- Schéma de base de données et scripts de migration  
- Tableaux de bord de surveillance et règles d'alerte  
- Configuration de déploiement multi-environnements  

### Projet 3 : Plateforme e-commerce basée sur microservices  
**Complexité** : Avancé  
**Durée** : 4-6 semaines  

Concevoir et mettre en œuvre une plateforme e-commerce basée sur microservices :  
- Plusieurs services API (catalogue, commandes, paiements, utilisateurs)  
- Intégration de file d'attente avec Service Bus  
- Cache Redis pour optimisation des performances  
- Journalisation et surveillance complètes  

**Exemple de référence** : Voir [Architecture Microservices](../../../examples/container-app/microservices) pour un modèle prêt pour la production et un guide de déploiement  

**Livrables** :  
- Architecture complète de microservices  
- Modèles de communication inter-services  
- Tests de performance et optimisation  
- Mise en œuvre de sécurité prête pour la production  

## Évaluation et certification

### Vérifications des connaissances

Complétez ces évaluations après chaque module :

**Évaluation du module 1** : Concepts de base et installation  
- Questions à choix multiples sur les concepts fondamentaux  
- Tâches pratiques d'installation et de configuration  
- Exercice de déploiement simple  

**Évaluation du module 2** : Configuration et environnements  
- Scénarios de gestion des environnements  
- Exercices de dépannage de configuration  
- Mise en œuvre de la configuration de sécurité  

**Évaluation du module 3** : Déploiement et provisionnement  
- Défis de conception d'infrastructure  
- Scénarios de déploiement multi-services  
- Exercices d'optimisation des performances  

**Évaluation du module 4** : Validation avant déploiement  
- Études de cas de planification de capacité  
- Scénarios d'optimisation des coûts  
- Mise en œuvre de pipelines de validation  

**Évaluation du module 5** : Résolution de problèmes et débogage  
- Exercices de diagnostic de problèmes  
- Tâches de mise en œuvre de la surveillance  
- Simulations de réponse aux incidents  

**Évaluation du module 6** : Sujets avancés  
- Conception de pipeline CI/CD  
- Développement de modèles personnalisés  
- Scénarios d'architecture d'entreprise  

### Projet final de synthèse

Concevoir et mettre en œuvre une solution complète démontrant la maîtrise de tous les concepts :

**Exigences** :  
- Architecture d'application multi-niveaux  
- Plusieurs environnements de déploiement  
- Surveillance et alertes complètes  
- Mise en œuvre de sécurité et conformité  
- Optimisation des coûts et des performances  
- Documentation complète et guides d'exploitation  

**Critères d'évaluation** :  
- Qualité de la mise en œuvre technique  
- Exhaustivité de la documentation  
- Respect des meilleures pratiques de sécurité  
- Optimisation des performances et des coûts  
- Efficacité de la surveillance et du dépannage  

## Ressources d'étude et références

### Documentation officielle
- [Documentation Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Documentation Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Centre d'architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Ressources communautaires
- [Galerie de modèles AZD](https://azure.github.io/awesome-azd/)  
- [Organisation GitHub Azure-Samples](https://github.com/Azure-Samples)  
- [Répertoire GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)  

### Environnements de pratique
- [Compte gratuit Azure](https://azure.microsoft.com/free/)  
- [Offre gratuite Azure DevOps](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Outils supplémentaires
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Pack d'extensions Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Recommandations de calendrier d'étude

### Étude à temps plein (8 semaines)
- **Semaines 1-2** : Modules 1-2 (Introduction, Configuration)  
- **Semaines 3-4** : Modules 3-4 (Déploiement, Validation avant déploiement)  
- **Semaines 5-6** : Modules 5-6 (Résolution de problèmes, Sujets avancés)  
- **Semaines 7-8** : Projets pratiques et évaluation finale  

### Étude à temps partiel (16 semaines)
- **Semaines 1-4** : Module 1 (Introduction)  
- **Semaines 5-7** : Module 2 (Configuration et environnements)  
- **Semaines 8-10** : Module 3 (Déploiement et provisionnement)  
- **Semaines 11-12** : Module 4 (Validation avant déploiement)  
- **Semaines 13-14** : Module 5 (Résolution de problèmes et débogage)  
- **Semaines 15-16** : Module 6 (Sujets avancés et évaluation)  

---

## Suivi des progrès et cadre d'évaluation

### Liste de contrôle de fin de chapitre

Suivez vos progrès à travers chaque chapitre avec ces résultats mesurables :

#### 📚 Chapitre 1 : Fondations et démarrage rapide
- [ ] **Installation terminée** : AZD installé et vérifié sur votre plateforme  
- [ ] **Premier déploiement** : Modèle todo-nodejs-mongo déployé avec succès  
- [ ] **Configuration de l'environnement** : Variables d'environnement initiales configurées  
- [ ] **Navigation des ressources** : Exploration des ressources déployées dans le portail Azure  
- [ ] **Maîtrise des commandes** : À l'aise avec les commandes de base AZD  

#### 🤖 Chapitre 2 : Développement axé sur l'IA  
- [ ] **Déploiement de modèle IA** : Modèle azure-search-openai-demo déployé avec succès  
- [ ] **Mise en œuvre RAG** : Indexation et récupération de documents configurées  
- [ ] **Configuration des modèles** : Plusieurs modèles IA configurés avec différents objectifs  
- [ ] **Surveillance IA** : Application Insights mis en œuvre pour les charges IA  
- [ ] **Optimisation des performances** : Performances de l'application IA ajustées  

#### ⚙️ Chapitre 3 : Configuration et authentification
- [ ] **Configuration multi-environnements** : Environnements dev, staging et prod configurés  
- [ ] **Mise en œuvre de la sécurité** : Authentification par identité gérée configurée  
- [ ] **Gestion des secrets** : Azure Key Vault intégré pour les données sensibles  
- [ ] **Gestion des paramètres** : Configurations spécifiques à l'environnement créées  
- [ ] **Maîtrise de l'authentification** : Modèles d'accès sécurisés mis en œuvre  

#### 🏗️ Chapitre 4 : Infrastructure en tant que code et déploiement
- [ ] **Création de modèles personnalisés** : Modèle d'application multi-services construit  
- [ ] **Maîtrise de Bicep** : Composants d'infrastructure modulaires et réutilisables créés  
- [ ] **Automatisation du déploiement** : Hooks de pré/post déploiement mis en œuvre  
- [ ] **Conception d'architecture** : Architecture complexe de microservices déployée  
- [ ] **Optimisation des modèles** : Modèles optimisés pour les performances et les coûts  

#### 🎯 Chapitre 5 : Solutions IA multi-agents
- [ ] **Déploiement de solution retail** : Scénario retail multi-agents complet déployé  
- [ ] **Personnalisation des agents** : Comportements des agents Client et Inventaire modifiés  
- [ ] **Mise à l'échelle de l'architecture** : Équilibrage de charge et mise à l'échelle automatique mis en œuvre  
- [ ] **Surveillance en production** : Surveillance et alertes complètes configurées  
- [ ] **Ajustement des performances** : Performances du système multi-agents optimisées  

#### 🔍 Chapitre 6 : Validation avant déploiement et planification
- [ ] **Analyse de capacité** : Besoins en ressources pour les applications analysés  
- [ ] **Optimisation des SKU** : Niveaux de service rentables sélectionnés  
- [ ] **Automatisation de la validation** : Scripts de vérification avant déploiement mis en œuvre  
- [ ] **Planification des coûts** : Estimations des coûts de déploiement et budgets créés  
- [ ] **Évaluation des risques** : Risques de déploiement identifiés et atténués  

#### 🚨 Chapitre 7 : Résolution de problèmes et débogage
- [ ] **Compétences en diagnostic** : Déploiements intentionnellement défectueux débogués avec succès  
- [ ] **Analyse des journaux** : Utilisation efficace d'Azure Monitor et Application Insights  
- [ ] **Ajustement des performances** : Applications lentes optimisées  
- [ ] **Procédures de récupération** : Sauvegarde et récupération après sinistre mises en œuvre  
- [ ] **Configuration de la surveillance** : Surveillance proactive et alertes créées  

#### 🏢 Chapitre 8 : Production et modèles d'entreprise
- [ ] **Sécurité d'entreprise** : Modèles de sécurité complets mis en œuvre  
- [ ] **Cadre de gouvernance** : Azure Policy et gestion des ressources configurés  
- [ ] **Surveillance avancée** : Tableaux de bord et alertes automatisées créés  
- [ ] **Intégration CI/CD** : Pipelines de déploiement automatisés construits  
- [ ] **Mise en œuvre de la conformité** : Exigences de conformité d'entreprise respectées  

### Chronologie d'apprentissage et jalons

#### Semaines 1-2 : Construction des bases
- **Jalon** : Déployer la première application IA avec AZD  
- **Validation** : Application fonctionnelle accessible via URL publique  
- **Compétences** : Flux de travail AZD de base et intégration des services IA  

#### Semaines 3-4 : Maîtrise de la configuration
- **Jalon** : Déploiement multi-environnements avec authentification sécurisée  
- **Validation** : Même application déployée sur dev/staging/prod  
- **Compétences** : Gestion des environnements et mise en œuvre de la sécurité  

#### Semaines 5-6 : Expertise en infrastructure
- **Jalon** : Modèle personnalisé pour une application multi-services complexe  
- **Validation** : Modèle réutilisable déployé par un autre membre de l'équipe  
- **Compétences** : Maîtrise de Bicep et automatisation de l'infrastructure  

#### Semaines 7-8 : Mise en œuvre avancée de l'IA
- **Jalon** : Solution IA multi-agents prête pour la production  
- **Validation** : Système gérant une charge réelle avec surveillance  
- **Compétences** : Orchestration multi-agents et optimisation des performances  

#### Semaines 9-10 : Prêt pour la production
- **Jalon** : Déploiement de niveau entreprise avec conformité complète  
- **Validation** : Passe la revue de sécurité et l'audit d'optimisation des coûts  
- **Compétences** : Gouvernance, surveillance et intégration CI/CD  

### Évaluation et certification

#### Méthodes de validation des connaissances
1. **Déploiements pratiques** : Applications fonctionnelles pour chaque chapitre  
2. **Revues de code** : Évaluation de la qualité des modèles et configurations  
3. **Résolution de problèmes** : Scénarios de dépannage et solutions  
4. **Enseignement entre pairs** : Explication des concepts à d'autres apprenants  
5. **Contribution à la communauté** : Partagez des modèles ou des améliorations

#### Résultats de développement professionnel
- **Projets de portfolio** : 8 déploiements prêts pour la production
- **Compétences techniques** : Expertise en AZD et déploiement IA conforme aux standards de l'industrie
- **Capacités de résolution de problèmes** : Résolution et optimisation indépendantes
- **Reconnaissance communautaire** : Participation active à la communauté des développeurs Azure
- **Avancement professionnel** : Compétences directement applicables aux rôles en cloud et IA

#### Indicateurs de succès
- **Taux de réussite des déploiements** : >95% de déploiements réussis
- **Temps de dépannage** : <30 minutes pour les problèmes courants
- **Optimisation des performances** : Améliorations démontrables en coût et performance
- **Conformité en matière de sécurité** : Tous les déploiements respectent les normes de sécurité des entreprises
- **Transfert de connaissances** : Capacité à encadrer d'autres développeurs

### Apprentissage continu et engagement communautaire

#### Restez à jour
- **Mises à jour Azure** : Suivez les notes de version de l'Azure Developer CLI
- **Événements communautaires** : Participez à des événements pour développeurs Azure et IA
- **Documentation** : Contribuez à la documentation communautaire et aux exemples
- **Boucle de rétroaction** : Fournissez des retours sur le contenu du cours et les services Azure

#### Développement de carrière
- **Réseau professionnel** : Connectez-vous avec des experts Azure et IA
- **Opportunités de prise de parole** : Présentez vos apprentissages lors de conférences ou meetups
- **Contribution open source** : Participez aux modèles et outils AZD
- **Mentorat** : Guidez d'autres développeurs dans leur apprentissage AZD

---

**Navigation du chapitre :**
- **📚 Accueil du cours** : [AZD Pour Débutants](../README.md)
- **📖 Commencez à apprendre** : [Chapitre 1 : Fondations & Démarrage rapide](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Suivi des progrès** : Suivez votre avancement à travers le système d'apprentissage complet en 8 chapitres
- **🤝 Communauté** : [Azure Discord](https://discord.gg/microsoft-azure) pour le support et les discussions

**Suivi des progrès d'étude** : Utilisez ce guide structuré pour maîtriser l'Azure Developer CLI grâce à un apprentissage progressif, pratique, avec des résultats mesurables et des avantages pour le développement professionnel.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction professionnelle humaine. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->