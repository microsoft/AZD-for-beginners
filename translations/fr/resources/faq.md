# Foire Aux Questions (FAQ)

**Obtenir de l'aide par chapitre**
- **📚 Accueil du cours** : [AZD pour débutants](../README.md)
- **🚆 Problèmes d'installation** : [Chapitre 1 : Installation & configuration](../docs/chapter-01-foundation/installation.md)
- **🤖 Questions sur l'IA** : [Chapitre 2 : Développement axé sur l'IA](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Dépannage** : [Chapitre 7 : Dépannage & débogage](../docs/chapter-07-troubleshooting/common-issues.md)

## Introduction

Cette FAQ complète fournit des réponses aux questions les plus fréquentes concernant Azure Developer CLI (azd) et les déploiements Azure. Trouvez des solutions rapides aux problèmes courants, comprenez les meilleures pratiques et obtenez des clarifications sur les concepts et workflows d'azd.

## Objectifs d'apprentissage

En consultant cette FAQ, vous allez :
- Trouver des réponses rapides aux questions et problèmes courants d'Azure Developer CLI
- Comprendre les concepts clés et le vocabulaire via un format Q&A pratique
- Accéder à des solutions de dépannage pour des problèmes fréquents et scénarios d'erreur
- Apprendre les meilleures pratiques grâce aux questions fréquemment posées sur l'optimisation
- Découvrir les fonctionnalités avancées et capacités via des questions de niveau expert
- Référencer efficacement les conseils sur les coûts, la sécurité et les stratégies de déploiement

## Résultats d'apprentissage

En vous référant régulièrement à cette FAQ, vous serez capable de :
- Résoudre de manière autonome les problèmes courants d'Azure Developer CLI avec les solutions fournies
- Prendre des décisions éclairées sur les stratégies de déploiement et les configurations
- Comprendre la relation entre azd et les autres outils et services Azure
- Appliquer les meilleures pratiques basées sur l'expérience communautaire et les recommandations d'experts
- Dépanner efficacement les problèmes d'authentification, de déploiement et de configuration
- Optimiser les coûts et les performances grâce aux connaissances et recommandations de la FAQ

## Table des matières

- [Commencer](#getting-started)
- [Authentification & accès](#authentication--access)
- [Modèles & projets](#templates--projects)
- [Déploiement & infrastructure](#deployment--infrastructure)
- [Configuration & environnements](#configuration--environments)
- [Dépannage](#troubleshooting)
- [Coûts & facturation](#cost--billing)
- [Meilleures pratiques](#best-practices)
- [Sujets avancés](#advanced-topics)

---

## Commencer

### Q : Qu'est-ce que Azure Developer CLI (azd) ?
**R** : Azure Developer CLI (azd) est un outil en ligne de commande centré sur le développeur qui accélère le temps nécessaire pour passer de l'environnement de développement local à Azure. Il fournit des meilleures pratiques via des modèles et aide tout au long du cycle de vie du déploiement.

### Q : En quoi azd est-il différent de Azure CLI ?
**R** : 
- **Azure CLI** : Outil polyvalent pour gérer les ressources Azure
- **azd** : Outil axé sur les développeurs pour les workflows de déploiement d'applications
- azd a son propre flux d'authentification et de déploiement ; Azure CLI est un outil séparé et complémentaire
- azd inclut des modèles, la gestion des environnements et l'automatisation du déploiement

### Q : Ai-je besoin d'installer Azure CLI pour utiliser azd ?
**R** : Pas pour le workflow principal AZD. Authentifiez-vous avec `azd auth login`. Installez Azure CLI séparément lorsque un hook de modèle ou un exercice exécute explicitement des commandes `az`.

### Q : Quelles langues de programmation azd supporte-t-il ?
**R** : azd est indépendant du langage. Il fonctionne avec :
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Sites Web statiques
- Applications conteneurisées

### Q : Puis-je utiliser azd avec des projets existants ?
**R** : Oui ! Vous pouvez soit :
1. Utiliser `azd init` pour ajouter la configuration azd aux projets existants
2. Adapter les projets existants pour correspondre à la structure des modèles azd
3. Créer des modèles personnalisés basés sur votre architecture existante

---

## Authentification & accès

### Q : Comment m'authentifier auprès d'Azure avec azd ?
**R** : Utilisez `azd auth login` qui ouvrira une fenêtre de navigateur pour l'authentification Azure. Pour les scénarios CI/CD, utilisez les principaux services ou identités managées.

### Q : Puis-je utiliser azd avec plusieurs abonnements Azure ?
**R** : Oui. Utilisez `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` pour spécifier quel abonnement utiliser pour chaque environnement.

### Q : Quelles permissions sont nécessaires pour déployer avec azd ?
**R** : Typiquement, vous avez besoin :
- Rôle **Collaborateur** sur le groupe de ressources ou l'abonnement
- Rôle **Administrateur d'accès utilisateur** si vous déployez des ressources nécessitant des attributions de rôles
- Les permissions spécifiques varient selon le modèle et les ressources déployées

### Q : Puis-je utiliser azd dans des pipelines CI/CD ?
**R** : Absolument ! azd est conçu pour l'intégration CI/CD. Utilisez des principaux services pour l'authentification et définissez les variables d'environnement pour la configuration.

### Q : Comment gérer l'authentification dans GitHub Actions ?
**R** : Préférez la fédération d'identité de charge de travail (OIDC), configurée avec `azd pipeline config`. Le workflow généré installe AZD et authentifie AZD directement avec une identité fédérée. Une étape `azure/login` seule n'établit pas une connexion AZD. Une étape de connexion dans un job existant est :
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Provisionnez ou déployez après connexion, avec l'environnement AZD, l'abonnement et la localisation configurés. La preuve fédérée de l'identité doit faire confiance au dépôt/ref ou à l'environnement GitHub du workflow, et ses rôles Azure doivent permettre les opérations demandées.

---

## Modèles & projets

### Q : Où puis-je trouver des modèles azd ?
**R** : 
- Modèles officiels et communautaires : [Awesome AZD](https://azure.github.io/awesome-azd/)
- Modèles communautaires : Recherche GitHub "azd-template"
- Utilisez `azd template list` pour parcourir les modèles disponibles

### Q : Comment créer un modèle personnalisé ?
**R** : 
1. Commencez avec une structure de modèle existante
2. Modifiez `azure.yaml`, les fichiers d'infrastructure, et le code de l'application
3. Testez minutieusement avec `azd up`
4. Publiez sur GitHub avec les tags appropriés

### Q : Puis-je utiliser azd sans modèle ?
**R** : Oui, utilisez `azd init` dans un projet existant pour créer les fichiers de configuration nécessaires. Vous devrez configurer manuellement `azure.yaml` et les fichiers d'infrastructure.

### Q : Quelle est la différence entre modèles officiels et communautaires ?
**R** : 
- **Modèles officiels** : Maintenus par Microsoft, régulièrement mis à jour, documentation complète
- **Modèles communautaires** : Créés par des développeurs, peuvent avoir des cas d'utilisation spécialisés, qualité et maintenance variables

### Q : Comment mettre à jour un modèle dans mon projet ?
**R** : Les modèles ne se mettent pas à jour automatiquement. Vous pouvez :
1. Comparer et fusionner manuellement les changements du modèle source
2. Repartir à neuf avec `azd init` en utilisant le modèle mis à jour
3. Sélectionner précisément certaines améliorations dans les modèles mis à jour

---

## Déploiement & infrastructure

### Q : Quels services Azure azd peut-il déployer ?
**R** : azd peut déployer n'importe quel service Azure via des modèles Bicep/ARM, y compris :
- Services d'application, applications conteneurisées, fonctions
- Bases de données (SQL, PostgreSQL, Cosmos DB)
- Stockage, coffre-fort de clés, Application Insights
- Ressources réseau, sécurité et surveillance

### Q : Puis-je déployer dans plusieurs régions ?
**R** : Oui, configurez plusieurs régions dans vos modèles Bicep et définissez le paramètre de localisation de façon appropriée pour chaque environnement.

### Q : Comment gérer les migrations de schéma de base de données ?
**R** : Utilisez des hooks de déploiement dans `azure.yaml` :
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q : Puis-je déployer uniquement l'infrastructure sans les applications ?
**R** : Oui, utilisez `azd provision` pour déployer uniquement les composants d'infrastructure définis dans vos modèles.

### Q : Comment déployer vers des ressources Azure existantes ?
**R** : Oui, si le modèle le prend en charge. Référencez les ressources existantes avec les déclarations `existing` de Bicep ou les paramètres documentés des ressources existantes du modèle, et mappez les services applications à leurs cibles prévues. Cela n'importe pas la propriété ni ne crée automatiquement les permissions manquantes. Vérifiez le modèle avant déploiement.

### Q : Puis-je utiliser Terraform au lieu de Bicep ?
**R** : Oui. AZD supporte à la fois Terraform et Bicep. Choisissez un modèle basé sur Terraform ou configurez `infra.provider: terraform` dans `azure.yaml`, avec les fichiers Terraform appropriés et la configuration d'état/backend. Voir le [workflow Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Configuration & environnements

### Q : Comment gérer différents environnements (dev, préprod, prod) ?
**R** : Créez des environnements séparés avec `azd env new <environment-name>` et configurez des paramètres différents pour chacun :
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q : Où sont stockées les configurations d'environnement ?
**R** : Dans le dossier `.azure` de votre répertoire de projet. Chaque environnement a son propre dossier avec des fichiers de configuration.

### Q : Comment définir une configuration spécifique à un environnement ?
**R** : Utilisez `azd env set` pour configurer les variables d'environnement :
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q : Puis-je partager les configurations d'environnement avec mes coéquipiers ?
**R** : Le dossier `.azure` contient des informations sensibles et ne doit pas être commité dans le contrôle de version. À la place :
1. Documentez les variables d'environnement requises
2. Utilisez des scripts de déploiement pour configurer les environnements
3. Utilisez Azure Key Vault pour la configuration sensible

### Q : Comment remplacer les paramètres par défaut des modèles ?
**R** : Définissez les variables d'environnement correspondant aux paramètres du modèle :
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Seules les variables utilisées par le modèle affectent le déploiement. `SKU_NAME` ci-dessus est un exemple d'entrée personnalisée, pas un paramètre AZD universel.

---

## Dépannage

### Q : Pourquoi `azd up` échoue-t-il ?
**R** : Causes courantes :
1. **Problèmes d'authentification** : Lancez `azd auth login`
2. **Permissions insuffisantes** : Vérifiez vos attributions de rôle Azure
3. **Conflits de nommage des ressources** : Vérifiez la ressource en conflit et les entrées de nommage du modèle ; créez un environnement séparé avec `azd env new` lorsque l'isolation est nécessaire
4. **Problèmes de quota/capacité** : Vérifiez la disponibilité régionale
5. **Erreurs de modèle** : Validez les modèles Bicep

### Q : Comment déboguer les échecs de déploiement ?
**R** : 
1. Utilisez `azd deploy --debug` pour une sortie détaillée
2. Vérifiez l'historique de déploiement dans le portail Azure
3. Consultez le journal d'activité dans le portail Azure
4. Utilisez `azd show` pour afficher l'état actuel de l'environnement

### Q : Pourquoi mes variables d'environnement ne fonctionnent-elles pas ?
**R** : Vérifiez :
1. Les noms des variables correspondent exactement aux paramètres du modèle
2. Les valeurs sont correctement citées si elles contiennent des espaces
3. L'environnement est sélectionné : `azd env select <environment>`
4. Les variables sont définies dans le bon environnement

### Q : Comment nettoyer les déploiements échoués ?
**R** : 
```bash
azd down
```
Vérifiez d'abord l'environnement sélectionné et la confirmation de suppression. Cela supprime les ressources Azure provisionnées, pas la configuration locale `.azure` de l'environnement. `--purge` demande en plus la suppression permanente des ressources pouvant être supprimées en douceur et peut être bloquée par la rétention/la protection de purge ; ce n'est pas une étape de récupération routinière.

### Q : Pourquoi mon application n'est-elle pas accessible après le déploiement ?
**R** : Vérifiez :
1. Le déploiement s'est terminé avec succès
2. L'application fonctionne (vérifiez les journaux dans le portail Azure)
3. Les groupes de sécurité réseau autorisent le trafic
4. Les domaines DNS/persos sont correctement configurés

---

## Coûts & facturation

### Q : Combien coûtent les déploiements azd ?
**R** : Les coûts dépendent de :
- Services Azure déployés
- Niveaux de service/SKUs sélectionnés
- Différences de tarification régionales
- Modes d'utilisation

Utilisez le [Calculateur de prix Azure](https://azure.microsoft.com/pricing/calculator/) pour des estimations.

### Q : Comment contrôler les coûts dans les déploiements azd ?
**R** : 
1. Utilisez des SKUs de niveau inférieur pour les environnements de développement
2. Configurez des budgets et alertes Azure
3. Utilisez `azd down` pour supprimer les ressources quand elles ne sont pas nécessaires
4. Choisissez des régions appropriées (les coûts varient selon la localisation)
5. Utilisez les outils de gestion des coûts Azure

### Q : Existe-t-il des options gratuites pour les modèles azd ?
**R** : Certains services ont des SKUs gratuits ou des crédits mensuels, soumis à éligibilité, plan d'hébergement, région et limites d'abonnement. Cela ne rend pas un modèle entier gratuit : bases de données, recherche, réseau, registre, télémétrie et inférence de modèles peuvent engendrer des frais indépendamment. Consultez la [liste des services gratuits Azure](https://azure.microsoft.com/free/) et les prix actuels pour chaque ressource avant déploiement.

### Q : Comment estimer les coûts avant déploiement ?
**R** : 
1. Consultez `main.bicep` du modèle pour voir quelles ressources sont créées
2. Utilisez le Calculateur de prix Azure avec les SKUs spécifiques
3. Déployez d'abord dans un environnement de développement pour surveiller les coûts réels
4. Utilisez la gestion des coûts Azure pour une analyse détaillée des coûts

---

## Meilleures pratiques

### Q : Quelles sont les meilleures pratiques pour la structure d'un projet azd ?
**R** : 
1. Gardez le code de l'application séparé de l'infrastructure
2. Utilisez des noms de services significatifs dans `azure.yaml`
3. Implémentez une gestion correcte des erreurs dans les scripts de build
4. Utilisez une configuration spécifique à l'environnement
5. Incluez une documentation complète

### Q : Comment organiser plusieurs services dans azd ?
**R** : Utilisez la structure recommandée :
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### Q : Dois-je commiter le dossier `.azure` dans le contrôle de version ?
**R** : **Non !** Le dossier `.azure` contient des informations sensibles. Ajoutez-le à `.gitignore` :
```gitignore
.azure/
```

### Q : Comment gérer les secrets et la configuration sensible ?
**R** : 
1. Utilisez Azure Key Vault pour les secrets
2. Référencez les secrets Key Vault dans la configuration de l'application
3. Ne jamais commettre les secrets dans le contrôle de version
4. Utilisez des identités gérées pour l'authentification service-à-service

### Q : Quelle est l'approche recommandée pour CI/CD avec azd ?
**R** : 
1. Utilisez des environnements séparés pour chaque étape (dev/staging/prod)
2. Mettez en œuvre des tests automatisés avant le déploiement
3. Utilisez des principaux de service pour l'authentification
4. Stockez la configuration sensible dans les secrets/variables du pipeline
5. Mettez en place des barrières d'approbation pour les déploiements en production

---

## Sujets Avancés

### Q : Puis-je étendre azd avec des fonctionnalités personnalisées ?
**R** : Oui, via des hooks de déploiement dans `azure.yaml` :
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q : Comment intégrer azd aux processus DevOps existants ?
**R** : 
1. Utilisez les commandes azd dans les scripts de pipelines existants
2. Standardisez les modèles azd entre les équipes
3. Intégrez avec la surveillance et l'alerte existantes
4. Utilisez la sortie JSON d’azd pour l’intégration des pipelines

### Q : Puis-je utiliser azd avec Azure DevOps ?
**R** : Oui, azd fonctionne avec tout système CI/CD. Créez des pipelines Azure DevOps qui utilisent les commandes azd.

### Q : Comment contribuer à azd ou créer des modèles communautaires ?
**R** : 
1. **outil azd** : Contribuez à [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Modèles** : Suivez les [instructions de contribution au galeried Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentation** : Contribuez à la documentation sur [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q : Quelle est la feuille de route pour azd ?
**R** : Consultez la [feuille de route officielle](https://github.com/Azure/azure-dev/projects) pour les fonctionnalités et améliorations prévues.

### Q : Comment migrer d'autres outils de déploiement vers azd ?
**R** : 
1. Analysez l’architecture de déploiement actuelle
2. Créez des modèles Bicep équivalents
3. Configurez `azure.yaml` pour correspondre aux services actuels
4. Testez soigneusement dans l’environnement de développement
5. Migrez progressivement les environnements

---

## Vous avez encore des questions ?

### **Cherchez d'abord**
- Consultez la [documentation officielle](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Recherchez dans les [issues GitHub](https://github.com/Azure/azure-dev/issues) des problèmes similaires

### **Obtenez de l'aide**
- [Discussions GitHub](https://github.com/Azure/azure-dev/discussions) - Support communautaire
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Questions techniques
- [Azure Discord](https://discord.gg/azure) - Chat communautaire en temps réel

### **Signalez des problèmes**
- [Issues GitHub](https://github.com/Azure/azure-dev/issues/new) - Rapports de bugs et demandes de fonctionnalités
- Incluez les logs pertinents, messages d’erreur et étapes pour reproduire

### **En savoir plus**
- [Documentation Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centre d'Architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Cadre Azure Bien Architecturé](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Conseils techniques examinés : 4 novembre 2026. La disponibilité cloud et la tarification doivent être vérifiées pour votre abonnement et votre région.*

---

**Navigation**
- **Leçon précédente** : [Glossaire](glossary.md)
- **Leçon suivante** : [Guide d'étude](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->