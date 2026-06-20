# Glossaire - Terminologie Azure et AZD

**Référence pour tous les chapitres**
- **📚 Accueil du cours** : [AZD Pour Débutants](../README.md)
- **📖 Apprendre les bases** : [Chapitre 1 : Bases d'AZD](../docs/getting-started/azd-basics.md)
- **🤖 Termes IA** : [Chapitre 2 : Développement IA-First](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduction

Ce glossaire complet fournit des définitions pour les termes, concepts et acronymes utilisés dans Azure Developer CLI et le développement cloud Azure. Une référence essentielle pour comprendre la documentation technique, résoudre les problèmes et communiquer efficacement sur les projets azd et les services Azure.

## Objectifs d'apprentissage

En utilisant ce glossaire, vous allez :
- Comprendre la terminologie et les concepts essentiels d’Azure Developer CLI
- Maîtriser le vocabulaire et les termes techniques du développement cloud Azure
- Référencer efficacement la terminologie Infrastructure as Code et déploiement
- Comprendre les noms, acronymes et usages des services Azure
- Accéder aux définitions pour la terminologie de dépannage et de débogage
- Apprendre les concepts avancés d’architecture et de développement Azure

## Résultats d'apprentissage

Avec une consultation régulière de ce glossaire, vous serez capable de :
- Communiquer efficacement en utilisant la terminologie appropriée d’Azure Developer CLI
- Comprendre plus clairement la documentation technique et les messages d’erreur
- Naviguer avec confiance dans les services et concepts Azure
- Résoudre les problèmes avec le vocabulaire technique adéquat
- Contribuer aux discussions d’équipe avec un langage technique précis
- Étendre systématiquement vos connaissances en développement cloud Azure

## A

**ARM Template**  
Modèle Azure Resource Manager. Format Infrastructure as Code basé JSON utilisé pour définir et déployer les ressources Azure de manière déclarative.

**App Service**  
Offre platform-as-a-service (PaaS) d’Azure pour héberger des applications web, des API REST et des backends mobiles sans gérer l’infrastructure.

**Application Insights**  
Service de surveillance de performance applicative (APM) d’Azure qui fournit des informations approfondies sur la performance, la disponibilité et l’utilisation des applications.

**Azure CLI**  
Interface en ligne de commande pour gérer les ressources Azure. Utilisée par azd pour l’authentification et certaines opérations.

**Azure Developer CLI (azd)**  
Outil en ligne de commande centré développeur qui accélère le processus de création et de déploiement d’applications sur Azure à l’aide de modèles et d’Infrastructure as Code.

**azure.yaml**  
Fichier de configuration principal d’un projet azd qui définit les services, l’infrastructure et les hooks de déploiement.

**Azure Resource Manager (ARM)**  
Service de déploiement et de gestion d’Azure qui offre une couche de gestion pour créer, mettre à jour et supprimer des ressources.

## B

**Bicep**  
Langage spécifique au domaine (DSL) développé par Microsoft pour déployer des ressources Azure. Fournit une syntaxe plus simple que les modèles ARM tout en compilant en ARM.

**Build**  
Processus de compilation du code source, d’installation des dépendances et de préparation des applications pour le déploiement.

**Blue-Green Deployment**  
Stratégie de déploiement utilisant deux environnements de production identiques (bleu et vert) pour minimiser les temps d’arrêt et les risques.

## C

**Container Apps**  
Service Azure de conteneurs sans serveur permettant d’exécuter des applications conteneurisées sans gérer une infrastructure complexe.

**CI/CD**  
Intégration Continue/Déploiement Continu. Pratiques automatisées pour intégrer les modifications de code et déployer des applications.

**Cosmos DB**  
Service de base de données multi-modèle, distribué mondialement d’Azure offrant des SLA complets pour le débit, la latence, la disponibilité et la cohérence.

**Configuration**  
Paramètres et options qui contrôlent le comportement des applications et les choix de déploiement.

## D

**Deployment**  
Processus d’installation et de configuration des applications et de leurs dépendances sur l’infrastructure cible.

**Docker**  
Plateforme pour développer, livrer et exécuter des applications utilisant la technologie des conteneurs.

**Dockerfile**  
Fichier texte contenant les instructions pour construire une image de conteneur Docker.

## E

**Environment**  
Cible de déploiement représentant une instance spécifique de votre application (ex. développement, staging, production).

**Environment Variables**  
Valeurs de configuration stockées sous forme de paires clé-valeur que les applications peuvent lire à l’exécution.

**Endpoint**  
URL ou adresse réseau où une application ou un service est accessible.

## F

**Function App**  
Service de calcul sans serveur d’Azure permettant d’exécuter du code déclenché par des événements sans gérer d’infrastructure.

## G

**GitHub Actions**  
Plateforme CI/CD intégrée aux dépôts GitHub pour automatiser les workflows.

**Git**  
Système de contrôle de version distribué utilisé pour suivre les modifications du code source.

## H

**Hooks**  
Scripts ou commandes personnalisés qui s’exécutent à des points spécifiques du cycle de vie du déploiement (préprovision, postprovision, prédeploy, postdeploy).

**Host**  
Type de service Azure où une application sera déployée (ex. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Pratique consistant à définir et gérer l’infrastructure via du code plutôt que manuellement.

**Init**  
Processus d’initialisation d’un nouveau projet azd, généralement à partir d’un modèle.

## J

**JSON**  
JavaScript Object Notation. Format d’échange de données couramment utilisé pour les fichiers de configuration et réponses d’API.

**JWT**  
JSON Web Token. Standard pour transmettre de manière sécurisée des informations entre parties sous forme d’objet JSON.

## K

**Key Vault**  
Service Azure pour stocker et gérer en toute sécurité secrets, clés et certificats.

**Kusto Query Language (KQL)**  
Langage de requête utilisé pour analyser les données dans Azure Monitor, Application Insights et autres services Azure.

## L

**Load Balancer**  
Service qui répartit le trafic réseau entrant entre plusieurs serveurs ou instances.

**Log Analytics**  
Service Azure pour collecter, analyser et agir sur les données télémétriques issues des environnements cloud et sur site.

## M

**Managed Identity**  
Fonction Azure qui fournit aux services Azure une identité gérée automatiquement pour s’authentifier auprès d’autres services Azure.

**Microservices**  
Approche architecturale où les applications sont construites comme une collection de petits services indépendants.

**Monitor**  
Solution unifiée de monitoring Azure qui offre une observabilité complète des applications et de l’infrastructure.

## N

**Node.js**  
Runtime JavaScript construit sur le moteur V8 de Chrome pour créer des applications côté serveur.

**npm**  
Gestionnaire de paquets pour Node.js qui gère les dépendances et les paquets.

## O

**Output**  
Valeurs retournées par le déploiement d’infrastructure qui peuvent être utilisées par les applications ou d’autres ressources.

## P

**Package**  
Processus de préparation du code applicatif et des dépendances pour le déploiement.

**Parameters**  
Valeurs d’entrée passées aux modèles d’infrastructure pour personnaliser les déploiements.

**PostgreSQL**  
Système de base de données relationnelle open-source supporté comme service managé dans Azure.

**Provisioning**  
Processus de création et configuration des ressources Azure définies dans les modèles d’infrastructure.

## Q

**Quota**  
Limites sur la quantité de ressources pouvant être créées dans un abonnement ou une région Azure.

## R

**Resource Group**  
Conteneur logique pour les ressources Azure partageant le même cycle de vie, permissions et stratégies.

**Resource Token**  
Chaîne unique générée par azd pour garantir que les noms des ressources sont uniques entre les déploiements.

**REST API**  
Style architectural pour concevoir des applications réseau utilisant les méthodes HTTP.

**Rollback**  
Processus de retour à une version précédente d’une application ou d’une configuration d’infrastructure.

## S

**Service**  
Composant de votre application défini dans azure.yaml (ex. frontend web, API backend, base de données).

**SKU**  
Stock Keeping Unit. Représente différents niveaux de service ou performances pour les ressources Azure.

**SQL Database**  
Service de base de données relationnelle managée d’Azure basé sur Microsoft SQL Server.

**Static Web Apps**  
Service Azure pour construire et déployer des applications web full-stack à partir de dépôts source.

**Storage Account**  
Service Azure qui fournit du stockage cloud pour objets de données incluant blobs, fichiers, files d’attente, et tables.

**Subscription**  
Conteneur de compte Azure qui contient les groupes de ressources et ressources, avec facturation et gestion des accès associées.

## T

**Template**  
Structure de projet pré-construite contenant code applicatif, définitions d’infrastructure et configuration pour scénarios communs.

**Terraform**  
Outil open-source Infrastructure as Code qui supporte plusieurs fournisseurs cloud dont Azure.

**Traffic Manager**  
Équilibreur de charge de trafic basé sur DNS d’Azure pour distribuer le trafic entre régions Azure globales.

## U

**URI**  
Identifiant Uniforme de Ressource. Chaîne identifiant une ressource particulière.

**URL**  
Localisateur Uniforme de Ressource. Type d’URI qui spécifie où une ressource est située et comment l’obtenir.

## V

**Virtual Network (VNet)**  
Brique fondamentale pour les réseaux privés dans Azure, fournissant isolation et segmentation.

**VS Code**  
Visual Studio Code. Éditeur de code populaire avec excellente intégration Azure et azd.

## W

**Webhook**  
Retour HTTP déclenché par des événements spécifiques, souvent utilisé dans les pipelines CI/CD.

**What-if**  
Fonction Azure qui montre les changements qu’un déploiement effectuerait sans l’exécuter réellement.

## Y

**YAML**  
YAML n’est pas un langage de balisage. Standard de sérialisation de données lisible par l’humain utilisé pour fichiers de configuration comme azure.yaml.

## Z

**Zone**  
Emplacements physiquement séparés dans une région Azure qui fournissent redondance et haute disponibilité.

---

## Acronymes courants

| Acronyme | Forme complète | Description |
|---------|----------------|-------------|
| AAD | Azure Active Directory (aujourd’hui Microsoft Entra ID) | Service d'identité et gestion des accès |
| ACR | Azure Container Registry | Service de registre d'images de conteneurs |
| AKS | Azure Kubernetes Service | Service Kubernetes managé |
| API | Application Programming Interface | Ensemble de protocoles pour construire des logiciels |
| ARM | Azure Resource Manager | Service de déploiement et gestion Azure |
| CDN | Content Delivery Network | Réseau distribué de serveurs |
| CI/CD | Continuous Integration/Continuous Deployment | Pratiques automatisées de développement |
| CLI | Command Line Interface | Interface utilisateur en ligne de commande |
| DNS | Domain Name System | Système de traduction des noms de domaine en adresses IP |
| HTTPS | Hypertext Transfer Protocol Secure | Version sécurisée de HTTP |
| IaC | Infrastructure as Code | Gestion de l’infrastructure via du code |
| JSON | JavaScript Object Notation | Format d’échange de données |
| JWT | JSON Web Token | Format de jeton pour la transmission sécurisée d’informations |
| KQL | Kusto Query Language | Langage de requête pour services de données Azure |
| RBAC | Role-Based Access Control | Contrôle d’accès basé sur les rôles utilisateurs |
| REST | Representational State Transfer | Style architectural pour services web |
| SDK | Software Development Kit | Collection d’outils de développement |
| SLA | Service Level Agreement | Engagement de disponibilité/performance d’un service |
| SQL | Structured Query Language | Langage de gestion des bases relationnelles |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocoles cryptographiques |
| URI | Uniform Resource Identifier | Chaîne identifiant une ressource |
| URL | Uniform Resource Locator | Type d’URI spécifiant localisation d’une ressource |
| VM | Virtual Machine | Émulation d’un système informatique |
| VNet | Virtual Network | Réseau privé dans Azure |
| YAML | YAML n’est pas un langage de balisage | Standard de sérialisation de données |

---

## Correspondances des noms de service Azure

| Nom Courant | Nom officiel du service Azure | Type d’hôte azd |
|-------------|-------------------------------|-----------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Termes spécifiques au contexte

### Termes de développement
- **Hot Reload** : Mise à jour automatique des applications durant le développement sans redémarrage
- **Build Pipeline** : Processus automatisé de compilation et test du code
- **Deployment Slot** : Environnement de préproduction dans un App Service
- **Environment Parity** : Maintenir les environnements développement, staging et production similaires

### Termes de sécurité
- **Managed Identity** : Fonction Azure offrant une gestion automatique des identifiants
- **Key Vault** : Stockage sécurisé pour secrets, clés et certificats
- **RBAC** : Contrôle d’accès basé sur les rôles pour les ressources Azure
- **Network Security Group** : Pare-feu virtuel pour contrôler le trafic réseau

### Termes de surveillance
- **Telemetry** : Collecte automatisée des mesures et données
- **Application Performance Monitoring (APM)** : Surveillance de la performance logicielle
- **Log Analytics** : Service de collecte et analyse des données de journalisation
- **Alert Rules** : Notifications automatisées basées sur des métriques ou conditions

### Termes de déploiement
- **Blue-Green Deployment** : Stratégie de déploiement sans interruption
- **Canary Deployment** : Déploiement progressif à un sous-ensemble d’utilisateurs
- **Rolling Update** : Remplacement séquentiel des instances d’application
- **Rollback** : Retour à une version précédente de l’application

---

**Conseil d’utilisation** : Utilisez `Ctrl+F` pour rechercher rapidement des termes spécifiques dans ce glossaire. Les termes sont croisés lorsque c’est pertinent.

---

**Navigation**
- **Leçon précédente** : [Feuille de Référence](cheat-sheet.md)
- **Leçon suivante** : [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->