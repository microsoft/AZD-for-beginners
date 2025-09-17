<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f16d2988a24670d1b6aa2372de1a231a",
  "translation_date": "2025-09-17T13:34:33+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "fr"
}
-->
# Glossaire - Terminologie Azure et AZD

**Références pour tous les chapitres**  
- **📚 Accueil du cours** : [AZD pour débutants](../README.md)  
- **📖 Apprendre les bases** : [Chapitre 1 : Bases d'AZD](../docs/getting-started/azd-basics.md)  
- **🤖 Termes IA** : [Chapitre 2 : Développement axé sur l'IA](../docs/ai-foundry/azure-ai-foundry-integration.md)  

## Introduction

Ce glossaire complet fournit des définitions pour les termes, concepts et acronymes utilisés dans Azure Developer CLI et le développement cloud Azure. Une référence essentielle pour comprendre la documentation technique, résoudre des problèmes et communiquer efficacement sur les projets azd et les services Azure.

## Objectifs d'apprentissage

En utilisant ce glossaire, vous pourrez :  
- Comprendre la terminologie et les concepts essentiels d'Azure Developer CLI  
- Maîtriser le vocabulaire et les termes techniques du développement cloud Azure  
- Référencer efficacement la terminologie liée à l'infrastructure en tant que code et au déploiement  
- Comprendre les noms des services Azure, les acronymes et leurs objectifs  
- Accéder aux définitions pour résoudre des problèmes et déboguer  
- Apprendre des concepts avancés d'architecture et de développement Azure  

## Résultats d'apprentissage

Avec une utilisation régulière de ce glossaire, vous serez capable de :  
- Communiquer efficacement en utilisant la terminologie appropriée d'Azure Developer CLI  
- Comprendre plus clairement la documentation technique et les messages d'erreur  
- Naviguer avec confiance dans les services et concepts Azure  
- Résoudre des problèmes en utilisant un vocabulaire technique adapté  
- Contribuer aux discussions d'équipe avec un langage technique précis  
- Développer systématiquement vos connaissances en développement cloud Azure  

## A

**Modèle ARM**  
Modèle Azure Resource Manager. Format JSON basé sur l'infrastructure en tant que code utilisé pour définir et déployer des ressources Azure de manière déclarative.

**App Service**  
Offre de plateforme en tant que service (PaaS) d'Azure pour héberger des applications web, des API REST et des backends mobiles sans gérer l'infrastructure.

**Application Insights**  
Service de surveillance des performances des applications d'Azure qui fournit des informations approfondies sur les performances, la disponibilité et l'utilisation des applications.

**Azure CLI**  
Interface en ligne de commande pour gérer les ressources Azure. Utilisée par azd pour l'authentification et certaines opérations.

**Azure Developer CLI (azd)**  
Outil en ligne de commande centré sur les développeurs qui accélère le processus de création et de déploiement d'applications sur Azure en utilisant des modèles et l'infrastructure en tant que code.

**azure.yaml**  
Le fichier de configuration principal d'un projet azd qui définit les services, l'infrastructure et les hooks de déploiement.

**Azure Resource Manager (ARM)**  
Service de déploiement et de gestion d'Azure qui fournit une couche de gestion pour créer, mettre à jour et supprimer des ressources.

## B

**Bicep**  
Langage spécifique au domaine (DSL) développé par Microsoft pour déployer des ressources Azure. Offre une syntaxe plus simple que les modèles ARM tout en se compilant en ARM.

**Build**  
Processus de compilation du code source, d'installation des dépendances et de préparation des applications pour le déploiement.

**Déploiement Blue-Green**  
Stratégie de déploiement utilisant deux environnements de production identiques (bleu et vert) pour minimiser les temps d'arrêt et les risques.

## C

**Container Apps**  
Service de conteneurs sans serveur d'Azure permettant d'exécuter des applications conteneurisées sans gérer une infrastructure complexe.

**CI/CD**  
Intégration continue/Déploiement continu. Pratiques automatisées pour intégrer les modifications de code et déployer des applications.

**Cosmos DB**  
Service de base de données multi-modèle et distribué mondialement d'Azure offrant des SLA complets pour le débit, la latence, la disponibilité et la cohérence.

**Configuration**  
Paramètres et options qui contrôlent le comportement des applications et les choix de déploiement.

## D

**Déploiement**  
Processus d'installation et de configuration des applications et de leurs dépendances sur l'infrastructure cible.

**Docker**  
Plateforme pour développer, expédier et exécuter des applications en utilisant la technologie de conteneurisation.

**Dockerfile**  
Fichier texte contenant des instructions pour construire une image de conteneur Docker.

## E

**Environnement**  
Cible de déploiement représentant une instance spécifique de votre application (par exemple, développement, préproduction, production).

**Variables d'environnement**  
Valeurs de configuration stockées sous forme de paires clé-valeur auxquelles les applications peuvent accéder au moment de l'exécution.

**Point de terminaison**  
URL ou adresse réseau où une application ou un service peut être accessible.

## F

**Function App**  
Service de calcul sans serveur d'Azure permettant d'exécuter du code déclenché par des événements sans gérer l'infrastructure.

## G

**GitHub Actions**  
Plateforme CI/CD intégrée aux dépôts GitHub pour automatiser les workflows.

**Git**  
Système de contrôle de version distribué utilisé pour suivre les modifications du code source.

## H

**Hooks**  
Scripts ou commandes personnalisés exécutés à des points spécifiques du cycle de vie du déploiement (préprovision, postprovision, prédeploy, postdeploy).

**Hôte**  
Type de service Azure où une application sera déployée (par exemple, appservice, containerapp, function).

## I

**Infrastructure en tant que code (IaC)**  
Pratique consistant à définir et gérer l'infrastructure via du code plutôt que des processus manuels.

**Init**  
Processus d'initialisation d'un nouveau projet azd, généralement à partir d'un modèle.

## J

**JSON**  
JavaScript Object Notation. Format d'échange de données couramment utilisé pour les fichiers de configuration et les réponses API.

**JWT**  
JSON Web Token. Norme pour transmettre des informations de manière sécurisée entre des parties sous forme d'objet JSON.

## K

**Key Vault**  
Service d'Azure pour stocker et gérer de manière sécurisée des secrets, des clés et des certificats.

**Langage de requête Kusto (KQL)**  
Langage de requête utilisé pour analyser les données dans Azure Monitor, Application Insights et d'autres services Azure.

## L

**Load Balancer**  
Service qui distribue le trafic réseau entrant entre plusieurs serveurs ou instances.

**Log Analytics**  
Service Azure pour collecter, analyser et agir sur les données de télémétrie provenant des environnements cloud et sur site.

## M

**Identité gérée**  
Fonctionnalité d'Azure qui fournit aux services Azure une identité gérée automatiquement pour s'authentifier auprès d'autres services Azure.

**Microservices**  
Approche architecturale où les applications sont construites comme une collection de petits services indépendants.

**Monitor**  
Solution de surveillance unifiée d'Azure qui offre une observabilité complète des applications et de l'infrastructure.

## N

**Node.js**  
Runtime JavaScript basé sur le moteur V8 de Chrome pour créer des applications côté serveur.

**npm**  
Gestionnaire de paquets pour Node.js qui gère les dépendances et les paquets.

## O

**Output**  
Valeurs retournées par le déploiement de l'infrastructure qui peuvent être utilisées par les applications ou d'autres ressources.

## P

**Package**  
Processus de préparation du code de l'application et des dépendances pour le déploiement.

**Paramètres**  
Valeurs d'entrée passées aux modèles d'infrastructure pour personnaliser les déploiements.

**PostgreSQL**  
Système de base de données relationnelle open-source pris en charge en tant que service géré dans Azure.

**Provisionnement**  
Processus de création et de configuration des ressources Azure définies dans les modèles d'infrastructure.

## Q

**Quota**  
Limites sur la quantité de ressources pouvant être créées dans un abonnement ou une région Azure.

## R

**Groupe de ressources**  
Conteneur logique pour les ressources Azure partageant le même cycle de vie, les mêmes autorisations et les mêmes politiques.

**Jeton de ressource**  
Chaîne unique générée par azd pour garantir que les noms de ressources sont uniques dans les déploiements.

**API REST**  
Style architectural pour concevoir des applications réseau en utilisant des méthodes HTTP.

**Rollback**  
Processus de retour à une version précédente d'une application ou d'une configuration d'infrastructure.

## S

**Service**  
Composant de votre application défini dans azure.yaml (par exemple, frontend web, backend API, base de données).

**SKU**  
Unité de gestion des stocks. Représente différents niveaux de service ou de performance pour les ressources Azure.

**Base de données SQL**  
Service de base de données relationnelle géré d'Azure basé sur Microsoft SQL Server.

**Static Web Apps**  
Service Azure pour créer et déployer des applications web full-stack à partir de dépôts de code source.

**Compte de stockage**  
Service Azure qui fournit un stockage cloud pour des objets de données tels que des blobs, des fichiers, des files d'attente et des tables.

**Abonnement**  
Conteneur de compte Azure qui contient des groupes de ressources et des ressources, avec une gestion de la facturation et des accès associés.

## T

**Modèle**  
Structure de projet préconstruite contenant du code d'application, des définitions d'infrastructure et des configurations pour des scénarios courants.

**Terraform**  
Outil open-source d'infrastructure en tant que code qui prend en charge plusieurs fournisseurs cloud, y compris Azure.

**Traffic Manager**  
Équilibreur de charge DNS d'Azure pour distribuer le trafic entre les régions Azure mondiales.

## U

**URI**  
Identifiant de ressource uniforme. Chaîne qui identifie une ressource particulière.

**URL**  
Localisateur de ressource uniforme. Type d'URI qui spécifie où une ressource est située et comment la récupérer.

## V

**Réseau virtuel (VNet)**  
Bloc de construction fondamental pour les réseaux privés dans Azure, offrant isolation et segmentation.

**VS Code**  
Visual Studio Code. Éditeur de code populaire avec une excellente intégration Azure et azd.

## W

**Webhook**  
Rappel HTTP déclenché par des événements spécifiques, couramment utilisé dans les pipelines CI/CD.

**What-if**  
Fonctionnalité Azure qui montre les modifications qui seraient apportées par un déploiement sans l'exécuter réellement.

## Y

**YAML**  
YAML Ain't Markup Language. Norme de sérialisation de données lisible par l'humain utilisée pour les fichiers de configuration comme azure.yaml.

## Z

**Zone**  
Emplacements physiquement séparés au sein d'une région Azure offrant redondance et haute disponibilité.

---

## Acronymes courants

| Acronyme | Forme complète | Description |
|---------|----------------|-------------|
| AAD | Azure Active Directory | Service de gestion des identités et des accès |
| ACR | Azure Container Registry | Service de registre d'images de conteneurs |
| AKS | Azure Kubernetes Service | Service Kubernetes géré |
| API | Interface de programmation d'application | Ensemble de protocoles pour créer des logiciels |
| ARM | Azure Resource Manager | Service de déploiement et de gestion d'Azure |
| CDN | Réseau de diffusion de contenu | Réseau distribué de serveurs |
| CI/CD | Intégration continue/Déploiement continu | Pratiques de développement automatisées |
| CLI | Interface en ligne de commande | Interface utilisateur basée sur du texte |
| DNS | Système de noms de domaine | Système de traduction des noms de domaine en adresses IP |
| HTTPS | Hypertext Transfer Protocol Secure | Version sécurisée de HTTP |
| IaC | Infrastructure en tant que code | Gestion de l'infrastructure via du code |
| JSON | JavaScript Object Notation | Format d'échange de données |
| JWT | JSON Web Token | Format de jeton pour la transmission sécurisée d'informations |
| KQL | Langage de requête Kusto | Langage de requête pour les services de données Azure |
| RBAC | Contrôle d'accès basé sur les rôles | Méthode de contrôle d'accès basée sur les rôles des utilisateurs |
| REST | Transfert d'état représentatif | Style architectural pour les services web |
| SDK | Kit de développement logiciel | Collection d'outils de développement |
| SLA | Accord de niveau de service | Engagement sur la disponibilité/performance du service |
| SQL | Langage de requête structuré | Langage pour gérer les bases de données relationnelles |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Protocoles cryptographiques |
| URI | Identifiant de ressource uniforme | Chaîne identifiant une ressource |
| URL | Localisateur de ressource uniforme | Type d'URI spécifiant l'emplacement d'une ressource |
| VM | Machine virtuelle | Émulation d'un système informatique |
| VNet | Réseau virtuel | Réseau privé dans Azure |
| YAML | YAML Ain't Markup Language | Norme de sérialisation de données |

---

## Correspondances des noms de services Azure

| Nom commun | Nom officiel du service Azure | Type d'hôte azd |
|------------|-------------------------------|-----------------|
| Application web | Azure App Service | `appservice` |
| Application API | Azure App Service | `appservice` |
| Application conteneurisée | Azure Container Apps | `containerapp` |
| Fonction | Azure Functions | `function` |
| Site statique | Azure Static Web Apps | `staticwebapp` |
| Base de données | Azure Database for PostgreSQL | `postgres` |
| Base de données NoSQL | Azure Cosmos DB | `cosmosdb` |
| Stockage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Recherche | Azure Cognitive Search | `search` |
| Messagerie | Azure Service Bus | `servicebus` |

---

## Termes spécifiques au contexte

### Termes de développement  
- **Hot Reload** : Mise à jour automatique des applications pendant le développement sans redémarrage  
- **Pipeline de build** : Processus automatisé pour construire et tester le code  
- **Slot de déploiement** : Environnement de préproduction au sein d'un App Service  
- **Parité des environnements** : Maintenir des environnements de développement, préproduction et production similaires  

### Termes de sécurité  
- **Identité gérée** : Fonctionnalité Azure offrant une gestion automatique des identifiants  
- **Key Vault** : Stockage sécurisé pour les secrets, clés et certificats  
- **RBAC** : Contrôle d'accès basé sur les rôles pour les ressources Azure  
- **Groupe de sécurité réseau** : Pare-feu virtuel pour contrôler le trafic réseau  

### Termes de surveillance  
- **Télémétrie** : Collecte automatisée de mesures et de données  
- **Surveillance des performances des applications (APM)** : Surveillance des performances des logiciels  
- **Log Analytics** : Service pour collecter et analyser les données de journaux  
- **Règles d'alerte** : Notifications automatisées basées sur des métriques ou des conditions  

### Termes de déploiement  
- **Déploiement Blue-Green** : Stratégie de déploiement sans interruption  
- **Déploiement Canary** : Déploiement progressif à un sous-ensemble d'utilisateurs  
- **Mise à jour progressive** : Remplacement séquentiel des instances d'application  
- **Rollback** : Retour à une version précédente de l'application  

---

**Astuce d'utilisation** : Utilisez `Ctrl+F` pour rechercher rapidement des termes spécifiques dans ce glossaire. Les termes sont croisés lorsque cela est applicable.

---

**Navigation**  
- **Leçon précédente** : [Fiche de référence](cheat-sheet.md)  
- **Leçon suivante** : [FAQ](faq.md)  

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.