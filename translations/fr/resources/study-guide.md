<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T17:38:47+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "fr"
}
-->
# Guide d'étude - AZD pour débutants

## Introduction

Ce guide d'étude complet propose des objectifs d'apprentissage structurés, des concepts clés, des exercices pratiques et des matériaux d'évaluation pour vous aider à maîtriser Azure Developer CLI (azd). Utilisez ce guide pour suivre vos progrès et vous assurer d'avoir couvert tous les sujets essentiels.

## Objectifs d'apprentissage

En complétant ce guide d'étude, vous serez capable de :
- Maîtriser tous les concepts fondamentaux et avancés de l'Azure Developer CLI
- Développer des compétences pratiques dans le déploiement et la gestion d'applications Azure
- Acquérir de la confiance dans le dépannage et l'optimisation des déploiements
- Comprendre les pratiques de déploiement prêtes pour la production et les considérations de sécurité

## Résultats d'apprentissage

Après avoir terminé toutes les sections de ce guide d'étude, vous serez en mesure de :
- Concevoir, déployer et gérer des architectures d'applications complètes avec azd
- Mettre en œuvre des stratégies de surveillance, de sécurité et d'optimisation des coûts
- Résoudre de manière autonome des problèmes complexes de déploiement
- Créer des modèles personnalisés et contribuer à la communauté azd

## Structure du cours

### Module 1 : Premiers pas (Semaines 1-2)

#### Objectifs d'apprentissage
- Comprendre les fondamentaux et les concepts clés de l'Azure Developer CLI
- Installer et configurer azd avec succès dans votre environnement de développement
- Réaliser votre premier déploiement en utilisant un modèle existant
- Naviguer dans la structure de projet azd et comprendre ses composants clés

#### Concepts clés à maîtriser
- Modèles, environnements et services
- Structure de configuration azure.yaml
- Commandes de base azd (init, up, down, deploy)
- Principes de l'infrastructure en tant que code
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

### Module 2 : Configuration et environnements (Semaine 3)

#### Objectifs d'apprentissage
- Maîtriser la gestion et la configuration des environnements
- Comprendre les configurations avancées azure.yaml
- Implémenter des paramètres et variables spécifiques à l'environnement
- Configurer l'authentification pour différents scénarios

#### Concepts clés à maîtriser
- Hiérarchie des environnements et priorité des variables
- Configuration des services et paramètres
- Hooks et événements de cycle de vie
- Méthodes d'authentification (utilisateur, principal de service, identité gérée)
- Gestion des fichiers de configuration

#### Exercices pratiques

**Exercice 2.1 : Configuration multi-environnement**  
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

**Exercice 2.3 : Configuration de sécurité**  
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
3. Comment configurez-vous différents SKUs pour différents environnements ?
4. Quelles sont les implications de sécurité des différentes méthodes d'authentification ?
5. Comment gérez-vous les secrets et les données de configuration sensibles ?

### Module 3 : Déploiement et provisionnement (Semaine 4)

#### Objectifs d'apprentissage
- Maîtriser les workflows de déploiement et les meilleures pratiques
- Comprendre l'infrastructure en tant que code avec les modèles Bicep
- Implémenter des architectures complexes multi-services
- Optimiser les performances et la fiabilité des déploiements

#### Concepts clés à maîtriser
- Structure des modèles Bicep et modules
- Dépendances et ordonnancement des ressources
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
2. Comment gérez-vous les migrations de bases de données dans les déploiements azd ?
3. Quelles stratégies existent pour des déploiements sans interruption ?
4. Comment gérez-vous les dépendances entre services ?
5. Quelles sont les considérations pour les déploiements multi-régions ?

### Module 4 : Validation avant déploiement (Semaine 5)

#### Objectifs d'apprentissage
- Implémenter des vérifications complètes avant déploiement
- Maîtriser la planification de capacité et la validation des ressources
- Comprendre la sélection des SKUs et l'optimisation des coûts
- Construire des pipelines de validation automatisés

#### Concepts clés à maîtriser
- Quotas et limites des ressources Azure
- Critères de sélection des SKUs et implications de coût
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

**Exercice 4.3 : Optimisation des SKUs**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Questions d'auto-évaluation
1. Quels facteurs doivent influencer les décisions de sélection des SKUs ?
2. Comment validez-vous la disponibilité des ressources Azure avant le déploiement ?
3. Quels sont les composants clés d'un système de vérification pré-déploiement ?
4. Comment estimez-vous et contrôlez-vous les coûts de déploiement ?
5. Quelle surveillance est essentielle pour la planification de capacité ?

### Module 5 : Dépannage et débogage (Semaine 6)

#### Objectifs d'apprentissage
- Maîtriser les méthodologies systématiques de dépannage
- Développer une expertise dans le débogage des problèmes complexes de déploiement
- Implémenter une surveillance et des alertes complètes
- Construire des procédures de réponse aux incidents et de récupération

#### Concepts clés à maîtriser
- Modèles courants d'échec de déploiement
- Techniques d'analyse et de corrélation des journaux
- Surveillance des performances et optimisation
- Détection et réponse aux incidents de sécurité
- Récupération après sinistre et continuité des activités

#### Exercices pratiques

**Exercice 5.1 : Scénarios de dépannage**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercice 5.2 : Implémentation de la surveillance**  
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
1. Quelle est l'approche systématique pour dépanner les déploiements azd ?
2. Comment corrélez-vous les journaux entre plusieurs services et ressources ?
3. Quels métriques de surveillance sont les plus critiques pour une détection précoce des problèmes ?
4. Comment implémentez-vous des procédures efficaces de récupération après sinistre ?
5. Quels sont les composants clés d'un plan de réponse aux incidents ?

### Module 6 : Sujets avancés et meilleures pratiques (Semaines 7-8)

#### Objectifs d'apprentissage
- Implémenter des modèles de déploiement de niveau entreprise
- Maîtriser l'intégration et l'automatisation CI/CD
- Développer des modèles personnalisés et contribuer à la communauté
- Comprendre les exigences avancées en matière de sécurité et de conformité

#### Concepts clés à maîtriser
- Modèles d'intégration CI/CD
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

**Exercice 6.3 : Implémentation d'entreprise**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Questions d'auto-évaluation
1. Comment intégrez-vous azd dans des workflows CI/CD existants ?
2. Quels sont les points clés à considérer pour le développement de modèles personnalisés ?
3. Comment implémentez-vous la gouvernance et la conformité dans les déploiements azd ?
4. Quelles sont les meilleures pratiques pour les déploiements à grande échelle ?
5. Comment contribuez-vous efficacement à la communauté azd ?
3. **Contribuez à l'Open Source** : Partagez vos modèles et solutions avec la communauté  
4. **Enseignez aux autres** : Expliquer des concepts à d'autres renforce votre propre compréhension  
5. **Restez curieux** : Explorez continuellement de nouveaux services Azure et des modèles d'intégration  

---

**Navigation**  
- **Leçon précédente** : [FAQ](faq.md)  
- **Leçon suivante** : [Changelog](../changelog.md)  

**Suivi de la progression d'étude** : Utilisez ce guide pour suivre votre parcours d'apprentissage et garantir une couverture complète de tous les concepts et pratiques liés à Azure Developer CLI.  

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.