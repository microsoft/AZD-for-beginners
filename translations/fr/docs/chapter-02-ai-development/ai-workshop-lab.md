# Laboratoire Atelier IA : Rendre Vos Solutions IA Déployables avec AZD

**Navigation Chapitre :**
- **📚 Accueil du Cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre Actuel** : Chapitre 2 - Développement AI-First
- **⬅️ Précédent** : [Déploiement de Modèle IA](ai-model-deployment.md)
- **➡️ Suivant** : [Bonnes Pratiques IA en Production](production-ai-practices.md)
- **🚀 Chapitre Suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

## Aperçu de l'Atelier

Ce laboratoire pratique guide les développeurs à travers le processus de prise d’un modèle IA existant et son déploiement à l’aide d’Azure Developer CLI (AZD). Vous apprendrez les modèles essentiels pour les déploiements IA en production utilisant les services Microsoft Foundry.

> **Note de validation (2026-03-25) :** Cet atelier a été testé avec `azd` version `1.23.12`. Si votre installation locale est plus ancienne, mettez à jour AZD avant de commencer pour que le flux d’authentification, de modèle et de déploiement corresponde aux étapes ci-dessous.

**Durée :** 2-3 heures  
**Niveau :** Intermédiaire  
**Prérequis :** Connaissances de base d’Azure, notions d’IA/ML

## 🎓 Objectifs d’Apprentissage

À la fin de cet atelier, vous serez capable de :  
- ✅ Convertir une application IA existante pour utiliser les modèles AZD  
- ✅ Configurer les services Microsoft Foundry avec AZD  
- ✅ Mettre en place une gestion sécurisée des identifiants pour les services IA  
- ✅ Déployer des applications IA prêtes pour la production avec supervision  
- ✅ Dépanner les problèmes communs au déploiement IA

## Prérequis

### Outils Requis
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installé  
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installé  
- [Git](https://git-scm.com/) installé  
- Éditeur de code (VS Code recommandé)

### Ressources Azure
- Abonnement Azure avec accès contributeur  
- Accès aux services Microsoft Foundry Models (ou possibilité de demander l’accès)  
- Permissions pour créer des groupes de ressources

### Connaissances Préalables
- Compréhension de base des services Azure  
- Familiarité avec les interfaces en ligne de commande  
- Concepts basiques IA/ML (API, modèles, prompts)

## Configuration du Laboratoire

### Étape 1 : Préparation de l’Environnement

1. **Vérifier l’installation des outils :**  
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
  
Si vous travaillez sur plusieurs locataires ou que votre abonnement n’est pas détecté automatiquement, réessayez avec `azd auth login --tenant-id <tenant-id>`.

2. **Cloner le dépôt de l’atelier :**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## Module 1 : Comprendre la Structure AZD pour Applications IA

### Anatomie d’un Modèle AZD IA

Explorez les fichiers clés dans un modèle AZD prêt pour l'IA :

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
  
### **Exercice en Laboratoire 1.1 : Explorer la Configuration**

1. **Examinez le fichier azure.yaml :**  
```bash
cat azure.yaml
```
  
**À rechercher :**  
- Définitions des services pour les composants IA  
- Mappages des variables d’environnement  
- Configurations d’hôtes

2. **Passez en revue l’infrastructure main.bicep :**  
```bash
cat infra/main.bicep
```
  
**Modèles IA clés à identifier :**  
- Provisionnement du service Microsoft Foundry Models  
- Intégration Azure AI Search  
- Gestion sécurisée des clés  
- Configurations de sécurité réseau

### **Point de Discussion : Pourquoi Ces Modèles sont Cruciaux pour l’IA**

- **Dépendances des Services :** Les applications IA requièrent souvent plusieurs services coordonnés  
- **Sécurité :** Les clés API et points d’accès nécessitent une gestion sécurisée  
- **Évolutivité :** Les charges IA ont des besoins de mise à l’échelle spécifiques  
- **Gestion des Coûts :** Les services IA peuvent être coûteux sans bonne configuration

## Module 2 : Déployer Votre Première Application IA

### Étape 2.1 : Initialiser l’Environnement

1. **Créer un nouvel environnement AZD :**  
```bash
azd env new myai-workshop
```
  
2. **Configurer les paramètres requis :**  
```bash
# Définissez votre région Azure préférée
azd env set AZURE_LOCATION eastus

# Optionnel : Définissez un modèle OpenAI spécifique
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```
  
### Étape 2.2 : Déployer l’Infrastructure et l’Application

1. **Déployer avec AZD :**  
```bash
azd up
```
  
**Ce qui se passe lors de `azd up` :**  
- ✅ Provisionne le service Microsoft Foundry Models  
- ✅ Crée le service Azure AI Search  
- ✅ Met en place un App Service pour l’application web  
- ✅ Configure le réseau et la sécurité  
- ✅ Déploie le code applicatif  
- ✅ Met en place la supervision et les logs

2. **Surveillez la progression du déploiement** et notez les ressources créées.

### Étape 2.3 : Vérifiez Votre Déploiement

1. **Contrôlez les ressources déployées :**  
```bash
azd show
```
  
2. **Ouvrez l’application déployée :**  
```bash
azd show
```
  
Ouvrez le point d’accès web affiché dans la sortie de `azd show`.

3. **Testez la fonctionnalité IA :**  
   - Naviguez dans l’application web  
   - Essayez des requêtes d’exemple  
   - Vérifiez que les réponses IA fonctionnent

### **Exercice en Laboratoire 2.1 : Pratique de Dépannage**

**Scénario :** Le déploiement a réussi mais l’IA ne répond pas.

**Problèmes courants à vérifier :**  
1. **Clés API OpenAI** : Vérifiez qu’elles sont correctement configurées  
2. **Disponibilité du modèle** : Assurez-vous que votre région supporte le modèle  
3. **Connectivité réseau** : Vérifiez que les services peuvent communiquer  
4. **Permissions RBAC** : Confirmez que l’application peut accéder à OpenAI

**Commandes de débogage :**  
```bash
# Vérifier les variables d'environnement
azd env get-values

# Voir les journaux de déploiement
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Vérifier le statut du déploiement OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## Module 3 : Personnaliser les Applications IA pour Vos Besoins

### Étape 3.1 : Modifier la Configuration IA

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
  
### Étape 3.2 : Configurations Spécifiques à l’Environnement

**Bonne pratique :** configurations différentes pour développement vs production.

1. **Créer un environnement production :**  
```bash
azd env new myai-production
```
  
2. **Configurer les paramètres spécifiques à la production :**  
```bash
# La production utilise généralement des UGS plus élevés
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Activer des fonctionnalités de sécurité supplémentaires
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  
### **Exercice en Laboratoire 3.1 : Optimisation des Coûts**

**Défi :** Configurez le modèle pour un développement à coût réduit.

**Tâches :**  
1. Identifier les SKU pouvant être en niveau gratuit/basique  
2. Configurer les variables d’environnement pour un coût minimal  
3. Déployer et comparer les coûts avec la configuration production

**Indices de solution :**  
- Utilisez le niveau F0 (gratuit) pour Azure AI Services lorsque possible  
- Utilisez le niveau Basique pour le service Search en développement  
- Envisagez le plan Consommation pour les Functions

## Module 4 : Sécurité et Bonnes Pratiques Production

### Étape 4.1 : Gestion Sécurisée des Identifiants

**Problème actuel :** Beaucoup d’applications IA codent en dur les clés API ou stockent de manière non sécurisée.

**Solution AZD :** Identité managée + intégration Key Vault.

1. **Revue de la configuration de sécurité dans votre modèle :**  
```bash
# Recherchez la configuration du Key Vault et de l'identité gérée
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **Vérifiez que l’Identité Managée fonctionne :**  
```bash
# Vérifiez si l'application web a la configuration d'identité correcte
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  
### Étape 4.2 : Sécurité Réseau

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
  
### Étape 4.3 : Supervision et Observabilité

1. **Configurez Application Insights :**  
```bash
# Application Insights doit être configuré automatiquement
# Vérifiez la configuration :
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **Mettez en place la supervision spécifique IA :**

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
  
### **Exercice en Laboratoire 4.1 : Audit de Sécurité**

**Tâche :** Revuez votre déploiement selon les bonnes pratiques sécurité.

**Checklist :**  
- [ ] Pas de secrets codés en dur dans le code ou la configuration  
- [ ] Identité Managée utilisée pour l’authentification service-à-service  
- [ ] Key Vault stocke la configuration sensible  
- [ ] Accès réseau correctement restreint  
- [ ] Supervision et logs activés

## Module 5 : Conversion de Votre Propre Application IA

### Étape 5.1 : Fiche d’Évaluation

**Avant de convertir votre application**, répondez à ces questions :

1. **Architecture de l’Application :**  
   - Quels services IA votre application utilise-t-elle ?  
   - Quelles ressources de calcul nécessite-t-elle ?  
   - Utilise-t-elle une base de données ?  
   - Quelles sont les dépendances entre services ?

2. **Exigences de Sécurité :**  
   - Quelles données sensibles votre application traite-t-elle ?  
   - Quelles exigences de conformité avez-vous ?  
   - Avez-vous besoin d’un réseau privé ?

3. **Exigences de Mise à l’Échelle :**  
   - Quelle charge attendez-vous ?  
   - Avez-vous besoin d’auto-scaling ?  
   - Y a-t-il des contraintes régionales ?

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

**infra/main.bicep** – Modèle principal :  
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
  
**infra/modules/openai.bicep** – Module OpenAI :  
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
  
### **Exercice en Laboratoire 5.1 : Défi de Création de Modèle**

**Défi :** Créez un modèle AZD pour une application IA de traitement de documents.

**Exigences :**  
- Microsoft Foundry Models pour l’analyse de contenu  
- Document Intelligence pour la reconnaissance optique de caractères (OCR)  
- Compte de stockage pour les uploads de documents  
- Function App pour la logique de traitement  
- Application web pour l’interface utilisateur

**Points bonus :**  
- Ajoutez une gestion d’erreur appropriée  
- Incluez une estimation des coûts  
- Mettez en place des tableaux de bord de supervision

## Module 6 : Résolution des Problèmes Courants

### Problèmes Courants de Déploiement

#### Problème 1 : Quota du Service OpenAI Dépassé  
**Symptômes :** Échec du déploiement avec erreur de quota  
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

# Mettre à jour vers un modèle disponible
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```
  
#### Problème 3 : Problèmes de Permissions  
**Symptômes :** Erreurs 403 Forbidden lors des appels aux services IA  
**Solutions :**  
```bash
# Vérifier les affectations de rôle
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
1. Vérifiez Application Insights pour les métriques de performance  
2. Passez en revue les métriques du service OpenAI dans le portail Azure  
3. Vérifiez la connectivité et la latence réseau

**Solutions :**  
- Implémentez la mise en cache pour les requêtes courantes  
- Utilisez le modèle OpenAI adapté à votre cas d’usage  
- Envisagez des réplicas en lecture pour les scénarios à forte charge

### **Exercice en Laboratoire 6.1 : Défi de Débogage**

**Scénario :** Votre déploiement a réussi, mais l’application renvoie des erreurs 500.

**Tâches de débogage :**  
1. Contrôlez les logs applicatifs  
2. Vérifiez la connectivité aux services  
3. Testez l’authentification  
4. Revue de la configuration

**Outils à utiliser :**  
- `azd show` pour un aperçu du déploiement  
- Portail Azure pour les logs détaillés des services  
- Application Insights pour la télémétrie applicative

## Module 7 : Supervision et Optimisation

### Étape 7.1 : Mise en Place d’une Supervision Complète

1. **Créez des tableaux de bord personnalisés :**

Naviguez dans le portail Azure et créez un tableau de bord avec :  
- Nombre et latence des requêtes OpenAI  
- Taux d’erreur applicatif  
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
  
### Étape 7.2 : Optimisation des Coûts

1. **Analysez les coûts actuels :**  
```bash
# Utilisez Azure CLI pour obtenir les données de coût
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **Mettez en œuvre des contrôles de coûts :**  
- Configurez des alertes budgétaires  
- Utilisez des politiques d’autoscaling  
- Implémentez la mise en cache des requêtes  
- Surveillez l’usage des tokens pour OpenAI

### **Exercice en Laboratoire 7.1 : Optimisation des Performances**

**Tâche :** Optimisez votre application IA à la fois pour la performance et les coûts.

**Metrics à améliorer :**  
- Réduire le temps moyen de réponse de 20%  
- Réduire les coûts mensuels de 15%  
- Maintenir une disponibilité de 99,9%

**Stratégies à tester :**  
- Implémenter la mise en cache des réponses  
- Optimiser les prompts pour l’efficacité des tokens  
- Utiliser les SKU de calcul appropriés  
- Mettre en place un autoscaling adapté

## Défi Final : Implémentation de Bout en Bout

### Scénario du Défi

Vous devez créer un chatbot IA opérationnel en production pour le service client avec ces exigences :

**Exigences Fonctionnelles :**  
- Interface web pour les interactions clients  
- Intégration avec Microsoft Foundry Models pour les réponses  
- Recherche documentaire via Azure AI Search  
- Intégration à la base client existante  
- Support multilingue

**Exigences Non Fonctionnelles :**  
- Gérer 1000 utilisateurs simultanés  
- SLA de disponibilité à 99,9%  
- Conformité SOC 2  
- Coût inférieur à 500$/mois  
- Déploiement multi-environnements (dev, staging, prod)

### Étapes d’Implémentation

1. Concevoir l’architecture  
2. Créer le modèle AZD  
3. Mettre en œuvre les mesures de sécurité  
4. Mettre en place la supervision et les alertes  
5. Créer les pipelines de déploiement  
6. Documenter la solution

### Critères d’Évaluation

- ✅ **Fonctionnalité** : Répond-il à toutes les exigences ?  
- ✅ **Sécurité** : Les bonnes pratiques sont-elles mises en place ?  
- ✅ **Évolutivité** : Supporte-t-il la charge ?  
- ✅ **Maintenabilité** : Le code et l’infrastructure sont-ils bien organisés ?  
- ✅ **Coût** : Respecte-t-il le budget ?

## Ressources Complémentaires

### Documentation Microsoft  
- [Documentation Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Documentation Microsoft Foundry Models](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Documentation Microsoft Foundry](https://learn.microsoft.com/azure/ai-studio/)

### Modèles d’Exemple  
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ressources Communautaires
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Certificat de Achèvement

Félicitations ! Vous avez terminé le laboratoire de l'atelier IA. Vous devriez maintenant être capable de :

- ✅ Convertir des applications IA existantes en modèles AZD
- ✅ Déployer des applications IA prêtes pour la production
- ✅ Mettre en œuvre les meilleures pratiques de sécurité pour les charges de travail IA
- ✅ Surveiller et optimiser les performances des applications IA
- ✅ Résoudre les problèmes courants de déploiement

### Étapes suivantes
1. Appliquez ces modèles à vos propres projets IA
2. Contribuez des modèles à la communauté
3. Rejoignez le Discord Microsoft Foundry pour un support continu
4. Explorez des sujets avancés comme les déploiements multi-région

---

**Retour sur l'atelier** : Aidez-nous à améliorer cet atelier en partageant votre expérience dans le [canal #Azure du Discord Microsoft Foundry](https://discord.gg/microsoft-azure).

---

**Navigation du Chapitre :**
- **📚 Accueil du cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 2 - Développement IA Prioritaire
- **⬅️ Précédent** : [Déploiement de Modèle IA](ai-model-deployment.md)
- **➡️ Suivant** : [Meilleures Pratiques IA en Production](production-ai-practices.md)
- **🚀 Chapitre Suivant** : [Chapitre 3 : Configuration](../chapter-03-configuration/configuration.md)

**Besoin d'aide ?** Rejoignez notre communauté pour du support et des discussions sur AZD et les déploiements IA.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->