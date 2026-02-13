# Foire Aux Questions (FAQ)

**Obtenir de l'aide par chapitre**
- **📚 Accueil du cours** : [AZD Pour les débutants](../README.md)
- **🚆 Problèmes d'installation** : [Chapitre 1 : Installation et configuration](../docs/getting-started/installation.md)
- **🤖 Questions sur l'IA** : [Chapitre 2 : Développement axé IA](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Dépannage** : [Chapitre 7 : Dépannage et débogage](../docs/troubleshooting/common-issues.md)

## Introduction

Cette FAQ complète fournit des réponses aux questions les plus courantes concernant Azure Developer CLI (azd) et les déploiements Azure. Trouvez rapidement des solutions aux problèmes fréquents, comprenez les meilleures pratiques et obtenez des éclaircissements sur les concepts et workflows azd.

## Objectifs d'apprentissage

En consultant cette FAQ, vous allez :
- Trouver des réponses rapides aux questions et problèmes courants liés à Azure Developer CLI
- Comprendre les concepts clés et la terminologie à travers un format question-réponse pratique
- Accéder à des solutions de dépannage pour les problèmes et scénarios d'erreurs fréquents
- Apprendre les meilleures pratiques grâce aux questions fréquemment posées sur l'optimisation
- Découvrir des fonctionnalités avancées via des questions de niveau expert
- Consulter efficacement les conseils sur les coûts, la sécurité et la stratégie de déploiement

## Résultats d'apprentissage

En vous référant régulièrement à cette FAQ, vous serez capable de :
- Résoudre de manière autonome des problèmes courants d'Azure Developer CLI en utilisant les solutions fournies
- Prendre des décisions éclairées sur les stratégies et configurations de déploiement
- Comprendre la relation entre azd et d'autres outils et services Azure
- Appliquer les meilleures pratiques basées sur l'expérience communautaire et les recommandations d'experts
- Diagnostiquer efficacement les problèmes d'authentification, de déploiement et de configuration
- Optimiser les coûts et la performance en s'appuyant sur les conseils et recommandations de la FAQ

## Table des matières

- [Prise en main](../../../resources)
- [Authentification et accès](../../../resources)
- [Templates et projets](../../../resources)
- [Déploiement et infrastructure](../../../resources)
- [Configuration et environnements](../../../resources)
- [Dépannage](../../../resources)
- [Coûts et facturation](../../../resources)
- [Meilleures pratiques](../../../resources)
- [Sujets avancés](../../../resources)

---

## Prise en main

### Q : Qu'est-ce que Azure Developer CLI (azd) ?
**R** : Azure Developer CLI (azd) est un outil en ligne de commande centré sur le développeur qui accélère le temps nécessaire pour amener votre application de l'environnement de développement local à Azure. Il fournit les meilleures pratiques via des templates et aide tout au long du cycle de vie du déploiement.

### Q : En quoi azd diffère-t-il de Azure CLI ?
**R** : 
- **Azure CLI** : outil généraliste pour gérer les ressources Azure
- **azd** : outil axé sur les développeurs pour les workflows de déploiement d'application
- azd utilise Azure CLI en interne mais propose des abstractions de plus haut niveau pour les scénarios de développement courants
- azd inclut des templates, la gestion des environnements et l'automatisation du déploiement

### Q : Ai-je besoin d'installer Azure CLI pour utiliser azd ?
**R** : Oui, azd nécessite Azure CLI pour l'authentification et certaines opérations. Installez d'abord Azure CLI, puis azd.

### Q : Quels langages de programmation azd supporte-t-il ?
**R** : azd est agnostique au langage. Il fonctionne avec :
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Sites statiques
- Applications conteneurisées

### Q : Puis-je utiliser azd avec des projets existants ?
**R** : Oui ! Vous pouvez soit :
1. Utiliser `azd init` pour ajouter la configuration azd à des projets existants
2. Adapter les projets existants pour correspondre à la structure de template azd
3. Créer des templates personnalisés basés sur votre architecture actuelle

---

## Authentification et accès

### Q : Comment m'authentifier avec Azure en utilisant azd ?
**R** : Utilisez `azd auth login` qui ouvrira une fenêtre de navigateur pour l'authentification Azure. Pour les scénarios CI/CD, utilisez des principals de service ou des identités managées.

### Q : Puis-je utiliser azd avec plusieurs abonnements Azure ?
**R** : Oui. Utilisez `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` pour spécifier l’abonnement à utiliser pour chaque environnement.

### Q : Quelles permissions sont nécessaires pour déployer avec azd ?
**R** : En général, vous devez avoir :
- le rôle **Contributeur** sur le groupe de ressources ou l'abonnement
- le rôle **Administrateur d'accès utilisateur** si vous déployez des ressources nécessitant des affectations de rôle
- Les permissions spécifiques varient selon le template et les ressources déployées

### Q : Puis-je utiliser azd dans des pipelines CI/CD ?
**R** : Absolument ! azd est conçu pour l’intégration CI/CD. Utilisez des principals de service pour l’authentification et définissez des variables d’environnement pour la configuration.

### Q : Comment gérer l’authentification dans GitHub Actions ?
**R** : Utilisez l’action Azure Login avec les identifiants du principal de service :
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates et projets

### Q : Où puis-je trouver les templates azd ?
**R** : 
- Templates officiels : [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Templates communautaires : recherche GitHub pour "azd-template"
- Utilisez `azd template list` pour parcourir les templates disponibles

### Q : Comment créer un template personnalisé ?
**R** : 
1. Commencez avec une structure de template existante
2. Modifiez `azure.yaml`, les fichiers d'infrastructure et le code applicatif
3. Testez minutieusement avec `azd up`
4. Publiez sur GitHub avec les tags appropriés

### Q : Puis-je utiliser azd sans template ?
**R** : Oui, utilisez `azd init` dans un projet existant pour créer les fichiers de configuration nécessaires. Vous devrez configurer manuellement `azure.yaml` et les fichiers d’infrastructure.

### Q : Quelle est la différence entre les templates officiels et communautaires ?
**R** : 
- **Templates officiels** : maintenus par Microsoft, régulièrement mis à jour, documentation complète
- **Templates communautaires** : créés par des développeurs, peuvent avoir des cas d’usage spécifiques, qualité et maintenance variables

### Q : Comment mettre à jour un template dans mon projet ?
**R** : Les templates ne sont pas mis à jour automatiquement. Vous pouvez :
1. Comparer et fusionner manuellement les changements du template source
2. Repartir de zéro avec `azd init` en utilisant le template mis à jour
3. Sélectionner et appliquer des améliorations spécifiques des templates mis à jour

---

## Déploiement et infrastructure

### Q : Quels services Azure azd peut-il déployer ?
**R** : azd peut déployer n'importe quel service Azure via les templates Bicep/ARM, y compris :
- App Services, Container Apps, Functions
- Bases de données (SQL, PostgreSQL, Cosmos DB)
- Stockage, Key Vault, Application Insights
- Ressources réseaux, sécurité et surveillance

### Q : Puis-je déployer dans plusieurs régions ?
**R** : Oui, configurez plusieurs régions dans vos templates Bicep et définissez le paramètre de localisation adéquat pour chaque environnement.

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

### Q : Puis-je déployer uniquement l'infrastructure sans les applications ?
**R** : Oui, utilisez `azd provision` pour déployer seulement les composants d'infrastructure définis dans vos templates.

### Q : Comment déployer sur des ressources Azure existantes ?
**R** : Cela est complexe et non directement supporté. Vous pouvez :
1. Importer les ressources existantes dans vos templates Bicep
2. Utiliser des références aux ressources existantes dans les templates
3. Modifier les templates pour créer ou référencer conditionnellement les ressources

### Q : Puis-je utiliser Terraform à la place de Bicep ?
**R** : Actuellement, azd supporte principalement les templates Bicep/ARM. Le support Terraform n’est pas officiel, bien qu’il puisse exister des solutions communautaires.

---

## Configuration et environnements

### Q : Comment gérer différents environnements (dev, staging, prod) ?
**R** : Créez des environnements séparés avec `azd env new <environment-name>` et configurez des paramètres différents pour chacun :
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q : Où sont stockées les configurations d’environnement ?
**R** : Dans le dossier `.azure` à la racine de votre projet. Chaque environnement a son propre dossier avec des fichiers de configuration.

### Q : Comment définir une configuration spécifique à un environnement ?
**R** : Utilisez `azd env set` pour configurer les variables d’environnement :
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q : Puis-je partager les configurations d’environnement entre membres de l’équipe ?
**R** : Le dossier `.azure` contient des informations sensibles et ne doit pas être versionné. Au lieu de cela :
1. Documentez les variables d’environnement requises
2. Utilisez des scripts de déploiement pour configurer les environnements
3. Utilisez Azure Key Vault pour la configuration sensible

### Q : Comment remplacer les valeurs par défaut des templates ?
**R** : Définissez des variables d’environnement correspondant aux paramètres du template :
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Dépannage

### Q : Pourquoi `azd up` échoue ?
**R** : Causes courantes :
1. **Problèmes d’authentification** : Exécutez `azd auth login`
2. **Permissions insuffisantes** : Vérifiez vos affectations de rôle Azure
3. **Conflits de noms de ressources** : Modifiez AZURE_ENV_NAME
4. **Quotas/capacités** : Vérifiez la disponibilité régionale
5. **Erreurs de template** : Validez les templates Bicep

### Q : Comment déboguer les échecs de déploiement ?
**R** : 
1. Utilisez `azd deploy --debug` pour un affichage détaillé
2. Consultez l’historique des déploiements dans le portail Azure
3. Vérifiez le journal d’activité du portail Azure
4. Utilisez `azd show` pour afficher l’état actuel de l’environnement

### Q : Pourquoi mes variables d’environnement ne fonctionnent-elles pas ?
**R** : Vérifiez :
1. Que les noms des variables correspondent exactement aux paramètres du template
2. Que les valeurs sont bien citées si elles contiennent des espaces
3. Que l’environnement est sélectionné : `azd env select <environment>`
4. Que les variables sont définies dans le bon environnement

### Q : Comment nettoyer les déploiements échoués ?
**R** : 
```bash
azd down --force --purge
```
Cela supprime toutes les ressources et la configuration d’environnement.

### Q : Pourquoi mon application n’est-elle pas accessible après déploiement ?
**R** : Vérifiez :
1. Que le déploiement s’est terminé avec succès
2. Que l’application est en cours d’exécution (vérifiez les journaux dans le portail Azure)
3. Que les groupes de sécurité réseau autorisent le trafic
4. Que les DNS/domaines personnalisés sont correctement configurés

---

## Coûts et facturation

### Q : Combien coûtent les déploiements azd ?
**R** : Les coûts dépendent de :
- Services Azure déployés
- Niveaux/SKUs choisis
- Variations de tarifs régionaux
- Modes d’utilisation

Utilisez le [Calculateur de prix Azure](https://azure.microsoft.com/pricing/calculator/) pour des estimations.

### Q : Comment contrôler les coûts dans les déploiements azd ?
**R** : 
1. Utilisez des SKUs bas niveau pour les environnements de développement
2. Configurez des budgets Azure et des alertes
3. Utilisez `azd down` pour supprimer les ressources inutilisées
4. Choisissez des régions appropriées (les coûts varient selon la localisation)
5. Utilisez les outils Azure Cost Management

### Q : Existe-t-il des options de niveau gratuit pour les templates azd ?
**R** : Plusieurs services Azure proposent des paliers gratuits :
- App Service : palier gratuit disponible
- Azure Functions : 1 million d’exécutions gratuites par mois
- Cosmos DB : palier gratuit avec 400 RU/s
- Application Insights : 5 Go par mois gratuits

Configurez les templates pour utiliser les paliers gratuits lorsque disponibles.

### Q : Comment estimer les coûts avant déploiement ?
**R** : 
1. Consultez le `main.bicep` du template pour voir les ressources créées
2. Utilisez le Calculateur de prix Azure avec les SKUs spécifiques
3. Déployez d’abord dans un environnement de développement pour surveiller les coûts réels
4. Utilisez Azure Cost Management pour une analyse détaillée des coûts

---

## Meilleures pratiques

### Q : Quelles sont les meilleures pratiques pour la structure du projet azd ?
**R** : 
1. Séparez le code applicatif de l’infrastructure
2. Utilisez des noms de services significatifs dans `azure.yaml`
3. Implémentez une gestion d’erreurs appropriée dans les scripts de build
4. Utilisez une configuration spécifique à l’environnement
5. Incluez une documentation exhaustive

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

### Q : Dois-je valider le dossier `.azure` dans le contrôle de version ?
**R** : **Non !** Le dossier `.azure` contient des informations sensibles. Ajoutez-le à `.gitignore` :
```gitignore
.azure/
```

### Q : Comment gérer les secrets et la configuration sensible ?
**R** : 
1. Utilisez Azure Key Vault pour les secrets
2. Référencez les secrets Key Vault dans la configuration de l’application
3. Ne validez jamais les secrets dans le contrôle de version
4. Utilisez des identités managées pour l’authentification service-à-service

### Q : Quelle est l’approche recommandée pour CI/CD avec azd ?
**R** : 
1. Utilisez des environnements distincts pour chaque étape (dev/staging/prod)
2. Implémentez des tests automatisés avant déploiement
3. Utilisez des principals de service pour l’authentification
4. Stockez la configuration sensible dans les secrets/variables du pipeline
5. Implémentez des portes d’approbation pour les déploiements en production

---

## Sujets avancés

### Q : Puis-je étendre azd avec des fonctionnalités personnalisées ?
**R** : Oui, via les hooks de déploiement dans `azure.yaml` :
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### Q : Comment intégrer azd dans des processus DevOps existants ?
**R** : 
1. Utilisez les commandes azd dans les scripts de pipeline existants
2. Standardisez les templates azd au sein des équipes
3. Intégrez avec les systèmes de surveillance et d’alerte existants
4. Utilisez la sortie JSON d’azd pour l’intégration aux pipelines

### Q : Puis-je utiliser azd avec Azure DevOps ?
**R** : Oui, azd fonctionne avec tout système CI/CD. Créez des pipelines Azure DevOps utilisant les commandes azd.

### Q : Comment contribuer à azd ou créer des templates communautaires ?
**R** : 

1. **outil azd** : Contribuer à [Azure/azure-dev](https://github.com/Azure/azure-dev)  
2. **Modèles** : Créer des modèles en suivant les [directives de modèles](https://github.com/Azure-Samples/awesome-azd)  
3. **Documentation** : Contribuer aux docs sur [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)  

### Q : Quelle est la feuille de route pour azd ?  
**R** : Consultez la [feuille de route officielle](https://github.com/Azure/azure-dev/projects) pour les fonctionnalités et améliorations prévues.  

### Q : Comment migrer depuis d'autres outils de déploiement vers azd ?  
**R** :  
1. Analyser l'architecture de déploiement actuelle  
2. Créer des modèles Bicep équivalents  
3. Configurer `azure.yaml` pour correspondre aux services actuels  
4. Tester minutieusement dans l'environnement de développement  
5. Migrer progressivement les environnements  

---

## Vous avez encore des questions ?  

### **Cherchez d'abord**  
- Consultez la [documentation officielle](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Recherchez dans les [issues GitHub](https://github.com/Azure/azure-dev/issues) des problèmes similaires  

### **Obtenez de l'aide**  
- [Discussions GitHub](https://github.com/Azure/azure-dev/discussions) – Support communautaire  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) – Questions techniques  
- [Discord Azure](https://discord.gg/azure) – Chat communautaire en temps réel  

### **Signaler un problème**  
- [Issues GitHub](https://github.com/Azure/azure-dev/issues/new) – Rapports de bugs et demandes de fonctionnalités  
- Inclure les journaux pertinents, messages d’erreur et étapes pour reproduire  

### **En savoir plus**  
- [Documentation Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Centre d’architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Cadre Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Cette FAQ est régulièrement mise à jour. Dernière mise à jour : 9 septembre 2025*  

---

**Navigation**  
- **Leçon précédente** : [Glossaire](glossary.md)  
- **Leçon suivante** : [Guide d'étude](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d’assurer l’exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue natale doit être considéré comme la source faisant autorité. Pour les informations critiques, une traduction professionnelle réalisée par un traducteur humain est recommandée. Nous ne saurions être tenus responsables de tout malentendu ou mauvaise interprétation résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->