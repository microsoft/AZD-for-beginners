<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8b26783231714a00efafee3aca8b233c",
  "translation_date": "2025-11-19T11:10:26+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "fr"
}
-->
# Atelier AI : Rendre vos solutions IA déployables avec AZD

**Navigation du chapitre :**
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 2 - Développement axé sur l'IA
- **⬅️ Précédent** : [Déploiement de modèles IA](ai-model-deployment.md)
- **➡️ Suivant** : [Meilleures pratiques pour l'IA en production](production-ai-practices.md)
- **🚀 Chapitre suivant** : [Chapitre 3 : Configuration](../getting-started/configuration.md)

## Aperçu de l'atelier

Ce laboratoire pratique guide les développeurs dans le processus de prise en main d'un modèle IA existant et de son déploiement à l'aide de l'Azure Developer CLI (AZD). Vous apprendrez les modèles essentiels pour les déploiements IA en production en utilisant les services Microsoft Foundry.

**Durée :** 2-3 heures  
**Niveau :** Intermédiaire  
**Prérequis :** Connaissances de base sur Azure, familiarité avec les concepts IA/ML

## 🎓 Objectifs d'apprentissage

À la fin de cet atelier, vous serez capable de :
- ✅ Convertir une application IA existante pour utiliser les modèles AZD
- ✅ Configurer les services Microsoft Foundry avec AZD
- ✅ Implémenter une gestion sécurisée des identifiants pour les services IA
- ✅ Déployer des applications IA prêtes pour la production avec surveillance
- ✅ Résoudre les problèmes courants liés au déploiement IA

## Prérequis

### Outils requis
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installé
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installé
- [Git](https://git-scm.com/) installé
- Éditeur de code (VS Code recommandé)

### Ressources Azure
- Abonnement Azure avec accès contributeur
- Accès aux services Azure OpenAI (ou capacité à demander l'accès)
- Permissions pour créer des groupes de ressources

### Connaissances requises
- Compréhension de base des services Azure
- Familiarité avec les interfaces en ligne de commande
- Concepts de base IA/ML (API, modèles, prompts)

## Configuration du laboratoire

### Étape 1 : Préparation de l'environnement

1. **Vérifiez l'installation des outils :**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Clonez le dépôt de l'atelier :**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1 : Comprendre la structure AZD pour les applications IA

### Anatomie d'un modèle AZD prêt pour l'IA

Explorez les fichiers clés dans un modèle AZD prêt pour l'IA :

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Exercice de laboratoire 1.1 : Explorer la configuration**

1. **Examinez le fichier azure.yaml :**
```bash
cat azure.yaml
```

**Ce qu'il faut rechercher :**
- Définitions des services pour les composants IA
- Mappages des variables d'environnement
- Configurations d'hébergement

2. **Passez en revue l'infrastructure main.bicep :**
```bash
cat infra/main.bicep
```

**Modèles IA clés à identifier :**
- Provisionnement du service Azure OpenAI
- Intégration Cognitive Search
- Gestion sécurisée des clés
- Configurations de sécurité réseau

### **Point de discussion : Pourquoi ces modèles sont importants pour l'IA**

- **Dépendances des services** : Les applications IA nécessitent souvent plusieurs services coordonnés
- **Sécurité** : Les clés API et les points de terminaison doivent être gérés de manière sécurisée
- **Évolutivité** : Les charges de travail IA ont des exigences uniques en matière de mise à l'échelle
- **Gestion des coûts** : Les services IA peuvent être coûteux s'ils ne sont pas correctement configurés

## Module 2 : Déployez votre première application IA

### Étape 2.1 : Initialiser l'environnement

1. **Créez un nouvel environnement AZD :**
```bash
azd env new myai-workshop
```

2. **Définissez les paramètres requis :**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Étape 2.2 : Déployer l'infrastructure et l'application

1. **Déployez avec AZD :**
```bash
azd up
```

**Ce qui se passe pendant `azd up` :**
- ✅ Provisionne le service Azure OpenAI
- ✅ Crée le service Cognitive Search
- ✅ Configure App Service pour l'application web
- ✅ Configure le réseau et la sécurité
- ✅ Déploie le code de l'application
- ✅ Configure la surveillance et la journalisation

2. **Surveillez la progression du déploiement** et notez les ressources créées.

### Étape 2.3 : Vérifiez votre déploiement

1. **Vérifiez les ressources déployées :**
```bash
azd show
```

2. **Ouvrez l'application déployée :**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testez les fonctionnalités IA :**
   - Accédez à l'application web
   - Essayez des requêtes d'exemple
   - Vérifiez que les réponses IA fonctionnent

### **Exercice de laboratoire 2.1 : Pratique de dépannage**

**Scénario** : Votre déploiement a réussi mais l'IA ne répond pas.

**Problèmes courants à vérifier :**
1. **Clés API OpenAI** : Vérifiez qu'elles sont correctement configurées
2. **Disponibilité du modèle** : Vérifiez si votre région prend en charge le modèle
3. **Connectivité réseau** : Assurez-vous que les services peuvent communiquer
4. **Permissions RBAC** : Vérifiez que l'application peut accéder à OpenAI

**Commandes de débogage :**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3 : Personnaliser les applications IA selon vos besoins

### Étape 3.1 : Modifier la configuration IA

1. **Mettez à jour le modèle OpenAI :**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Ajoutez des services IA supplémentaires :**

Modifiez `infra/main.bicep` pour ajouter Document Intelligence :

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Étape 3.2 : Configurations spécifiques à l'environnement

**Meilleure pratique** : Configurations différentes pour le développement et la production.

1. **Créez un environnement de production :**
```bash
azd env new myai-production
```

2. **Définissez des paramètres spécifiques à la production :**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Exercice de laboratoire 3.1 : Optimisation des coûts**

**Défi** : Configurez le modèle pour un développement économique.

**Tâches :**
1. Identifiez les SKUs pouvant être configurés en niveaux gratuits/de base
2. Configurez les variables d'environnement pour minimiser les coûts
3. Déployez et comparez les coûts avec la configuration de production

**Astuces pour la solution :**
- Utilisez le niveau F0 (gratuit) pour les services cognitifs lorsque possible
- Utilisez le niveau Basic pour le service de recherche en développement
- Envisagez d'utiliser le plan Consumption pour les fonctions

## Module 4 : Sécurité et meilleures pratiques en production

### Étape 4.1 : Gestion sécurisée des identifiants

**Défi actuel** : De nombreuses applications IA codent en dur les clés API ou utilisent un stockage non sécurisé.

**Solution AZD** : Intégration Managed Identity + Key Vault.

1. **Passez en revue la configuration de sécurité dans votre modèle :**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Vérifiez que Managed Identity fonctionne :**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Étape 4.2 : Sécurité réseau

1. **Activez les points de terminaison privés** (si ce n'est pas déjà configuré) :

Ajoutez à votre modèle bicep :
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Étape 4.3 : Surveillance et observabilité

1. **Configurez Application Insights :**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Configurez une surveillance spécifique à l'IA :**

Ajoutez des métriques personnalisées pour les opérations IA :
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Exercice de laboratoire 4.1 : Audit de sécurité**

**Tâche** : Passez en revue votre déploiement pour les meilleures pratiques de sécurité.

**Liste de contrôle :**
- [ ] Pas de secrets codés en dur dans le code ou la configuration
- [ ] Managed Identity utilisé pour l'authentification entre services
- [ ] Key Vault stocke les configurations sensibles
- [ ] L'accès réseau est correctement restreint
- [ ] La surveillance et la journalisation sont activées

## Module 5 : Convertir votre propre application IA

### Étape 5.1 : Fiche d'évaluation

**Avant de convertir votre application**, répondez à ces questions :

1. **Architecture de l'application :**
   - Quels services IA votre application utilise-t-elle ?
   - Quels ressources de calcul sont nécessaires ?
   - Nécessite-t-elle une base de données ?
   - Quelles sont les dépendances entre les services ?

2. **Exigences de sécurité :**
   - Quelles données sensibles votre application traite-t-elle ?
   - Quelles exigences de conformité avez-vous ?
   - Avez-vous besoin d'un réseau privé ?

3. **Exigences de mise à l'échelle :**
   - Quelle est votre charge attendue ?
   - Avez-vous besoin d'une mise à l'échelle automatique ?
   - Y a-t-il des exigences régionales ?

### Étape 5.2 : Créez votre modèle AZD

**Suivez ce modèle pour convertir votre application :**

1. **Créez la structure de base :**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal
```

2. **Créez azure.yaml :**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Créez des modèles d'infrastructure :**

**infra/main.bicep** - Modèle principal :
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - Module OpenAI :
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Exercice de laboratoire 5.1 : Défi de création de modèle**

**Défi** : Créez un modèle AZD pour une application IA de traitement de documents.

**Exigences :**
- Azure OpenAI pour l'analyse de contenu
- Document Intelligence pour l'OCR
- Compte de stockage pour les téléchargements de documents
- Function App pour la logique de traitement
- Application web pour l'interface utilisateur

**Points bonus :**
- Ajoutez une gestion des erreurs appropriée
- Incluez une estimation des coûts
- Configurez des tableaux de bord de surveillance

## Module 6 : Résolution des problèmes courants

### Problèmes courants de déploiement

#### Problème 1 : Quota du service OpenAI dépassé
**Symptômes :** Échec du déploiement avec une erreur de quota
**Solutions :**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Problème 2 : Modèle non disponible dans la région
**Symptômes :** Échec des réponses IA ou erreurs de déploiement du modèle
**Solutions :**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problème 3 : Problèmes de permissions
**Symptômes :** Erreurs 403 Forbidden lors de l'appel des services IA
**Solutions :**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problèmes de performance

#### Problème 4 : Réponses IA lentes
**Étapes d'investigation :**
1. Vérifiez les métriques de performance dans Application Insights
2. Passez en revue les métriques du service OpenAI dans le portail Azure
3. Vérifiez la connectivité réseau et la latence

**Solutions :**
- Implémentez la mise en cache pour les requêtes courantes
- Utilisez le modèle OpenAI approprié pour votre cas d'utilisation
- Envisagez des réplicas de lecture pour les scénarios de forte charge

### **Exercice de laboratoire 6.1 : Défi de débogage**

**Scénario** : Votre déploiement a réussi, mais l'application retourne des erreurs 500.

**Tâches de débogage :**
1. Vérifiez les journaux de l'application
2. Vérifiez la connectivité des services
3. Testez l'authentification
4. Passez en revue la configuration

**Outils à utiliser :**
- `azd show` pour un aperçu du déploiement
- Portail Azure pour les journaux détaillés des services
- Application Insights pour la télémétrie de l'application

## Module 7 : Surveillance et optimisation

### Étape 7.1 : Configurez une surveillance complète

1. **Créez des tableaux de bord personnalisés :**

Accédez au portail Azure et créez un tableau de bord avec :
- Nombre de requêtes OpenAI et latence
- Taux d'erreurs de l'application
- Utilisation des ressources
- Suivi des coûts

2. **Configurez des alertes :**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Étape 7.2 : Optimisation des coûts

1. **Analysez les coûts actuels :**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implémentez des contrôles de coûts :**
- Configurez des alertes budgétaires
- Utilisez des politiques de mise à l'échelle automatique
- Implémentez la mise en cache des requêtes
- Surveillez l'utilisation des tokens pour OpenAI

### **Exercice de laboratoire 7.1 : Optimisation des performances**

**Tâche** : Optimisez votre application IA pour la performance et les coûts.

**Métriques à améliorer :**
- Réduisez le temps de réponse moyen de 20 %
- Réduisez les coûts mensuels de 15 %
- Maintenez une disponibilité de 99,9 %

**Stratégies à essayer :**
- Implémentez la mise en cache des réponses
- Optimisez les prompts pour l'efficacité des tokens
- Utilisez les SKUs de calcul appropriés
- Configurez une mise à l'échelle automatique adéquate

## Défi final : Implémentation de bout en bout

### Scénario de défi

Vous êtes chargé de créer un chatbot de service client alimenté par l'IA, prêt pour la production, avec les exigences suivantes :

**Exigences fonctionnelles :**
- Interface web pour les interactions clients
- Intégration avec Azure OpenAI pour les réponses
- Capacité de recherche documentaire via Cognitive Search
- Intégration avec une base de données client existante
- Support multilingue

**Exigences non fonctionnelles :**
- Gérer 1000 utilisateurs simultanés
- SLA de disponibilité de 99,9 %
- Conformité SOC 2
- Coût inférieur à 500 $/mois
- Déploiement dans plusieurs environnements (dev, staging, prod)

### Étapes d'implémentation

1. **Concevez l'architecture**
2. **Créez le modèle AZD**
3. **Implémentez les mesures de sécurité**
4. **Configurez la surveillance et les alertes**
5. **Créez des pipelines de déploiement**
6. **Documentez la solution**

### Critères d'évaluation

- ✅ **Fonctionnalité** : Répond-elle à toutes les exigences ?
- ✅ **Sécurité** : Les meilleures pratiques sont-elles mises en œuvre ?
- ✅ **Évolutivité** : Peut-elle gérer la charge ?
- ✅ **Maintenabilité** : Le code et l'infrastructure sont-ils bien organisés ?
- ✅ **Coût** : Respecte-t-elle le budget ?

## Ressources supplémentaires

### Documentation Microsoft
- [Documentation Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentation Azure OpenAI Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentation Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Modèles d'exemple
- [Application de chat Azure OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Quickstart Application de chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ressources communautaires
- [Discord Microsoft Foundry](https://discord.gg/microsoft-azure)
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Templates AZD exceptionnels](https://azure.github.io/awesome-azd/)

## 🎓 Certificat de réussite
Félicitations ! Vous avez terminé le laboratoire de l'atelier sur l'IA. Vous devriez maintenant être capable de :

- ✅ Convertir des applications d'IA existantes en modèles AZD
- ✅ Déployer des applications d'IA prêtes pour la production
- ✅ Mettre en œuvre les meilleures pratiques de sécurité pour les charges de travail d'IA
- ✅ Surveiller et optimiser les performances des applications d'IA
- ✅ Résoudre les problèmes courants de déploiement

### Prochaines étapes
1. Appliquez ces modèles à vos propres projets d'IA
2. Contribuez des modèles à la communauté
3. Rejoignez le Discord Microsoft Foundry pour un support continu
4. Explorez des sujets avancés comme les déploiements multi-régions

---

**Retour sur l'atelier** : Aidez-nous à améliorer cet atelier en partageant votre expérience dans le [canal #Azure du Discord Microsoft Foundry](https://discord.gg/microsoft-azure).

---

**Navigation des chapitres :**
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 2 - Développement axé sur l'IA
- **⬅️ Précédent** : [Déploiement de modèles d'IA](ai-model-deployment.md)
- **➡️ Suivant** : [Meilleures pratiques pour l'IA en production](production-ai-practices.md)
- **🚀 Chapitre suivant** : [Chapitre 3 : Configuration](../getting-started/configuration.md)

**Besoin d'aide ?** Rejoignez notre communauté pour obtenir du support et discuter des déploiements AZD et d'IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction professionnelle humaine. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->