# Atelier pratique IA : Rendre vos solutions IA déployables avec AZD

**Chapter Navigation:**
- **📚 Accueil du cours**: [AZD For Beginners](../../README.md)
- **📖 Chapitre actuel**: Chapitre 2 - Développement axé IA
- **⬅️ Précédent**: [Déploiement de modèles IA](ai-model-deployment.md)
- **➡️ Suivant**: [Bonnes pratiques IA en production](production-ai-practices.md)
- **🚀 Chapitre suivant**: [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

## Aperçu de l'atelier

Ce laboratoire pratique guide les développeurs à travers le processus de prise d'un modèle IA existant et de son déploiement à l'aide d'Azure Developer CLI (AZD). Vous apprendrez des motifs essentiels pour les déploiements IA en production en utilisant les services Microsoft Foundry.

**Durée:** 2-3 heures  
**Niveau:** Intermédiaire  
**Prérequis:** Connaissances de base d'Azure, familiarité avec les concepts IA/ML

## 🎓 Objectifs d'apprentissage

À la fin de cet atelier, vous serez capable de :
- ✅ Convertir une application IA existante pour utiliser les modèles AZD
- ✅ Configurer les services Microsoft Foundry avec AZD
- ✅ Mettre en œuvre une gestion sécurisée des identifiants pour les services IA
- ✅ Déployer des applications IA prêtes pour la production avec surveillance
- ✅ Dépanner les problèmes courants de déploiement IA

## Prérequis

### Outils requis
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installé
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installé
- [Git](https://git-scm.com/) installé
- Éditeur de code (VS Code recommandé)

### Ressources Azure
- Abonnement Azure avec accès contributif
- Accès aux services Azure OpenAI (ou possibilité de demander l'accès)
- Permissions de création de groupe de ressources

### Connaissances préalables
- Compréhension de base des services Azure
- Familiarité avec les interfaces en ligne de commande
- Concepts de base IA/ML (APIs, modèles, prompts)

## Configuration du laboratoire

### Étape 1 : Préparation de l'environnement

1. **Vérifier les installations des outils :**
```bash
# Vérifier l'installation d'AZD
azd version

# Vérifier l'Azure CLI
az --version

# Se connecter à Azure
az login
azd auth login
```

2. **Cloner le dépôt de l'atelier :**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1 : Comprendre la structure AZD pour les applications IA

### Anatomie d'un modèle AZD pour IA

Découvrez les fichiers clés dans un modèle AZD prêt pour l'IA :

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

**À quoi faire attention :**
- Définitions de services pour les composants IA
- Mappages des variables d'environnement
- Configurations d'hôte

2. **Passez en revue l'infrastructure main.bicep :**
```bash
cat infra/main.bicep
```

**Principaux modèles IA à identifier :**
- Provisionnement du service Azure OpenAI
- Intégration de Cognitive Search
- Gestion sécurisée des clés
- Configurations de sécurité réseau

### **Point de discussion :** Pourquoi ces modèles sont importants pour l'IA

- **Dépendances de services** : Les applications IA nécessitent souvent plusieurs services coordonnés
- **Sécurité** : Les clés API et les points de terminaison nécessitent une gestion sécurisée
- **Scalabilité** : Les charges de travail IA ont des exigences de mise à l'échelle uniques
- **Gestion des coûts** : Les services IA peuvent être coûteux s'ils ne sont pas correctement configurés

## Module 2 : Déployer votre première application IA

### Étape 2.1 : Initialiser l'environnement

1. **Créer un nouvel environnement AZD :**
```bash
azd env new myai-workshop
```

2. **Définir les paramètres requis :**
```bash
# Définissez votre région Azure préférée
azd env set AZURE_LOCATION eastus

# Optionnel : Définissez un modèle OpenAI spécifique
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Étape 2.2 : Déployer l'infrastructure et l'application

1. **Déployer avec AZD :**
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

### Étape 2.3 : Vérifier votre déploiement

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
1. **Clés API OpenAI** : Vérifiez qu'elles sont correctement définies
2. **Disponibilité du modèle** : Vérifiez si votre région prend en charge le modèle
3. **Connectivité réseau** : Assurez-vous que les services peuvent communiquer
4. **Permissions RBAC** : Vérifiez que l'application peut accéder à OpenAI

**Commandes de débogage :**
```bash
# Vérifier les variables d'environnement
azd env get-values

# Afficher les journaux de déploiement
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Vérifier l'état du déploiement d'OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3 : Personnaliser les applications IA pour vos besoins

### Étape 3.1 : Modifier la configuration IA

1. **Mettre à jour le modèle OpenAI :**
```bash
# Passez à un modèle différent (si disponible dans votre région)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redéployez avec la nouvelle configuration
azd deploy
```

2. **Ajouter des services IA supplémentaires :**

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

**Bonne pratique** : Des configurations différentes pour le développement et la production.

1. **Créer un environnement de production :**
```bash
azd env new myai-production
```

2. **Définir des paramètres spécifiques à la production :**
```bash
# La production utilise généralement des SKU plus élevés
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Activer des fonctionnalités de sécurité supplémentaires
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Exercice de laboratoire 3.1 : Optimisation des coûts**

**Défi** : Configurez le modèle pour un développement économique.

**Tâches :**
1. Identifiez quels SKUs peuvent être définis sur des niveaux gratuits/basique
2. Configurez les variables d'environnement pour un coût minimal
3. Déployez et comparez les coûts avec la configuration de production

**Indices de solution :**
- Utilisez le niveau F0 (gratuit) pour les Cognitive Services lorsque c'est possible
- Utilisez le niveau Basic pour le service Search en développement
- Envisagez d'utiliser le plan Consumption pour les Functions

## Module 4 : Sécurité et meilleures pratiques en production

### Étape 4.1 : Gestion sécurisée des identifiants

**Problème actuel** : De nombreuses applications IA codent en dur les clés API ou utilisent un stockage non sécurisé.

**Solution AZD** : Managed Identity + intégration Key Vault.

1. **Examinez la configuration de sécurité dans votre modèle :**
```bash
# Recherchez la configuration de Key Vault et de l’identité gérée.
grep -r "keyVault\|managedIdentity" infra/
```

2. **Vérifiez que Managed Identity fonctionne :**
```bash
# Vérifier si l'application web a la bonne configuration d'identité
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Étape 4.2 : Sécurité réseau

1. **Activer les points de terminaison privés** (si non déjà configurés) :

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

1. **Configurer Application Insights :**
```bash
# Application Insights devrait être configuré automatiquement
# Vérifiez la configuration :
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Mettre en place une surveillance spécifique à l'IA :**

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
- [ ] Aucune secret codé en dur dans le code ou la configuration
- [ ] Managed Identity utilisé pour l'authentification service-à-service
- [ ] Key Vault stocke la configuration sensible
- [ ] L'accès réseau est correctement restreint
- [ ] La surveillance et la journalisation sont activées

## Module 5 : Conversion de votre propre application IA

### Étape 5.1 : Feuille d'évaluation

**Avant de convertir votre application**, répondez à ces questions :

1. **Architecture de l'application :**
   - Quels services IA votre application utilise-t-elle ?
   - Quelles ressources de calcul nécessite-t-elle ?
   - A-t-elle besoin d'une base de données ?
   - Quelles sont les dépendances entre les services ?

2. **Exigences de sécurité :**
   - Quelles données sensibles votre application manipule-t-elle ?
   - Quelles exigences de conformité avez-vous ?
   - Avez-vous besoin d'un réseau privé ?

3. **Exigences de mise à l'échelle :**
   - Quelle est votre charge attendue ?
   - Avez-vous besoin d'auto-scaling ?
   - Y a-t-il des exigences régionales ?

### Étape 5.2 : Créez votre modèle AZD

**Suivez ce modèle pour convertir votre application :**

1. **Créez la structure de base :**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialiser le modèle AZD
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

3. **Créez les modèles d'infrastructure :**

**infra/main.bicep** - Modèle principal:
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

**infra/modules/openai.bicep** - Module OpenAI:
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
- Compte de stockage pour les uploads de documents
- Function App pour la logique de traitement
- Application web pour l'interface utilisateur

**Points bonus :**
- Ajoutez une gestion d'erreurs appropriée
- Incluez une estimation des coûts
- Configurez des tableaux de bord de surveillance

## Module 6 : Dépannage des problèmes courants

### Problèmes de déploiement courants

#### Problème 1 : Quota du service OpenAI dépassé
**Symptômes :** Le déploiement échoue avec une erreur de quota
**Solutions :**
```bash
# Vérifier les quotas actuels
az cognitiveservices usage list --location eastus

# Demander une augmentation des quotas ou essayer une autre région
azd env set AZURE_LOCATION westus2
azd up
```

#### Problème 2 : Modèle non disponible dans la région
**Symptômes :** Les réponses IA échouent ou des erreurs de déploiement du modèle
**Solutions :**
```bash
# Vérifier la disponibilité du modèle par région
az cognitiveservices model list --location eastus

# Mettre à jour vers un modèle disponible
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problème 3 : Problèmes d'autorisation
**Symptômes :** Erreurs 403 Forbidden lors d'appels aux services IA
**Solutions :**
```bash
# Vérifier les attributions de rôles
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Ajouter les rôles manquants
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Problèmes de performance

#### Problème 4 : Réponses IA lentes
**Étapes d'investigation :**
1. Vérifiez Application Insights pour les métriques de performance
2. Passez en revue les métriques du service OpenAI dans le portail Azure
3. Vérifiez la connectivité réseau et la latence

**Solutions :**
- Mettez en œuvre un cache pour les requêtes courantes
- Utilisez un modèle OpenAI approprié pour votre cas d'utilisation
- Envisagez des répliques en lecture pour les scénarios à forte charge

### **Exercice de laboratoire 6.1 : Défi de débogage**

**Scénario** : Votre déploiement a réussi, mais l'application renvoie des erreurs 500.

**Tâches de débogage :**
1. Consultez les logs de l'application
2. Vérifiez la connectivité des services
3. Testez l'authentification
4. Passez en revue la configuration

**Outils à utiliser :**
- `azd show` pour un aperçu du déploiement
- Portail Azure pour les logs détaillés des services
- Application Insights pour la télémétrie applicative

## Module 7 : Surveillance et optimisation

### Étape 7.1 : Mettre en place une surveillance complète

1. **Créer des tableaux de bord personnalisés :**

Accédez au portail Azure et créez un tableau de bord avec :
- Nombre et latence des requêtes OpenAI
- Taux d'erreur de l'application
- Utilisation des ressources
- Suivi des coûts

2. **Configurer des alertes :**
```bash
# Alerte pour un taux d'erreur élevé
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Étape 7.2 : Optimisation des coûts

1. **Analyser les coûts actuels :**
```bash
# Utilisez Azure CLI pour obtenir les données de coût
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Mettre en œuvre des contrôles des coûts :**
- Configurez des alertes de budget
- Utilisez des politiques d'autoscaling
- Mettez en place un cache des requêtes
- Surveillez l'utilisation des tokens pour OpenAI

### **Exercice de laboratoire 7.1 : Optimisation des performances**

**Tâche** : Optimisez votre application IA pour la performance et les coûts.

**Indicateurs à améliorer :**
- Réduire le temps de réponse moyen de 20%
- Réduire les coûts mensuels de 15%
- Maintenir une disponibilité de 99,9%

**Stratégies à essayer :**
- Mettre en œuvre un cache de réponses
- Optimiser les prompts pour l'efficacité des tokens
- Utiliser des SKUs de calcul appropriés
- Configurer un autoscaling adapté

## Défi final : Mise en œuvre de bout en bout

### Scénario du défi

Vous devez créer un chatbot de service client alimenté par l'IA, prêt pour la production, avec ces exigences :

**Exigences fonctionnelles :**
- Interface web pour les interactions clients
- Intégration avec Azure OpenAI pour les réponses
- Capacité de recherche de documents avec Cognitive Search
- Intégration avec la base de données client existante
- Support multilingue

**Exigences non fonctionnelles :**
- Gérer 1000 utilisateurs concurrents
- SLA de disponibilité de 99,9%
- Conformité SOC 2
- Coût inférieur à 500 $/mois
- Déployer sur plusieurs environnements (dev, staging, prod)

### Étapes de mise en œuvre

1. **Concevoir l'architecture**
2. **Créer le modèle AZD**
3. **Mettre en œuvre les mesures de sécurité**
4. **Configurer la surveillance et les alertes**
5. **Créer des pipelines de déploiement**
6. **Documenter la solution**

### Critères d'évaluation

- ✅ **Fonctionnalité** : Répond-il à toutes les exigences ?
- ✅ **Sécurité** : Les meilleures pratiques sont-elles mises en œuvre ?
- ✅ **Scalabilité** : Peut-il gérer la charge ?
- ✅ **Maintenabilité** : Le code et l'infrastructure sont-ils bien organisés ?
- ✅ **Coût** : Respecte-t-il le budget ?

## Ressources supplémentaires

### Documentation Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Modèles d'exemple
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ressources communautaires
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificat d'achèvement
Félicitations ! Vous avez terminé le laboratoire de l'atelier IA. Vous devriez maintenant être en mesure de :

- ✅ Convertir des applications d'IA existantes en modèles AZD
- ✅ Déployer des applications d'IA prêtes pour la production
- ✅ Mettre en œuvre des bonnes pratiques de sécurité pour les charges de travail IA
- ✅ Surveiller et optimiser les performances des applications d'IA
- ✅ Résoudre les problèmes courants de déploiement

### Étapes suivantes
1. Appliquez ces modèles à vos propres projets d'IA
2. Contribuez des modèles à la communauté
3. Rejoignez le Discord Microsoft Foundry pour un support continu
4. Explorez des sujets avancés comme les déploiements multi-région

---

**Retour sur l'atelier** : Aidez-nous à améliorer cet atelier en partageant votre expérience dans le [Microsoft Foundry Discord canal #Azure](https://discord.gg/microsoft-azure).

---

**Navigation du chapitre :**
- **📚 Accueil du cours**: [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel**: Chapitre 2 - Développement axé sur l'IA
- **⬅️ Précédent**: [Déploiement de modèles IA](ai-model-deployment.md)
- **➡️ Suivant**: [Bonnes pratiques pour l'IA en production](production-ai-practices.md)
- **🚀 Chapitre suivant**: [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

**Besoin d'aide ?** Rejoignez notre communauté pour obtenir de l'aide et participer aux discussions sur AZD et les déploiements d'IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Clause de non-responsabilité :**
Ce document a été traduit à l'aide du service de traduction par IA [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'être précis, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original, dans sa langue d'origine, doit être considéré comme la version faisant autorité. Pour les informations critiques, une traduction professionnelle effectuée par un traducteur humain est recommandée. Nous ne pouvons être tenus responsables de tout malentendu ou de toute mauvaise interprétation résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->