# Questions Fréquentes (FAQ)

**Obtenir de l'aide par chapitre**
- **📚 Accueil du cours** : [AZD Pour Débutants](../README.md)
- **🚆 Problèmes d'installation** : [Chapitre 1 : Installation & Configuration](../docs/chapter-01-foundation/installation.md)
- **🤖 Questions sur l'IA** : [Chapitre 2 : Développement AI-First](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Dépannage** : [Chapitre 7 : Dépannage & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Introduction

Cette FAQ complète fournit des réponses aux questions les plus courantes concernant Azure Developer CLI (azd) et les déploiements Azure. Trouvez des solutions rapides aux problèmes fréquents, comprenez les meilleures pratiques, et obtenez des clarifications sur les concepts et les workflows azd.

## Objectifs d'apprentissage

En consultant cette FAQ, vous allez :
- Trouver des réponses rapides aux questions et problèmes courants d'Azure Developer CLI
- Comprendre les concepts clés et la terminologie via un format questions-réponses pratique
- Accéder aux solutions de dépannage pour les problèmes et erreurs fréquents
- Apprendre les meilleures pratiques grâce aux questions fréquemment posées sur l'optimisation
- Découvrir les fonctionnalités avancées grâce aux questions de niveau expert
- Se référer efficacement aux conseils sur les coûts, la sécurité et la stratégie de déploiement

## Résultats d'apprentissage

En consultant régulièrement cette FAQ, vous serez capable de :
- Résoudre de façon autonome les problèmes courants d'Azure Developer CLI en utilisant les solutions fournies
- Prendre des décisions éclairées concernant les stratégies et configurations de déploiement
- Comprendre la relation entre azd et les autres outils et services Azure
- Appliquer les meilleures pratiques basées sur l'expérience communautaire et les recommandations d'experts
- Dépanner efficacement les problèmes d'authentification, de déploiement et de configuration
- Optimiser les coûts et la performance en utilisant les aperçus et recommandations de la FAQ

## Table des matières

- [Premiers pas](#getting-started)
- [Authentification & Accès](#authentication--access)
- [Modèles & Projets](#templates--projects)
- [Déploiement & Infrastructure](#deployment--infrastructure)
- [Configuration & Environnements](#configuration--environments)
- [Dépannage](#troubleshooting)
- [Coûts & Facturation](#cost--billing)
- [Bonnes Pratiques](#best-practices)
- [Sujets avancés](#advanced-topics)

---

## Premiers pas

### Q : Qu'est-ce qu'Azure Developer CLI (azd) ?
**R** : Azure Developer CLI (azd) est un outil en ligne de commande centré sur les développeurs qui accélère le temps nécessaire pour faire passer votre application de l'environnement de développement local à Azure. Il offre des meilleures pratiques via des modèles et aide tout au long du cycle de vie du déploiement.

### Q : En quoi azd est-il différent de l'Azure CLI ?
**R** : 
- **Azure CLI** : Outil polyvalent pour gérer les ressources Azure
- **azd** : Outil destiné aux développeurs pour les workflows de déploiement d'applications
- azd dispose de son propre flux d'authentification et de déploiement ; Azure CLI est un outil séparé et complémentaire
- azd inclut des modèles, la gestion d'environnements et l'automatisation du déploiement

### Q : Ai-je besoin d'avoir Azure CLI installé pour utiliser azd ?
**R** : Pas pour le workflow principal AZD. Authentifiez-vous avec `azd auth login`. Installez Azure CLI séparément lorsqu'un hook de modèle ou un exercice exécute explicitement des commandes `az`.

### Q : Quels langages de programmation azd prend-il en charge ?
**R** : azd est indépendant du langage. Il fonctionne avec :
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Sites web statiques
- Applications containerisées

### Q : Puis-je utiliser azd avec des projets existants ?
**R** : Oui ! Vous pouvez soit :
1. Utiliser `azd init` pour ajouter la configuration azd aux projets existants
2. Adapter les projets existants pour correspondre à la structure des modèles azd
3. Créer des modèles personnalisés basés sur votre architecture existante

### Q : Qu'est-ce qui a changé avec la disponibilité générale de l'extension Foundry ?
**R** : Le bundle `microsoft.foundry` a atteint la version 1.0 et la disponibilité générale le 5 novembre 2026. Avec AZD 1.37.0+, utilisez `azd ext install microsoft.foundry` pour installer sept extensions principales pour agents, connexions, inspecteur, projets, routines, compétences et boîtes à outils. Ce n’est pas un nouvel espace de noms de commande, et ses composants sont versionnés indépendamment. Les évaluations, ensembles de données, l’affinage et les modèles personnalisés sont installés séparément ; les fonctionnalités en préversion optionnelles ne deviennent pas GA simplement parce que le bundle l’est.

La [démonstration de l’agent hébergé](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) utilise Python 3.13+ et uv actuel. `azd ai agent run` ouvre Agent Inspector localement, mais les appels modèle utilisent encore Azure et engendrent des frais. Le mode code `azd deploy` téléverse la source pour une compilation distante sans nécessiter de compilation locale dans un conteneur.

### Q : Est-ce que `azd down` supprime un agent hébergé d’un projet Foundry existant ?
**R** : Pas pour le chemin de projet réutilisé décrit dans le démarrage rapide de l’agent hébergé : il laisse le projet, l’agent hébergé et les autres ressources en place. Supprimez les ressources non désirées séparément sans supprimer les ressources partagées. Si l’environnement a créé un nouveau projet Foundry, `azd down` supprime son groupe de ressources et tout ce qu’il contient. Consultez les [instructions de nettoyage](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) et les confirmations de suppression avant de valider.

---

## Authentification & Accès

### Q : Comment m’authentifier avec Azure en utilisant azd ?
**R** : Utilisez `azd auth login` qui ouvrira une fenêtre de navigateur pour l’authentification Azure. Pour les scénarios CI/CD, utilisez les principaux de service ou identités gérées.

### Q : Puis-je utiliser azd avec plusieurs abonnements Azure ?
**R** : Oui. Utilisez `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` pour spécifier l’abonnement à utiliser pour chaque environnement.

### Q : Quelles autorisations sont nécessaires pour déployer avec azd ?
**R** : Typiquement, vous avez besoin de :
- Rôle **Contributeur** sur le groupe de ressources ou l’abonnement
- Rôle **Administrateur d’accès utilisateur** si vous déployez des ressources nécessitant des attributions de rôle
- Les permissions spécifiques varient selon le modèle et les ressources déployées

### Q : Puis-je utiliser azd dans les pipelines CI/CD ?
**R** : Absolument ! azd est conçu pour l’intégration CI/CD. Utilisez des principaux de service pour l’authentification et configurez les variables d’environnement pour la configuration.

### Q : Comment gérer l’authentification dans GitHub Actions ?
**R** : Préférez la fédération d’identité par charge de travail (OIDC), configurée avec `azd pipeline config`. Le workflow généré installe AZD et authentifie AZD directement avec une identité fédérée. Une étape `azure/login` seule n’établit pas une connexion AZD. Une étape de connexion dans un job existant est :
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

Provisionnez ou déployez après la connexion, avec l’environnement AZD, l’abonnement et l’emplacement configurés comme prévu. La preuve d’identité fédérée doit faire confiance au dépôt/référence du workflow ou à l’environnement GitHub, et les rôles Azure doivent permettre les opérations requises.

---

## Modèles & Projets

### Q : Où puis-je trouver des modèles azd ?
**R** : 
- Modèles officiels et communautaires : [Awesome AZD](https://azure.github.io/awesome-azd/)
- Modèles communautaires : recherche GitHub pour "azd-template"
- Utilisez `azd template list` pour parcourir les modèles disponibles

### Q : Comment créer un modèle personnalisé ?
**R** : 
1. Commencez avec une structure de modèle existante
2. Modifiez `azure.yaml`, les fichiers d’infrastructure et le code applicatif
3. Testez minutieusement avec `azd up`
4. Publiez sur GitHub avec les tags appropriés

### Q : Puis-je utiliser azd sans modèle ?
**R** : Oui, utilisez `azd init` dans un projet existant pour créer les fichiers de configuration nécessaires. Vous devrez configurer manuellement `azure.yaml` et les fichiers d’infrastructure.

### Q : Quelle est la différence entre les modèles officiels et communautaires ?
**R** : 
- **Modèles officiels** : Maintenus par Microsoft, régulièrement mis à jour, documentation complète
- **Modèles communautaires** : Créés par des développeurs, peuvent avoir des cas d’usage spécialisés, qualité et maintenance variables

### Q : Comment mettre à jour un modèle dans mon projet ?
**R** : Les modèles ne sont pas mis à jour automatiquement. Vous pouvez :
1. Comparer et fusionner manuellement les changements du modèle source
2. Repartir de zéro avec `azd init` en utilisant le modèle mis à jour
3. Sélectionner des améliorations spécifiques dans les modèles mis à jour

---

## Déploiement & Infrastructure

### Q : Quels services Azure azd peut-il déployer ?
**R** : azd peut déployer n’importe quel service Azure via des modèles Bicep/ARM, notamment :
- App Services, Container Apps, Functions
- Bases de données (SQL, PostgreSQL, Cosmos DB)
- Stockage, Key Vault, Application Insights
- Réseau, sécurité et ressources de surveillance

### Q : Puis-je déployer dans plusieurs régions ?
**R** : Oui, configurez plusieurs régions dans vos modèles Bicep et définissez le paramètre d’emplacement approprié pour chaque environnement.

### Q : Comment gérer les migrations de schéma de base de données ?
**R** : Utilisez les hooks de déploiement dans `azure.yaml` :
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### Q : Puis-je déployer uniquement l’infrastructure sans les applications ?
**R** : Oui, utilisez `azd provision` pour déployer uniquement les composants d’infrastructure définis dans vos modèles.

### Q : Comment déployer vers des ressources Azure existantes ?
**R** : Oui, si le modèle le prend en charge. Référencez les ressources existantes avec les déclarations `existing` de Bicep ou les paramètres documentés de ressources existantes du modèle, et mappez les services applicatifs vers leurs cibles prévues. Cela n’importe pas la propriété ni ne crée automatiquement les permissions manquantes. Examinez le modèle avant le déploiement.

### Q : Puis-je utiliser Terraform au lieu de Bicep ?
**R** : Oui. AZD prend en charge Terraform ainsi que Bicep. Sélectionnez un modèle basé sur Terraform ou configurez `infra.provider: terraform` dans `azure.yaml`, avec les fichiers Terraform appropriés et la configuration d’état/backend. Voir le [workflow Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Configuration & Environnements

### Q : Comment gérer différents environnements (dev, staging, prod) ?
**R** : Créez des environnements séparés avec `azd env new <environment-name>` et configurez différents réglages pour chacun :
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q : Où sont stockées les configurations d’environnement ?
**R** : Dans le dossier `.azure` dans votre répertoire de projet. Chaque environnement a son propre dossier avec des fichiers de configuration.

### Q : Comment définir une configuration spécifique à un environnement ?
**R** : Utilisez `azd env set` pour configurer des variables d’environnement :
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q : Puis-je partager les configurations d’environnement entre les membres de l’équipe ?
**R** : Le dossier `.azure` contient des informations sensibles et ne doit pas être soumis au contrôle de version. Au lieu de cela :
1. Documentez les variables d’environnement requises
2. Utilisez des scripts de déploiement pour configurer les environnements
3. Utilisez Azure Key Vault pour les configurations sensibles

### Q : Comment surcharger les valeurs par défaut du modèle ?
**R** : Définissez des variables d’environnement correspondant aux paramètres du modèle :
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Seules les variables utilisées par le modèle impactent le déploiement. `SKU_NAME` ci-dessus est un exemple d’entrée personnalisée, pas un réglage AZD universel.

---

## Résolution des problèmes

### Q : Pourquoi `azd up` échoue-t-il ?
**R** : Causes courantes :
1. **Problèmes d’authentification** : Exécutez `azd auth login`
2. **Permissions insuffisantes** : Vérifiez vos attributions de rôle Azure
3. **Conflits de nommage des ressources** : Examinez la ressource en conflit et les paramètres de nommage du modèle ; créez un environnement séparé avec `azd env new` lorsque l’isolation est nécessaire
4. **Problèmes de quota/capacité** : Vérifiez la disponibilité régionale
5. **Erreurs dans le modèle** : Validez les modèles Bicep

### Q : Comment déboguer les échecs de déploiement ?
**R** : 
1. Utilisez `azd deploy --debug` pour une sortie détaillée
2. Vérifiez l’historique des déploiements dans le portail Azure
3. Consultez le journal d’activité dans le portail Azure
4. Utilisez `azd show` pour afficher l’état actuel de l’environnement

### Q : Pourquoi mes variables d’environnement ne fonctionnent-elles pas ?
**R** : Vérifiez :
1. Les noms des variables correspondent exactement aux paramètres du modèle
2. Les valeurs sont correctement citées si elles contiennent des espaces
3. L’environnement est sélectionné : `azd env select <environment>`
4. Les variables sont définies dans le bon environnement

### Q : Comment nettoyer les déploiements échoués ?
**R** : 
```bash
azd down
```
Examinez d’abord l’environnement sélectionné et la confirmation de suppression. Cela supprime les ressources Azure provisionnées, pas la configuration d’environnement locale `.azure`. `--purge` demande en plus la suppression définitive des ressources prises en charge en suppression douce, et peut être bloqué par la protection de rétention/purge ; ce n’est pas une étape habituelle de récupération.

### Q : Pourquoi mon application n’est-elle pas accessible après le déploiement ?
**R** : Vérifiez :
1. Le déploiement est bien terminé
2. L’application fonctionne (vérifiez les journaux dans le portail Azure)
3. Les groupes de sécurité réseau autorisent le trafic
4. Les domaines DNS/personalizés sont correctement configurés

---

## Coût & Facturation

### Q : Combien coûteront les déploiements azd ?
**R** : Les coûts dépendent de :
- Services Azure déployés
- Paliers/SKUs de service sélectionnés
- Différences de tarification régionales
- Modèles d’utilisation

Utilisez le [Calculateur de Prix Azure](https://azure.microsoft.com/pricing/calculator/) pour des estimations.

### Q : Comment contrôler les coûts des déploiements azd ?
**R** : 
1. Utilisez des SKUs de gamme inférieure pour les environnements de développement
2. Configurez des budgets et alertes Azure
3. Utilisez `azd down` pour supprimer les ressources quand elles ne sont pas nécessaires
4. Choisissez des régions appropriées (les coûts varient selon l’emplacement)
5. Utilisez les outils Azure Cost Management

### Q : Existe-t-il des options gratuites pour les modèles azd ?
**R** : Certains services disposent de SKU gratuits ou de crédits mensuels, soumis à des conditions d’éligibilité, au plan d’hébergement, à la région et aux limites d’abonnement. Ceux-ci ne rendent pas un modèle entier gratuit : bases de données, recherche, réseau, registre, télémétrie et inférence de modèle peuvent entraîner des frais indépendamment. Vérifiez la [liste des services gratuits Azure](https://azure.microsoft.com/free/) et les tarifs actuels pour chaque ressource avant le déploiement.

### Q : Comment estimer les coûts avant le déploiement ?
**R** : 
1. Examinez le `main.bicep` du modèle pour voir quelles ressources sont créées
2. Utilisez le calculateur de tarification Azure avec des SKU spécifiques
3. Déployez d’abord dans un environnement de développement pour surveiller les coûts réels
4. Utilisez Azure Cost Management pour une analyse détaillée des coûts

---

## Bonnes pratiques

### Q : Quelles sont les bonnes pratiques pour la structure d’un projet azd ?
**R** : 
1. Séparez le code applicatif de l’infrastructure
2. Utilisez des noms de service significatifs dans `azure.yaml`
3. Implémentez une gestion adéquate des erreurs dans les scripts de build
4. Utilisez une configuration spécifique à l’environnement
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
2. Référencez les secrets du Key Vault dans la configuration applicative
3. Ne jamais commiter les secrets dans le contrôle de version
4. Utilisez des identités gérées pour l’authentification service-à-service

### Q : Quelle est la méthode recommandée pour CI/CD avec azd ?
**R** : 
1. Utilisez des environnements séparés pour chaque étape (dev/staging/prod)
2. Implémentez des tests automatisés avant le déploiement
3. Utilisez des principals de service pour l’authentification
4. Stockez la configuration sensible dans les secrets/variables du pipeline
5. Implémentez des étapes d’approbation pour les déploiements en production

---

## Sujets avancés

### Q : Puis-je étendre azd avec des fonctionnalités personnalisées ?
**R** : Oui, via des hooks de déploiement dans `azure.yaml` :
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q : Comment intégrer azd avec des processus DevOps existants ?
**R** : 
1. Utilisez les commandes azd dans les scripts des pipelines existants
2. Standardisez les modèles azd au sein des équipes
3. Intégrez la surveillance et les alertes existantes
4. Utilisez la sortie JSON d’azd pour l’intégration dans les pipelines

### Q : Puis-je utiliser azd avec Azure DevOps ?
**R** : Oui, azd fonctionne avec tout système CI/CD. Créez des pipelines Azure DevOps qui utilisent les commandes azd.

### Q : Comment contribuer à azd ou créer des modèles communautaires ?
**R** : 
1. **Outil azd** : Contribuez à [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Modèles** : Suivez les [instructions de contribution à la galerie Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Documentation** : Contribuez à la documentation sur [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q : Quelle est la feuille de route d’azd ?
**R** : Consultez la [feuille de route officielle](https://github.com/Azure/azure-dev/projects) pour les fonctionnalités prévues et les améliorations.

### Q : Comment migrer d’autres outils de déploiement vers azd ?
**R** : 
1. Analysez l’architecture de déploiement actuelle
2. Créez des modèles Bicep équivalents
3. Configurez `azure.yaml` pour correspondre aux services actuels
4. Testez minutieusement dans l’environnement de développement
5. Migrez les environnements progressivement

---

## Vous avez encore des questions ?

### **Cherchez d’abord**
- Consultez la [documentation officielle](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Recherchez [les issues GitHub](https://github.com/Azure/azure-dev/issues) pour des problèmes similaires

### **Obtenez de l’aide**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Support communautaire
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Questions techniques
- [Azure Discord](https://discord.gg/azure) - Chat communautaire en temps réel

### **Signalez les problèmes**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Rapports de bugs et demandes de fonctionnalités
- Incluez les logs pertinents, messages d’erreur et étapes pour reproduire

### **En savoir plus**
- [Documentation Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Conseils techniques révisés : 4 novembre 2026. La disponibilité cloud et les tarifs doivent être vérifiés pour votre abonnement et votre région.*

---

**Navigation**
- **Leçon précédente** : [Glossaire](glossary.md)
- **Leçon suivante** : [Guide d'étude](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->