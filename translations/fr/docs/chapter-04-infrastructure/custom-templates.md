# Créer Votre Propre Modèle azd

**Navigation du Chapitre :**
- **📚 Accueil du Cours** : [AZD pour Débutants](../../README.md)
- **📖 Chapitre Actuel** : Chapitre 4 - Infrastructure as Code & Déploiement
- **⬅️ Précédent** : [Guide de Déploiement](deployment-guide.md)
- **🚀 Chapitre Suivant** : [Chapitre 5 : Solutions Multi-Agents](../chapter-05-multi-agent/README.md)

> Revu avec `azd 1.37.2` (novembre 2026). Ceci est un **tutoriel de création avec fichiers partiels**, pas un modèle complet : vous devez fournir le code applicatif et `modules/web.bicep` avec son environnement, registre, Container App et sorties avant déploiement. La provision Azure n’a pas été exécutée dans cette revue.

## Introduction

Jusqu'à présent, vous avez *consommé* des modèles avec `azd init --template <name>`. Mais une fois que vous avez une structure de projet que votre équipe apprécie — par exemple, une Container App avec un Cosmos DB et la bonne supervision — vous voudrez en faire un modèle réutilisable à votre propre usage. Un modèle est simplement un dépôt Git avec une structure prévisible que azd sait lire. Cette leçon vous montre comment en créer un de zéro, le tester, et (optionnellement) le publier dans la galerie communautaire.

## Objectifs d’Apprentissage

À la fin de cette leçon, vous serez capable de :
- Comprendre ce qui fait d’un dossier un « modèle azd »
- Connaître les fichiers requis et la structure des dossiers
- Ajouter un `azure.yaml` et un `infra/` que d'autres pourront réutiliser
- Tester votre modèle localement avant de le partager
- Le publier et (optionnellement) le soumettre à Awesome AZD

## Résultats d’Apprentissage

Une fois cette leçon terminée, vous serez capable de :
- Générer un dépôt de modèle neuf
- Paramétrer l’infrastructure pour qu’elle fonctionne dans n’importe quel abonnement
- Valider un modèle avec `azd init` et `azd up`
- Ajouter les métadonnées requises par la galerie communautaire

---

## Qu’est-ce qu’un Modèle, Réellement ?

Un modèle azd est **un dépôt Git** qui contient, au minimum :

| Fichier / dossier | But | Requis ? |
|---------------|---------|-----------|
| `azure.yaml` | Décrit services, hôtes, et fournisseur infra | ✅ Oui |
| `infra/` | Définitions de provisioning Bicep ou Terraform | Requis pour cet exemple IaC explicite ; les projets avec infrastructure générée peuvent l’omettre |
| `src/` (ou votre code) | Le code applicatif déployé par azd | Requis pour les services basés sur le code source ; tous les modèles ne contiennent pas de code applicatif |
| `README.md` | Comment utiliser le modèle | ✅ Fortement recommandé |
| `.azdo/` ou `.github/` | Définitions du pipeline CI/CD | Optionnel |
| `.devcontainer/` | Environnement de développement reproductible | Optionnel |
| `azure.yaml` `metadata` | Informations d’identité/télémétrie du modèle | Recommandé ; publier un dépôt Git ne le requiert pas |

Il n’y a rien de magique ici : quand vous lancez `azd init --template you/your-repo`, azd clone le dépôt et lit `azure.yaml`.

---

## Étape 1 : Générer le Dépôt

Créez la structure des dossiers à la main ou partez d’un modèle minimal et modifiez-le :

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Create the standard layout
mkdir -p src infra
```

Une disposition typique finale ressemble à ceci :

```
my-azd-template/
├── azure.yaml              # ← template definition
├── README.md               # ← how to use it
├── infra/
│   ├── main.bicep          # entry point
│   ├── main.parameters.json
│   └── modules/
│       └── web.bicep
├── src/
│   └── app/                # your application code
└── .github/
    └── workflows/
        └── azure-dev.yml   # optional CI/CD
```

---

## Étape 2 : Écrire `azure.yaml`

C’est le cœur du modèle. Il indique à azd quoi déployer et comment :

```yaml
# azure.yaml
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
name: my-azd-template
metadata:
  template: my-azd-template@1.0.0   # name@version — used by the gallery and telemetry
infra:
  provider: bicep                   # built-in alternative: terraform
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Le champ `metadata.template` est ce que la télémétrie de la galerie utilise pour compter l’utilisation. Utilisez la convention `name@version`.

---

## Étape 3 : Paramétrer l’Infrastructure

La règle la plus importante pour un modèle *réutilisable* : **ne jamais coder en dur les noms, régions ou valeurs spécifiques d’abonnement.** Utilisez des paramètres et le modèle de jeton ressource pour que le même modèle fonctionne dans l’abonnement de n’importe qui.

```bicep
// infra/main.bicep
targetScope = 'subscription'

@minLength(1)
@description('Primary location for all resources')
param location string

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'rg-${environmentName}'
  location: location
  tags: tags
}

module web 'modules/web.bicep' = {
  name: 'web'
  scope: rg
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Deux choses rendent ce modèle adapté à la réutilisation :

1. **`azd-env-name` tag** — azd l’utilise pour suivre et nettoyer les ressources par environnement.
2. **`uniqueString(...)` resource token** — produit un suffixe de hachage stable pour réduire les collisions ; ce n’est pas une garantie d’unicité globale.

Le `modules/web.bicep` manquant doit accepter `name`, `location`, et `tags`, provisionner l’environnement/registre Container Apps et l’application, taguer l’application avec `azd-service-name: web`, et exporter `uri`. Il doit aussi exposer les valeurs du registre nécessaires au flux de build/deploy choisi (par exemple `AZURE_CONTAINER_REGISTRY_ENDPOINT` depuis le module racine). Une sortie d’endpoint seule ne connecte pas la découverte de service, les paramètres de l’application, ni l’authentification au registre.

Fournissez un fichier de paramètres correspondant qui lit les valeurs que azd injecte depuis l’environnement :

Enregistrez ce qui suit en tant que `infra/main.parameters.json` :

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd substitue automatiquement `${AZURE_ENV_NAME}` et `${AZURE_LOCATION}` depuis l’environnement actuel.

---

## Étape 4 : Testez votre modèle localement

Avant de partager, assurez-vous que le modèle fonctionne depuis un état propre.

**Testez depuis le dossier local** (pas besoin de push Git) :

```bash
# From an empty directory, initialize using your local template path
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template .

# Provision + deploy end to end
azd auth login
azd up
```

**Puis testez le démontage** — un bon modèle nettoie totalement :

```bash
azd down --force --purge
```

Si `azd down` laisse des ressources derrière, vérifiez la découverte d’environnement/groupe de ressources, les ressources externes/partagées, les permissions, verrous, et la protection contre la purge. `--purge` ne supprime pas l’état local `.azure/`.

> **Astuce :** après avoir fourni tous les fichiers manquants, exécutez d’abord `azd provision --preview`. Inspectez les hooks avant l’aperçu car ils peuvent exécuter des commandes ayant des effets secondaires. L’aperçu n’est pas une estimation de prix ni une garantie que le provisioning réussira.

---

## Étape 5 : Publiez le modèle

Poussez le dépôt sur GitHub (public si vous voulez que d’autres l’utilisent) :

```bash
# Return to the SOURCE template folder, not /tmp/test-run.
# Review .gitignore and staged content; never commit .azure/ or secrets.
git add azure.yaml infra src README.md .gitignore
git commit -m "Add reusable azd template"
gh repo create my-azd-template --public --source=. --push
```

N’importe qui peut désormais l’utiliser :

```bash
azd init --template your-github-username/my-azd-template .
```

---

## Étape 6 (Optionnel) : Soumettre à Awesome AZD

La [galerie Awesome AZD](https://azure.github.io/awesome-azd/) liste les modèles communautaires. Pour être listé, votre dépôt doit inclure :

- ✅ Un `README.md` clair avec les prérequis, un diagramme d’architecture, et des notes de coûts
- ✅ Un `azure.yaml` fonctionnel avec `metadata.template`
- ✅ Une infrastructure qui se provisionne proprement dans un nouvel abonnement
- ✅ Un fichier `LICENSE`
- ✅ (Recommandé) Un `.devcontainer/` pour Codespaces en un clic

Soumettez en ouvrant une pull request qui ajoute votre modèle au fichier de données de la galerie, en suivant le guide de contribution dans le [dépôt Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Pièges Courants

| Piège | Correction |
|---------|-----|
| Noms de ressources codés en dur | Utilisez le `uniqueString()` resource token |
| `azd down` laisse des ressources | Tagguez chaque ressource (ou le groupe de ressources) avec `azd-env-name` |
| Le modèle marche pour vous, échoue pour d’autres | Enlevez les IDs d’abonnement, d’entité, et les hypothèses de région |
| Sorties non reliées à l’application | Faites correspondre `azd-service-name`/`resourceName` pour le déploiement et mappez explicitement les sorties aux paramètres de l’application |
| Soumission à la galerie rejetée | Ajoutez `README.md`, `LICENSE`, et `metadata.template` |

---

## Résumé

- Un modèle est juste un repo Git avec `azure.yaml`, `infra/`, et votre code.
- Paramétrez tout — noms, régions, et IDs — pour qu’il fonctionne partout.
- Tagguez toujours les ressources avec `azd-env-name` pour que `azd down` fonctionne.
- Testez localement avec `azd init --template <local-path>` avant de publier.
- Ajoutez des métadonnées et un README pour soumettre à Awesome AZD.

---

## 🔗 Navigation

| Direction | Ressource |
|-----------|----------|
| **Précédent** | [Guide de déploiement](deployment-guide.md) |
| **Accueil du chapitre** | [Chapitre 4 : Infrastructure en tant que Code](README.md) |
| **Chapitre suivant** | [Chapitre 5 : Solutions Multi-Agents](../chapter-05-multi-agent/README.md) |

## 📖 Ressources Associées

- [Provisionnement de ressources](provisioning.md)
- [Galerie Awesome AZD](https://azure.github.io/awesome-azd/)
- [Documentation officielle des templates azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->