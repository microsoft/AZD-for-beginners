# Atelier AI : Rendre vos solutions AI déployables avec AZD

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 2 - Développement AI-First
- **⬅️ Précédent** : [Déploiement de modèle AI](ai-model-deployment.md)
- **➡️ Suivant** : [Bonnes pratiques AI en production](production-ai-practices.md)
- **🚀 Chapitre suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

## Vue d'ensemble de l'atelier

Ce laboratoire pratique guide les développeurs à travers le processus de prise d'un modèle AI existant et son déploiement en utilisant Azure Developer CLI (AZD). Vous apprendrez les modèles essentiels pour les déploiements AI en production avec les services Microsoft Foundry.

> **Note de validation (2026-03-25) :** Cet atelier a été testé avec `azd` version `1.23.12`. Si votre installation locale est plus ancienne, mettez à jour AZD avant de commencer afin que l’authentification, le modèle et le flux de déploiement correspondent aux étapes ci-dessous.

**Durée :** 2-3 heures  
**Niveau :** Intermédiaire  
**Prérequis :** Connaissances de base Azure, familiarité avec les concepts AI/ML

## 🎓 Objectifs d'apprentissage

À la fin de cet atelier, vous serez capable de :  
- ✅ Convertir une application AI existante pour utiliser les modèles AZD  
- ✅ Configurer les services Microsoft Foundry avec AZD  
- ✅ Mettre en œuvre une gestion sécurisée des identifiants pour les services AI  
- ✅ Déployer des applications AI prêtes pour la production avec surveillance  
- ✅ Dépanner les problèmes courants de déploiement AI

## Prérequis

### Outils requis
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installé  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installé  
- [Git](https://git-scm.com/) installé  
- Éditeur de code (VS Code recommandé)

### Ressources Azure
- Abonnement Azure avec accès contributeur  
- Accès aux services Microsoft Foundry Models (ou capacité à demander un accès)  
- Permissions de création de groupe de ressources  

### Connaissances préalables
- Compréhension de base des services Azure  
- Familiarité avec les interfaces en ligne de commande  
- Concepts de base AI/ML (APIs, modèles, prompts)

## Configuration du laboratoire

### Étape 1 : Préparation de l'environnement

1. **Vérifiez l’installation des outils :**  
```bash
# Vérifier l'installation d'AZD
azd version

# Vérifier Azure CLI
az --version

# Se connecter à Azure pour les flux de travail AZD
azd auth login

# Se connecter à Azure CLI uniquement si vous prévoyez d'exécuter des commandes az lors du diagnostic
az login
```
  
Si vous travaillez sur plusieurs locataires ou si votre abonnement n’est pas détecté automatiquement, réessayez avec `azd auth login --tenant-id <tenant-id>`.

2. **Clonez le dépôt de l’atelier :**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```


## Module 1 : Comprendre la structure AZD pour les applications AI

### Anatomie d’un modèle AZD prêt pour AI

Explorez les fichiers clés d’un modèle AZD prêt pour AI :

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


### **Exercice de laboratoire 1.1 : Explorez la configuration**

1. **Examinez le fichier azure.yaml :**  
```bash
cat azure.yaml
```
  
**À rechercher :**  
- Définitions des services pour les composants AI  
- Mappage des variables d’environnement  
- Configurations d’hôtes

2. **Examinez l’infrastructure main.bicep :**  
```bash
cat infra/main.bicep
```
  
**Modèles AI clés à identifier :**  
- Provisionnement du service Microsoft Foundry Models  
- Intégration Azure AI Search  
- Gestion sécurisée des clés  
- Configurations de sécurité réseau

### **Point de discussion : Pourquoi ces modèles sont importants pour AI**

- **Dépendances des services :** Les applications AI nécessitent souvent plusieurs services coordonnés  
- **Sécurité :** Les clés API et points de terminaison demandent une gestion sécurisée  
- **Scalabilité :** Les charges AI ont des exigences de montée en charge uniques  
- **Gestion des coûts :** Les services AI peuvent être coûteux sans une configuration appropriée

## Module 2 : Déployez votre première application AI

### Étape 2.1 : Initialisez l’environnement

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


### Étape 2.2 : Déployez l’infrastructure et l’application

1. **Déployez avec AZD :**  
```bash
azd up
```
  
**Ce qui se passe pendant `azd up` :**  
- ✅ Provisionne le service Microsoft Foundry Models  
- ✅ Crée le service Azure AI Search  
- ✅ Met en place App Service pour l’application web  
- ✅ Configure le réseau et la sécurité  
- ✅ Déploie le code de l’application  
- ✅ Configure la surveillance et les logs

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
  
Ouvrez le point de terminaison web indiqué dans la sortie `azd show`.

3. **Testez la fonctionnalité AI :**  
   - Naviguez vers l’application web  
   - Essayez des requêtes d’exemple  
   - Vérifiez que les réponses AI fonctionnent

### **Exercice de laboratoire 2.1 : Pratique de dépannage**

**Scénario :** Votre déploiement a réussi mais l’AI ne répond pas.

**Problèmes courants à vérifier :**  
1. **Clés API OpenAI** : Vérifiez qu’elles sont correctement définies  
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


## Module 3 : Personnaliser les applications AI selon vos besoins

### Étape 3.1 : Modifiez la configuration AI

1. **Mettez à jour le modèle OpenAI :**  
```bash
# Changez pour un modèle différent (si disponible dans votre région)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Redéployez avec la nouvelle configuration
azd deploy
```
  
2. **Ajoutez des services AI supplémentaires :**  

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

**Bonne pratique :** Configurations différentes pour développement vs production.

1. **Créez un environnement de production :**  
```bash
azd env new myai-production
```
  
2. **Définissez les paramètres spécifiques à la production :**  
```bash
# La production utilise généralement des SKU plus élevés
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Activer des fonctionnalités de sécurité supplémentaires
azd env set ENABLE_PRIVATE_ENDPOINTS true
```


### **Exercice de laboratoire 3.1 : Optimisation des coûts**

**Défi :** Configurez le modèle pour un développement économique.

**Tâches :**  
1. Identifier quels SKU peuvent être réglés sur gratuit/basique  
2. Configurer les variables d’environnement pour un coût minimal  
3. Déployez et comparez les coûts avec la configuration production

**Indices de solution :**  
- Utilisez le paliers F0 (gratuit) pour Azure AI Services quand possible  
- Utilisez le palier Basique pour le service Search en développement  
- Envisagez le plan Consumption pour Functions

## Module 4 : Sécurité et bonnes pratiques de production

### Étape 4.1 : Gestion sécurisée des identifiants

**Problème actuel :** Beaucoup d’applications AI codent en dur les clés API ou utilisent un stockage non sécurisé.

**Solution AZD :** Identité gérée + intégration Key Vault.

1. **Examinez la configuration de sécurité dans votre modèle :**  
```bash
# Recherchez la configuration de Key Vault et Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **Vérifiez que l’Identité Gérée fonctionne :**  
```bash
# Vérifiez si l'application web a la configuration d'identité correcte
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```


### Étape 4.2 : Sécurité réseau

1. **Activez les points de terminaison privés** (si non déjà configurés) :  

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
# Application Insights doit être configuré automatiquement
# Vérifiez la configuration :
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **Configurez la surveillance spécifique AI :**  

Ajoutez des métriques personnalisées pour les opérations AI :  
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

**Tâche :** Passez en revue votre déploiement selon les bonnes pratiques de sécurité.

**Liste de contrôle :**  
- [ ] Pas de secrets codés en dur dans le code ou la configuration  
- [ ] Utilisation de l’Identité Gérée pour l’authentification service-à-service  
- [ ] Key Vault stocke la configuration sensible  
- [ ] L’accès réseau est correctement restreint  
- [ ] Surveillance et journalisation activées

## Module 5 : Conversion de votre propre application AI

### Étape 5.1 : Feuille d’évaluation

**Avant de convertir votre app**, répondez à ces questions :

1. **Architecture de l’application :**  
   - Quels services AI votre app utilise-t-elle ?  
   - Quels ressources de calcul nécessite-t-elle ?  
   - A-t-elle besoin d’une base de données ?  
   - Quelles sont les dépendances entre services ?

2. **Exigences de sécurité :**  
   - Quelles données sensibles votre app manipule-t-elle ?  
   - Quelles exigences de conformité avez-vous ?  
   - Avez-vous besoin d’un réseau privé ?

3. **Exigences de montée en charge :**  
   - Quelle est votre charge attendue ?  
   - Avez-vous besoin d’auto-scalabilité ?  
   - Y a-t-il des contraintes régionales ?

### Étape 5.2 : Créez votre modèle AZD

**Suivez ce modèle pour convertir votre app :**

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


### **Exercice de laboratoire 5.1 : Défi de création de modèle**

**Défi :** Créez un modèle AZD pour une application AI de traitement documentaire.

**Exigences :**  
- Microsoft Foundry Models pour analyse de contenu  
- Document Intelligence pour OCR  
- Compte de stockage pour les uploads de documents  
- Function App pour la logique de traitement  
- Application web pour l’interface utilisateur

**Points bonus :**  
- Ajoutez une gestion d’erreur appropriée  
- Incluez une estimation des coûts  
- Configurez des tableaux de bord de surveillance

## Module 6 : Dépannage des problèmes courants

### Problèmes courants de déploiement

#### Problème 1 : Quota du service OpenAI dépassé  
**Symptômes :** Échec du déploiement avec erreur de quota  
**Solutions :**  
```bash
# Vérifiez les quotas actuels
az cognitiveservices usage list --location eastus

# Demandez une augmentation de quota ou essayez une autre région
azd env set AZURE_LOCATION westus2
azd up
```


#### Problème 2 : Modèle non disponible dans la région  
**Symptômes :** Échecs de réponses AI ou erreurs de déploiement du modèle  
**Solutions :**  
```bash
# Vérifier la disponibilité du modèle par région
az cognitiveservices model list --location eastus

# Mettre à jour vers le modèle disponible
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```


#### Problème 3 : Problèmes de permission  
**Symptômes :** Erreurs 403 Forbidden lors des appels aux services AI  
**Solutions :**  
```bash
# Vérifier les affectations de rôles
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Ajouter les rôles manquants
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```


### Problèmes de performance

#### Problème 4 : Réponses AI lentes  
**Étapes d’investigation :**  
1. Consultez Application Insights pour les métriques de performance  
2. Passez en revue les métriques du service OpenAI dans le portail Azure  
3. Vérifiez la connectivité réseau et la latence

**Solutions :**  
- Implémentez la mise en cache pour les requêtes courantes  
- Utilisez le modèle OpenAI adapté à votre cas d’usage  
- Envisagez des réplicas en lecture pour les scénarios de forte charge

### **Exercice de laboratoire 6.1 : Défi de débogage**

**Scénario :** Votre déploiement a réussi, mais l’application retourne des erreurs 500.

**Tâches de débogage :**  
1. Vérifiez les logs de l’application  
2. Vérifiez la connectivité des services  
3. Testez l’authentification  
4. Passez en revue la configuration

**Outils à utiliser :**  
- `azd show` pour un aperçu du déploiement  
- Portail Azure pour les logs détaillés des services  
- Application Insights pour la télémétrie de l’application

## Module 7 : Surveillance et optimisation

### Étape 7.1 : Configurez une surveillance complète

1. **Créez des tableaux de bord personnalisés :**  

Naviguez dans le portail Azure et créez un tableau de bord avec :  
- Nombre et latence des requêtes OpenAI  
- Taux d’erreurs de l’application  
- Utilisation des ressources  
- Suivi des coûts

2. **Configurez des alertes :**  
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

1. **Analysez les coûts actuels :**  
```bash
# Utilisez Azure CLI pour obtenir les données de coût
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **Mettez en place des contrôles de coûts :**  
- Configurez des alertes budgétaires  
- Utilisez des politiques d’autoscaling  
- Implémentez la mise en cache des requêtes  
- Surveillez l’utilisation des tokens OpenAI

### **Exercice de laboratoire 7.1 : Optimisation des performances**

**Tâche :** Optimisez votre application AI pour la performance et le coût.

**Metrics à améliorer :**  
- Réduire le temps moyen de réponse de 20%  
- Réduire les coûts mensuels de 15%  
- Maintenir un uptime de 99,9%

**Stratégies à essayer :**  
- Implémenter la mise en cache des réponses  
- Optimiser les prompts pour l’efficacité en tokens  
- Utiliser des SKUs de calcul appropriés  
- Configurer une autoscaling adaptée

## Défi final : Implémentation de bout en bout

### Scénario du défi

Vous devez créer un chatbot service client AI prêt pour la production avec ces exigences :

**Exigences fonctionnelles :**  
- Interface web pour interactions client  
- Intégration avec Microsoft Foundry Models pour les réponses  
- Recherche documentaire via Azure AI Search  
- Intégration à la base client existante  
- Support multilingue

**Exigences non fonctionnelles :**  
- Supporte 1000 utilisateurs simultanés  
- SLA de 99,9% uptime  
- Conformité SOC 2  
- Coût inférieur à 500$/mois  
- Déploiement vers plusieurs environnements (dev, staging, prod)

### Étapes d’implémentation

1. **Concevez l’architecture**  
2. **Créez le modèle AZD**  
3. **Implémentez les mesures de sécurité**  
4. **Mettez en place la surveillance et les alertes**  
5. **Créez les pipelines de déploiement**  
6. **Documentez la solution**

### Critères d’évaluation

- ✅ **Fonctionnalité** : Répond-elle à toutes les exigences ?  
- ✅ **Sécurité** : Les bonnes pratiques sont-elles respectées ?  
- ✅ **Scalabilité** : Peut-elle gérer la charge ?  
- ✅ **Maintenabilité** : Le code et l’infrastructure sont-ils bien organisés ?  
- ✅ **Coût** : Reste-t-elle dans le budget ?

## Ressources supplémentaires

### Documentation Microsoft  
- [Documentation Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Documentation du service Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Documentation Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Modèles d’exemple  
- [Application chat Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [Démarrage rapide OpenAI Chat App](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ressources Communautaires
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificat d'Achèvement

Félicitations ! Vous avez terminé le laboratoire AI Workshop. Vous devriez maintenant être capable de :

- ✅ Convertir des applications IA existantes en modèles AZD
- ✅ Déployer des applications IA prêtes pour la production
- ✅ Mettre en œuvre les meilleures pratiques de sécurité pour les charges de travail IA
- ✅ Surveiller et optimiser la performance des applications IA
- ✅ Résoudre les problèmes courants de déploiement

### Prochaines étapes
1. Appliquez ces modèles à vos propres projets IA
2. Contribuez à la communauté en partageant vos modèles
3. Rejoignez le Discord Microsoft Foundry pour un support continu
4. Explorez des sujets avancés comme les déploiements multi-régions

---

**Retour sur l'atelier** : Aidez-nous à améliorer cet atelier en partageant votre expérience dans le [canal #Azure du Discord Microsoft Foundry](https://discord.gg/microsoft-azure).

---

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 2 - Développement IA en priorité
- **⬅️ Précédent** : [Déploiement de modèle IA](ai-model-deployment.md)
- **➡️ Suivant** : [Bonnes pratiques IA en production](production-ai-practices.md)
- **🚀 Chapitre suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

**Besoin d’aide ?** Rejoignez notre communauté pour obtenir du support et discuter des déploiements AZD et IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->