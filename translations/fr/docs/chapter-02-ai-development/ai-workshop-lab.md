# Atelier AI : Rendre vos solutions IA déployables avec AZD

**Navigation du Chapitre :**  
- **📚 Accueil du cours** : [AZD Pour Débutants](../../README.md)  
- **📖 Chapitre actuel** : Chapitre 2 - Développement AI-First  
- **⬅️ Précédent** : [Déploiement de Modèle IA](ai-model-deployment.md)  
- **➡️ Suivant** : [Bonnes Pratiques IA en Production](production-ai-practices.md)  
- **🚀 Chapitre suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)  

## Vue d’ensemble de l’atelier

Ce laboratoire pratique guide les développeurs à travers le processus de prise d’un modèle IA existant et de son déploiement utilisant Azure Developer CLI (AZD). Vous apprendrez les modèles essentiels pour les déploiements IA en production utilisant les services Microsoft Foundry.

> **Note de validation (2026-03-25) :** Cet atelier a été revu avec `azd` version `1.23.12`. Si votre installation locale est plus ancienne, mettez à jour AZD avant de commencer afin que l’authentification, le modèle et le flux de déploiement correspondent aux étapes ci-dessous.

**Durée :** 2-3 heures  
**Niveau :** Intermédiaire  
**Prérequis :** Connaissances de base d’Azure, familiarité avec les concepts IA/ML  

## 🎓 Objectifs d’apprentissage

À la fin de cet atelier, vous serez capable de :  
- ✅ Convertir une application IA existante pour utiliser les templates AZD  
- ✅ Configurer les services Microsoft Foundry avec AZD  
- ✅ Mettre en œuvre une gestion sécurisée des identifiants pour les services IA  
- ✅ Déployer des applications IA prêtes pour la production avec supervision  
- ✅ Dépanner les problèmes courants de déploiement IA  

## Prérequis

### Outils requis  
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installé  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installé  
- [Git](https://git-scm.com/) installé  
- Éditeur de code (VS Code recommandé)  

### Ressources Azure  
- Abonnement Azure avec accès contributeur  
- Accès aux services Microsoft Foundry Models (ou capacité à demander l’accès)  
- Permissions pour créer un groupe de ressources  

### Connaissances préalables  
- Connaissance de base des services Azure  
- Familiarité avec les interfaces en ligne de commande  
- Concepts de base IA/ML (APIs, modèles, prompts)  

## Configuration du laboratoire

### Étape 1 : Préparation de l’environnement

1. **Vérifiez les installations des outils :**  
```bash
# Vérifier l'installation d'AZD
azd version

# Vérifier Azure CLI
az --version

# Se connecter à Azure pour les flux de travail AZD
azd auth login

# Se connecter à Azure CLI uniquement si vous prévoyez d'exécuter des commandes az pendant le diagnostic
az login
```
  
Si vous travaillez sur plusieurs tenants ou si votre abonnement n’est pas détecté automatiquement, réessayez avec `azd auth login --tenant-id <tenant-id>`.  

2. **Clonez le dépôt de l’atelier :**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  

## Module 1 : Comprendre la structure AZD pour les applications IA

### Anatomie d’un template AZD IA

Explorez les fichiers clés d’un template AZD prêt pour l’IA :  

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```
  

### **Exercice pratique 1.1 : Explorez la configuration**

1. **Examinez le fichier azure.yaml :**  
```bash
cat azure.yaml
```
  
**À rechercher :**  
- Définitions des services pour les composants IA  
- Mappage des variables d’environnement  
- Configurations des hôtes  

2. **Examinez l’infrastructure main.bicep :**  
```bash
cat infra/main.bicep
```
  
**Modèles IA clés à identifier :**  
- Provisionnement du service Microsoft Foundry Models  
- Intégration de Cognitive Search  
- Gestion sécurisée des clés  
- Configurations de sécurité réseau  

### **Point de discussion : Pourquoi ces modèles sont importants pour l’IA**

- **Dépendances de service** : Les applications IA requièrent souvent plusieurs services coordonnés  
- **Sécurité** : Les clés API et endpoints doivent être gérés de manière sécurisée  
- **Scalabilité** : Les charges IA ont des exigences uniques de mise à l’échelle  
- **Gestion des coûts** : Les services IA peuvent être coûteux si mal configurés  

## Module 2 : Déployez votre première application IA

### Étape 2.1 : Initialiser l’environnement

1. **Créez un nouvel environnement AZD :**  
```bash
azd env new myai-workshop
```
  
2. **Définissez les paramètres requis :**  
```bash
# Définissez votre région Azure préférée
azd env set AZURE_LOCATION eastus

# Facultatif : Définissez un modèle OpenAI spécifique
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```
  

### Étape 2.2 : Déployer l’infrastructure et l’application

1. **Déployez avec AZD :**  
```bash
azd up
```
  
**Ce qui se passe durant `azd up` :**  
- ✅ Provisionnement du service Microsoft Foundry Models  
- ✅ Création du service Cognitive Search  
- ✅ Mise en place de App Service pour l’application web  
- ✅ Configuration du réseau et de la sécurité  
- ✅ Déploiement du code applicatif  
- ✅ Mise en place de la supervision et journalisation  

2. **Surveillez la progression du déploiement** et notez les ressources créées.  

### Étape 2.3 : Vérifiez votre déploiement

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

### **Exercice pratique 2.1 : Pratique de dépannage**

**Scénario** : Votre déploiement a réussi mais l’IA ne répond pas.  

**Problèmes communs à vérifier :**  
1. **Clés API OpenAI** : Vérifiez qu’elles sont bien définies  
2. **Disponibilité du modèle** : Vérifiez si votre région supporte le modèle  
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
  

## Module 3 : Personnaliser les applications IA selon vos besoins

### Étape 3.1 : Modifier la configuration IA

1. **Mettez à jour le modèle OpenAI :**  
```bash
# Changer pour un modèle différent (si disponible dans votre région)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Redéployer avec la nouvelle configuration
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
  

### Étape 3.2 : Configurations spécifiques à l’environnement

**Bonne pratique** : Configurations différenciées pour développement et production.  

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
  

### **Exercice pratique 3.1 : Optimisation des coûts**

**Défi** : Configurez le template pour un développement économique.

**Tâches :**  
1. Identifiez quels SKU peuvent être réglés en niveaux gratuit/basique  
2. Configurez les variables d’environnement pour un coût minimal  
3. Déployez et comparez les coûts avec la configuration de production  

**Indices de solution :**  
- Utilisez le niveau F0 (gratuit) pour Cognitive Services quand possible  
- Utilisez le niveau Basique pour Search Service en développement  
- Pensez à utiliser le plan à la consommation pour Functions  

## Module 4 : Sécurité et bonnes pratiques en production

### Étape 4.1 : Gestion sécurisée des identifiants

**Problématique actuelle** : Beaucoup d’applications IA codent en dur les clés API ou utilisent un stockage non sécurisé.  

**Solution AZD** : Identité managée + intégration avec Key Vault.  

1. **Examinez la configuration de sécurité dans votre template :**  
```bash
# Recherchez la configuration du Key Vault et de l'identité gérée
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **Vérifiez que l’identité managée fonctionne :**  
```bash
# Vérifiez si l’application web a la bonne configuration d’identité
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  

### Étape 4.2 : Sécurité réseau

1. **Activez les points de terminaison privés** (si non déjà configurés) :  

Ajoutez dans votre template bicep :  
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
  

### Étape 4.3 : Supervision et observabilité

1. **Configurez Application Insights :**  
```bash
# Application Insights doit être configuré automatiquement
# Vérifiez la configuration :
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **Mettez en place une supervision spécifique à l’IA :**  

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
  

### **Exercice pratique 4.1 : Audit de sécurité**

**Tâche** : Passez en revue votre déploiement pour les bonnes pratiques de sécurité.  

**Liste de vérification :**  
- [ ] Pas de secrets codés en dur dans le code ou la configuration  
- [ ] Identité managée utilisée pour authentification service-à-service  
- [ ] Key Vault stocke la configuration sensible  
- [ ] L’accès réseau est correctement restreint  
- [ ] La supervision et journalisation sont activées  

## Module 5 : Conversion de votre propre application IA

### Étape 5.1 : Fiche d’évaluation

**Avant de convertir votre application**, répondez à ces questions :  

1. **Architecture de l’application :**  
   - Quels services IA votre application utilise-t-elle ?  
   - Quels sont ses besoins en ressources de calcul ?  
   - A-t-elle besoin d’une base de données ?  
   - Quelles sont les dépendances entre services ?  

2. **Exigences de sécurité :**  
   - Quelles données sensibles votre application manipule-t-elle ?  
   - Quelles sont vos exigences en matière de conformité ?  
   - Avez-vous besoin de réseau privé ?  

3. **Exigences de montée en charge :**  
   - Quelle charge prévoyez-vous ?  
   - Avez-vous besoin d’auto-scaling ?  
   - Y a-t-il des exigences régionales ?  

### Étape 5.2 : Créez votre template AZD

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
  
3. **Créez les templates d’infrastructure :**  

**infra/main.bicep** - template principal :  
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
  
**infra/modules/openai.bicep** - module OpenAI :  
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
  

### **Exercice pratique 5.1 : Défi création de template**

**Défi** : Créez un template AZD pour une application IA de traitement documentaire.  

**Exigences :**  
- Microsoft Foundry Models pour l’analyse de contenu  
- Document Intelligence pour OCR  
- Compte de stockage pour les documents uploadés  
- Function App pour la logique de traitement  
- Application web pour l’interface utilisateur  

**Points bonus :**  
- Ajoutez une gestion correcte des erreurs  
- Incluez une estimation des coûts  
- Mettez en place des tableaux de bord de supervision  

## Module 6 : Résolution des problèmes courants

### Problèmes courants de déploiement

#### Problème 1 : Quota service OpenAI dépassé  
**Symptômes :** Échec du déploiement avec erreur de quota  
**Solutions :**  
```bash
# Vérifier les quotas actuels
az cognitiveservices usage list --location eastus

# Demander une augmentation de quota ou essayer une autre région
azd env set AZURE_LOCATION westus2
azd up
```
  

#### Problème 2 : Modèle non disponible dans la région  
**Symptômes :** Réponses IA erronées ou erreurs de déploiement du modèle  
**Solutions :**  
```bash
# Vérifier la disponibilité du modèle par région
az cognitiveservices model list --location eastus

# Mettre à jour vers le modèle disponible
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```
  

#### Problème 3 : Problèmes de permissions  
**Symptômes :** Erreurs 403 Forbidden lors des appels aux services IA  
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
**Étapes d’investigation :**  
1. Consultez Application Insights pour les métriques de performance  
2. Vérifiez les métriques du service OpenAI dans le portail Azure  
3. Vérifiez la connectivité réseau et la latence  

**Solutions :**  
- Implémentez un cache pour les requêtes fréquentes  
- Utilisez le modèle OpenAI adapté à votre cas d’usage  
- Envisagez des réplicas en lecture pour les scénarios à forte charge  

### **Exercice pratique 6.1 : Défi de débogage**

**Scénario** : Votre déploiement a réussi, mais l’application retourne des erreurs 500.  

**Tâches de débogage :**  
1. Vérifiez les logs de l’application  
2. Vérifiez la connectivité des services  
3. Testez l’authentification  
4. Examinez la configuration  

**Outils à utiliser :**  
- `azd show` pour la vue d’ensemble du déploiement  
- Portail Azure pour les logs détaillés des services  
- Application Insights pour la télémétrie applicative  

## Module 7 : Supervision et optimisation

### Étape 7.1 : Mise en place d’une supervision complète

1. **Créez des tableaux de bord personnalisés :**  

Dans le portail Azure, créez un tableau de bord avec :  
- Nombre et latence des requêtes OpenAI  
- Taux d’erreurs applicatives  
- Utilisation des ressources  
- Suivi des coûts  

2. **Configurez des alertes :**  
```bash
# Alerte pour taux d'erreur élevé
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
# Utilisez Azure CLI pour obtenir les données de coût
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **Mettez en œuvre des contrôles de coûts :**  
- Configurez des alertes de budget  
- Utilisez des politiques d’autoscaling  
- Implémentez un cache des requêtes  
- Surveillez l’utilisation des tokens OpenAI  

### **Exercice pratique 7.1 : Optimisation des performances**

**Tâche :** Optimisez votre application IA pour la performance et le coût.  

**Métriques à améliorer :**  
- Réduire le temps de réponse moyen de 20 %  
- Réduire les coûts mensuels de 15 %  
- Maintenir une disponibilité à 99,9 %  

**Stratégies à essayer :**  
- Implémenter un cache des réponses  
- Optimiser les prompts pour l’efficacité des tokens  
- Utiliser les SKU de calcul appropriés  
- Configurer un autoscaling adapté  

## Défi final : Implémentation de bout en bout

### Scénario du défi

Vous devez créer un chatbot de service client IA prêt pour la production avec ces exigences :  

**Exigences fonctionnelles :**  
- Interface web pour les interactions clients  
- Intégration avec Microsoft Foundry Models pour les réponses  
- Recherche documentaire via Cognitive Search  
- Intégration avec la base de données client existante  
- Support multilingue  

**Exigences non fonctionnelles :**  
- Gestion de 1000 utilisateurs simultanés  
- SLA de disponibilité à 99,9 %  
- Conformité SOC 2  
- Coût inférieur à 500 $/mois  
- Déploiement sur plusieurs environnements (dev, staging, prod)  

### Étapes d’implémentation

1. Concevez l’architecture  
2. Créez le template AZD  
3. Mettez en œuvre les mesures de sécurité  
4. Configurez la supervision et les alertes  
5. Créez les pipelines de déploiement  
6. Documentez la solution  

### Critères d’évaluation

- ✅ **Fonctionnalité** : Répond-il à toutes les exigences ?  
- ✅ **Sécurité** : Les meilleures pratiques sont-elles en place ?  
- ✅ **Scalabilité** : Peut-il gérer la charge ?  
- ✅ **Maintenabilité** : Le code et l’infrastructure sont-ils bien organisés ?  
- ✅ **Coût** : Respecte-t-il le budget ?  

## Ressources supplémentaires

### Documentation Microsoft  
- [Documentation Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Documentation Microsoft Foundry Models Service](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Documentation Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)  

### Templates d’exemple  
- [Application de Chat des Modèles Microsoft Foundry](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Démarrage Rapide Application de Chat OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Chat Contoso](https://github.com/Azure-Samples/contoso-chat)

### Ressources Communautaires
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)
- [Templates AZD Exceptionnels](https://azure.github.io/awesome-azd/)

## 🎓 Certificat de Réussite

Félicitations ! Vous avez terminé le laboratoire de l'atelier IA. Vous devriez maintenant être capable de :

- ✅ Convertir des applications IA existantes en templates AZD
- ✅ Déployer des applications IA prêtes pour la production
- ✅ Mettre en œuvre les meilleures pratiques de sécurité pour les charges de travail IA
- ✅ Surveiller et optimiser les performances des applications IA
- ✅ Résoudre les problèmes courants de déploiement

### Étapes Suivantes
1. Appliquez ces modèles à vos propres projets IA
2. Contribuez des templates à la communauté
3. Rejoignez le Discord Microsoft Foundry pour un support continu
4. Explorez des sujets avancés comme les déploiements multi-régions

---

**Retour sur l'atelier** : Aidez-nous à améliorer cet atelier en partageant votre expérience dans le [canal #Azure du Discord Microsoft Foundry](https://discord.gg/microsoft-azure).

---

**Navigation dans les Chapitres :**
- **📚 Accueil du Cours** : [AZD pour Débutants](../../README.md)
- **📖 Chapitre Actuel** : Chapitre 2 - Développement IA-first
- **⬅️ Précédent** : [Déploiement du Modèle IA](ai-model-deployment.md)
- **➡️ Suivant** : [Meilleures Pratiques de l'IA en Production](production-ai-practices.md)
- **🚀 Chapitre Suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

**Besoin d’Aide ?** Rejoignez notre communauté pour du support et des discussions autour d’AZD et des déploiements IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d’assurer l’exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant foi. Pour les informations cruciales, une traduction humaine professionnelle est recommandée. Nous ne sommes pas responsables des malentendus ou des erreurs d’interprétation résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->