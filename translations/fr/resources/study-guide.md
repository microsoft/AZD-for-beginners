# Guide d'étude - Objectifs d'apprentissage complets

**Navigation du parcours d'apprentissage**
- **📚 Accueil du cours**: [AZD pour débutants](../README.md)
- **📖 Commencer à apprendre**: [Chapitre 1 : Fondations et démarrage rapide](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Suivi des progrès**: [Achèvement du cours](../README.md#-course-completion--certification)

## Introduction

Ce guide d'étude complet fournit des objectifs d'apprentissage structurés, des concepts clés, des exercices pratiques et des supports d'évaluation pour vous aider à maîtriser Azure Developer CLI (azd). Utilisez ce guide pour suivre vos progrès et vous assurer d'avoir couvert tous les sujets essentiels.

## Objectifs d'apprentissage

En complétant ce guide d'étude, vous allez :
- Maîtriser tous les concepts fondamentaux et avancés d'Azure Developer CLI
- Développer des compétences pratiques pour déployer et gérer des applications Azure
- Acquérir de la confiance pour résoudre les problèmes et optimiser les déploiements
- Comprendre les pratiques de déploiement prêtes pour la production et les considérations de sécurité

## Résultats d'apprentissage

Après avoir terminé toutes les sections de ce guide d'étude, vous serez capable de :
- Concevoir, déployer et gérer des architectures d'application complètes en utilisant azd
- Mettre en œuvre des stratégies complètes de surveillance, de sécurité et d'optimisation des coûts
- Résoudre de manière autonome des problèmes de déploiement complexes
- Créer des templates personnalisés et contribuer à la communauté azd

## Structure d'apprentissage en 8 chapitres

### Chapitre 1 : Fondations et démarrage rapide (Semaine 1)
**Durée**: 30-45 minutes | **Complexité**: ⭐

#### Objectifs d'apprentissage
- Comprendre les concepts de base et la terminologie d'Azure Developer CLI
- Installer et configurer avec succès AZD sur votre plateforme de développement
- Déployer votre première application en utilisant un template existant
- Naviguer efficacement dans l'interface en ligne de commande AZD

#### Concepts clés à maîtriser
- Structure et composants d'un projet AZD (azure.yaml, infra/, src/)
- Flux de déploiement basés sur des templates
- Principes de base de la configuration des environnements
- Gestion des groupes de ressources et des abonnements

#### Exercices pratiques
1. **Vérification de l'installation**: Installer AZD et vérifier avec `azd version`
2. **Premier déploiement**: Déployer avec succès le template todo-nodejs-mongo
3. **Configuration de l'environnement**: Configurer vos premières variables d'environnement
4. **Exploration des ressources**: Parcourir les ressources déployées dans le Portail Azure

#### Questions d'évaluation
- Quels sont les composants principaux d'un projet AZD ?
- Comment initialiser un nouveau projet à partir d'un template ?
- Quelle est la différence entre `azd up` et `azd deploy` ?
- Comment gérer plusieurs environnements avec AZD ?

---

### Chapitre 2 : Développement axé IA (Semaine 2)
**Durée**: 1-2 heures | **Complexité**: ⭐⭐

#### Objectifs d'apprentissage
- Intégrer les services Microsoft Foundry aux flux de travail AZD
- Déployer et configurer des applications enrichies par l'IA
- Comprendre les schémas d'implémentation RAG (Retrieval-Augmented Generation)
- Gérer les déploiements et la montée en charge des modèles d'IA

#### Concepts clés à maîtriser
- Intégration du service Microsoft Foundry Models et gestion des API
- Configuration d'AI Search et indexation vectorielle
- Stratégies de déploiement des modèles et planification de capacité
- Surveillance des applications IA et optimisation des performances

#### Exercices pratiques
1. **Déploiement d'un chat IA**: Déployer le template azure-search-openai-demo
2. **Implémentation RAG**: Configurer l'indexation et la récupération de documents
3. **Configuration des modèles**: Mettre en place plusieurs modèles d'IA à des fins différentes
4. **Surveillance IA**: Implémenter Application Insights pour les charges de travail IA

#### Questions d'évaluation
- Comment configure-t-on les services Microsoft Foundry Models dans un template AZD ?
- Quels sont les composants clés d'une architecture RAG ?
- Comment gérer la capacité et la montée en charge des modèles d'IA ?
- Quelles métriques de surveillance sont importantes pour les applications IA ?

---

### Chapitre 3 : Configuration et authentification (Semaine 3)
**Durée**: 45-60 minutes | **Complexité**: ⭐⭐

#### Objectifs d'apprentissage
- Maîtriser les stratégies de configuration et de gestion des environnements
- Mettre en œuvre des schémas d'authentification sécurisés et l'identité managée
- Organiser les ressources avec des conventions de nommage appropriées
- Configurer des déploiements multi-environnements (dev, staging, prod)

#### Concepts clés à maîtriser
- Hiérarchie des environnements et précédence de configuration
- Identité managée et authentification par principal de service
- Intégration d'Azure Key Vault pour la gestion des secrets
- Gestion des paramètres spécifiques aux environnements

#### Exercices pratiques
1. **Configuration multi-environnements**: Configurer les environnements dev, staging et prod
2. **Configuration de sécurité**: Mettre en œuvre l'authentification par identité managée
3. **Gestion des secrets**: Intégrer Azure Key Vault pour les données sensibles
4. **Gestion des paramètres**: Créer des configurations spécifiques aux environnements

#### Questions d'évaluation
- Comment configure-t-on différents environnements avec AZD ?
- Quels sont les avantages d'utiliser une identité managée plutôt que des principals de service ?
- Comment gérer de manière sécurisée les secrets d'application ?
- Quelle est la hiérarchie de configuration dans AZD ?

---

### Chapitre 4 : Infrastructure as Code et déploiement (Semaine 4-5)
**Durée**: 1-1.5 heures | **Complexité**: ⭐⭐⭐

#### Objectifs d'apprentissage
- Créer et personnaliser des templates d'infrastructure Bicep
- Mettre en œuvre des schémas de déploiement et workflows avancés
- Comprendre les stratégies de provisioning des ressources
- Concevoir des architectures multi-services évolutives

- Déployer des applications conteneurisées en utilisant Azure Container Apps et AZD


#### Concepts clés à maîtriser
- Structure des templates Bicep et bonnes pratiques
- Dépendances entre ressources et ordonnancement des déploiements
- Fichiers de paramètres et modularité des templates
- Hooks personnalisés et automatisation des déploiements
- Schémas de déploiement d'applications conteneurisées (démarrage rapide, production, microservices)

#### Exercices pratiques
1. **Création de template personnalisé**: Construire un template d'application multi-service
2. **Maîtrise de Bicep**: Créer des composants d'infrastructure modulaires et réutilisables
3. **Automatisation des déploiements**: Implémenter des hooks pré/post déploiement
4. **Conception d'architecture**: Déployer une architecture microservices complexe
5. **Déploiement d'applications conteneurisées**: Déployer les exemples [Simple Flask API](../../../examples/container-app/simple-flask-api) et [Microservices Architecture](../../../examples/container-app/microservices) en utilisant AZD

#### Questions d'évaluation
- Comment créer des templates Bicep personnalisés pour AZD ?
- Quelles sont les bonnes pratiques pour organiser le code d'infrastructure ?
- Comment gérer les dépendances entre ressources dans les templates ?
- Quels schémas de déploiement supportent les mises à jour sans interruption ?

---

### Chapitre 5 : Solutions IA multi-agents (Semaine 6-7)
**Durée**: 2-3 heures | **Complexité**: ⭐⭐⭐⭐

#### Objectifs d'apprentissage
- Concevoir et implémenter des architectures IA multi-agents
- Orchestrer la coordination et la communication entre agents
- Déployer des solutions IA prêtes pour la production avec surveillance
- Comprendre la spécialisation des agents et les schémas de workflows
- Intégrer des microservices conteneurisés dans des solutions multi-agents

#### Concepts clés à maîtriser
- Schémas d'architecture multi-agents et principes de conception
- Protocoles de communication entre agents et flux de données
- Stratégies d'équilibrage de charge et de montée en charge pour les agents IA
- Surveillance en production pour les systèmes multi-agents
- Communication service-à-service dans des environnements conteneurisés

#### Exercices pratiques
1. **Déploiement solution retail**: Déployer le scénario complet retail multi-agents
2. **Personnalisation des agents**: Modifier les comportements des agents Customer et Inventory
3. **Mise à l'échelle de l'architecture**: Implémenter l'équilibrage de charge et l'auto-scaling
4. **Surveillance en production**: Mettre en place une surveillance et des alertes complètes
5. **Intégration microservices**: Étendre l'exemple [Microservices Architecture](../../../examples/container-app/microservices) pour supporter des workflows basés sur des agents

#### Questions d'évaluation
- Comment concevoir des schémas de communication efficaces entre agents ?
- Quelles sont les considérations clés pour la montée en charge des charges de travail d'agents IA ?
- Comment surveiller et déboguer des systèmes IA multi-agents ?
- Quels schémas de production assurent la fiabilité des agents IA ?

---

### Chapitre 6 : Validation et planification pré-déploiement (Semaine 8)
**Durée**: 1 heure | **Complexité**: ⭐⭐

#### Objectifs d'apprentissage
- Réaliser une planification de capacité et une validation complètes des ressources
- Choisir des SKUs Azure optimales pour la rentabilité
- Mettre en œuvre des vérifications et validations automatisées pré-vol
- Planifier les déploiements avec des stratégies d'optimisation des coûts

#### Concepts clés à maîtriser
- Quotas de ressources Azure et limitations de capacité
- Critères de sélection des SKUs et optimisation des coûts
- Scripts de validation automatisée et tests
- Planification de déploiement et évaluation des risques

#### Exercices pratiques
1. **Analyse de capacité**: Analyser les besoins en ressources de vos applications
2. **Optimisation des SKUs**: Comparer et sélectionner des niveaux de service économes
3. **Automatisation de la validation**: Implémenter des scripts de vérification pré-déploiement
4. **Planification des coûts**: Créer des estimations de coûts de déploiement et des budgets

#### Questions d'évaluation
- Comment valider la capacité Azure avant un déploiement ?
- Quels facteurs influencent les décisions de sélection des SKUs ?
- Comment automatiser la validation pré-déploiement ?
- Quelles stratégies aident à optimiser les coûts de déploiement ?

---

### Chapitre 7 : Dépannage et débogage (Semaine 9)
**Durée**: 1-1.5 heures | **Complexité**: ⭐⭐

#### Objectifs d'apprentissage
- Développer des approches systématiques de débogage pour les déploiements AZD
- Résoudre les problèmes courants de déploiement et de configuration
- Déboguer les problèmes spécifiques à l'IA et les problèmes de performance
- Mettre en place la surveillance et les alertes pour une détection proactive des problèmes

#### Concepts clés à maîtriser
- Techniques de diagnostic et stratégies de journalisation
- Schémas d'échec courants et leurs solutions
- Surveillance de la performance et optimisation
- Procédures d'intervention et de récupération des incidents

#### Exercices pratiques
1. **Compétences de diagnostic**: S'exercer avec des déploiements volontairement cassés
2. **Analyse des logs**: Utiliser Azure Monitor et Application Insights efficacement
3. **Optimisation des performances**: Optimiser les applications lentes
4. **Procédures de récupération**: Mettre en œuvre des sauvegardes et la reprise après sinistre

#### Questions d'évaluation
- Quelles sont les défaillances de déploiement AZD les plus courantes ?
- Comment déboguer les problèmes d'authentification et d'autorisations ?
- Quelles stratégies de surveillance aident à prévenir les problèmes en production ?
- Comment optimiser les performances des applications dans Azure ?

---

### Chapitre 8 : Patterns de production et d'entreprise (Semaine 10-11)
**Durée**: 2-3 heures | **Complexité**: ⭐⭐⭐⭐

#### Objectifs d'apprentissage
- Mettre en œuvre des stratégies de déploiement de niveau entreprise
- Concevoir des schémas de sécurité et des cadres de conformité
- Établir la surveillance, la gouvernance et la gestion des coûts
- Créer des pipelines CI/CD évolutifs avec intégration AZD
- Appliquer les bonnes pratiques pour les déploiements d'applications conteneurisées en production (sécurité, surveillance, coût, CI/CD)

#### Concepts clés à maîtriser
- Exigences de sécurité et de conformité pour l'entreprise
- Cadres de gouvernance et mise en œuvre des politiques
- Surveillance avancée et gestion des coûts
- Intégration CI/CD et pipelines de déploiement automatisés
- Stratégies de déploiement blue-green et canary pour les charges conteneurisées

#### Exercices pratiques
1. **Sécurité entreprise**: Mettre en œuvre des schémas de sécurité complets
2. **Cadre de gouvernance**: Configurer Azure Policy et la gestion des ressources
3. **Surveillance avancée**: Créer des tableaux de bord et des alertes automatisées
4. **Intégration CI/CD**: Construire des pipelines de déploiement automatisés
5. **Applications conteneurisées en production**: Appliquer la sécurité, la surveillance et l'optimisation des coûts à l'exemple [Microservices Architecture](../../../examples/container-app/microservices)

#### Questions d'évaluation
- Comment implémenter la sécurité d'entreprise dans les déploiements AZD ?
- Quels schémas de gouvernance assurent la conformité et le contrôle des coûts ?
- Comment concevoir une surveillance évolutive pour les systèmes en production ?
- Quels schémas CI/CD fonctionnent le mieux avec les workflows AZD ?

#### Objectifs d'apprentissage
- Comprendre les fondamentaux et les concepts clés d'Azure Developer CLI
- Installer et configurer avec succès azd sur votre environnement de développement
- Réaliser votre premier déploiement en utilisant un template existant
- Naviguer dans la structure du projet azd et comprendre les composants clés

#### Concepts clés à maîtriser
- Templates, environnements et services
- Structure de configuration azure.yaml
- Commandes de base azd (init, up, down, deploy)
- Principes d'Infrastructure as Code
- Authentification et autorisation Azure

#### Exercices pratiques

**Exercice 1.1: Installation et configuration**
```bash
# Complétez ces tâches:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Exercice 1.2: Premier déploiement**
```bash
# Déployer une application web simple:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Exercice 1.3: Analyse de la structure du projet**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Questions d'auto-évaluation
1. Quels sont les trois concepts clés de l'architecture azd ?
2. Quel est le but du fichier azure.yaml ?
3. Comment les environnements aident-ils à gérer différentes cibles de déploiement ?
4. Quelles méthodes d'authentification peuvent être utilisées avec azd ?
5. Que se passe-t-il lorsque vous exécutez `azd up` pour la première fois ?

---

## Cadre de suivi des progrès et d'évaluation
```bash
# Créer et configurer plusieurs environnements :
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Exercice 2.2: Configuration avancée**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Exercice 2.3: Configuration de la sécurité**
```bash
# Mettre en œuvre les meilleures pratiques de sécurité :
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Questions d'auto-évaluation
1. Comment azd gère-t-il la précédence des variables d'environnement ?
2. Que sont les hooks de déploiement et quand devriez-vous les utiliser ?
3. Comment configure-t-on différents SKUs pour différents environnements ?
4. Quelles sont les implications de sécurité des différentes méthodes d'authentification ?
5. Comment gérer les secrets et les données de configuration sensibles ?

### Module 3 : Déploiement et provisioning (Semaine 4)

#### Objectifs d'apprentissage
- Maîtriser les workflows de déploiement et les bonnes pratiques
- Comprendre Infrastructure as Code avec des templates Bicep
- Mettre en œuvre des architectures multi-services complexes
- Optimiser les performances et la fiabilité des déploiements

#### Concepts clés à maîtriser
- Structure et modules des templates Bicep
- Dépendances entre ressources et ordonnancement
- Stratégies de déploiement (blue-green, rolling updates)
- Déploiements multi-régions
- Migrations de bases de données et gestion des données

#### Exercices pratiques

**Exercice 3.1: Infrastructure personnalisée**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Exercice 3.2: Application multi-service**
```bash
# Déployer une architecture de microservices:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Exercice 3.3: Intégration de base de données**
```bash
# Implémenter des modèles de déploiement de base de données:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Questions d'auto-évaluation
1. Quels sont les avantages d'utiliser Bicep plutôt que les templates ARM ?
2. Comment gérer les migrations de bases de données dans les déploiements azd ?
3. Quelles stratégies existent pour des déploiements sans interruption ?
4. Comment gérer les dépendances entre services ?
5. Quelles sont les considérations pour les déploiements multi-régions ?

### Module 4 : Validation pré-déploiement (Semaine 5)

#### Objectifs d'apprentissage
- Mettre en place des vérifications complètes avant le déploiement
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
# Implémenter la validation de la capacité:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercice 4.2 : Validation pré-déploiement**
```powershell
# Construire un pipeline de validation complet :
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercice 4.3 : Optimisation des SKU**
```bash
# Optimiser les configurations des services :
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Questions d'auto-évaluation
1. Quels facteurs doivent influencer les décisions de sélection des SKU ?
2. Comment validez-vous la disponibilité des ressources Azure avant le déploiement ?
3. Quels sont les composants clés d'un système de vérification pré-déploiement ?
4. Comment estimez-vous et contrôlez-vous les coûts de déploiement ?
5. Quelle surveillance est essentielle pour la planification de capacité ?

### Module 5 : Résolution des problèmes et débogage (Semaine 6)

#### Objectifs d'apprentissage
- Maîtriser les méthodologies systématiques de dépannage
- Développer une expertise dans le débogage des problèmes complexes de déploiement
- Mettre en place une surveillance et des mécanismes d'alerte complets
- Élaborer des procédures de réponse aux incidents et de récupération

#### Concepts clés à maîtriser
- Modèles courants d'échec de déploiement
- Techniques d'analyse et de corrélation des journaux
- Surveillance des performances et optimisation
- Détection et réponse aux incidents de sécurité
- Reprise après sinistre et continuité des activités

#### Exercices pratiques

**Exercice 5.1 : Scénarios de dépannage**
```bash
# Entraînez-vous à résoudre des problèmes courants:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercice 5.2 : Mise en œuvre de la surveillance**
```bash
# Mettre en place une surveillance complète :
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercice 5.3 : Réponse aux incidents**
```bash
# Mettre en place des procédures de réponse aux incidents :
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Questions d'auto-évaluation
1. Quelle est l'approche systématique pour dépanner les déploiements azd ?
2. Comment corrélez-vous les journaux entre plusieurs services et ressources ?
3. Quelles métriques de surveillance sont les plus critiques pour la détection précoce des problèmes ?
4. Comment implémentez-vous des procédures efficaces de reprise après sinistre ?
5. Quels sont les composants clés d'un plan de réponse aux incidents ?

### Module 6 : Sujets avancés et meilleures pratiques (Semaines 7-8)

#### Objectifs d'apprentissage
- Mettre en œuvre des modèles de déploiement de niveau entreprise
- Maîtriser l'intégration et l'automatisation CI/CD
- Développer des modèles personnalisés et contribuer à la communauté
- Comprendre les exigences avancées en matière de sécurité et de conformité

#### Concepts clés à maîtriser
- Modèles d'intégration de pipelines CI/CD
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
# Créer et publier des modèles personnalisés :
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercice 6.3 : Mise en œuvre en entreprise**
```bash
# Mettre en œuvre des fonctionnalités de niveau entreprise :
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Questions d'auto-évaluation
1. Comment intégrez-vous azd dans des workflows CI/CD existants ?
2. Quelles sont les considérations clés pour le développement de modèles personnalisés ?
3. Comment mettez-vous en œuvre la gouvernance et la conformité dans les déploiements azd ?
4. Quelles sont les meilleures pratiques pour des déploiements à l'échelle de l'entreprise ?
5. Comment contribuez-vous efficacement à la communauté azd ?

## Projets pratiques

### Projet 1 : Site Web de portfolio personnel
**Complexité**: Débutant  
**Durée**: 1-2 semaines

Construire et déployer un site web de portfolio personnel en utilisant :
- Hébergement de site statique sur Azure Storage
- Configuration de domaine personnalisé
- Intégration CDN pour des performances globales
- Pipeline de déploiement automatisé

**Livrables**:
- Site fonctionnel déployé sur Azure
- Modèle azd personnalisé pour les déploiements de portfolio
- Documentation du processus de déploiement
- Analyse des coûts et recommandations d'optimisation

### Projet 2 : Application de gestion de tâches
**Complexité**: Intermédiaire  
**Durée**: 2-3 semaines

Créer une application de gestion de tâches full-stack avec :
- Frontend React déployé sur App Service
- Backend API Node.js avec authentification
- Base de données PostgreSQL avec migrations
- Surveillance Application Insights

**Livrables**:
- Application complète avec authentification des utilisateurs
- Schéma de base de données et scripts de migration
- Tableaux de bord de surveillance et règles d'alerte
- Configuration de déploiement multi-environnements

### Projet 3 : Plateforme e-commerce basée sur des microservices
**Complexité**: Avancé  
**Durée**: 4-6 semaines

Concevoir et implémenter une plateforme e-commerce basée sur des microservices :
- Plusieurs services d'API (catalogue, commandes, paiements, utilisateurs)
- Intégration de file de messages avec Service Bus
- Cache Redis pour optimisation des performances
- Journalisation et surveillance complètes

**Exemple de référence** : Voir [Architecture de microservices](../../../examples/container-app/microservices) pour un modèle prêt pour la production et un guide de déploiement

**Livrables**:
- Architecture complète de microservices
- Modèles de communication inter-services
- Tests de performance et optimisation
- Mise en œuvre de sécurité prête pour la production

## Évaluation et certification

### Contrôles de connaissances

Complétez ces évaluations après chaque module :

**Évaluation du Module 1** : Concepts de base et installation
- Questions à choix multiple sur les concepts clés
- Tâches pratiques d'installation et de configuration
- Exercice de déploiement simple

**Évaluation du Module 2** : Configuration et environnements
- Scénarios de gestion d'environnements
- Exercices de dépannage de configuration
- Mise en œuvre de configurations de sécurité

**Évaluation du Module 3** : Déploiement et provisionnement
- Défis de conception d'infrastructure
- Scénarios de déploiement multi-service
- Exercices d'optimisation des performances

**Évaluation du Module 4** : Validation pré-déploiement
- Études de cas de planification de capacité
- Scénarios d'optimisation des coûts
- Mise en œuvre de pipelines de validation

**Évaluation du Module 5** : Dépannage et débogage
- Exercices de diagnostic de problèmes
- Tâches de mise en œuvre de la surveillance
- Simulations de réponse aux incidents

**Évaluation du Module 6** : Sujets avancés
- Conception de pipelines CI/CD
- Développement de modèles personnalisés
- Scénarios d'architecture d'entreprise

### Projet final de synthèse

Concevez et implémentez une solution complète démontrant la maîtrise de tous les concepts :

**Exigences**:
- Architecture d'application multi-niveaux
- Plusieurs environnements de déploiement
- Surveillance et alerting complets
- Mise en œuvre de la sécurité et de la conformité
- Optimisation des coûts et des performances
- Documentation complète et runbooks

**Critères d'évaluation**:
- Qualité de l'implémentation technique
- Complétude de la documentation
- Conformité aux pratiques de sécurité et aux meilleures pratiques
- Optimisation des performances et des coûts
- Efficacité du dépannage et de la surveillance

## Ressources d'étude et références

### Documentation officielle
- [Documentation Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Documentation Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centre d'architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Ressources communautaires
- [Galerie de templates AZD](https://azure.github.io/awesome-azd/)
- [Organisation GitHub Azure-Samples](https://github.com/Azure-Samples)
- [Dépôt GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)

### Environnements de pratique
- [Compte Azure gratuit](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Outils supplémentaires
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Recommandations de programme d'étude

### Étude à temps plein (8 semaines)
- **Semaines 1-2**: Modules 1-2 (Getting Started, Configuration)
- **Semaines 3-4**: Modules 3-4 (Deployment, Pre-deployment)
- **Semaines 5-6**: Modules 5-6 (Troubleshooting, Advanced Topics)
- **Semaines 7-8**: Projets pratiques et évaluation finale

### Étude à temps partiel (16 semaines)
- **Semaines 1-4**: Module 1 (Getting Started)
- **Semaines 5-7**: Module 2 (Configuration and Environments)
- **Semaines 8-10**: Module 3 (Deployment and Provisioning)
- **Semaines 11-12**: Module 4 (Pre-deployment Validation)
- **Semaines 13-14**: Module 5 (Troubleshooting and Debugging)
- **Semaines 15-16**: Module 6 (Advanced Topics and Assessment)

---

## Suivi de progression et cadre d'évaluation

### Liste de contrôle d'achèvement des chapitres

Suivez votre progression à travers chaque chapitre avec ces résultats mesurables :

#### 📚 Chapitre 1 : Fondations et démarrage rapide
- [ ] **Installation terminée** : AZD installé et vérifié sur votre plateforme
- [ ] **Premier déploiement** : Modèle todo-nodejs-mongo déployé avec succès
- [ ] **Configuration de l'environnement** : Variables d'environnement initiales configurées
- [ ] **Navigation des ressources** : Exploration des ressources déployées dans le portail Azure
- [ ] **Maîtrise des commandes** : À l'aise avec les commandes AZD de base

#### 🤖 Chapitre 2 : Développement axé IA  
- [ ] **Déploiement de template IA** : azure-search-openai-demo déployé avec succès
- [ ] **Implémentation RAG** : Indexation et récupération de documents configurées
- [ ] **Configuration des modèles** : Plusieurs modèles IA configurés pour différents usages
- [ ] **Surveillance IA** : Application Insights implémenté pour les charges IA
- [ ] **Optimisation des performances** : Performances des applications IA ajustées

#### ⚙️ Chapitre 3 : Configuration et authentification
- [ ] **Configuration multi-environnements** : Environnements dev, staging et prod configurés
- [ ] **Mise en œuvre de la sécurité** : Authentification par identité gérée configurée
- [ ] **Gestion des secrets** : Intégration d'Azure Key Vault pour les données sensibles
- [ ] **Gestion des paramètres** : Configurations spécifiques par environnement créées
- [ ] **Maîtrise de l'authentification** : Modèles d'accès sécurisés implémentés

#### 🏗️ Chapitre 4 : Infrastructure as Code et déploiement
- [ ] **Création de templates personnalisés** : Modèle d'application multi-service construit
- [ ] **Maîtrise de Bicep** : Composants d'infrastructure modulaires et réutilisables créés
- [ ] **Automatisation des déploiements** : Hooks pré/post-déploiement implémentés
- [ ] **Conception d'architecture** : Architecture microservices complexe déployée
- [ ] **Optimisation des templates** : Templates optimisés pour la performance et les coûts

#### 🎯 Chapitre 5 : Solutions IA multi-agents
- [ ] **Déploiement de solution retail** : Scénario multi-agent retail complet déployé
- [ ] **Personnalisation des agents** : Comportements des agents Customer et Inventory modifiés
- [ ] **Mise à l'échelle de l'architecture** : Équilibrage de charge et auto-scaling implémentés
- [ ] **Surveillance en production** : Surveillance et alerting complets configurés
- [ ] **Tuning des performances** : Performance du système multi-agent optimisée

#### 🔍 Chapitre 6 : Validation pré-déploiement et planification
- [ ] **Analyse de capacité** : Exigences en ressources analysées pour les applications
- [ ] **Optimisation des SKU** : Niveaux de service rentables sélectionnés
- [ ] **Automatisation de la validation** : Scripts de vérification pré-déploiement implémentés
- [ ] **Planification des coûts** : Estimations de coûts de déploiement et budgets créés
- [ ] **Évaluation des risques** : Risques de déploiement identifiés et atténués

#### 🚨 Chapitre 7 : Dépannage et débogage
- [ ] **Compétences diagnostiques** : Déploiements cassés volontairement débogués avec succès
- [ ] **Analyse des journaux** : Azure Monitor et Application Insights utilisés efficacement
- [ ] **Optimisation des performances** : Applications lentes optimisées
- [ ] **Procédures de récupération** : Sauvegarde et reprise après sinistre implémentées
- [ ] **Configuration de la surveillance** : Surveillance proactive et alerting créés

#### 🏢 Chapitre 8 : Production et modèles d'entreprise
- [ ] **Sécurité d'entreprise** : Modèles de sécurité complets implémentés
- [ ] **Cadre de gouvernance** : Azure Policy et gestion des ressources mis en place
- [ ] **Surveillance avancée** : Tableaux de bord et alerting automatisé créés
- [ ] **Intégration CI/CD** : Pipelines de déploiement automatisés construits
- [ ] **Mise en conformité** : Exigences de conformité d'entreprise remplies

### Calendrier d'apprentissage et jalons

#### Semaine 1-2 : Consolidation des bases
- **Jalon**: Déployer la première application IA en utilisant AZD
- **Validation**: Application fonctionnelle accessible via une URL publique
- **Compétences**: Flux de travail AZD de base et intégration de services IA

#### Semaine 3-4 : Maîtrise de la configuration
- **Jalon**: Déploiement multi-environnements avec authentification sécurisée
- **Validation**: Même application déployée en dev/staging/prod
- **Compétences**: Gestion des environnements et mise en œuvre de la sécurité

#### Semaine 5-6 : Expertise en infrastructure
- **Jalon**: Modèle personnalisé pour une application multi-service complexe
- **Validation**: Modèle réutilisable déployé par un autre membre de l'équipe
- **Compétences**: Maîtrise de Bicep et automatisation d'infrastructure

#### Semaine 7-8 : Mise en œuvre avancée de l'IA
- **Jalon**: Solution multi-agent IA prête pour la production
- **Validation**: Système supportant une charge réelle avec surveillance
- **Compétences**: Orchestration multi-agent et optimisation des performances

#### Semaine 9-10 : Préparation à la production
- **Jalon**: Déploiement de niveau entreprise avec conformité complète
- **Validation**: Réussite d'une revue de sécurité et d'un audit d'optimisation des coûts
- **Compétences**: Gouvernance, surveillance et intégration CI/CD

### Évaluation et certification

#### Méthodes de validation des connaissances
1. **Déploiements pratiques**: Applications fonctionnelles pour chaque chapitre
2. **Relectures de code**: Évaluation de la qualité des templates et configurations
3. **Résolution de problèmes**: Scénarios de dépannage et solutions
4. **Enseignement par les pairs**: Expliquer les concepts à d'autres apprenants
5. **Contribution communautaire**: Partager des templates ou des améliorations

#### Résultats de développement professionnel
- **Projets de portfolio**: 8 déploiements prêts pour la production
- **Compétences techniques**: Expertise en déploiement AZD et IA conforme aux standards de l'industrie
- **Capacités de résolution de problèmes**: Dépannage et optimisation de manière autonome
- **Reconnaissance par la communauté**: Participation active à la communauté des développeurs Azure
- **Avancement de carrière**: Compétences directement applicables aux postes cloud et IA

#### Indicateurs de réussite
- **Taux de réussite des déploiements**: >95% de déploiements réussis
- **Temps de dépannage**: <30 minutes pour les problèmes courants
- **Optimisation des performances**: Améliorations mesurables des coûts et des performances
- **Conformité en matière de sécurité**: Tous les déploiements respectent les normes de sécurité d'entreprise
- **Transfert de connaissances**: Capacité à encadrer d'autres développeurs

### Apprentissage continu et engagement communautaire

#### Rester à jour
- **Mises à jour Azure**: Suivre les notes de publication de l'Azure Developer CLI
- **Événements communautaires**: Participer aux événements pour développeurs Azure et IA
- **Documentation**: Contribuer à la documentation et aux exemples destinés à la communauté
- **Boucle de rétroaction**: Fournir des retours sur le contenu du cours et les services Azure

#### Développement de carrière
- **Réseau professionnel**: Entrer en relation avec des experts Azure et IA
- **Opportunités de prise de parole**: Présenter ses apprentissages lors de conférences ou de meetups
- **Contribution open source**: Contribuer aux templates et outils AZD
- **Mentorat**: Guider d'autres développeurs dans leur parcours d'apprentissage d'AZD

---

**Navigation du chapitre:**
- **📚 Accueil du cours**: [AZD pour débutants](../README.md)
- **📖 Commencer à apprendre**: [Chapitre 1 : Fondations & Démarrage rapide](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Suivi des progrès**: Suivez votre progression à travers le système d'apprentissage complet en 8 chapitres
- **🤝 Communauté**: [Serveur Discord Azure](https://discord.gg/microsoft-azure) pour le support et la discussion

**Suivi de la progression des études**: Utilisez ce guide structuré pour maîtriser Azure Developer CLI via un apprentissage progressif et pratique avec des résultats mesurables et des avantages pour le développement professionnel.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Clause de non-responsabilité :
Ce document a été traduit à l'aide du service de traduction automatique Co-op Translator (https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'en assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original, dans sa langue d'origine, doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle effectuée par un traducteur humain. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->