# Glossaire - Terminologie Azure et AZD

**Référence pour tous les chapitres**
- **📚 Accueil du cours** : [AZD pour débutants](../README.md)
- **📖 Apprendre les bases** : [Chapitre 1 : Bases d’AZD](../docs/getting-started/azd-basics.md)
- **🤖 Termes IA** : [Chapitre 2 : Développement AI-First](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduction

Ce glossaire complet fournit des définitions pour les termes, concepts et acronymes utilisés dans Azure Developer CLI et le développement cloud Azure. Référence essentielle pour comprendre la documentation technique, résoudre les problèmes et communiquer efficacement au sujet des projets azd et des services Azure.

## Objectifs d’apprentissage

En utilisant ce glossaire, vous allez :
- Comprendre la terminologie et les concepts essentiels d’Azure Developer CLI
- Maîtriser le vocabulaire et les termes techniques du développement cloud Azure
- Référencer efficacement la terminologie Infrastructure as Code et déploiement
- Comprendre les noms de services Azure, acronymes et leurs rôles
- Accéder aux définitions pour les termes de dépannage et de débogage
- Apprendre des concepts avancés d’architecture et développement Azure

## Résultats d’apprentissage

Avec une référence régulière à ce glossaire, vous serez capable de :
- Communiquer efficacement en utilisant la terminologie appropriée d’Azure Developer CLI
- Comprendre plus clairement la documentation technique et les messages d’erreur
- Naviguer avec confiance dans les services et concepts Azure
- Résoudre des problèmes en utilisant le vocabulaire technique adéquat
- Contribuer aux discussions d’équipe avec un langage technique précis
- Élargir vos connaissances en développement cloud Azure de manière systématique

## A

**ARM Template**  
Modèle Azure Resource Manager. Format Infrastructure as Code basé sur JSON utilisé pour définir et déployer des ressources Azure de manière déclarative.

**App Service**  
Offre plateforme en tant que service (PaaS) d’Azure pour héberger des applications web, des API REST et des backends mobiles sans gérer l’infrastructure.

**Application Insights**  
Service de surveillance des performances applicatives (APM) d’Azure qui fournit des informations approfondies sur les performances, la disponibilité et l’utilisation des applications.

**Azure CLI**  
Interface en ligne de commande pour gérer les ressources Azure. Utilisé par azd pour l’authentification et certaines opérations.

**Azure Developer CLI (azd)**  
Outil en ligne de commande centré sur le développeur qui accélère la construction et le déploiement d’applications dans Azure en utilisant des modèles et Infrastructure as Code.

**azure.yaml**  
Fichier de configuration principal d’un projet azd qui définit les services, l’infrastructure et les hooks de déploiement.

**Azure Resource Manager (ARM)**  
Service de déploiement et de gestion d’Azure qui fournit une couche de gestion pour créer, mettre à jour et supprimer des ressources.

## B

**Bicep**  
Langage spécifique au domaine (DSL) développé par Microsoft pour déployer des ressources Azure. Offre une syntaxe plus simple que les templates ARM tout en compilant en ARM.

**Build**  
Processus de compilation du code source, d’installation des dépendances et de préparation des applications pour le déploiement.

**Blue-Green Deployment**  
Stratégie de déploiement utilisant deux environnements de production identiques (bleu et vert) pour minimiser les interruptions et les risques.

## C

**Container Apps**  
Service de conteneurs sans serveur d’Azure permettant d’exécuter des applications conteneurisées sans gérer une infrastructure complexe.

**CI/CD**  
Intégration Continue/Déploiement Continu. Pratiques automatisées pour intégrer les changements de code et déployer les applications.

**Cosmos DB**  
Service de base de données multi-modèle distribué mondialement d’Azure qui fournit des SLA complets pour le débit, la latence, la disponibilité et la cohérence.

**Configuration**  
Paramètres et réglages qui contrôlent le comportement de l’application et les options de déploiement.

## D

**Deployment**  
Processus d’installation et de configuration des applications et de leurs dépendances sur l’infrastructure cible.

**Docker**  
Plateforme pour développer, expédier et exécuter des applications via la technologie de conteneurisation.

**Dockerfile**  
Fichier texte contenant des instructions pour construire une image de conteneur Docker.

## E

**Environment**  
Cible de déploiement représentant une instance spécifique de votre application (ex. : développement, préproduction, production).

**Environment Variables**  
Valeurs de configuration stockées sous forme de paires clé-valeur accessibles par les applications à l’exécution.

**Endpoint**  
URL ou adresse réseau où une application ou un service est accessible.

## F

**Function App**  
Service de calcul sans serveur d’Azure permettant d’exécuter du code événementiel sans gérer l’infrastructure.

## G

**GitHub Actions**  
Plateforme CI/CD intégrée aux dépôts GitHub pour automatiser les workflows.

**Git**  
Système de contrôle de version distribué utilisé pour suivre les modifications du code source.

## H

**Hooks**  
Scripts ou commandes personnalisés qui s’exécutent à des moments précis durant le cycle de vie du déploiement (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Type de service Azure où une application sera déployée (ex. : appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Pratique consistant à définir et gérer l’infrastructure via du code plutôt que manuellement.

**Init**  
Processus d’initialisation d’un nouveau projet azd, généralement à partir d’un modèle.

## J

**JSON**  
JavaScript Object Notation. Format d’échange de données couramment utilisé pour les fichiers de configuration et les réponses API.

**JWT**  
JSON Web Token. Standard pour transmettre de façon sécurisée des informations entre parties sous forme d’objet JSON.

## K

**Key Vault**  
Service Azure pour stocker et gérer de manière sécurisée les secrets, clés et certificats.

**Kusto Query Language (KQL)**  
Langage de requête utilisé pour analyser les données dans Azure Monitor, Application Insights et d’autres services Azure.

## L

**Load Balancer**  
Service qui distribue le trafic réseau entrant sur plusieurs serveurs ou instances.

**Log Analytics**  
Service Azure pour collecter, analyser et agir sur des données télémétriques provenant d’environnements cloud et sur site.

## M

**Managed Identity**  
Fonctionnalité Azure qui fournit aux services Azure une identité automatiquement gérée pour s’authentifier auprès d’autres services Azure.

**Microservices**  
Approche architecturale où les applications sont construites comme une collection de petits services indépendants.

**Monitor**  
Solution de surveillance unifiée d’Azure qui offre une observabilité complète des applications et de l’infrastructure.

## N

**Node.js**  
Environnement d’exécution JavaScript basé sur le moteur V8 de Chrome pour créer des applications côté serveur.

**npm**  
Gestionnaire de paquets pour Node.js qui gère les dépendances et les packages.

## O

**Output**  
Valeurs renvoyées par le déploiement d’infrastructure pouvant être utilisées par des applications ou d’autres ressources.

## P

**Package**  
Processus de préparation du code applicatif et des dépendances pour le déploiement.

**Parameters**  
Valeurs d’entrée passées aux modèles d’infrastructure pour personnaliser les déploiements.

**PostgreSQL**  
Système de gestion de base de données relationnelle open-source pris en charge comme service managé dans Azure.

**Provisioning**  
Processus de création et de configuration des ressources Azure définies dans les modèles d’infrastructure.

## Q

**Quota**  
Limites concernant la quantité de ressources pouvant être créées dans un abonnement ou une région Azure.

## R

**Resource Group**  
Conteneur logique pour des ressources Azure partageant le même cycle de vie, permissions et politiques.

**Resource Token**  
Chaîne unique générée par azd pour garantir l’unicité des noms de ressources lors des déploiements.

**REST API**  
Style architectural pour concevoir des applications réseau utilisant les méthodes HTTP.

**Rollback**  
Processus de retour à une version précédente d’une application ou d’une configuration infrastructure.

## S

**Service**  
Composant de votre application défini dans azure.yaml (ex. : frontend web, backend API, base de données).

**SKU**  
Unité de gestion des stocks. Représente différents niveaux de service ou performances pour les ressources Azure.

**SQL Database**  
Service de base de données relationnelle managé d’Azure basé sur Microsoft SQL Server.

**Static Web Apps**  
Service Azure pour construire et déployer des applications web full-stack depuis des dépôts de code source.

**Storage Account**  
Service Azure offrant un stockage cloud pour des objets de données incluant blobs, fichiers, files d’attente et tables.

**Subscription**  
Conteneur de compte Azure qui regroupe les groupes de ressources et ressources, avec gestion de facturation et accès.

## T

**Template**  
Structure de projet préconstruite contenant code applicatif, définitions d’infrastructure et configurations pour scénarios courants.

**Terraform**  
Outil open-source Infrastructure as Code qui prend en charge plusieurs fournisseurs cloud dont Azure.

**Traffic Manager**  
Équilibreur de charge basé sur DNS d’Azure pour distribuer le trafic globalement entre les régions Azure.

## U

**URI**  
Identificateur uniforme de ressource. Chaîne identifiant une ressource spécifique.

**URL**  
Localisateur uniforme de ressource. Type d’URI spécifiant où une ressource est localisée et comment y accéder.

## V

**Virtual Network (VNet)**  
Bloc fondamental pour les réseaux privés dans Azure, fournissant isolation et segmentation.

**VS Code**  
Visual Studio Code. Éditeur de code populaire avec excellente intégration Azure et azd.

## W

**Webhook**  
Callback HTTP déclenché par des événements spécifiques, couramment utilisé dans les pipelines CI/CD.

**What-if**  
Fonctionnalité Azure qui montre les changements qu’un déploiement ferait sans l’exécuter réellement.

## Y

**YAML**  
YAML n’est pas un langage de balisage. Standard de sérialisation de données lisible par l’homme utilisé pour les fichiers de configuration comme azure.yaml.

## Z

**Zone**  
Emplacements physiquement séparés dans une région Azure fournissant redondance et haute disponibilité.

---

## Acronymes courants

| Acronyme | Forme complète | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Service de gestion des identités et des accès |
| ACR | Azure Container Registry | Service de registre d’images de conteneurs |
| AKS | Azure Kubernetes Service | Service Kubernetes managé |
| API | Application Programming Interface | Ensemble de protocoles pour construire des logiciels |
| ARM | Azure Resource Manager | Service de déploiement et gestion d’Azure |
| CDN | Content Delivery Network | Réseau distribué de serveurs |
| CI/CD | Intégration Continue/Déploiement Continu | Pratiques automatisées de développement |
| CLI | Command Line Interface | Interface utilisateur en ligne de commande |
| DNS | Domain Name System | Système de traduction des noms de domaine en adresses IP |
| HTTPS | Hypertext Transfer Protocol Secure | Version sécurisée de HTTP |
| IaC | Infrastructure as Code | Gestion de l’infrastructure via du code |
| JSON | JavaScript Object Notation | Format d’échange de données |
| JWT | JSON Web Token | Format de jeton pour transmission sécurisée d’informations |
| KQL | Kusto Query Language | Langage de requête pour services de données Azure |
| RBAC | Role-Based Access Control | Méthode de contrôle d’accès basée sur les rôles utilisateurs |
| REST | Representational State Transfer | Style architectural pour services web |
| SDK | Software Development Kit | Ensemble d’outils de développement |
| SLA | Service Level Agreement | Engagement sur la disponibilité et les performances d’un service |
| SQL | Structured Query Language | Langage de gestion des bases de données relationnelles |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocoles cryptographiques |
| URI | Uniform Resource Identifier | Chaîne identifiant une ressource |
| URL | Uniform Resource Locator | Type d’URI précisant la localisation d’une ressource |
| VM | Virtual Machine | Émulation d’un système informatique |
| VNet | Virtual Network | Réseau privé dans Azure |
| YAML | YAML n’est pas un langage de balisage | Standard de sérialisation de données |

---

## Correspondances des noms de services Azure

| Nom commun | Nom officiel du service Azure | Type d’hôte azd |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Termes spécifiques au contexte

### Termes de développement
- **Hot Reload** : Mise à jour automatique des applications pendant le développement sans redémarrage
- **Build Pipeline** : Processus automatisé de construction et de test du code
- **Deployment Slot** : Environnement de préproduction dans un App Service
- **Environment Parity** : Maintien de la similarité entre les environnements de développement, préproduction et production

### Termes de sécurité
- **Managed Identity** : Fonctionnalité Azure fournissant une gestion automatique des identifiants
- **Key Vault** : Stockage sécurisé pour secrets, clés et certificats
- **RBAC** : Contrôle d’accès basé sur les rôles pour les ressources Azure
- **Network Security Group** : Pare-feu virtuel pour contrôler le trafic réseau

### Termes de surveillance
- **Telemetry** : Collecte automatique de mesures et données
- **Application Performance Monitoring (APM)** : Surveillance des performances logicielles
- **Log Analytics** : Service de collecte et d’analyse des données de logs
- **Alert Rules** : Notifications automatisées basées sur des métriques ou conditions

### Termes de déploiement
- **Blue-Green Deployment** : Stratégie de déploiement sans interruption
- **Canary Deployment** : Déploiement progressif à un sous-ensemble d’utilisateurs
- **Rolling Update** : Remplacement séquentiel des instances applicatives
- **Rollback** : Retour à une version précédente de l’application

---

**Astuce d’utilisation** : Utilisez `Ctrl+F` pour rechercher rapidement des termes spécifiques dans ce glossaire. Les termes sont croisés lorsqu’applicables.

---

**Navigation**
- **Leçon précédente** : [Fiche de révision](cheat-sheet.md)
- **Leçon suivante** : [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avis de non-responsabilité** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçons d’assurer l’exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue originale doit être considéré comme la source faisant foi. Pour toute information critique, une traduction professionnelle humaine est recommandée. Nous ne pouvons être tenus responsables de tout malentendu ou mauvaise interprétation résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->