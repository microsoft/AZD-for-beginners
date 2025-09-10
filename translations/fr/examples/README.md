<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:00:21+00:00",
  "source_file": "examples/README.md",
  "language_code": "fr"
}
-->
# Exemples - Modèles et configurations pratiques AZD

## Introduction

Ce répertoire contient des exemples pratiques, des modèles et des scénarios réels pour vous aider à apprendre Azure Developer CLI grâce à une pratique concrète. Chaque exemple fournit du code fonctionnel complet, des modèles d'infrastructure et des instructions détaillées pour différentes architectures d'applications et modèles de déploiement.

## Objectifs d'apprentissage

En travaillant sur ces exemples, vous allez :
- Pratiquer les workflows Azure Developer CLI avec des scénarios d'application réalistes
- Comprendre différentes architectures d'applications et leurs implémentations avec azd
- Maîtriser les modèles d'Infrastructure as Code pour divers services Azure
- Appliquer des stratégies de gestion de configuration et de déploiement spécifiques à l'environnement
- Mettre en œuvre des modèles de surveillance, de sécurité et de mise à l'échelle dans des contextes pratiques
- Acquérir de l'expérience en dépannage et en débogage de scénarios de déploiement réels

## Résultats d'apprentissage

Après avoir terminé ces exemples, vous serez capable de :
- Déployer différents types d'applications en toute confiance avec Azure Developer CLI
- Adapter les modèles fournis à vos propres besoins applicatifs
- Concevoir et implémenter des modèles d'infrastructure personnalisés avec Bicep
- Configurer des applications complexes multi-services avec des dépendances appropriées
- Appliquer les meilleures pratiques en matière de sécurité, de surveillance et de performance dans des scénarios réels
- Résoudre les problèmes et optimiser les déploiements grâce à une expérience pratique

## Structure du répertoire

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Exemples de démarrage rapide

### Pour débutants
1. **[Application Web simple](../../../examples/simple-web-app)** - Déployez une application web Node.js basique
2. **[Site web statique](../../../examples/static-website)** - Hébergez un site web statique sur Azure Storage
3. **[Application conteneurisée](../../../examples/container-app)** - Déployez une application conteneurisée

### Pour utilisateurs intermédiaires
4. **[Application avec base de données](../../../examples/database-app)** - Application web avec base de données PostgreSQL
5. **[Fonction sans serveur](../../../examples/serverless-function)** - Azure Functions avec déclencheurs HTTP
6. **[Microservices](../../../examples/microservices)** - Application multi-services avec passerelle API

## 📋 Instructions d'utilisation

### Exécution des exemples en local

1. **Cloner ou copier l'exemple**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Initialiser l'environnement AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Configurer l'environnement**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Déployer**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Adapter les exemples

Chaque exemple inclut :
- **README.md** - Instructions détaillées de configuration et de personnalisation
- **azure.yaml** - Configuration AZD avec commentaires
- **infra/** - Modèles Bicep avec explications des paramètres
- **src/** - Code d'application exemple
- **scripts/** - Scripts d'aide pour les tâches courantes

## 🎯 Objectifs d'apprentissage

### Catégories d'exemples

#### **Déploiements basiques**
- Applications mono-service
- Modèles d'infrastructure simples
- Gestion de configuration basique
- Configurations économiques pour le développement

#### **Scénarios avancés**
- Architectures multi-services
- Configurations réseau complexes
- Modèles d'intégration de bases de données
- Implémentations de sécurité et conformité

#### **Modèles prêts pour la production**
- Configurations haute disponibilité
- Surveillance et observabilité
- Intégration CI/CD
- Configurations de reprise après sinistre

## 📖 Descriptions des exemples

### Application Web simple
**Technologies** : Node.js, App Service, Application Insights  
**Complexité** : Débutant  
**Concepts** : Déploiement basique, variables d'environnement, vérifications de santé

### Site web statique
**Technologies** : HTML/CSS/JS, Storage Account, CDN  
**Complexité** : Débutant  
**Concepts** : Hébergement statique, intégration CDN, domaines personnalisés

### Application conteneurisée
**Technologies** : Docker, Container Apps, Container Registry  
**Complexité** : Intermédiaire  
**Concepts** : Conteneurisation, mise à l'échelle, configuration d'accès

### Application avec base de données
**Technologies** : Python Flask, PostgreSQL, App Service  
**Complexité** : Intermédiaire  
**Concepts** : Connexions à la base de données, gestion des secrets, migrations

### Fonction sans serveur
**Technologies** : Azure Functions, Cosmos DB, API Management  
**Complexité** : Intermédiaire  
**Concepts** : Architecture événementielle, bindings, gestion des API

### Microservices
**Technologies** : Services multiples, Service Bus, Passerelle API  
**Complexité** : Avancé  
**Concepts** : Communication entre services, file d'attente de messages, équilibrage de charge

## 🛠 Exemples de configuration

Le répertoire `configurations/` contient des composants réutilisables :

### Configurations d'environnement
- Paramètres pour l'environnement de développement
- Configurations pour l'environnement de staging
- Configurations prêtes pour la production
- Configurations de déploiement multi-régions

### Modules Bicep
- Composants d'infrastructure réutilisables
- Modèles de ressources courants
- Modèles sécurisés
- Configurations optimisées pour les coûts

### Scripts d'aide
- Automatisation de la configuration de l'environnement
- Scripts de migration de base de données
- Outils de validation de déploiement
- Utilitaires de surveillance des coûts

## 🔧 Guide de personnalisation

### Adapter les exemples à votre cas d'utilisation

1. **Vérifier les prérequis**
   - Vérifiez les exigences des services Azure
   - Confirmez les limites de votre abonnement
   - Comprenez les implications en termes de coûts

2. **Modifier la configuration**
   - Mettez à jour les définitions de service dans `azure.yaml`
   - Personnalisez les modèles Bicep
   - Ajustez les variables d'environnement

3. **Tester minutieusement**
   - Déployez d'abord dans l'environnement de développement
   - Validez la fonctionnalité
   - Testez la mise à l'échelle et les performances

4. **Revue de sécurité**
   - Vérifiez les contrôles d'accès
   - Implémentez la gestion des secrets
   - Activez la surveillance et les alertes

## 📊 Tableau comparatif

| Exemple | Services | Base de données | Authentification | Surveillance | Complexité |
|---------|----------|-----------------|------------------|--------------|------------|
| Application Web simple | 1 | ❌ | Basique | Basique | ⭐ |
| Site web statique | 1 | ❌ | ❌ | Basique | ⭐ |
| Application conteneurisée | 1 | ❌ | Basique | Complète | ⭐⭐ |
| Application avec base de données | 2 | ✅ | Complète | Complète | ⭐⭐⭐ |
| Fonction sans serveur | 3 | ✅ | Complète | Complète | ⭐⭐⭐ |
| Microservices | 5+ | ✅ | Complète | Complète | ⭐⭐⭐⭐ |

## 🎓 Parcours d'apprentissage

### Progression recommandée

1. **Commencez par l'application Web simple**
   - Apprenez les concepts de base d'AZD
   - Comprenez le workflow de déploiement
   - Pratiquez la gestion des environnements

2. **Essayez le site web statique**
   - Explorez différentes options d'hébergement
   - Apprenez l'intégration CDN
   - Comprenez la configuration DNS

3. **Passez à l'application conteneurisée**
   - Apprenez les bases de la conteneurisation
   - Comprenez les concepts de mise à l'échelle
   - Pratiquez avec Docker

4. **Ajoutez l'intégration de base de données**
   - Apprenez le provisionnement de bases de données
   - Comprenez les chaînes de connexion
   - Pratiquez la gestion des secrets

5. **Explorez les fonctions sans serveur**
   - Comprenez l'architecture événementielle
   - Apprenez les déclencheurs et bindings
   - Pratiquez avec les API

6. **Construisez des microservices**
   - Apprenez la communication entre services
   - Comprenez les systèmes distribués
   - Pratiquez les déploiements complexes

## 🔍 Trouver le bon exemple

### Par pile technologique
- **Node.js** : Application Web simple, Microservices
- **Python** : Application avec base de données, Fonction sans serveur
- **Sites statiques** : Site web statique
- **Conteneurs** : Application conteneurisée, Microservices
- **Bases de données** : Application avec base de données, Fonction sans serveur

### Par modèle d'architecture
- **Monolithique** : Application Web simple, Application avec base de données
- **Statique** : Site web statique
- **Microservices** : Exemple de microservices
- **Sans serveur** : Fonction sans serveur
- **Hybride** : Application conteneurisée

### Par niveau de complexité
- **Débutant** : Application Web simple, Site web statique
- **Intermédiaire** : Application conteneurisée, Application avec base de données, Fonction sans serveur  
- **Avancé** : Microservices

## 📚 Ressources supplémentaires

### Liens vers la documentation
- [Modèles AZD Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Documentation Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centre d'architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Exemples communautaires
- [Modèles AZD Azure Samples](https://github.com/Azure-Samples/azd-templates)
- [Modèles Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galerie Azure Developer CLI](https://azure.github.io/awesome-azd/)

### Meilleures pratiques
- [Framework Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Framework d'adoption du cloud](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Contribuer des exemples

Vous avez un exemple utile à partager ? Nous accueillons vos contributions !

### Directives de soumission
1. Suivez la structure de répertoire établie
2. Incluez un README.md complet
3. Ajoutez des commentaires aux fichiers de configuration
4. Testez minutieusement avant de soumettre
5. Incluez des estimations de coûts et des prérequis

### Structure de modèle d'exemple
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Astuce** : Commencez par l'exemple le plus simple correspondant à votre pile technologique, puis progressez graduellement vers des scénarios plus complexes. Chaque exemple s'appuie sur les concepts des précédents !

**Prochaines étapes** : 
- Choisissez un exemple correspondant à votre niveau de compétence
- Suivez les instructions de configuration dans le README de l'exemple
- Expérimentez avec des personnalisations
- Partagez vos apprentissages avec la communauté

---

**Navigation**
- **Leçon précédente** : [Guide d'étude](../resources/study-guide.md)
- **Retour à** : [README principal](../README.md)

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.