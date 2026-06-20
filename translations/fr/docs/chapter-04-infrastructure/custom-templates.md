# Créer votre propre modèle azd

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapitre 4 - Infrastructure as Code et Déploiement
- **⬅️ Previous**: [Guide de déploiement](deployment-guide.md)
- **🚀 Next Chapter**: [Chapitre 5 : Solutions multi-agents](../chapter-05-multi-agent/README.md)

> Validé avec `azd 1.25.6` en juin 2026.

## Introduction

Jusqu'à présent, vous avez *utilisé* des modèles avec `azd init --template <name>`. Mais une fois que vous avez une structure de projet que votre équipe aime—par exemple une Container App avec une base Cosmos DB et la surveillance appropriée—vous voudrez en faire un modèle réutilisable. Un modèle est simplement un dépôt Git avec une structure prévisible que azd sait lire. Cette leçon vous montre comment en créer un à partir de zéro, le tester et (optionnellement) le publier dans la galerie communautaire.

## Learning Goals

By the end of this lesson, you will:
- Comprendre ce qui fait d'un dossier un « modèle azd »
- Connaître les fichiers requis et la structure des dossiers
- Ajouter un `azure.yaml` et un `infra/` que d'autres peuvent réutiliser
- Tester votre modèle localement avant de le partager
- Le publier et (optionnellement) le soumettre à Awesome AZD

## Learning Outcomes

After completing this lesson, you will be able to:
- Créer le squelette d'un nouveau dépôt de modèle
- Paramétrer l'infrastructure pour qu'elle fonctionne dans n'importe quel abonnement
- Valider un modèle avec `azd init` et `azd up`
- Ajouter les métadonnées requises par la galerie communautaire

---

## What Is a Template, Really?

Un modèle azd est **un dépôt Git** qui contient, au minimum :

| Fichier / dossier | Objectif | Requis? |
|-------------------|----------|---------|
| `azure.yaml` | Décrit les services, les hôtes et le fournisseur d'infrastructure | ✅ Oui |
| `infra/` | Bicep, Terraform ou Pulumi qui provisionnent les ressources | ✅ Oui |
| `src/` (or your code) | Le code de l'application que azd déploie | ✅ Oui |
| `README.md` | Comment utiliser le modèle | ✅ Fortement recommandé |
| `.azdo/` or `.github/` | Définitions de pipeline CI/CD | Optionnel |
| `.devcontainer/` | Environnement de développement reproductible | Optionnel |
| `azure.yaml` `metadata` | Informations de galerie + télémétrie | Optionnel (requis pour publier) |

There is nothing magic here: when you run `azd init --template you/your-repo`, azd clones the repo and reads `azure.yaml`.

---

## Step 1: Scaffold the Repository

Create the folder structure by hand or start from a minimal template and edit it:

```bash
mkdir my-azd-template && cd my-azd-template
git init

# Créer la mise en page standard
mkdir -p src infra
```

A typical finished layout looks like this:

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

## Step 2: Write `azure.yaml`

This is the heart of the template. It tells azd what to deploy and how:

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

> Le champ `metadata.template` est ce que la télémétrie de la galerie utilise pour compter les usages. Utilisez la convention `name@version`.

---

## Step 3: Parameterize the Infrastructure

The single most important rule for a *reusable* template: **never hardcode names, regions, or subscription-specific values.** Use parameters and the resource token pattern so the same template works in anyone's subscription.

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

Two things make this template-friendly:

1. **`azd-env-name` tag** — azd uses it to track and clean up resources per environment.
2. **`uniqueString(...)` resource token** — produces a stable, globally-unique suffix so names don't collide.

Provide a matching parameters file that reads values azd injects from the environment:

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

azd substitutes `${AZURE_ENV_NAME}` and `${AZURE_LOCATION}` from the current environment automatically.

---

## Step 4: Test Your Template Locally

Before sharing, prove the template works from a clean state.

**Test from the local folder** (no Git push required):

```bash
# À partir d'un répertoire vide, initialisez en utilisant le chemin de votre modèle local
mkdir /tmp/test-run && cd /tmp/test-run
azd init --template /path/to/my-azd-template

# Provisionner et déployer de bout en bout
azd auth login
azd up
```

**Then test the teardown**—a good template cleans up completely:

```bash
azd down --force --purge
```

If `azd down` leaves resources behind, you probably missed the `azd-env-name` tag on a resource.

> **Astuce:** run `azd provision --preview` first. Il effectue un what-if et met en évidence les erreurs du modèle avant la création de toute ressource.

---

## Step 5: Publish the Template

Push the repository to GitHub (public if you want others to use it):

```bash
gh repo create my-azd-template --public --source=. --push
```

Anyone can now use it:

```bash
azd init --template your-github-username/my-azd-template
```

---

## Step 6 (Optional): Submit to Awesome AZD

The [Awesome AZD gallery](https://azure.github.io/awesome-azd/) lists community templates. To be listed your repo should include:

- ✅ Un `README.md` clair avec les prérequis, un diagramme d'architecture et des notes sur les coûts
- ✅ Un `azure.yaml` fonctionnel avec `metadata.template`
- ✅ Une infrastructure qui se provisionne proprement dans un abonnement vierge
- ✅ Un fichier `LICENSE`
- ✅ (Recommandé) Un `.devcontainer/` pour Codespaces en un clic

Submit by opening a pull request that adds your template to the gallery's data file, following the contribution guide at the [Awesome AZD repository](https://github.com/Azure/awesome-azd).

---

## Common Pitfalls

| Pitfall | Fix |
|---------|-----|
| Noms de ressources codés en dur | Utilisez le jeton de ressource `uniqueString()` |
| `azd down` leaves resources | Étiquetez chaque ressource (ou le groupe de ressources) avec `azd-env-name` |
| Template works for you, fails for others | Supprimez les ID d'abonnement, les ID de locataire et les hypothèses de région |
| Outputs not wired into the app | Exportez `SERVICE_<NAME>_ENDPOINT_URL` et autres sorties `AZURE_*` |
| Gallery submission rejected | Ajoutez `README.md`, `LICENSE` et `metadata.template` |

---

## Summary

- Un modèle est simplement un dépôt Git avec `azure.yaml`, `infra/`, et votre code.
- Paramétrez tout—noms, régions, et IDs—pour qu'il s'exécute partout.
- Étiquetez toujours les ressources avec `azd-env-name` afin que `azd down` fonctionne.
- Testez localement avec `azd init --template <local-path>` avant de publier.
- Ajoutez les métadonnées et un README pour soumettre à Awesome AZD.

---

## 🔗 Navigation

| Direction | Ressource |
|-----------|-----------|
| **Previous** | [Guide de déploiement](deployment-guide.md) |
| **Chapter Home** | [Chapitre 4 : Infrastructure as Code](README.md) |
| **Next Chapter** | [Chapitre 5 : Solutions multi-agents](../chapter-05-multi-agent/README.md) |

## 📖 Related Resources

- [Provisioning Resources](provisioning.md)
- [Galerie Awesome AZD](https://azure.github.io/awesome-azd/)
- [Documentation officielle des modèles azd](https://learn.microsoft.com/azure/developer/azure-developer-cli/make-azd-compatible)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->