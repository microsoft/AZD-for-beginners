# Apportez votre propre application - Ajouter azd à un projet existant

**Navigation du chapitre :**
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 1 - Fondations & Démarrage rapide
- **⬅️ Précédent** : [Votre premier projet](first-project.md)
- **➡️ Suivant** : [Conteneurs de développement & Codespaces](dev-containers.md)

> Validé avec `azd 1.27.1` en juillet 2026.

## Introduction

Dans [Votre premier projet](first-project.md), vous avez déployé une application en partant d’un modèle. Mais la plupart du temps, vous avez déjà *une* application—une API Node.js, un service Python Flask, une application web .NET—qui est dans un dossier sur votre machine. Cette leçon montre comment ajouter azd à ce code existant pour pouvoir le déployer avec `azd up`, aucun modèle requis.

## Objectifs d’apprentissage

À la fin de cette leçon, vous allez :
- Comprendre les trois manières de démarrer un projet azd
- Exécuter `azd init` dans une base de code existante
- Comprendre le rôle de `azure.yaml` et du dossier `infra/` pour votre application
- Savoir quand laisser azd générer l’infrastructure ou écrire la vôtre
- Déployer votre application existante sur Azure avec `azd up`

## Résultats d’apprentissage

Après avoir terminé cette leçon, vous serez capable de :
- Initialiser azd dans un projet que vous avez déjà
- Lire et modifier un fichier `azure.yaml` basique
- Générer une infrastructure de démarrage avec `azd infra generate`
- Choisir un hôte Azure approprié pour votre application
- Déployer et nettoyer votre propre application

---

## Trois façons de démarrer un projet azd

| Point de départ | Commande | Quand l’utiliser |
|----------------|---------|--------------|
| **À partir d’un modèle** | `azd init --template <name>` | Apprentissage ou démarrage d’une nouvelle application à partir d’un exemple éprouvé |
| **À partir de votre code existant** | `azd init` (dans le dossier de votre projet) | Vous avez déjà une application et vous voulez la déployer |
| **À partir d’un dépôt Git** | `azd init --from-code` (dans un dépôt cloné) | Adopter azd pour un dépôt existant |

Vous avez déjà pratiqué la première option. Cette leçon couvre la deuxième—le scénario réel le plus courant.

---

## Étape 1 : Lancez `azd init` dans votre projet

Ouvrez un terminal **dans le dossier de votre projet existant** puis exécutez :

```bash
cd my-existing-app
azd init
```

azd vous demandera comment vous voulez initialiser. Choisissez :

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Sélectionnez **"Utiliser le code dans le répertoire actuel."** azd scanne alors votre dossier, détecte votre langage et cadre, et propose un hôte.

### Ce que azd détecte

azd recherche des indices comme `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` ou un `Dockerfile`, et suggère un hôte Azure correspondant :

| Votre application | Hôte probablement détecté |
|------------------|------------------------|
| Application web Node.js / Python / .NET | Azure App Service ou Azure Container Apps |
| Application conteneurisée (`Dockerfile`) | Azure Container Apps |
| Application de fonctions | Azure Functions |
| Site statique (sortie de build React/Vue) | Azure Static Web Apps |

Confirmez les services détectés, et azd génère les fichiers dont vous avez besoin.

---

## Étape 2 : Comprendre ce que azd a créé

Après l’initialisation, vous aurez deux nouveautés dans votre projet :

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

C’est le cœur d’un projet azd. Un fichier minimal ressemble à ceci :

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Le bloc `services` est la partie clé : chaque entrée associe un dossier de votre code à un hôte Azure. Si votre application comprend à la fois un frontend et une API, vous aurez deux services.

### `infra/` — vos ressources Azure en tant que code

Le dossier `infra/` contient des fichiers Bicep qui définissent les ressources Azure dont votre application a besoin (App Service, base de données, etc.). Vous n’avez pas à écrire cela à la main—azd génère un point de départ fonctionnel. Vous *pouvez* les modifier plus tard pour ajouter des ressources ou renforcer la sécurité (abordé dans [Chapitre 4](../chapter-04-infrastructure/README.md)).

> **Astuce :** Vous voulez voir ou personnaliser l’infrastructure générée avant le déploiement ? Exécutez `azd infra generate` (également disponible comme `azd infra synth`) pour écrire l’IaC sur disque afin de pouvoir la réviser et la versionner.

---

## Étape 3 : Définissez la configuration requise

Si votre application a besoin de paramètres ou secrets (une chaîne de connexion, une clé API), ne les codez pas en dur. Utilisez des valeurs d’environnement :

```bash
# Créer un environnement
azd env new dev

# Définir une valeur non secrète
azd env set API_VERSION 1.0.0
```

Pour les vrais secrets, stockez-les dans Key Vault et faites-y référence depuis votre infrastructure—voir [Chapitre 3 : Configuration & Authentification](../chapter-03-configuration/authsecurity.md).

---

## Étape 4 : Déployez

Utilisez maintenant le même flux de travail que vous connaissez déjà :

```bash
# Authentifier (requis pour azd)
azd auth login

# Aperçu des ressources qui seront créées
azd provision --preview

# Provisionner l'infrastructure et déployer votre code
azd up
```

À la fin, azd affiche l’URL de votre application. Vérifiez-la de la même manière que pour toute application azd :

```bash
azd show           # afficher les points de terminaison
azd monitor --logs # vérifier les journaux si nécessaire
```

---

## Problèmes courants lors du premier lancement

| Symptôme | Cause probable | Solution |
|---------|---------------|---------|
| azd n’a pas détecté mon application | Manifeste manquant (ex : `package.json`) | Ajoutez le manifeste, ou choisissez l’hôte manuellement durant `azd init` |
| Échec de la compilation lors de `azd up` | L’application nécessite une étape de compilation | Ajoutez `buildCommand`/`outputPath` sous le service dans `azure.yaml` |
| L’application démarre mais renvoie des erreurs | Configuration ou secret manquant | Définissez les valeurs avec `azd env set` ou connectez Key Vault |
| Mauvais hôte choisi | Détection automatique erronée | Modifiez `host:` dans `azure.yaml` et relancez `azd up` |

Pour plus d’informations, consultez [Chapitre 7 : Dépannage](../chapter-07-troubleshooting/README.md).

---

## Nettoyage

```bash
azd down --force --purge
```

---

## Résumé

- `azd init` → **"Utiliser le code dans le répertoire actuel"** ajoute azd à une application que vous avez déjà.
- `azure.yaml` associe vos dossiers de code aux hôtes Azure ; `infra/` définit les ressources en Bicep.
- `azd infra generate` vous permet de réviser ou personnaliser l’infrastructure générée.
- Une fois initialisée, votre application existante utilise exactement le même flux `azd up` / `azd down` qu’une application basée sur un modèle.

---

## 🔗 Navigation

| Direction | Leçon |
|-----------|--------|
| **Précédent** | [Votre premier projet](first-project.md) |
| **Suivant** | [Conteneurs de développement & Codespaces](dev-containers.md) |

## 📖 Ressources associées

- [Notions de base sur AZD](azd-basics.md)
- [Chapitre 4 : Infrastructure comme code](../chapter-04-infrastructure/README.md)
- [Configuration & Authentification](../chapter-03-configuration/authsecurity.md)
- [Fiche de commande](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->