# Apportez votre propre application - Ajouter azd à un projet existant

**Chapter Navigation:**
- **📚 Course Home**: [AZD pour débutants](../../README.md)
- **📖 Current Chapter**: Chapitre 1 - Fondations & Démarrage rapide
- **⬅️ Previous**: [Votre premier projet](first-project.md)
- **➡️ Next**: [Dev Containers et Codespaces](dev-containers.md)

> Validé avec `azd 1.25.6` en juin 2026.

## Introduction

Dans [Votre premier projet](first-project.md) vous avez déployé une application en partant d'un modèle. Mais la plupart du temps vous avez déjà une application — une API Node.js, un service Python Flask, une application web .NET — dans un dossier sur votre machine. Cette leçon montre comment ajouter azd à ce code existant afin de pouvoir le déployer avec `azd up`, sans modèle requis.

## Learning Goals

À la fin de cette leçon, vous allez :
- Comprendre les trois façons de démarrer un projet azd
- Exécuter `azd init` dans une base de code existante
- Comprendre à quoi servent `azure.yaml` et le dossier `infra/` pour votre application
- Savoir quand laisser azd générer l'infrastructure vs. écrire la vôtre
- Déployer votre application existante sur Azure avec `azd up`

## Learning Outcomes

Après avoir terminé cette leçon, vous serez capable de :
- Initialiser azd dans un projet que vous avez déjà
- Lire et éditer un fichier `azure.yaml` basique
- Générer une infrastructure de démarrage avec `azd infra generate`
- Choisir un hôte Azure approprié pour votre application
- Déployer et nettoyer votre propre application

---

## Three Ways to Start an azd Project

| Starting point | Command | When to use |
|----------------|---------|-------------|
| **From a template** | `azd init --template <name>` | Apprentissage, ou démarrer une nouvelle application à partir d'un exemple éprouvé |
| **From your existing code** | `azd init` (in your project folder) | Vous avez déjà une application et voulez la déployer |
| **From a Git repo** | `azd init --from-code` (in a cloned repo) | Adopter azd pour un dépôt existant |

Vous avez déjà pratiqué la première option. Cette leçon couvre la seconde — le scénario réel le plus courant.

---

## Step 1: Run `azd init` in Your Project

Open a terminal **inside your existing project folder** and run:

```bash
cd my-existing-app
azd init
```

azd will ask how you want to initialize. Choose:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Choisissez **"Use code in the current directory."** azd then scans your folder, detects your language and framework, and proposes a host.

### What azd detects

azd recherche des indices tels que `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, ou un `Dockerfile`, et propose un hôte Azure correspondant :

| Your app | Likely detected host |
|----------|----------------------|
| Node.js / Python / .NET web app | Azure App Service or Container Apps |
| Containerized app (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Static site (React/Vue build output) | Azure Static Web Apps |

Confirmez le(s) service(s) détecté(s), et azd génère l'ossature des fichiers dont vous avez besoin.

---

## Step 2: Understand What azd Created

After init, you'll have two new things in your project:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — la définition du projet

C'est le cœur d'un projet azd. Un exemple minimal ressemble à ceci :

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Le bloc `services` est la partie clé : chaque entrée associe un dossier de votre code à un hôte Azure. Si votre application a à la fois un frontend et une API, vous aurez deux services.

### `infra/` — vos ressources Azure en tant que code

Le dossier `infra/` contient des fichiers Bicep qui définissent les ressources Azure dont votre application a besoin (l'App Service, la base de données, etc.). Vous n'avez pas à écrire ces fichiers à la main — azd génère un point de départ fonctionnel. Vous *pouvez* les modifier plus tard pour ajouter des ressources ou renforcer la sécurité (abordé dans [Chapitre 4](../chapter-04-infrastructure/README.md)).

> **Astuce :** Vous voulez voir ou personnaliser l'infrastructure générée avant le déploiement ? Exécutez `azd infra generate` (aussi disponible comme `azd infra synth`) pour écrire l'IaC sur le disque afin de pouvoir le réviser et le versionner.

---

## Step 3: Set Required Configuration

If your app needs settings or secrets (a connection string, an API key), don't hardcode them. Use environment values:

```bash
# Créer un environnement
azd env new dev

# Définir une valeur non secrète
azd env set API_VERSION 1.0.0
```

Pour de vrais secrets, stockez-les dans Key Vault et référencez-les depuis votre infrastructure — voir [Chapitre 3 : Configuration et authentification](../chapter-03-configuration/authsecurity.md).

---

## Step 4: Deploy

Now use the same workflow you already know:

```bash
# S'authentifier (requis pour azd)
azd auth login

# Prévisualiser les ressources qui seront créées
azd provision --preview

# Approvisionner l'infrastructure et déployer votre code
azd up
```

When it finishes, azd prints your app's URL. Verify it the same way as any azd app:

```bash
azd show           # afficher les points de terminaison
azd monitor --logs # vérifier les journaux si nécessaire
```

---

## Common First-Time Issues

| Symptom | Likely cause | Fix |
|---------|--------------|-----|
| azd didn't detect my app | Missing manifest (e.g., `package.json`) | Add the manifest, or pick the host manually during `azd init` |
| Build fails during `azd up` | App needs a build step | Add `buildCommand`/`outputPath` under the service in `azure.yaml` |
| App starts but returns errors | Missing config/secret | Set values with `azd env set` or wire up Key Vault |
| Wrong host chosen | Auto-detection guessed | Edit `host:` in `azure.yaml` and re-run `azd up` |

Pour en savoir plus, voir [Chapitre 7 : Dépannage](../chapter-07-troubleshooting/README.md).

---

## Clean Up

```bash
azd down --force --purge
```

---

## Summary

- `azd init` → **"Use code in the current directory"** ajoute azd à une application que vous avez déjà.
- `azure.yaml` associe vos dossiers de code aux hôtes Azure ; `infra/` définit les ressources en Bicep.
- `azd infra generate` vous permet de revoir ou personnaliser l'infrastructure générée.
- Une fois initialisée, votre application existante utilise exactement le même workflow `azd up` / `azd down` qu'une application basée sur un modèle.

---

## 🔗 Navigation

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Votre premier projet](first-project.md) |
| **Next** | [Dev Containers et Codespaces](dev-containers.md) |

## 📖 Related Resources

- [Bases d'AZD](azd-basics.md)
- [Chapitre 4 : Infrastructure as Code](../chapter-04-infrastructure/README.md)
- [Configuration et authentification](../chapter-03-configuration/authsecurity.md)
- [Fiche mémo des commandes](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->