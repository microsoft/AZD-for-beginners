# Apportez votre propre application - Ajouter azd à un projet existant

**Navigation dans le chapitre :**
- **📚 Accueil du cours** : [AZD pour débutants](../../README.md)
- **📖 Chapitre actuel** : Chapitre 1 - Fondations & Démarrage rapide
- **⬅️ Précédent** : [Votre premier projet](first-project.md)
- **➡️ Suivant** : [Conteneurs de dev & Codespaces](dev-containers.md)

> Cible de relecture commande et configuration : `azd 1.37.2` (novembre 2026). Les fichiers générés dépendent de l'application détectée ; le déploiement Azure n'a pas été exécuté lors de cette relecture.

## Introduction

Dans [Votre premier projet](first-project.md), vous avez déployé une application en partant d'un modèle. Mais la plupart du temps, vous avez déjà *une* application — une API Node.js, un service Python Flask, une application web .NET — qui se trouve dans un dossier sur votre machine. Cette leçon montre comment ajouter azd à ce code existant afin de pouvoir le déployer avec `azd up`, sans modèle requis.

## Objectifs d’apprentissage

À la fin de cette leçon, vous serez capable de :
- Comprendre les trois façons de démarrer un projet azd
- Exécuter `azd init` dans une base de code existante
- Comprendre ce que font `azure.yaml` et le dossier `infra/` pour votre application
- Savoir quand laisser azd générer l'infrastructure ou écrire la vôtre
- Déployer votre application existante sur Azure avec `azd up`

## Résultats d’apprentissage

Après avoir terminé cette leçon, vous serez capable de :
- Initialiser azd dans un projet que vous possédez déjà
- Lire et modifier un fichier `azure.yaml` basique
- Générer une infrastructure de départ avec `azd infra generate`
- Choisir un hôte Azure approprié pour votre application
- Déployer et nettoyer votre propre application

---

## Trois façons de commencer un projet azd

| Point de départ | Commande | Quand l'utiliser |
|----------------|---------|-----------------|
| **Depuis un modèle** | `azd init --template <name> .` (répertoire vide) | Apprentissage, ou démarrer une nouvelle appli à partir d’un exemple éprouvé |
| **Depuis votre code existant** | `azd init` (dans votre dossier projet) | Vous avez déjà une appli et vous voulez la déployer |
| **Depuis un dépôt Git** | `azd init --from-code` (dans un dépôt cloné) | Adopter azd pour un dépôt existant |

Vous avez déjà pratiqué la première option. Cette leçon couvre la seconde — le scénario réel le plus courant.

---

## Étape 1 : Exécuter `azd init` dans votre projet

Ouvrez un terminal **dans le dossier de votre projet existant** et lancez :

```bash
cd my-existing-app
azd init
```

azd vous demandera comment vous souhaitez initialiser. Choisissez :

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Sélectionnez **"Utiliser le code dans le répertoire actuel."** azd scanne alors votre dossier, détecte votre langage et framework, et propose un hébergement.

### Ce que azd détecte

azd cherche des signaux d’application comme `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, ou un `Dockerfile`. Le flux depuis le code n’est pas un assistant généraliste de sélection d’hôte pour chaque cible de déploiement supportée :

| Votre appli | Hôte probablement détecté |
|------------|-------------------------|
| Appli web Node.js / Python / .NET supportée | Typiquement Azure Container Apps ; inspectez la définition générée |
| Appli conteneurisée (`Dockerfile`) | Azure Container Apps |
| Application Function ou projet Static Web Apps | Utilisez un modèle correspondant ou écrivez `azure.yaml` et l'infrastructure si le flux depuis le code ne supporte pas votre architecture |

Confirmez le(s) service(s) détecté(s), et azd génère les fichiers nécessaires.

---

## Étape 2 : Comprendre ce que azd a créé

Après l'init, inspectez `azure.yaml`. Le flux d'infrastructure générée peut garder l'infrastructure implicite jusqu’à ce que vous exécutiez `azd infra generate` ; ne supposez pas que `infra/` existe déjà :

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — la définition du projet

C’est le cœur d’un projet azd. La **définition illustrative App Service** suivante requiert une infrastructure App Service correspondante ; ce n’est pas une raison de changer un hôte Container Apps généré sans changer l’infrastructure :

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Le bloc `services` est la partie clé : chaque entrée associe un dossier de votre code à un hôte Azure. Si votre appli a à la fois un frontend et une API, vous aurez deux services.

### `infra/` — vos ressources Azure en tant que code

Le dossier `infra/` contient des fichiers Bicep qui définissent les ressources Azure dont votre appli a besoin (App Service, base de données, etc.). Vous n’avez pas à écrire ceux-ci à la main — azd génère un point de départ fonctionnel. Vous *pouvez* les éditer plus tard pour ajouter des ressources ou renforcer la sécurité (abordé dans le [Chapitre 4](../chapter-04-infrastructure/README.md)).

> **Astuce :** Vous voulez voir ou personnaliser l’infrastructure générée avant de déployer ? Exécutez `azd infra generate` (disponible aussi comme `azd infra synth`) pour écrire l’IaC sur disque afin de pouvoir la réviser et la contrôler en version.

---

## Étape 3 : Configurer les paramètres requis

Si votre appli a besoin de paramètres ou secrets (une chaîne de connexion, une clé API), ne les codez pas en dur. Utilisez des valeurs d’environnement :

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Ceci stocke une valeur locale uniquement. Pour affecter l’appli, consommez-la explicitement dans les paramètres d’infrastructure, un paramètre de service supporté, ou un hook ; définir une variable arbitraire ne configure pas le runtime déployé.

Pour les vrais secrets, stockez-les dans Key Vault et référencez-les depuis votre infrastructure — voir [Chapitre 3 : Configuration & Authentification](../chapter-03-configuration/authsecurity.md).

---

## Étape 4 : Déployer

Maintenant, utilisez le même workflow que vous connaissez déjà :

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Quand il se termine, azd affiche l’URL de votre appli. Vérifiez-la comme toute appli azd :

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Problèmes fréquents lors du premier déploiement

| Symptôme | Cause probable | Solution |
|---------|--------------|---------|
| azd n'a pas détecté mon appli | Manque de manifeste (ex : `package.json`) | Ajoutez le manifeste, ou choisissez l’hôte manuellement lors de `azd init` |
| La compilation échoue pendant `azd up` | L’appli nécessite une étape de build | Configurez les scripts package de l’appli ou le hook de service `prepackage` ; utilisez `dist` pour les sorties de déploiement, pas `buildCommand`/`outputPath` |
| L’appli démarre mais renvoie des erreurs | Configuration/secret manquant | Branchez les valeurs dans les paramètres d’exécution de l’appli ou une référence Key Vault ; `azd env set` seul ne suffit pas |
| Mauvais hôte choisi | La détection automatique ne correspond pas à vos besoins | Modifiez à la fois `host:` et l’infrastructure correspondante, ou choisissez un modèle adapté |

Pour plus, voir [Chapitre 7 : Dépannage](../chapter-07-troubleshooting/README.md).

---

## Nettoyer

```bash
azd down --force --purge
```

---

## Résumé

- `azd init` → **"Utiliser le code dans le répertoire actuel"** ajoute azd à une app que vous possédez déjà.
- `azure.yaml` mappe vos dossiers de code aux hôtes Azure ; `infra/` définit les ressources en Bicep.
- `azd infra generate` vous permet de réviser ou personnaliser l'infrastructure générée.
- Une fois initialisée, votre appli existante utilise exactement le même workflow `azd up` / `azd down` qu’une appli basée sur modèle.

---

## 🔗 Navigation

| Direction | Leçon |
|-----------|--------|
| **Précédent** | [Votre premier projet](first-project.md) |
| **Suivant** | [Conteneurs de dev & Codespaces](dev-containers.md) |

## 📖 Ressources associées

- [Bases AZD](azd-basics.md)
- [Chapitre 4 : Infrastructure en tant que code](../chapter-04-infrastructure/README.md)
- [Configuration & Authentification](../chapter-03-configuration/authsecurity.md)
- [Fiche de commandes](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->