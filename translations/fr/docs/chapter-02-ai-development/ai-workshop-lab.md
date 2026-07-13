# Laboratoire Atelier IA : Rendre vos Solutions IA Déployables avec AZD

**Navigation du Chapitre :**
- **📚 Accueil du Cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre en Cours** : Chapitre 2 - Développement IA-Prioritaire
- **⬅️ Précédent** : [Déploiement de Modèles IA](ai-model-deployment.md)
- **➡️ Suivant** : [Bonnes Pratiques IA en Production](production-ai-practices.md)
- **🚀 Chapitre Suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

## Vue d'ensemble de l'Atelier

Ce laboratoire pratique guide les développeurs à travers le processus de prise d’un modèle IA existant et son déploiement via Azure Developer CLI (AZD). Vous apprendrez les patrons essentiels pour les déploiements IA en production utilisant les services Microsoft Foundry.

> **Note de validation (2026-07-13) :** Cet atelier a été testé avec `azd` `1.27.1`. Si votre installation locale est plus ancienne, mettez AZD à jour avant de commencer pour que le workflow d’authentification, modèle et déploiement corresponde aux étapes ci-dessous.

**Durée :** 2-3 heures  
**Niveau :** Intermédiaire  
**Prérequis :** Connaissances de base Azure, familiarité avec concepts IA/ML

## 🎓 Objectifs d'Apprentissage

À la fin de cet atelier, vous serez capable de :
- ✅ Convertir une application IA existante pour utiliser les modèles AZD
- ✅ Configurer les services Microsoft Foundry avec AZD
- ✅ Implémenter une gestion sécurisée des identifiants pour les services IA
- ✅ Déployer des applications IA prêtes pour la production avec surveillance
- ✅ Résoudre les problèmes courants de déploiement IA

## Prérequis

### Outils Nécessaires
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installé
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installé
- [Git](https://git-scm.com/) installé
- Éditeur de code (VS Code recommandé)

### Ressources Azure
- Abonnement Azure avec accès contributeur
- Accès aux services Microsoft Foundry Models (ou capacité à en faire la demande)
- Permissions pour créer un groupe de ressources

### Connaissances Préalables
- Connaissance de base des services Azure
- Familiarité avec les interfaces en ligne de commande
- Concepts de base IA/ML (APIs, modèles, prompts)

## Mise en Place du Laboratoire

### Étape 1 : Préparation de l'Environnement

1. **Vérifiez l'installation des outils :**
```bash
# Vérifier l'installation d'AZD
azd version

# Vérifier Azure CLI
az --version

# Se connecter à Azure pour les workflows AZD
azd auth login

# Se connecter à Azure CLI uniquement si vous prévoyez d'exécuter des commandes az lors du diagnostic
az login
```

Si vous travaillez sur plusieurs locataires ou si votre abonnement n’est pas détecté automatiquement, essayez à nouveau avec `azd auth login --tenant-id <tenant-id>`.

2. **Clonez le dépôt de l’atelier :**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1 : Comprendre la Structure AZD pour Applications IA

### Anatomie d’un Modèle AZD pour IA

Explorez les fichiers clés d'un modèle AZD prêt pour IA :

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Exercice de laboratoire 1.1 : Explorer la Configuration**

1. **Examinez le fichier azure.yaml :**
```bash
cat azure.yaml
```

**À quoi faire attention :**
- Définitions des services pour les composants IA
- Mappages des variables d'environnement
- Configurations des hôtes

2. **Passez en revue infrastructure main.bicep :**
```bash
cat infra/main.bicep
```

**Patrons IA clés à identifier :**
- Provisionnement du service Microsoft Foundry Models
- Intégration Azure AI Search
- Gestion sécurisée des clés
- Configurations de sécurité réseau

### **Point de discussion : Pourquoi ces patrons sont-ils importants pour l’IA**

- **Dépendances entre services** : Les applications IA requièrent souvent plusieurs services coordonnés
- **Sécurité** : Les clés API et endpoints doivent être gérés de manière sécurisée
- **Scalabilité** : Les charges IA ont des exigences uniques de mise à l’échelle
- **Gestion des coûts** : Les services IA peuvent être coûteux si mal configurés

## Module 2 : Déployez Votre Première Application IA

### Étape 2.1 : Initialiser l’Environnement

1. **Créez un nouvel environnement AZD :**
```bash
azd env new myai-workshop
```

2. **Définissez les paramètres requis :**
```bash
# Définissez votre région Azure préférée
azd env set AZURE_LOCATION eastus

# Optionnel : Définissez un modèle OpenAI spécifique
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Étape 2.2 : Déployez Infrastructure et Application

1. **Déployez avec AZD :**
```bash
azd up
```

**Ce qui se passe lors de `azd up` :**
- ✅ Provisionne le service Microsoft Foundry Models
- ✅ Crée le service Azure AI Search
- ✅ Met en place App Service pour l’application web
- ✅ Configure réseau et sécurité
- ✅ Déploie le code de l’application
- ✅ Met en place monitoring et journalisation

2. **Surveillez la progression du déploiement** et notez les ressources créées.

### Étape 2.3 : Vérifiez Votre Déploiement

1. **Vérifiez les ressources déployées :**
```bash
azd show
```

2. **Ouvrez l’application déployée :**
```bash
azd show
```

Ouvrez le point d’accès web affiché dans la sortie de `azd show`.

3. **Testez la fonctionnalité IA :**
   - Naviguez vers l’application web
   - Essayez des requêtes d’exemple
   - Vérifiez que les réponses IA fonctionnent

### **Exercice de laboratoire 2.1 : Pratique de dépannage**

**Scénario** : Votre déploiement a réussi mais l’IA ne répond pas.

**Problèmes courants à vérifier :**
1. **Clés API OpenAI** : Vérifiez qu’elles sont correctement définies
2. **Disponibilité du modèle** : Vérifiez que votre région supporte le modèle
3. **Connectivité réseau** : Assurez-vous que les services peuvent communiquer
4. **Permissions RBAC** : Vérifiez que l’application peut accéder à OpenAI

**Commandes de débogage :**
```bash
# Vérifier les variables d'environnement
azd env get-values

# Voir les journaux de déploiement
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Vérifier le statut du déploiement OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Module 3 : Personnaliser vos Applications IA selon Vos Besoins

### Étape 3.1 : Modifier la Configuration IA

1. **Mettez à jour le modèle OpenAI :**
```bash
# Changez pour un modèle différent (si disponible dans votre région)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Redéployez avec la nouvelle configuration
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

### Étape 3.2 : Configurations Spécifiques à l'Environnement

**Meilleure pratique** : Configurations différentes pour développement vs production.

1. **Créez un environnement de production :**
```bash
azd env new myai-production
```

2. **Définissez des paramètres spécifiques à la production :**
```bash
# La production utilise généralement des SKU plus élevés
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Activer des fonctionnalités de sécurité supplémentaires
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Exercice de laboratoire 3.1 : Optimisation des Coûts**

**Défi** : Configurez le modèle pour un développement économique.

**Tâches :**
1. Identifiez quelles SKUs peuvent être réglées en paliers gratuits/basiques
2. Configurez les variables d’environnement pour un coût minimal
3. Déployez et comparez les coûts avec la configuration de production

**Indices de solution :**
- Utilisez le palier F0 (gratuit) pour les services Azure AI quand possible
- Utilisez le palier Basic pour Search Service en développement
- Envisagez le plan Consumption pour les Functions

## Module 4 : Sécurité et Bonnes Pratiques en Production

### Étape 4.1 : Gestion Sécurisée des Identifiants

**Défi actuel** : Beaucoup d’apps IA codent en dur les clés API ou utilisent un stockage non sécurisé.

**Solution AZD** : Intégration Identité Managée + Key Vault.

1. **Passez en revue la configuration de sécurité dans votre modèle :**
```bash
# Recherchez la configuration de Key Vault et d'Identité gérée
grep -r "keyVault\|managedIdentity" infra/
```

2. **Vérifiez que l’Identité Managée fonctionne :**
```bash
# Vérifiez si l'application web a la configuration d'identité correcte
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Étape 4.2 : Sécurité Réseau

1. **Activez les endpoints privés** (si non déjà configurés) :

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

### Étape 4.3 : Monitoring et Observabilité

1. **Configurez Application Insights :**
```bash
# Application Insights doit être configuré automatiquement
# Vérifiez la configuration :
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Mettez en place un monitoring spécifique IA :**

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

### **Exercice de laboratoire 4.1 : Audit de Sécurité**

**Tâche** : Passez en revue votre déploiement pour les meilleures pratiques de sécurité.

**Liste de contrôle :**
- [ ] Pas de secrets codés en dur dans le code ou la configuration
- [ ] Utilisation de l’Identité Managée pour l’authentification service-à-service
- [ ] Key Vault stocke la configuration sensible
- [ ] L’accès réseau est correctement restreint
- [ ] Monitoring et journalisation sont activés

## Module 5 : Conversion de Votre Propre Application IA

### Étape 5.1 : Fiche d’Évaluation

**Avant de convertir votre application**, répondez à ces questions :

1. **Architecture de l’Application :**
   - Quels services IA votre application utilise-t-elle ?
   - Quelles ressources de calcul requiert-elle ?
   - A-t-elle besoin d’une base de données ?
   - Quelles sont les dépendances entre services ?

2. **Exigences de Sécurité :**
   - Quelles données sensibles votre application traite-t-elle ?
   - Quelles obligations réglementaires devez-vous respecter ?
   - Avez-vous besoin d’un réseau privé ?

3. **Exigences de Mise à l’Échelle :**
   - Quelle est votre charge attendue ?
   - Avez-vous besoin d’auto-scalabilité ?
   - Existe-t-il des exigences régionales ?

### Étape 5.2 : Créez Votre Modèle AZD

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

3. **Créez les modèles d’infrastructure :**

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

### **Exercice de laboratoire 5.1 : Défi de Création de Modèle**

**Défi** : Créez un modèle AZD pour une application IA de traitement documentaire.

**Exigences :**
- Microsoft Foundry Models pour l’analyse de contenu
- Document Intelligence pour OCR
- Compte de stockage pour les uploads de documents
- Fonction App pour la logique de traitement
- Application web pour l’interface utilisateur

**Points bonus :**
- Ajoutez une gestion des erreurs appropriée
- Incluez une estimation des coûts
- Configurez des tableaux de bord de monitoring

## Module 6 : Résolution des Problèmes Courants

### Problèmes Courants de Déploiement

#### Problème 1 : Quota du Service OpenAI Dépassé
**Symptômes :** Le déploiement échoue avec une erreur de quota
**Solutions :**
```bash
# Vérifier les quotas actuels
az cognitiveservices usage list --location eastus

# Demander une augmentation de quota ou essayer une autre région
azd env set AZURE_LOCATION westus2
azd up
```

#### Problème 2 : Modèle Non Disponible dans la Région
**Symptômes :** Réponses IA échouent ou erreurs de déploiement du modèle
**Solutions :**
```bash
# Vérifier la disponibilité du modèle par région
az cognitiveservices model list --location eastus

# Mettre à jour avec un modèle disponible
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problème 3 : Problèmes d’Autorisations
**Symptômes :** Erreurs 403 Forbidden lors d’appels aux services IA
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

### Problèmes de Performance

#### Problème 4 : Réponses IA Lentes
**Étapes d’investigation :**
1. Vérifiez les métriques de performance dans Application Insights
2. Passez en revue les métriques du service OpenAI dans le portail Azure
3. Vérifiez la connectivité réseau et la latence

**Solutions :**
- Implémentez un cache pour requêtes courantes
- Utilisez le modèle OpenAI approprié à votre cas d’utilisation
- Envisagez des replicas en lecture pour scénarios de charge élevée

### **Exercice de laboratoire 6.1 : Défi de Débogage**

**Scénario :** Votre déploiement a réussi, mais l’application retourne des erreurs 500.

**Tâches de débogage :**
1. Vérifiez les logs de l’application
2. Vérifiez la connectivité des services
3. Testez l’authentification
4. Passez en revue la configuration

**Outils à utiliser :**
- `azd show` pour vue d’ensemble du déploiement
- Portail Azure pour logs détaillés des services
- Application Insights pour la télémétrie de l’application

## Module 7 : Monitoring et Optimisation

### Étape 7.1 : Configurez un Monitoring Complet

1. **Créez des tableaux de bord personnalisés :**

Naviguez dans le portail Azure et créez un tableau de bord avec :
- Nombre et latence des requêtes OpenAI
- Taux d’erreurs applicatives
- Utilisation des ressources
- Suivi des coûts

2. **Mettez en place des alertes :**
```bash
# Alerte pour un taux d'erreur élevé
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Étape 7.2 : Optimisation des Coûts

1. **Analysez les coûts actuels :**
```bash
# Utilisez Azure CLI pour obtenir les données de coût
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Implémentez des contrôles des coûts :**
- Mettez en place des alertes budget
- Utilisez les politiques d’autoscaling
- Implémentez le cache des requêtes
- Surveillez l’usage des tokens pour OpenAI

### **Exercice de laboratoire 7.1 : Optimisation de la Performance**

**Tâche** : Optimisez votre application IA pour la performance et le coût.

**Métriques à améliorer :**
- Réduisez le temps de réponse moyen de 20%
- Réduisez les coûts mensuels de 15%
- Maintenez une disponibilité de 99,9 %

**Stratégies à essayer :**
- Implémentez un cache des réponses
- Optimisez les prompts pour l’efficacité des tokens
- Utilisez les SKUs de calcul appropriés
- Configurez un autoscaling adéquat

## Défi Final : Implémentation de Bout en Bout

### Scénario du Défi

Vous devez créer un chatbot de service client IA prêt pour la production avec ces exigences :

**Exigences Fonctionnelles :**
- Interface web pour interactions clients
- Intégration avec Microsoft Foundry Models pour les réponses
- Capacités de recherche documentaire avec Azure AI Search
- Intégration avec base client existante
- Support multilingue

**Exigences Non Fonctionnelles :**
- Gérer 1000 utilisateurs simultanés
- SLA de 99,9 % de disponibilité
- Conformité SOC 2
- Coût inférieur à 500 $/mois
- Déployer sur plusieurs environnements (dev, staging, prod)

### Étapes d’Implémentation

1. **Concevez l’architecture**
2. **Créez le modèle AZD**
3. **Implémentez les mesures de sécurité**
4. **Mettez en place monitoring et alertes**
5. **Créez les pipelines de déploiement**
6. **Documentez la solution**

### Critères d’Évaluation

- ✅ **Fonctionnalité** : Répond-il à toutes les exigences ?
- ✅ **Sécurité** : Les meilleures pratiques sont-elles implémentées ?
- ✅ **Scalabilité** : Peut-il gérer la charge ?
- ✅ **Maintenabilité** : Le code et l’infrastructure sont-ils bien organisés ?
- ✅ **Coût** : Respecte-t-il le budget ?

## Ressources Supplémentaires

### Documentation Microsoft
- [Documentation Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Documentation Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Documentation Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Modèles d’Exemple
- [Application de Chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Démarrage Rapide Application Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ressources Communautaires
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificat de Réussite

Félicitations ! Vous avez terminé le laboratoire AI Workshop. Vous devriez maintenant être capable de :

- ✅ Convertir des applications IA existantes en modèles AZD
- ✅ Déployer des applications IA prêtes pour la production
- ✅ Mettre en œuvre les meilleures pratiques de sécurité pour les charges de travail IA
- ✅ Surveiller et optimiser les performances des applications IA
- ✅ Résoudre les problèmes courants de déploiement

### Étapes Suivantes
1. Appliquez ces modèles à vos propres projets IA
2. Contribuez des modèles à la communauté
3. Rejoignez le Discord Microsoft Foundry pour un support continu
4. Explorez des sujets avancés comme les déploiements multi-régions

---

**Retour d'Expérience sur l'Atelier** : Aidez-nous à améliorer cet atelier en partageant votre expérience dans le [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Navigation dans le Chapitre :**
- **📚 Accueil du Cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre Actuel** : Chapitre 2 - Développement AI-First
- **⬅️ Précédent** : [Déploiement de Modèle IA](ai-model-deployment.md)
- **➡️ Suivant** : [Meilleures Pratiques Production IA](production-ai-practices.md)
- **🚀 Chapitre Suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

**Besoin d'aide ?** Rejoignez notre communauté pour du support et des discussions sur AZD et les déploiements IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->