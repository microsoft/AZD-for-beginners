<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-09T17:49:20+00:00",
  "source_file": "resources/faq.md",
  "language_code": "fr"
}
-->
# Questions Fréquemment Posées (FAQ)

## Introduction

Cette FAQ complète fournit des réponses aux questions les plus courantes sur Azure Developer CLI (azd) et les déploiements Azure. Trouvez des solutions rapides aux problèmes courants, comprenez les meilleures pratiques et obtenez des clarifications sur les concepts et workflows d'azd.

## Objectifs d'apprentissage

En consultant cette FAQ, vous pourrez :
- Trouver des réponses rapides aux questions et problèmes courants liés à Azure Developer CLI
- Comprendre les concepts et la terminologie clés grâce à un format de questions-réponses pratique
- Accéder à des solutions de dépannage pour des problèmes fréquents et des scénarios d'erreurs
- Apprendre les meilleures pratiques à travers des questions courantes sur l'optimisation
- Découvrir des fonctionnalités avancées et des capacités grâce à des questions de niveau expert
- Référencer efficacement des conseils sur les coûts, la sécurité et les stratégies de déploiement

## Résultats d'apprentissage

En vous référant régulièrement à cette FAQ, vous serez capable de :
- Résoudre de manière autonome les problèmes courants liés à Azure Developer CLI en utilisant les solutions fournies
- Prendre des décisions éclairées sur les stratégies et configurations de déploiement
- Comprendre la relation entre azd et les autres outils et services Azure
- Appliquer les meilleures pratiques basées sur l'expérience de la communauté et les recommandations d'experts
- Dépanner efficacement les problèmes d'authentification, de déploiement et de configuration
- Optimiser les coûts et les performances grâce aux informations et recommandations de la FAQ

## Table des matières

- [Premiers Pas](../../../resources)
- [Authentification & Accès](../../../resources)
- [Templates & Projets](../../../resources)
- [Déploiement & Infrastructure](../../../resources)
- [Configuration & Environnements](../../../resources)
- [Dépannage](../../../resources)
- [Coûts & Facturation](../../../resources)
- [Meilleures Pratiques](../../../resources)
- [Sujets Avancés](../../../resources)

---

## Premiers Pas

### Q : Qu'est-ce qu'Azure Developer CLI (azd) ?
**R** : Azure Developer CLI (azd) est un outil en ligne de commande centré sur les développeurs qui accélère le temps nécessaire pour passer de l'environnement de développement local à Azure. Il fournit des meilleures pratiques via des templates et aide avec tout le cycle de vie du déploiement.

### Q : En quoi azd est-il différent d'Azure CLI ?
**R** : 
- **Azure CLI** : Outil polyvalent pour gérer les ressources Azure
- **azd** : Outil axé sur les développeurs pour les workflows de déploiement d'applications
- azd utilise Azure CLI en interne mais offre des abstractions de haut niveau pour les scénarios de développement courants
- azd inclut des templates, la gestion des environnements et l'automatisation des déploiements

### Q : Dois-je installer Azure CLI pour utiliser azd ?
**R** : Oui, azd nécessite Azure CLI pour l'authentification et certaines opérations. Installez Azure CLI en premier, puis installez azd.

### Q : Quels langages de programmation azd prend-il en charge ?
**R** : azd est indépendant du langage. Il fonctionne avec :
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Sites web statiques
- Applications conteneurisées

### Q : Puis-je utiliser azd avec des projets existants ?
**R** : Oui ! Vous pouvez :
1. Utiliser `azd init` pour ajouter une configuration azd à des projets existants
2. Adapter des projets existants pour correspondre à la structure des templates azd
3. Créer des templates personnalisés basés sur votre architecture existante

---

## Authentification & Accès

### Q : Comment m'authentifier avec Azure en utilisant azd ?
**R** : Utilisez `azd auth login`, qui ouvrira une fenêtre de navigateur pour l'authentification Azure. Pour les scénarios CI/CD, utilisez des principaux de service ou des identités managées.

### Q : Puis-je utiliser azd avec plusieurs abonnements Azure ?
**R** : Oui. Utilisez `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` pour spécifier quel abonnement utiliser pour chaque environnement.

### Q : Quels sont les droits nécessaires pour déployer avec azd ?
**R** : En général, vous avez besoin de :
- Rôle **Contributeur** sur le groupe de ressources ou l'abonnement
- **Administrateur d'accès utilisateur** si vous déployez des ressources nécessitant des affectations de rôle
- Les permissions spécifiques varient selon le template et les ressources déployées

### Q : Puis-je utiliser azd dans des pipelines CI/CD ?
**R** : Absolument ! azd est conçu pour l'intégration CI/CD. Utilisez des principaux de service pour l'authentification et configurez des variables d'environnement.

### Q : Comment gérer l'authentification dans GitHub Actions ?
**R** : Utilisez l'action Azure Login avec des identifiants de principal de service :
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projets

### Q : Où puis-je trouver des templates azd ?
**R** : 
- Templates officiels : [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Templates communautaires : Recherche GitHub pour "azd-template"
- Utilisez `azd template list` pour parcourir les templates disponibles

### Q : Comment créer un template personnalisé ?
**R** : 
1. Commencez avec la structure d'un template existant
2. Modifiez `azure.yaml`, les fichiers d'infrastructure et le code de l'application
3. Testez minutieusement avec `azd up`
4. Publiez sur GitHub avec les balises appropriées

### Q : Puis-je utiliser azd sans template ?
**R** : Oui, utilisez `azd init` dans un projet existant pour créer les fichiers de configuration nécessaires. Vous devrez configurer manuellement `azure.yaml` et les fichiers d'infrastructure.

### Q : Quelle est la différence entre les templates officiels et communautaires ?
**R** : 
- **Templates officiels** : Maintenus par Microsoft, régulièrement mis à jour, documentation complète
- **Templates communautaires** : Créés par des développeurs, peuvent avoir des cas d'utilisation spécialisés, qualité et maintenance variables

### Q : Comment mettre à jour un template dans mon projet ?
**R** : Les templates ne sont pas mis à jour automatiquement. Vous pouvez :
1. Comparer et fusionner manuellement les modifications du template source
2. Recommencer avec `azd init` en utilisant le template mis à jour
3. Sélectionner des améliorations spécifiques des templates mis à jour

---

## Déploiement & Infrastructure

### Q : Quels services Azure azd peut-il déployer ?
**R** : azd peut déployer n'importe quel service Azure via des templates Bicep/ARM, notamment :
- App Services, Container Apps, Functions
- Bases de données (SQL, PostgreSQL, Cosmos DB)
- Stockage, Key Vault, Application Insights
- Ressources de réseau, sécurité et surveillance

### Q : Puis-je déployer dans plusieurs régions ?
**R** : Oui, configurez plusieurs régions dans vos templates Bicep et définissez le paramètre de localisation de manière appropriée pour chaque environnement.

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
**R** : Oui, utilisez `azd provision` pour déployer uniquement les composants d'infrastructure définis dans vos templates.

### Q : Comment déployer sur des ressources Azure existantes ?
**R** : Cela est complexe et n'est pas directement pris en charge. Vous pouvez :
1. Importer des ressources existantes dans vos templates Bicep
2. Utiliser des références de ressources existantes dans les templates
3. Modifier les templates pour créer ou référencer conditionnellement des ressources

### Q : Puis-je utiliser Terraform au lieu de Bicep ?
**R** : Actuellement, azd prend principalement en charge les templates Bicep/ARM. Le support Terraform n'est pas officiellement disponible, bien que des solutions communautaires puissent exister.

---

## Configuration & Environnements

### Q : Comment gérer différents environnements (dev, staging, prod) ?
**R** : Créez des environnements séparés avec `azd env new <environment-name>` et configurez des paramètres différents pour chacun :
```bash
azd env new development
azd env new staging  
azd env new production
```

### Q : Où sont stockées les configurations d'environnement ?
**R** : Dans le dossier `.azure` de votre répertoire de projet. Chaque environnement a son propre dossier avec des fichiers de configuration.

### Q : Comment configurer des paramètres spécifiques à un environnement ?
**R** : Utilisez `azd env set` pour configurer des variables d'environnement :
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### Q : Puis-je partager les configurations d'environnement avec les membres de l'équipe ?
**R** : Le dossier `.azure` contient des informations sensibles et ne doit pas être ajouté au contrôle de version. À la place :
1. Documentez les variables d'environnement nécessaires
2. Utilisez des scripts de déploiement pour configurer les environnements
3. Utilisez Azure Key Vault pour les configurations sensibles

### Q : Comment remplacer les valeurs par défaut des templates ?
**R** : Configurez des variables d'environnement correspondant aux paramètres des templates :
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Dépannage

### Q : Pourquoi `azd up` échoue-t-il ?
**R** : Causes courantes :
1. **Problèmes d'authentification** : Exécutez `azd auth login`
2. **Permissions insuffisantes** : Vérifiez vos affectations de rôle Azure
3. **Conflits de nommage des ressources** : Modifiez AZURE_ENV_NAME
4. **Problèmes de quota/capacité** : Vérifiez la disponibilité régionale
5. **Erreurs de template** : Validez les templates Bicep

### Q : Comment déboguer les échecs de déploiement ?
**R** : 
1. Utilisez `azd deploy --debug` pour un affichage détaillé
2. Consultez l'historique des déploiements dans le portail Azure
3. Examinez le journal d'activité dans le portail Azure
4. Utilisez `azd show` pour afficher l'état actuel de l'environnement

### Q : Pourquoi mes variables d'environnement ne fonctionnent-elles pas ?
**R** : Vérifiez :
1. Les noms des variables correspondent exactement aux paramètres des templates
2. Les valeurs sont correctement entre guillemets si elles contiennent des espaces
3. L'environnement est sélectionné : `azd env select <environment>`
4. Les variables sont définies dans le bon environnement

### Q : Comment nettoyer les déploiements échoués ?
**R** : 
```bash
azd down --force --purge
```
Cela supprime toutes les ressources et la configuration de l'environnement.

### Q : Pourquoi mon application n'est-elle pas accessible après le déploiement ?
**R** : Vérifiez :
1. Le déploiement s'est terminé avec succès
2. L'application est en cours d'exécution (vérifiez les journaux dans le portail Azure)
3. Les groupes de sécurité réseau permettent le trafic
4. Les DNS/domaines personnalisés sont correctement configurés

---

## Coûts & Facturation

### Q : Combien coûteront les déploiements azd ?
**R** : Les coûts dépendent de :
- Services Azure déployés
- Niveaux/versions des services sélectionnés
- Différences de prix régionales
- Modèles d'utilisation

Utilisez le [Calculateur de prix Azure](https://azure.microsoft.com/pricing/calculator/) pour des estimations.

### Q : Comment contrôler les coûts des déploiements azd ?
**R** : 
1. Utilisez des versions de services de niveau inférieur pour les environnements de développement
2. Configurez des budgets et alertes Azure
3. Utilisez `azd down` pour supprimer les ressources lorsqu'elles ne sont pas nécessaires
4. Choisissez des régions appropriées (les coûts varient selon l'emplacement)
5. Utilisez les outils de gestion des coûts Azure

### Q : Existe-t-il des options de niveau gratuit pour les templates azd ?
**R** : De nombreux services Azure offrent des niveaux gratuits :
- App Service : Niveau gratuit disponible
- Azure Functions : 1M d'exécutions gratuites/mois
- Cosmos DB : Niveau gratuit avec 400 RU/s
- Application Insights : Premiers 5 Go/mois gratuits

Configurez les templates pour utiliser les niveaux gratuits lorsque disponibles.

### Q : Comment estimer les coûts avant le déploiement ?
**R** : 
1. Examinez le `main.bicep` du template pour voir quelles ressources sont créées
2. Utilisez le Calculateur de prix Azure avec des versions spécifiques
3. Déployez d'abord dans un environnement de développement pour surveiller les coûts réels
4. Utilisez la gestion des coûts Azure pour une analyse détaillée des coûts

---

## Meilleures Pratiques

### Q : Quelles sont les meilleures pratiques pour la structure des projets azd ?
**R** : 
1. Séparez le code de l'application de l'infrastructure
2. Utilisez des noms de services significatifs dans `azure.yaml`
3. Implémentez une gestion appropriée des erreurs dans les scripts de build
4. Configurez des paramètres spécifiques à chaque environnement
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

### Q : Dois-je ajouter le dossier `.azure` au contrôle de version ?
**R** : **Non !** Le dossier `.azure` contient des informations sensibles. Ajoutez-le à `.gitignore` :
```gitignore
.azure/
```

### Q : Comment gérer les secrets et les configurations sensibles ?
**R** : 
1. Utilisez Azure Key Vault pour les secrets
2. Référencez les secrets Key Vault dans la configuration de l'application
3. Ne jamais ajouter les secrets au contrôle de version
4. Utilisez des identités managées pour l'authentification entre services

### Q : Quelle est l'approche recommandée pour CI/CD avec azd ?
**R** : 
1. Utilisez des environnements séparés pour chaque étape (dev/staging/prod)
2. Implémentez des tests automatisés avant le déploiement
3. Utilisez des principaux de service pour l'authentification
4. Stockez les configurations sensibles dans les secrets/variables du pipeline
5. Implémentez des étapes d'approbation pour les déploiements en production

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

### Q : Comment intégrer azd dans des processus DevOps existants ?
**R** : 
1. Utilisez les commandes azd dans les scripts de pipeline existants
2. Standardisez les templates azd au sein des équipes
3. Intégrez avec la surveillance et les alertes existantes
4. Utilisez la sortie JSON d'azd pour l'intégration dans les pipelines

### Q : Puis-je utiliser azd avec Azure DevOps ?
**R** : Oui, azd fonctionne avec n'importe quel système CI/CD. Créez des pipelines Azure DevOps qui utilisent les commandes azd.

### Q : Comment contribuer à azd ou créer des templates communautaires ?
**R** : 
1. **Outil azd** : Contribuez à [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates** : Créez des templates en suivant les [directives de template](https://github.com/Azure-Samples/awesome-azd)
3. **Documentation** : Contribuez à la documentation sur [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Q : Quel est le plan de développement pour azd ?
**R** : Consultez le [plan officiel](https://github.com/Azure/azure-dev/projects) pour les fonctionnalités et améliorations prévues.

### Q : Comment migrer d'autres outils de déploiement vers azd ?
**R** :
1. Analyser l'architecture actuelle de déploiement  
2. Créer des modèles Bicep équivalents  
3. Configurer `azure.yaml` pour correspondre aux services actuels  
4. Tester minutieusement dans l'environnement de développement  
5. Migrer progressivement les environnements  

---

## Vous avez encore des questions ?

### **Cherchez d'abord**  
- Consultez la [documentation officielle](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Recherchez des problèmes similaires dans les [issues GitHub](https://github.com/Azure/azure-dev/issues)  

### **Obtenez de l'aide**  
- [Discussions GitHub](https://github.com/Azure/azure-dev/discussions) - Support communautaire  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Questions techniques  
- [Azure Discord](https://discord.gg/azure) - Chat communautaire en temps réel  

### **Signalez des problèmes**  
- [Issues GitHub](https://github.com/Azure/azure-dev/issues/new) - Rapports de bugs et demandes de fonctionnalités  
- Incluez les journaux pertinents, les messages d'erreur et les étapes pour reproduire le problème  

### **En savoir plus**  
- [Documentation Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Centre d'architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Framework Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Cette FAQ est mise à jour régulièrement. Dernière mise à jour : 9 septembre 2025*  

---

**Navigation**  
- **Leçon précédente** : [Glossaire](glossary.md)  
- **Leçon suivante** : [Guide d'étude](study-guide.md)  

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de faire appel à une traduction professionnelle humaine. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.