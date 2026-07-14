# Créer Votre Propre Modèle azd

**Navigation du Chapitre :**
- **📚 Accueil du cours** : [AZD Pour Débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 4 - Infrastructure as Code & Déploiement
- **⬅️ Précédent** : [Guide de Déploiement](deployment-guide.md)
- **🚀 Chapitre suivant** : [Chapitre 5 : Solutions Multi-Agent](../chapter-05-multi-agent/README.md)

> Validé avec `azd 1.27.1` en juillet 2026.

## Introduction

Jusqu'à présent, vous avez *consommé* des modèles avec `azd init --template <nom>`. Mais une fois que vous avez une structure de projet que votre équipe apprécie — par exemple, une Container App avec Cosmos DB et la surveillance adéquate — vous voudrez en faire un modèle réutilisable à vous. Un modèle est simplement un dépôt Git avec une structure prévisible que azd sait lire. Cette leçon vous montre comment en construire un de zéro, le tester et (optionnellement) le publier dans la galerie communautaire.

## Objectifs d'Apprentissage

À la fin de cette leçon, vous serez capable de :
- Comprendre ce qui fait d'un dossier un "modèle azd"
- Connaître les fichiers et la structure du dossier nécessaires
- Ajouter un `azure.yaml` et un `infra/` que d'autres peuvent réutiliser
- Tester votre modèle localement avant de le partager
- Le publier et (optionnellement) le soumettre à Awesome AZD

## Résultats d'apprentissage

Après avoir complété cette leçon, vous serez capable de :
- Générer un nouveau dépôt de modèle
- Paramétrer l'infrastructure pour qu'elle fonctionne dans n'importe quel abonnement
- Valider un modèle avec `azd init` et `azd up`
- Ajouter les métadonnées requises par la galerie communautaire

---

## Qu'est-ce qu'un Modèle ?

Un modèle azd est **un dépôt Git** qui contient, au minimum :

| Fichier / dossier | Objectif | Obligatoire ? |
|---------------|---------|-----------|
| `azure.yaml` | Décrit les services, hôtes et fournisseur d'infra | ✅ Oui |
| `infra/` | Bicep, Terraform, ou Pulumi qui provisionne les ressources | ✅ Oui |
| `src/` (ou votre code) | Le code de l'application que azd déploie | ✅ Oui |
| `README.md` | Comment utiliser le modèle | ✅ Fortement recommandé |
| `.azdo/` ou `.github/` | Définitions des pipelines CI/CD | Optionnel |
| `.devcontainer/` | Environnement de dev reproductible | Optionnel |
| `azure.yaml` `metadata` | Infos galerie + télémétrie | Optionnel (requis pour publier) |

Il n’y a rien de magique : quand vous lancez `azd init --template you/your-repo`, azd clone le dépôt et lit `azure.yaml`.

---

## Étape 1 : Générer le Dépôt

Créez la structure de dossiers à la main ou partez d’un modèle minimal et modifiez-le :

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Créer la disposition standard
mkdir -p src infra
```

Une structure typique finale ressemble à ceci :

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
  provider: bicep                   # or "terraform" / "pulumi"
  path: infra
services:
  web:
    project: ./src/app
    language: js                    # js | python | dotnet | java | go
    host: containerapp              # appservice | containerapp | function | aks | staticwebapp
```

> Le champ `metadata.template` est ce que la télémétrie de la galerie utilise pour comptabiliser l'utilisation. Utilisez la convention `nom@version`.

---

## Étape 3 : Paramétrer l’Infrastructure

La règle la plus importante pour un modèle *réutilisable* : **ne jamais coder en dur des noms, régions ou valeurs spécifiques d’abonnement.** Utilisez des paramètres et le modèle resource token afin que le même modèle fonctionne dans l’abonnement de n’importe qui.

```bicep
// infra/main.bicep
targetScope = 'resourceGroup'

@minLength(1)
@description('Primary location for all resources')
param location string = resourceGroup().location

@minLength(1)
@maxLength(64)
@description('Name of the environment (used to generate resource names)')
param environmentName string

// Generate globally-unique, stable names from the environment + subscription
var resourceToken = uniqueString(subscription().id, environmentName, location)
var tags = { 'azd-env-name': environmentName }

module web 'modules/web.bicep' = {
  name: 'web'
  params: {
    name: 'app-${resourceToken}'
    location: location
    tags: tags
  }
}

output SERVICE_WEB_ENDPOINT_URL string = web.outputs.uri
```

Deux choses rendent ce modèle adapté à la réutilisation :

1. **Tag `azd-env-name`** — azd l’utilise pour tracer et nettoyer les ressources par environnement.
2. **Resource token `uniqueString(...)`** — produit un suffixe stable et globalement unique pour éviter les collisions de noms.

Fournissez un fichier de paramètres correspondant qui lit les valeurs que azd injecte depuis l’environnement :

```json
// infra/main.parameters.json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": { "value": "${AZURE_ENV_NAME}" },
    "location": { "value": "${AZURE_LOCATION}" }
  }
}
```

azd substitue automatiquement `${AZURE_ENV_NAME}` et `${AZURE_LOCATION}` depuis l’environnement courant.

---

## Étape 4 : Tester Votre Modèle Localement

Avant de partager, prouvez que le modèle fonctionne à partir d’un état propre.

**Testez depuis le dossier local** (pas besoin de pousser sur Git) :

```bash
# Depuis un répertoire vide, initialisez en utilisant votre chemin de modèle local
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisionner + déployer de bout en bout
azd auth login
azd up
```

**Puis testez la destruction** — un bon modèle nettoie complètement :

```bash
azd down --force --purge
```

Si `azd down` laisse des ressources, vous avez probablement oublié le tag `azd-env-name` sur une ressource.

> **Astuce :** lancez d’abord `azd provision --preview`. Cela fait un what-if et affiche les erreurs du modèle avant la création de toute ressource.

---

## Étape 5 : Publier le Modèle

Poussez le dépôt sur GitHub (public si vous voulez que d’autres l’utilisent) :

```bash
gh repo create my-azd-template --public --source=. --push
```

N’importe qui peut maintenant l’utiliser :

```bash
azd init --template your-github-username/my-azd-template
```

---

## Étape 6 (Optionnel) : Soumettre à Awesome AZD

La [galerie Awesome AZD](https://azure.github.io/awesome-azd/) liste les modèles communautaires. Pour être listé, votre dépôt doit inclure :

- ✅ Un `README.md` clair avec prérequis, un diagramme d'architecture et des notes sur les coûts
- ✅ Un `azure.yaml` fonctionnel avec `metadata.template`
- ✅ Une infrastructure qui se provisionne proprement dans un nouvel abonnement
- ✅ Un fichier `LICENSE`
- ✅ (Recommandé) Un `.devcontainer/` pour Codespaces en un clic

Soumettez en ouvrant une pull request qui ajoute votre modèle au fichier de données de la galerie, suivant le guide de contribution dans le [dépôt Awesome AZD](https://github.com/Azure/awesome-azd).

---

## Pièges Courants

| Piège | Solution |
|---------|-----|
| Noms de ressources codés en dur | Utiliser le resource token `uniqueString()` |
| `azd down` laisse des ressources | Taguer chaque ressource (ou le groupe ressource) avec `azd-env-name` |
| Le modèle marche pour vous mais pas pour d’autres | Enlever les IDs d’abonnement, IDs de locataire et hypothèses sur les régions |
| Sorties non reliées à l’application | Exporter `SERVICE_<NAME>_ENDPOINT_URL` et autres sorties `AZURE_*` |
| Soumission galerie rejetée | Ajouter `README.md`, `LICENSE` et `metadata.template` |

---

## Résumé

- Un modèle est juste un dépôt Git avec `azure.yaml`, `infra/` et votre code.
- Paramétrez tout — noms, régions et IDs — pour que ça fonctionne partout.
- Toujours taguer les ressources avec `azd-env-name` pour que `azd down` fonctionne.
- Testez localement avec `azd init --template <chemin-local>` avant de publier.
- Ajoutez métadonnées et README pour soumettre à Awesome AZD.

---

## 🔗 Navigation

| Direction | Ressource |
|-----------|----------|
| **Précédent** | [Guide de Déploiement](deployment-guide.md) |
| **Accueil du Chapitre** | [Chapitre 4 : Infrastructure en tant que Code](README.md) |
| **Chapitre Suivant** | [Chapitre 5 : Solutions Multi-Agent](../chapter-05-multi-agent/README.md) |

## 📖 Ressources Associées

- [Provisioning des Ressources](provisioning.md)
- [Galerie Awesome AZD](https://azure.github.io/awesome-azd/)
- [Documentation officielle des modèles azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->