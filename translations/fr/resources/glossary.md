# Glossaire - Terminologie Azure et AZD

**Référence pour tous les chapitres**
- **📚 Accueil du cours** : [AZD Pour Débutants](../README.md)
- **📖 Apprendre les bases** : [Chapitre 1 : Bases d’AZD](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 Termes de l’IA** : [Chapitre 2 : Développement axé sur l’IA](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Ce glossaire complet fournit des définitions des termes, concepts et acronymes utilisés dans Azure Developer CLI et le développement cloud Azure. Référence essentielle pour comprendre la documentation technique, résoudre des problèmes et communiquer efficacement sur les projets azd et les services Azure.

## Objectifs d’apprentissage

En utilisant ce glossaire, vous allez :
- Comprendre la terminologie et les concepts essentiels de Azure Developer CLI
- Maîtriser le vocabulaire et les termes techniques du développement cloud Azure
- Référencer efficacement la terminologie de l’Infrastructure as Code et du déploiement
- Comprendre les noms des services Azure, les acronymes et leurs fonctions
- Accéder aux définitions pour le dépannage et le débogage
- Apprendre des concepts avancés d’architecture et de développement Azure

## Résultats d’apprentissage

En vous référant régulièrement à ce glossaire, vous serez capable de :
- Communiquer efficacement en utilisant la terminologie appropriée de Azure Developer CLI
- Comprendre plus clairement la documentation technique et les messages d’erreur
- Naviguer avec confiance parmi les services et concepts Azure
- Résoudre les problèmes en utilisant un vocabulaire technique approprié
- Contribuer aux discussions d’équipe avec un langage technique précis
- Élargir systématiquement vos connaissances en développement cloud Azure

## A

**Modèle ARM**  
Modèle Azure Resource Manager. Format Infrastructure as Code basé sur JSON utilisé pour définir et déployer des ressources Azure de manière déclarative.

**App Service**  
Offre plateforme en tant que service (PaaS) d’Azure pour héberger des applications web, API REST et backends mobiles sans gérer l’infrastructure.

**Application Insights**  
Service de monitoring des performances applicatives (APM) d’Azure fournissant des informations approfondies sur la performance, la disponibilité et l’utilisation des applications.

**Azure CLI**  
Interface en ligne de commande pour gérer les ressources Azure. Elle complète AZD mais possède une connexion distincte ; l’authentification principale d’AZD utilise `azd auth login`.

**Azure Developer CLI (azd)**  
Outil en ligne de commande orienté développeur qui accélère le processus de construction et déploiement d’applications vers Azure en utilisant des modèles et Infrastructure as Code.

**azure.yaml**  
Le fichier de configuration principal d’un projet azd qui définit les services, l’infrastructure et les hooks de déploiement.

**Azure Resource Manager (ARM)**  
Service de déploiement et gestion d’Azure fournissant une couche de gestion pour créer, mettre à jour et supprimer des ressources.

## B

**Bicep**  
Langage spécifique au domaine (DSL) développé par Microsoft pour déployer des ressources Azure. Offre une syntaxe plus simple que les modèles ARM tout en compilant vers ARM.

**Build**  
Processus de compilation du code source, d’installation des dépendances, et de préparation des applications pour le déploiement.

**Déploiement Blue-Green**  
Stratégie de déploiement utilisant deux environnements de production identiques (bleu et vert) pour minimiser les temps d’arrêt et les risques.

## C

**Container Apps**  
Service de conteneurs serverless d’Azure permettant d’exécuter des applications conteneurisées sans gérer d’infrastructure complexe.

**CI/CD**  
Intégration Continue / Déploiement Continu. Pratiques automatisées pour intégrer les modifications de code et déployer les applications.

**Cosmos DB**  
Service de base de données multimodèle distribuée globalement d’Azure offrant des SLA complets pour le débit, la latence, la disponibilité et la cohérence.

**Configuration**  
Paramètres et options qui contrôlent le comportement de l’application et les options de déploiement.

## D

**Déploiement**  
Processus d’installation et de configuration des applications et leurs dépendances sur une infrastructure cible.

**Docker**  
Plateforme pour développer, livrer et exécuter des applications utilisant la technologie de conteneurisation.

**Dockerfile**  
Fichier texte contenant des instructions pour construire une image de conteneur Docker.

## E

**Environnement**  
Cible de déploiement qui représente une instance spécifique de votre application (ex. développement, préproduction, production).

**Variables d’Environnement**  
Valeurs de configuration stockées sous forme de paires clé-valeur accessibles par les applications au moment de l’exécution.

**Point de terminaison**  
URL ou adresse réseau où une application ou un service peut être accessible.

## F

**Function App**  
Service de calcul sans serveur d’Azure permettant d’exécuter du code déclenché par des événements sans gérer l’infrastructure.

## G

**GitHub Actions**  
Plateforme CI/CD intégrée aux dépôts GitHub pour automatiser les workflows.

**Git**  
Système de contrôle de version distribué utilisé pour suivre les modifications dans le code source.

## H

**Hooks**  
Scripts ou commandes personnalisés s’exécutant à des moments spécifiques durant le cycle de vie du déploiement (pré-provisionnement, post-provisionnement, pré-déploiement, post-déploiement).

**Hôte**  
Type de service Azure où une application sera déployée (ex. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Pratique de définir et gérer l’infrastructure via du code plutôt que par des processus manuels.

**Init**  
Processus d’initialisation d’un nouveau projet azd, généralement à partir d’un modèle.

## J

**JSON**  
JavaScript Object Notation. Format d’échange de données couramment utilisé pour les fichiers de configuration et les réponses d’API.

**JWT**  
JSON Web Token. Standard pour transmettre de manière sécurisée des informations entre parties sous forme d’objet JSON.

## K

**Key Vault**  
Service Azure pour stocker et gérer en toute sécurité les secrets, clés et certificats.

**Kusto Query Language (KQL)**  
Langage de requête utilisé pour analyser les données dans Azure Monitor, Application Insights, et autres services Azure.

## L

**Load Balancer**  
Service qui distribue le trafic réseau entrant entre plusieurs serveurs ou instances.

**Log Analytics**  
Service Azure pour collecter, analyser et agir sur des données télémétriques provenant des environnements cloud et locaux.

## M

**Managed Identity**  
Fonctionnalité Azure fournissant aux services Azure une identité gérée automatiquement pour s’authentifier auprès d’autres services Azure.

**Microservices**  
Approche architecturale où les applications sont construites comme une collection de petits services indépendants.

**Monitor**  
Solution de supervision unifiée d’Azure offrant une observabilité complète des applications et de l’infrastructure.

## N

**Node.js**  
Environnement d’exécution JavaScript basé sur le moteur V8 de Chrome pour construire des applications côté serveur.

**npm**  
Gestionnaire de paquets pour Node.js qui gère les dépendances et paquets.

## O

**Sortie (Output)**  
Valeurs retournées par le déploiement d’infrastructure qui peuvent être utilisées par les applications ou d’autres ressources.

## P

**Package**  
Processus de préparation du code et des dépendances de l’application pour le déploiement.

**Paramètres**  
Valeurs d’entrée passées aux modèles d’infrastructure pour personnaliser les déploiements.

**PostgreSQL**  
Système de base de données relationnelle open-source supporté comme service managé dans Azure.

**Provisioning**  
Processus de création et configuration des ressources Azure définies dans les modèles d’infrastructure.

## Q

**Quota**  
Limites sur la quantité de ressources pouvant être créées dans une souscription ou une région Azure.

## R

**Groupe de ressources**  
Conteneur logique pour les ressources Azure qui partagent le même cycle de vie, permissions et politiques.

**Jeton de ressource**  
Chaîne unique générée par azd pour assurer que les noms de ressources sont uniques entre les déploiements.

**API REST**  
Style architectural pour concevoir des applications réseau utilisant les méthodes HTTP.

**Rollback**  
Processus de retour à une version antérieure d’une application ou configuration d’infrastructure.

## S

**Service**  
Composant de votre application défini dans azure.yaml (ex. frontend web, backend API, base de données).

**SKU**  
Unité de gestion des stocks. Représente différents niveaux de service ou performances pour les ressources Azure.

**Base de données SQL**  
Service de base de données relationnelle managé d’Azure basé sur Microsoft SQL Server.

**Static Web Apps**  
Service Azure pour créer et déployer des applications web full-stack à partir de dépôts source.

**Compte de stockage**  
Service Azure offrant un stockage cloud pour des objets de données incluant blobs, fichiers, files d’attente et tables.

**Souscription**  
Conteneur de compte Azure qui regroupe des groupes de ressources et des ressources, avec facturation et gestion des accès associées.

## T

**Modèle (Template)**  
Structure de projet préconstruite contenant le code applicatif, les définitions d’infrastructure, et la configuration pour des scénarios courants.

**Terraform**  
Outil open-source Infrastructure as Code qui supporte plusieurs fournisseurs cloud, dont Azure.

**Traffic Manager**  
Équilibreur de charge DNS d’Azure pour distribuer le trafic à travers des régions Azure globales.

## U

**URI**  
Uniform Resource Identifier. Chaîne identifiant une ressource particulière.

**URL**  
Uniform Resource Locator. Type d’URI spécifiant où une ressource se trouve et comment la récupérer.

## V

**Réseau virtuel (VNet)**  
Élément fondamental pour les réseaux privés dans Azure, apportant isolation et segmentation.

**VS Code**  
Visual Studio Code. Éditeur de code populaire avec une excellente intégration Azure et azd.

## W

**Webhook**  
Rappel HTTP déclenché par des événements spécifiques, couramment utilisé dans les pipelines CI/CD.

**What-if**  
Fonctionnalité Azure qui montre quels changements seraient effectués par un déploiement sans l’exécuter réellement.

## Y

**YAML**  
YAML Ain’t Markup Language. Standard de sérialisation de données lisible par l’humain utilisé pour des fichiers de configuration comme azure.yaml.

## Z

**Zone**  
Emplacements physiquement séparés dans une région Azure fournissant redondance et haute disponibilité.

---

## Acronymes courants

| Acronyme | Forme complète | Description |
|---------|----------------|-------------|
| AAD | Azure Active Directory (maintenant Microsoft Entra ID) | Service de gestion des identités et accès |
| ACR | Azure Container Registry | Service de registre d’images de conteneur |
| AKS | Azure Kubernetes Service | Service Kubernetes managé |
| API | Application Programming Interface | Ensemble de protocoles pour créer des logiciels |
| ARM | Azure Resource Manager | Service de déploiement et gestion Azure |
| CDN | Content Delivery Network | Réseau distribué de serveurs |
| CI/CD | Intégration Continue / Déploiement Continu | Pratiques de développement automatisées |
| CLI | Command Line Interface | Interface utilisateur en ligne de commande |
| DNS | Domain Name System | Système de traduction des noms de domaine en adresses IP |
| HTTPS | Hypertext Transfer Protocol Secure | Version sécurisée de HTTP |
| IaC | Infrastructure as Code | Gestion de l'infrastructure via du code |
| JSON | JavaScript Object Notation | Format d’échange de données |
| JWT | JSON Web Token | Format de jeton pour transmission sécurisée d’informations |
| KQL | Kusto Query Language | Langage de requête pour services de données Azure |
| RBAC | Role-Based Access Control | Méthode de contrôle d’accès basée sur les rôles d’utilisateur |
| REST | Representational State Transfer | Style architectural pour services web |
| SDK | Software Development Kit | Ensemble d’outils de développement |
| SLA | Service Level Agreement | Engagement de disponibilité/performance de service |
| SQL | Structured Query Language | Langage de gestion des bases de données relationnelles |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocoles cryptographiques |
| URI | Uniform Resource Identifier | Chaîne identifiant une ressource |
| URL | Uniform Resource Locator | Type d’URI spécifiant la localisation d’une ressource |
| VM | Machine Virtuelle | Émulation d’un système informatique |
| VNet | Réseau Virtuel | Réseau privé dans Azure |
| YAML | YAML Ain’t Markup Language | Standard de sérialisation de données |

---

## Mappages des noms de services Azure

| Nom courant | Nom officiel du service Azure | Type d’hôte azd |
|-------------|------------------------------|---------------|
| Application Web | Azure App Service | `appservice` |
| Application API | Azure App Service | `appservice` |
| Application conteneur | Azure Container Apps | `containerapp` |
| Fonction | Azure Functions | `function` |
| Site statique | Azure Static Web Apps | `staticwebapp` |
| Base de données | Azure Database for PostgreSQL | Ressource d’infrastructure, pas une application `host` |
| Base NoSQL | Azure Cosmos DB | Ressource d’infrastructure, pas une application `host` |
| Stockage | Azure Storage Account | Ressource d’infrastructure, pas une application intégrée `host` |
| Cache | Azure Managed Redis | Ressource d’infrastructure, pas une application `host` |
| Recherche | Azure AI Search | Ressource d’infrastructure, pas une application `host` |
| Messagerie | Azure Service Bus | Ressource d’infrastructure, pas une application `host` |

`services.<name>.host` sélectionne une cible de déploiement applicatif ; ce n’est pas une abréviation pour un type de ressource Azure. Bases de données, caches, services de recherche et files d’attente sont généralement provisionnés via le fournisseur d’infrastructure et connectés à l’application par des sorties/configuration.

---

## Termes spécifiques au contexte

### Termes de développement
- **Hot Reload** : Mise à jour automatique des applications durant le développement sans redémarrage
- **Pipeline de build** : Processus automatisé pour compiler et tester le code
- **Slot de déploiement** : Environnement de mise en scène dans un App Service
- **Parité d’environnement** : Maintien de la similarité entre les environnements développement, préproduction et production

### Termes de sécurité
- **Identité gérée** : Fonctionnalité Azure fournissant une gestion automatique des identifiants
- **Key Vault** : Stockage sécurisé pour secrets, clés et certificats
- **RBAC** : Contrôle d’accès basé sur les rôles pour les ressources Azure
- **Groupe de sécurité réseau** : Pare-feu virtuel contrôlant le trafic réseau

### Termes de supervision
- **Télémétrie** : Collecte automatisée de mesures et données
- **Application Performance Monitoring (APM)** : Supervision des performances logicielles
- **Log Analytics** : Service de collecte et d’analyse des données de journalisation
- **Règles d’alerte** : Notifications automatisées basées sur des métriques ou conditions

### Termes de déploiement
- **Déploiement Blue-Green** : Stratégie de déploiement sans interruption
- **Déploiement Canary** : Déploiement progressif à un sous-ensemble d’utilisateurs
- **Mise à jour progressive** : Remplacement séquentiel des instances applicatives
- **Rollback** : Revenir à une version antérieure de l’application

---

**Conseil d’utilisation** : Utilisez `Ctrl+F` pour rechercher rapidement des termes spécifiques dans ce glossaire. Les termes sont croisés lorsque c’est applicable.

---

**Navigation**
- **Leçon précédente** : [Fiche pratique](cheat-sheet.md)
- **Leçon suivante** : [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->