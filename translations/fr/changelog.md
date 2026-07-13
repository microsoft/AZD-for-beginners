# Journal des modifications - AZD Pour Débutants

## Introduction

Ce journal des modifications documente tous les changements notables, mises à jour et améliorations du dépôt AZD Pour Débutants. Nous suivons les principes de la gestion sémantique des versions et maintenons ce log pour aider les utilisateurs à comprendre ce qui a changé entre les versions.

## Objectifs d’apprentissage

En consultant ce journal, vous allez :
- Rester informé des nouvelles fonctionnalités et ajouts de contenu
- Comprendre les améliorations apportées à la documentation existante
- Suivre les corrections de bugs et rectifications pour garantir l’exactitude
- Suivre l’évolution des supports d’apprentissage au fil du temps

## Résultats d’apprentissage

Après avoir consulté les entrées du journal des modifications, vous serez capable de :
- Identifier les nouveaux contenus et ressources disponibles pour l’apprentissage
- Comprendre quelles sections ont été mises à jour ou améliorées
- Planifier votre parcours d’apprentissage en fonction des matériaux les plus récents
- Contribuer par des retours et suggestions pour les améliorations futures

## Historique des versions

### [v3.23.0] - 2026-07-13

#### Rafraîchissement AZD 1.27.1 : mise à jour de la version
**Cette version revalide le cours avec `azd` `1.27.1` (juillet 2026, dernière version stable) et l’extension actuelle d’agent IA en aperçu `azure.ai.agents` `1.0.0-beta.5`, mettant à jour toutes les bannières "validé contre" après les sorties 1.26.0, 1.27.0 et 1.27.1.**

#### Changé
- **✅ Base de validation mise à jour** de `azd 1.25.6` (juin 2026) à `azd 1.27.1` (juillet 2026) à travers le README racine, tous les README des chapitres, la leçon conteneur de développement du Chapitre 1 (incluant les exemples à version figée), la leçon sur les modèles personnalisés du Chapitre 4, la leçon multi-agent du Chapitre 5, et la documentation de l’atelier
- **🤖 Base actualisée pour le Chapitre 2** de `azd 1.23.12` (mars 2026) vers `azd 1.27.1` à travers `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, et `microsoft-foundry-integration.md` ; dates des notes de validation mises à jour au 2026-07-13
- **🧩 Extension agent IA mise à jour** de `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` à la version actuelle `1.0.0-beta.5` dans le README du Chapitre 2 et `agents.md`
- **🧪 Exemple de validation d’atelier** (sortie de `azd version`) mise à jour vers `1.27.1`

#### Notes sur les versions azd pertinentes (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24) :** Support Go pour Azure Functions sur consommation Flex, filtres d’abonnement par locataire `azd config sub-filter`, bundles d’extension autonomes (`azd x pack --bundle`), et `azd tool install azure-skills`
- **1.27.0 (2026-06-30) :** Modélisation directe de projets/agants Azure AI Foundry dans `azure.yaml` (initialisation sans Bicep ni Terraform), support de déploiement conteneur pour App Service (`host: appservice` + `language: docker`), `-s/--source` direct pour les commandes `azd extension` et `azd tool uninstall`
- **1.27.1 (2026-07-09) :** Option `--no-dependencies` pour `azd extension install`, modèles dépréciés exclus par défaut des catalogues/invites de quota, et plusieurs corrections de bugs

#### Fichiers mis à jour
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Complétude pour débutant #2 : création de modèles, conteneurs de développement, Pulumi, Azure DevOps, principals de service, et plus encore
**Cette version comble les derniers écarts intermédiaires identifiés par l’analyse de couverture azd : comment créer et publier votre propre modèle, environnements reproductibles de conteneurs de développement/Codespaces, le fournisseur d’infrastructure Pulumi, un tutoriel CI/CD Azure DevOps, l’authentification via principal de service, conseils de sélection d’hôte (AKS/Spring Apps), explications `azd restore`/`azd package`, gestion des erreurs des hooks, et pratiques d’environnement d’équipe/partagé.**

#### Ajouté
- **🧱 Nouvelle leçon du Chapitre 4** `docs/chapter-04-infrastructure/custom-templates.md` — création de votre propre modèle azd : structure requise (`azure.yaml`, `infra/`, `src/`), champ `metadata.template`, paramétrage de l’infrastructure avec le jeton ressource `uniqueString()` et tag `azd-env-name`, tests locaux avec `azd init --template <local-path>`, publication sur GitHub, et soumission à la galerie Awesome AZD
- **📦 Nouvelle leçon du Chapitre 1** `docs/chapter-01-foundation/dev-containers.md` — environnements azd reproductibles avec conteneurs de développement et GitHub Codespaces : un `.devcontainer/devcontainer.json` minimal utilisant la fonctionnalité officielle `ghcr.io/azure/azure-dev/azd`, fonctionnalités spécifiques au langage, `docker-in-docker` pour hôtes conteneurs, et `azd auth login --use-device-code` pour connexion distante
- **🧩 Pulumi avec azd** section dans `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, organisation du dossier Pulumi, stacks mappés aux environnements azd, sorties/étiquetage requis, et workflow identique `azd up` / `azd down`
- **🎯 Conseils de sélection d’hôte** dans `docs/chapter-04-infrastructure/provisioning.md` — comparaison accessible de `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` et `springapp`, avec conseils pour choisir entre AKS ou Azure Spring Apps
- **🛠️ Tutoriel CI/CD Azure DevOps** dans `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, connexion service avec fédération d'identité (OIDC), `azure-dev.yml` généré, et configuration du groupe de variables
- **🔑 Principals de service (modèle 4)** ajouté à `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, connexion `azd auth login` non interactive avec secret client vs. identifiants fédérés/OIDC, quand utiliser, et stockage sécurisé des identifiants
- **🪝 Gestion des erreurs des hooks** sous-section dans `docs/chapter-04-infrastructure/deployment-guide.md` — codes de sortie et `set -e`, `continueOnError`, test des hooks isolés avec `azd hooks run`, shells spécifiques au système, et `--debug`
- **👥 Equipiers / environnements partagés** section dans `docs/chapter-03-configuration/configuration.md` — ce qui vit dans `.azure/`, ce qu’il faut gitignore, environnements par développeur, `azd env list`/`select`, et fourniture des valeurs d’environnement en CI/CD
- **🧰 Explications `azd restore` et extension `azd package`** dans `resources/cheat-sheet.md` — restauration des dépendances et construction d’un artefact déployable sans déploiement

#### Changé
- **🧭 Tableau des leçons du Chapitre 4** mis à jour pour inclure la nouvelle leçon "Créer votre propre modèle" (leçon 3)
- **🧭 Tableau des leçons du Chapitre 1** mis à jour pour inclure la nouvelle leçon "Conteneurs de développement & Codespaces" (leçon 5) ; pieds de page de navigation connectés entre `bring-your-own-app.md` et `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Complétude pour débutants : leçon multi-agent pratique, "Apportez votre propre application", Terraform, et tutoriel CI/CD
**Cette version comble les lacunes les plus importantes pour un guide complet pour débutants en ajoutant deux nouvelles leçons pratiques (une procédure multi-agent déployable et l’intégration d’azd dans une application existante), une introduction accessible aux hooks, une section Terraform avec azd, un tutoriel pas à pas GitHub Actions, un explicatif des nouvelles extensions en aperçu, et une liste de contrôle explicite de vérification de déploiement.**

#### Ajouté
- **🤝 Nouvelle leçon du Chapitre 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — un tutoriel totalement pratique, déployable avec deux agents (orchestrateur + spécialistes) utilisant un modèle réel (`contoso-creative-writer`), couvrant quand utiliser multi-agent, workflow `azd up`, compréhension des ressources déployées, traçage entre agents, personnalisation, et nettoyage
- **📦 Nouvelle leçon du Chapitre 1** `docs/chapter-01-foundation/bring-your-own-app.md` — comment ajouter azd à un projet existant avec `azd init` ("utiliser le code du répertoire courant"), compréhension de `azure.yaml` et `infra/`, `azd infra generate`, détection d’hôte, et déploiement avec `azd up`
- **🌐 Section Terraform avec azd** ajoutée à `docs/chapter-04-infrastructure/provisioning.md` — configuration `infra.provider: terraform`, organisation du dossier `.tf`, sorties obligatoires `AZURE_*` et étiquetage `azd-env-name`, et workflow identique `azd up` / `azd down` (comble l’écart où le support Terraform était annoncé mais seul Bicep avait été montré)
- **⚙️ Tutoriel pas à pas GitHub Actions** dans `docs/chapter-08-production/production-ai-practices.md` — du dépôt GitHub aux déploiements automatisés : `azd pipeline config`, identifiants fédérés OIDC (sans stockage de secrets), `azure-dev.yml` généré, conseils secrets vs variables
- **🪝 Introduction débutant "Nouveau aux hooks ?"** dans `docs/chapter-04-infrastructure/deployment-guide.md` — ce qu’est un hook, tableau des étapes hook, premier hook minimal, et exécution manuelle des hooks avec `azd hooks run`
- **✅ Liste de contrôle "Vérifiez votre déploiement"** ajoutée à l’étape 5 de `docs/chapter-01-foundation/first-project.md` — test rapide, vérification du point de terminaison santé, et critères de succès explicites
- **🧩 Explicatif des nouvelles extensions en aperçu** `azure.ai.skills` et `azure.ai.connections` (ce que c’est et quand les utiliser) dans `docs/chapter-08-production/production-ai-practices.md`

#### Changé
- **🧭 Tableau des leçons du Chapitre 5** corrigé : `multi-agent-basics.md` est désormais la Leçon 1 (la seule totalement pratique), avec un libellé clair que la Leçon 2 se trouve dans le Chapitre 6 et que le scénario Retail est un plan d'architecture, pas un modèle à commande unique
- **🧭 Tableau des leçons du Chapitre 1** inclut désormais la nouvelle leçon "Apportez votre propre app" (Leçon 4)
- **🔗 Pieds de page de navigation** mis à jour : `first-project.md` pointe désormais vers `bring-your-own-app.md`

#### Corrigé
- **🧱 Fermeture de la lacune "annoncée mais absente" Terraform** — le cours faisait précédemment référence au support Terraform sans le montrer
- **🔀 Correction des liens croisés trompeurs du Chapitre 5** qui laissaient entendre qu’une implémentation multi-agent complète existait alors qu’il s’agissait uniquement d’un plan d'architecture

#### Fichiers mis à jour
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(nouveau)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(nouveau)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### Rafraîchissement AZD 1.25.6, commandes complètes du cycle de vie des agents & rebranding Aspire

**Cette version revalide le cours avec `azd` `1.25.6` (juin 2026) et l'extension `azure.ai.agents` `0.1.40-preview`, étend les directives IA de « monter un agent » au cycle de vie complet de l'agent (tester → évaluer → optimiser → inspecter → supprimer), met en avant les nouvelles extensions en aperçu `azure.ai.skills` et `azure.ai.connections`, et note le changement de marque produit de ".NET Aspire" à "Aspire".**

#### Ajouté
- **🔁 Couverture complète du cycle de vie de l'agent** pour les débutants et ingénieurs IA à travers la documentation :
  - `docs/chapter-01-foundation/azd-basics.md` — Tableau du cycle de vie (montage → test → mesure → amélioration → inspection → nettoyage) ajouté à la section Extensions et Commandes IA
  - `docs/chapter-08-production/production-ai-practices.md` — Nouvelle section "Gestion du cycle de vie de l'agent" couvrant `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` et `delete --force`
  - `resources/cheat-sheet.md` — Commandes AI Agent étendues avec `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` et `delete --force`
- **🧩 Nouvelles extensions en aperçu** documentées : `azure.ai.skills` (compétences d’agent réutilisables) et `azure.ai.connections` (connexions Foundry) ajoutées au tableau des extensions et au mémo
- **⏱️ Guide sur le temps de réponse** — les exemples `azd ai agent invoke` indiquent désormais la latence totale et le temps jusqu’au premier octet
- **📌 Bannière de version** dans le README racine orientant les apprenants vers `azd version` et `azd upgrade`

#### Modifié
- **✅ Base de validation mise à jour** de `azd 1.23.12` (mars 2026) à `azd 1.25.6` (juin 2026) dans tous les README des chapitres et documentation de l’atelier
- **🤖 Note d’extension du chapitre 2** mise à jour de `azure.ai.agents` `0.1.18-preview` à `0.1.40-preview`
- **🧪 Exemple de validation d’atelier** (`azd version` en sortie) mis à jour à `1.25.6`
- **🧭 README "Quoi de neuf dans azd aujourd’hui"** actualisé pour mettre en avant le cycle de vie complet de l’agent, les nouvelles extensions IA et les corrections récentes facilitant l’usage (`azd init` idempotent, `azd auth login` nettoyage de jetons expirés, invite au premier lancement de `azd tool`)
- **📖 agents.md du chapitre 2 (Option 4)** oriente désormais les apprenants vers les commandes de cycle de vie post-déploiement plutôt que de s’arrêter à `azd up`

#### Corrigé
- **🏷️ Nom du produit** — ajout d’une note de rebranding Aspire (".NET Aspire" est désormais simplement "Aspire") ; le support azd pour Aspire reste inchangé
- **🔎 Validation de la sortie en direct** confirmée avec le flux de versions Azure Developer CLI : CLI stable `1.25.6` (2026-06-12) et `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Fichiers mis à jour
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27

#### Clarification de l’intégration des débutants, validation de configuration et nettoyage des dernières commandes AZD
**Cette version fait suite à la validation AZD 1.23 par une révision de la documentation ciblée débutants : elle clarifie les directives d’authentification AZD-first, ajoute des scripts de validation locale, vérifie les commandes clés contre l’AZD CLI en direct, et supprime les dernières références aux commandes obsolètes anglaises en dehors du changelog.**

#### Ajouté
- **🧪 Scripts de validation de configuration pour débutants** avec `validate-setup.ps1` et `validate-setup.sh` afin que les apprenants puissent confirmer les outils requis avant de commencer le Chapitre 1
- **✅ Étapes de validation de configuration initiales** dans les README racine et Chapitre 1 pour détecter les prérequis manquants avant `azd up`

#### Modifié
- **🔐 Guide d’authentification pour débutants** traitant désormais systématiquement `azd auth login` comme voie principale des workflows AZD, `az login` étant optionnel sauf usage direct des commandes Azure CLI
- **📚 Flux d’intégration au Chapitre 1** invitant les apprenants à valider leur configuration locale avant installation, authentification et premier déploiement
- **🛠️ Messages du valideur** distinguant clairement les exigences bloquantes des avertissements Azure CLI optionnels pour le parcours débutant uniquement AZD
- **📖 Documentation configuration, dépannage et exemples** différenciant désormais clairement entre authentification AZD obligatoire et connexion Azure CLI optionnelle là où avant cela n’avait pas de contexte

#### Corrigé
- **📋 Références restantes aux commandes sources anglaises** mises à jour vers les formes AZD actuelles, incluant `azd config show` dans le mémo et `azd monitor --overview` là où le guide portail Azure visait un aperçu
- **🧭 Affirmations des débutants au Chapitre 1** modérées pour éviter des promesses excessives de zéro erreur garantie ou rollback dans tous les templates et ressources Azure
- **🔎 Validation CLI en direct** confirmant le support actuel des commandes `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` et `azd down --force --purge`

#### Fichiers mis à jour
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### Validation AZD 1.23.12, expansion de l’environnement atelier & rafraîchissement du modèle IA
**Cette version effectue une passe de validation de documentation avec `azd` `1.23.12`, met à jour les exemples obsolètes de commandes AZD, rafraîchit les guides du modèle IA vers les valeurs par défaut actuelles, et élargit les instructions d’atelier au-delà de GitHub Codespaces pour inclure les conteneurs de développement et clones locaux.**

#### Ajouté
- **✅ Notes de validation dans les chapitres principaux et documentation d’atelier** pour rendre explicite la base AZD testée pour les apprenants utilisant des builds CLI plus récents ou plus anciens
- **⏱️ Guide de timeout de déploiement** pour déploiements d’applications IA longue durée utilisant `azd deploy --timeout 1800`
- **🔎 Étapes d’inspection d’extension** avec `azd extension show azure.ai.agents` dans la documentation des workflows IA
- **🌐 Guide d’environnement d’atelier élargi** couvrant GitHub Codespaces, conteneurs de développement et clones locaux avec MkDocs

#### Modifié
- **📚 README d’introduction des chapitres** notant désormais systématiquement la validation avec `azd 1.23.12` dans les sections fondation, configuration, infrastructure, multi-agent, pré-déploiement, dépannage et production
- **🛠️ Références de commande AZD** mises à jour aux formes actuelles dans toute la documentation :
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` ou `azd env get-value(s)` selon le contexte
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` là où un aperçu Application Insights est prévu
- **🧪 Exemples de provision en preview** simplifiés vers les usages pris en charge actuels comme `azd provision --preview` et `azd provision --preview -e production`
- **🧭 Flux de l’atelier** mis à jour pour permettre aux apprenants de réaliser les labs dans Codespaces, un conteneur de développement ou un clone local au lieu de supposer un usage exclusif de Codespaces
- **🔐 Guide d’authentification** préférant désormais `azd auth login` pour les workflows AZD, avec `az login` placé en optionnel si l’on utilise directement les commandes Azure CLI

#### Corrigé
- **🪟 Commandes d’installation Windows** normalisées à la casse `winget` actuelle dans le guide d’installation
- **🐧 Guide d’installation Linux** corrigé pour éviter les instructions non supportées par gestionnaire de paquets `azd` spécifiques à certaines distributions et orienter vers les assets de release quand approprié
- **📦 Exemples de modèles IA** rafraîchis des anciens par défaut comme `gpt-35-turbo` et `text-embedding-ada-002` vers des exemples actuels tels que `gpt-4.1-mini`, `gpt-4.1`, et `text-embedding-3-large`
- **📋 Extraits de déploiement et diagnostics** corrigés pour utiliser les commandes actuelles d’environnement et de statut dans les logs, scripts et procédures de dépannage
- **⚙️ Guide GitHub Actions** mis à jour de `Azure/setup-azd@v1.0.0` à `Azure/setup-azd@v2`
- **🤖 Guide consentement MCP/Copilot** mis à jour de `azd mcp consent` à `azd copilot consent list`

#### Amélioré
- **🧠 Guide chapitre IA** expliquant maintenant mieux le comportement `azd ai` sensible à l’aperçu, la connexion par locataire, l’utilisation actuelle des extensions et les recommandations mises à jour pour le déploiement du modèle
- **🧪 Instructions d’atelier** utilisant désormais des exemples de version plus réalistes et un langage plus clair pour la configuration d’environnement en laboratoire pratique
- **📈 Documentation production et dépannage** mieux alignée aux exemples actuels de surveillance, modèle de secours, et niveaux de coût

#### Fichiers mis à jour
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### Commandes AZD AI CLI, validation de contenu & expansion des templates
**Cette version ajoute la couverture des commandes `azd ai`, `azd extension` et `azd mcp` à travers tous les chapitres liés à l’IA, corrige les liens cassés et le code obsolète dans agents.md, met à jour le mémo, et remanie la section des templates exemples avec des descriptions validées et de nouveaux templates Azure AI AZD.**

#### Ajouté
- **🤖 Couverture AZD AI CLI** sur 7 fichiers (précédemment seulement au Chapitre 8) :
  - `docs/chapter-01-foundation/azd-basics.md` — Nouvelle section "Extensions et Commandes IA" présentant `azd extension`, `azd ai agent init` et `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Option 4 : `azd ai agent init` avec tableau comparatif (approche template vs manifeste)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Sous-sections "Extensions AZD pour Foundry" et "Déploiement agent-first"

  - `docs/chapter-05-multi-agent/README.md` — Démarrage rapide affiche désormais à la fois les chemins de déploiement basés sur un modèle et un manifeste
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — La section Déploiement inclut maintenant l'option `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Sous-section "Commandes d'extension AZD AI pour le diagnostic"
  - `resources/cheat-sheet.md` — Nouvelle section "Commandes AI & Extensions" avec `azd extension`, `azd ai agent init`, `azd mcp` et `azd infra generate`
- **📦 Nouveaux modèles d'exemples AZD AI** dans `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET avec Blazor WebAssembly, Semantic Kernel et support vocal
  - **azure-search-openai-demo-java** — Chat RAG Java utilisant Langchain4J avec options de déploiement ACA/AKS
  - **contoso-creative-writer** — Application d'écriture créative multi-agent utilisant Azure AI Agent Service, Bing Grounding et Prompty
  - **serverless-chat-langchainjs** — RAG sans serveur utilisant Azure Functions + LangChain.js + Cosmos DB avec support dev local Ollama
  - **chat-with-your-data-solution-accelerator** — Accélérateur RAG entreprise avec portail admin, intégration Teams et options PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Application de référence d'orchestration MCP multi-agent avec serveurs en .NET, Python, Java et TypeScript
  - **azd-ai-starter** — Modèle de démarrage minimaliste d'infrastructure Azure AI Bicep
  - **🔗 Lien vers la galerie géniale AZD AI** — Référence à la [superbe galerie awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (plus de 80 modèles)

#### Corrigé
- **🔗 Navigation agents.md** : Les liens Précédent/Suivant correspondent maintenant à l'ordre des leçons du chapitre 2 README (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Liens cassés agents.md** : Correction de `production-ai-practices.md` en `../chapter-08-production/production-ai-practices.md` (3 occurrences)
- **📦 Code obsolète agents.md** : Remplacement de `opencensus` par `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API invalide agents.md** : Passage de `max_tokens` de `create_agent()` à `create_run()` sous `max_completion_tokens`
- **🔢 Comptage des tokens agents.md** : Remplacement de l'estimation approximative `len//4` par `tiktoken.encoding_for_model()`
- **azure-search-openai-demo** : Correction des services de "Cognitive Search + App Service" à "Azure AI Search + Azure Container Apps" (hôte par défaut modifié en octobre 2024)
- **contoso-chat** : Mise à jour de la description pour référencer Azure AI Foundry + Prompty, correspondant au titre réel et à la stack technique du dépôt

#### Supprimé
- **ai-document-processing** : Suppression de la référence à un modèle non fonctionnel (dépôt non accessible publiquement comme modèle AZD)

#### Amélioré
- **📝 Exercices agents.md** : L'exercice 1 montre maintenant la sortie attendue et l'étape `azd monitor` ; l'exercice 2 inclut le code complet d'enregistrement `FunctionTool` ; l'exercice 3 remplace les consignes vagues par des commandes concrètes `prepdocs.py`
- **📚 Ressources agents.md** : Mise à jour des liens documentaires vers la doc actuelle d'Azure AI Agent Service et le démarrage rapide
- **📋 Tableau Next Steps agents.md** : Ajout du lien vers le laboratoire AI Workshop pour une couverture complète du chapitre

#### Fichiers mis à jour
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Amélioration de la navigation dans le cours
**Cette version améliore la navigation dans le README.md des chapitres avec un format de tableau avancé.**

#### Modifié
- **Tableau de carte du cours** : Amélioré avec liens directs vers les leçons, estimations de durée et niveaux de complexité
- **Nettoyage des dossiers** : Suppression des anciens dossiers redondants (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validation des liens** : Plus de 21 liens internes du tableau Carte du cours vérifiés

### [v3.16.0] - 2026-02-05

#### Mise à jour des noms de produits
**Cette version met à jour les références produits selon la marque actuelle de Microsoft.**

#### Modifié
- **Microsoft Foundry → Microsoft Foundry** : Toutes les références mises à jour dans les fichiers hors traduction
- **Azure AI Agent Service → Foundry Agents** : Nom du service mis à jour pour refléter la marque actuelle

#### Fichiers mis à jour
- `README.md` - Page principale du cours
- `changelog.md` - Historique des versions
- `course-outline.md` - Structure du cours
- `docs/chapter-02-ai-development/agents.md` - Guide des agents IA
- `examples/README.md` - Documentation des exemples
- `workshop/README.md` - Page d'accueil de l'atelier
- `workshop/docs/index.md` - Index de l'atelier
- `workshop/docs/instructions/*.md` - Tous les fichiers d'instructions d'atelier

---

### [v3.15.0] - 2026-02-05

#### Restructuration majeure du dépôt : noms de dossiers par chapitres
**Cette version restructure la documentation en dossiers dédiés par chapitre pour une navigation claire.**

#### Renommage des dossiers
Les anciens dossiers ont été remplacés par des dossiers numérotés par chapitre :
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Ajout de : `docs/chapter-05-multi-agent/`

#### Migration des fichiers
| Fichier | De | Vers |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| Tous les fichiers pré-déploiement | pre-deployment/ | chapter-06-pre-deployment/ |
| Tous les fichiers dépannage | troubleshooting/ | chapter-07-troubleshooting/ |

#### Ajouté
- **📚 Fichiers README de chapitres** : Création de README.md dans chaque dossier de chapitre avec :
  - Objectifs d'apprentissage et durée
  - Tableau des leçons avec descriptions
  - Commandes de démarrage rapide
  - Navigation vers les autres chapitres

#### Modifié
- **🔗 Mise à jour de tous les liens internes** : Plus de 78 chemins mis à jour dans tous les fichiers documentaires
- **🗺️ README.md principal** : Mise à jour de la carte du cours avec la nouvelle structure par chapitres
- **📝 examples/README.md** : Mise à jour des références croisées vers les dossiers chapitres

#### Supprimé
- Ancienne structure de dossiers (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restructuration du dépôt : navigation par chapitre
**Cette version ajoute des fichiers README de navigation par chapitre (remplacée par la v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nouveau guide des agents IA
**Cette version ajoute un guide complet pour déployer des agents IA avec Azure Developer CLI.**

#### Ajouté
- **🤖 docs/microsoft-foundry/agents.md** : Guide complet couvrant :
  - Qu'est-ce que les agents IA et en quoi ils diffèrent des chatbots
  - Trois modèles d'agents pour démarrage rapide (Foundry Agents, Prompty, RAG)
  - Modèles architecturaux d'agents (agent unique, RAG, multi-agent)
  - Configuration et personnalisation des outils
  - Suivi et surveillance des métriques
  - Considérations et optimisation des coûts
  - Scénarios courants de dépannage
  - Trois exercices pratiques avec critères de réussite

#### Structure du contenu
- **Introduction** : Concepts d'agents pour débutants
- **Démarrage rapide** : Déployer des agents avec `azd init --template get-started-with-ai-agents`
- **Modèles architecturaux** : Diagrammes visuels des modèles d'agents
- **Configuration** : Configuration des outils et variables d'environnement
- **Surveillance** : Intégration Application Insights
- **Exercices** : Apprentissage pratique progressif (20-45 minutes chacun)

---

### [v3.12.0] - 2026-02-05

#### Mise à jour de l'environnement DevContainer
**Cette version met à jour la configuration du conteneur de développement avec des outils modernes et de meilleures valeurs par défaut pour l'expérience d'apprentissage AZD.**

#### Modifié
- **🐳 Image de base** : Mise à jour de `python:3.12-bullseye` vers `python:3.12-bookworm` (dernière stable Debian)
- **📛 Nom du conteneur** : Renommé de "Python 3" à "AZD for Beginners" pour plus de clarté

#### Ajouté
- **🔧 Nouvelles fonctionnalités Dev Container** :
  - `azure-cli` avec support Bicep activé
  - `node:20` (version LTS pour les modèles AZD)
  - `github-cli` pour la gestion des modèles
  - `docker-in-docker` pour déploiements d’applications conteneurisées

- **🔌 Redirections de ports** : Ports pré-configurés pour le développement courant :
  - 8000 (aperçu MkDocs)
  - 3000 (applications web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nouvelles extensions VS Code** :
  - `ms-python.vscode-pylance` - IntelliSense Python amélioré
  - `ms-azuretools.vscode-azurefunctions` - support Azure Functions
  - `ms-azuretools.vscode-docker` - support Docker
  - `ms-azuretools.vscode-bicep` - support langage Bicep
  - `ms-azure-devtools.azure-resource-groups` - gestion des ressources Azure
  - `yzhang.markdown-all-in-one` - édition Markdown
  - `DavidAnson.vscode-markdownlint` - linting Markdown
  - `bierner.markdown-mermaid` - support diagrammes Mermaid
  - `redhat.vscode-yaml` - support YAML (pour azure.yaml)
  - `eamodio.gitlens` - visualisation Git
  - `mhutchie.git-graph` - historique Git

- **⚙️ Paramètres VS Code** : Ajout des réglages par défaut pour l’interpréteur Python, le formatage à la sauvegarde et la suppression des espaces superflus

- **📦 Mise à jour de requirements-dev.txt** :
  - Ajout du plugin MkDocs minify
  - Ajout de pre-commit pour la qualité du code
  - Ajout des packages Azure SDK (azure-identity, azure-mgmt-resource)

#### Corrigé
- **Commande post-création** : Vérifie désormais l'installation de AZD et Azure CLI au démarrage du conteneur

---

### [v3.11.0] - 2026-02-05

#### Refonte du README pour les débutants
**Cette version améliore considérablement le README.md pour le rendre plus accessible aux débutants et ajoute des ressources essentielles pour les développeurs AI.**

#### Ajouté
- **🆚 Comparaison Azure CLI vs AZD** : Explication claire de quand utiliser chaque outil avec exemples pratiques
- **🌟 Liens géniaux AZD** : Liens directs vers la galerie communautaire de modèles et ressources de contribution :
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Plus de 200 modèles prêts à déployer
  - [Soumettre un modèle](https://github.com/Azure/awesome-azd/issues) - Contribution communautaire
- **🎯 Guide de démarrage rapide** : Section simplifiée en 3 étapes (Installer → Se connecter → Déployer)
- **📊 Tableau de navigation basé sur l'expérience** : Orientation claire selon le niveau du développeur

#### Modifié
- **Structure du README** : Réorganisée pour une divulgation progressive – informations clés en premier
- **Section Introduction** : Réécriture pour expliquer "La magie de `azd up`" aux débutants complets
- **Contenu en double supprimé** : Élimination de la section dépannage dupliquée
- **Commandes de dépannage** : Correction de la référence `azd logs` en `azd monitor --logs` valide

#### Corrigé

- **🔐 Commandes d'authentification** : Ajout de `azd auth login` et `azd auth logout` dans cheat-sheet.md
- **Références de commandes invalides** : Suppression des occurrences restantes de `azd logs` dans la section dépannage du README

#### Notes
- **Portée** : Modifications appliquées au README.md principal et à resources/cheat-sheet.md
- **Public cible** : Améliorations spécifiquement destinées aux développeurs débutants avec AZD

---

### [v3.10.0] - 2026-02-05

#### Mise à jour de la précision des commandes Azure Developer CLI
**Cette version corrige les commandes AZD inexistantes dans toute la documentation, assurant que tous les exemples de code utilisent une syntaxe valide de l'Azure Developer CLI.**

#### Corrections
- **🔧 Commandes AZD inexistantes supprimées** : Audit complet et correction des commandes invalides :
  - `azd logs` (n'existe pas) → remplacé par `azd monitor --logs` ou des alternatives Azure CLI
  - Sous-commandes `azd service` (n'existent pas) → remplacées par `azd show` et Azure CLI
  - `azd infra import/export/validate` (n'existent pas) → supprimées ou remplacées par des alternatives valides
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (n'existent pas) → supprimés
  - Flags `azd provision --what-if/--rollback` (n'existent pas) → mis à jour pour utiliser `--preview`
  - `azd config validate` (n'existe pas) → remplacé par `azd config list`
  - `azd info`, `azd history`, `azd metrics` (n'existent pas) → supprimés

- **📚 Fichiers mis à jour avec corrections de commandes** :
  - `resources/cheat-sheet.md` : Révision majeure de la référence des commandes
  - `docs/deployment/deployment-guide.md` : Correction des stratégies de rollback et de déploiement
  - `docs/troubleshooting/debugging.md` : Correction des sections d'analyse de logs
  - `docs/troubleshooting/common-issues.md` : Mise à jour des commandes de dépannage
  - `docs/troubleshooting/ai-troubleshooting.md` : Correction de la section debugging AZD
  - `docs/getting-started/azd-basics.md` : Correction des commandes de surveillance
  - `docs/getting-started/first-project.md` : Mise à jour des exemples de surveillance et de debugging
  - `docs/getting-started/installation.md` : Correction des exemples d'aide et version
  - `docs/pre-deployment/application-insights.md` : Correction des commandes de visualisation des logs
  - `docs/pre-deployment/coordination-patterns.md` : Correction des commandes de debugging agent

- **📝 Référence de version mise à jour** : 
  - `docs/getting-started/installation.md` : Changé la version codée en dur `1.5.0` en `1.x.x` générique avec lien vers les releases

#### Changements
- **Stratégies de rollback** : Mise à jour de la documentation pour utiliser un rollback basé sur Git (pas de rollback natif dans AZD)
- **Visualisation des logs** : Remplacement des références `azd logs` par `azd monitor --logs`, `azd monitor --live` et commandes Azure CLI
- **Section Performance** : Suppression des flags de déploiement parallèle/incrémental inexistants, fourniture d'alternatives valides

#### Détails techniques
- **Commandes AZD valides** : `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags azd monitor valides** : `--live`, `--logs`, `--overview`
- **Fonctionnalités supprimées** : `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notes
- **Vérification** : Commandes validées avec Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Finalisation de l'atelier et amélioration de la qualité de documentation
**Cette version termine les modules interactifs de l'atelier, corrige tous les liens documentation cassés et améliore la qualité globale du contenu pour les développeurs IA utilisant Microsoft AZD.**

#### Ajouts
- **📝 CONTRIBUTING.md** : Nouveau document de directives de contribution avec :
  - Instructions claires pour signaler des problèmes et proposer des modifications
  - Normes documentaires pour nouveau contenu
  - Directives d'exemples de code et conventions de messages de commit
  - Informations sur la participation communautaire

#### Terminé
- **🎯 Module 7 de l’atelier (Conclusion)** : Module de conclusion entièrement complété avec :
  - Résumé complet des accomplissements de l’atelier
  - Section concepts clés maîtrisés couvrant AZD, templates et Microsoft Foundry
  - Recommandations pour la poursuite du parcours d’apprentissage
  - Exercices de défis atelier avec niveaux de difficulté
  - Liens de feedback et support communautaire

- **📚 Module 3 de l’atelier (Déconstruction)** : Objectifs d’apprentissage mis à jour avec :
  - Activation GitHub Copilot avec serveurs MCP
  - Compréhension de la structure des dossiers des templates AZD
  - Patterns d’organisation infrastructure-as-code (Bicep)
  - Instructions pour laboratoire pratique

- **🔧 Module 6 de l’atelier (Démontage)** : Terminé avec :
  - Objectifs de nettoyage des ressources et gestion des coûts
  - Utilisation de `azd down` pour déprovisionnement sécurisé de l’infrastructure
  - Guide de récupération de services cognitifs supprimés doucement
  - Invitations à l’exploration bonus pour GitHub Copilot et Azure Portal

#### Corrections
- **🔗 Correction de liens cassés** : Résolution de plus de 15 liens internes cassés dans la documentation :
  - `docs/ai-foundry/ai-model-deployment.md` : Correction des chemins vers microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md` : Correction des chemins ai-model-deployment.md et production-ai-practices.md
  - `docs/getting-started/first-project.md` : Remplacement du fichier inexistant cicd-integration.md par deployment-guide.md
  - `examples/retail-scenario.md` : Correction des chemins FAQ et guide dépannage
  - `examples/container-app/microservices/README.md` : Correction des chemins vers la page d’accueil du cours et guide de déploiement
  - `resources/faq.md` et `resources/glossary.md` : Mise à jour des références du chapitre IA
  - `course-outline.md` : Correction des références au guide instructeur et aux labos atelier IA

- **📅 Bannière statut atelier** : Mise à jour de "En construction" à statut actif avec date février 2026

- **🔗 Navigation atelier** : Correction des liens de navigation cassés dans le README de l’atelier pointant vers un dossier lab-1-azd-basics inexistant

#### Changements
- **Présentation atelier** : Suppression de l’avertissement « en construction », l’atelier est maintenant complet et prêt à l’usage
- **Cohérence navigation** : Assuré que tous les modules d’atelier ont une navigation inter-module correcte
- **Références parcours d’apprentissage** : Mise à jour des références croisées des chapitres avec les bons chemins microsoft-foundry

#### Validation
- ✅ Tous les fichiers markdown anglais ont des liens internes valides
- ✅ Modules atelier 0-7 complets avec objectifs d’apprentissage
- ✅ Navigation entre chapitres et modules fonctionnelle
- ✅ Contenu adapté aux développeurs IA utilisant Microsoft AZD
- ✅ Langage et structure accessibles aux débutants conservés
- ✅ CONTRIBUTING.md fournit des directives claires pour les contributeurs communautaires

#### Mise en œuvre technique
- **Validation des liens** : Script PowerShell automatisé a vérifié tous les liens internes .md
- **Audit de contenu** : Revue manuelle de la complétude de l’atelier et de son adéquation débutants
- **Système de navigation** : Application cohérente des modèles de navigation chapitres et modules

#### Notes
- **Portée** : Modifications appliquées uniquement à la documentation anglaise
- **Traductions** : Les dossiers de traduction ne sont pas mis à jour dans cette version (traduction automatisée synchronisée ultérieurement)
- **Durée atelier** : Atelier complet offrant désormais 3-4 heures d’apprentissage pratique

---

### [v3.8.0] - 2025-11-19

#### Documentation avancée : Surveillance, sécurité et modèles multi-agents
**Cette version ajoute des cours complets de qualité A sur l'intégration d'Application Insights, les modèles d'authentification, et la coordination multi-agents pour les déploiements en production.**

#### Ajouts
- **📊 Leçon intégration Application Insights** : dans `docs/pre-deployment/application-insights.md` :
  - Déploiement centré AZD avec provisioning automatique
  - Templates Bicep complets pour Application Insights + Log Analytics
  - Applications Python fonctionnelles avec télémétrie personnalisée (plus de 1 200 lignes)
  - Modèles de surveillance IA/LLM (suivi jetons/coûts Microsoft Foundry Models)
  - 6 diagrammes Mermaid (architecture, traçage distribué, flux télémétrie)
  - 3 exercices pratiques (alertes, tableaux de bord, surveillance IA)
  - Exemples de requêtes Kusto et stratégies d’optimisation des coûts
  - Streaming métriques en direct et debugging temps réel
  - Temps d’apprentissage 40-50 minutes avec modèles prêts pour la production

- **🔐 Leçon Authentification & Sécurité** : dans `docs/getting-started/authsecurity.md` :
  - 3 modèles d’authentification (chaînes de connexion, Key Vault, identité gérée)
  - Templates complets d’infrastructure Bicep pour déploiements sécurisés
  - Code d’application Node.js avec intégration Azure SDK
  - 3 exercices complets (activation identité gérée, identité assignée par utilisateur, rotation Key Vault)
  - Bonnes pratiques sécurité et configurations RBAC
  - Guide dépannage et analyse coûts
  - Modèles d’authentification sans mot de passe prêts pour production

- **🤖 Leçon Modèles de coordination multi-agents** : dans `docs/pre-deployment/coordination-patterns.md` :
  - 5 modèles de coordination (séquentiel, parallèle, hiérarchique, piloté par événement, consensus)
  - Implémentation complète de service orchestrateur (Python/Flask, plus de 1 500 lignes)
  - 3 implémentations spécialisées d’agents (Recherche, Rédacteur, Éditeur)
  - Intégration Service Bus pour gestion des files de messages
  - Gestion d’état Cosmos DB pour systèmes distribués
  - 6 diagrammes Mermaid montrant les interactions entre agents
  - 3 exercices avancés (gestion des délais, logique de retry, disjoncteur)
  - Détail des coûts ($240-565/mois) avec stratégies d’optimisation
  - Intégration Application Insights pour surveillance

#### Améliorations
- **Chapitre Pré-déploiement** : Inclut désormais la surveillance complète et les modèles de coordination
- **Chapitre Démarrage** : Renforcé avec des modèles professionnels d’authentification
- **Préparation à la production** : Couverture complète de la sécurité à l’observabilité
- **Plan du cours** : Mis à jour pour référencer les nouvelles leçons des chapitres 3 et 6

#### Changements
- **Progression pédagogique** : Meilleure intégration de la sécurité et de la surveillance dans tout le cours
- **Qualité documentaire** : Standards A constants (95-97%) dans les nouvelles leçons
- **Modèles de production** : Couverture complète bout-en-bout des déploiements d’entreprise

#### Améliorations
- **Expérience développeur** : Parcours clair du développement à la surveillance en production
- **Standards de sécurité** : Modèles professionnels pour authentification et gestion des secrets
- **Observabilité** : Intégration complète d'Application Insights avec AZD
- **Charges de travail IA** : Surveillance spécialisée pour Microsoft Foundry Models et systèmes multi-agents

#### Validation
- ✅ Toutes les leçons incluent code fonctionnel complet (pas de fragments)
- ✅ Diagrammes Mermaid pour apprentissage visuel (19 au total dans 3 leçons)
- ✅ Exercices pratiques avec étapes de vérification (9 au total)
- ✅ Templates Bicep prêts pour production déployables via `azd up`
- ✅ Analyse des coûts et stratégies d’optimisation
- ✅ Guides dépannage et meilleures pratiques
- ✅ Points de contrôle des connaissances avec commandes de vérification

#### Résultats de notation documentaire
- **docs/pre-deployment/application-insights.md** : - Guide complet de surveillance
- **docs/getting-started/authsecurity.md** : - Modèles professionnels de sécurité
- **docs/pre-deployment/coordination-patterns.md** : - Architectures avancées multi-agents
- **Nouveau contenu global** : - Standards de haute qualité constants

#### Mise en œuvre technique
- **Application Insights** : Log Analytics + télémétrie personnalisée + traçage distribué
- **Authentification** : Identité gérée + Key Vault + modèles RBAC
- **Multi-Agents** : Service Bus + Cosmos DB + Container Apps + orchestration
- **Surveillance** : métriques en direct + requêtes Kusto + alertes + tableaux de bord
- **Gestion des coûts** : Stratégies d’échantillonnage, politiques de rétention, contrôle budgétaire

### [v3.7.0] - 2025-11-19

#### Améliorations qualité documentation et nouvel exemple Microsoft Foundry Models
**Cette version améliore la qualité de la documentation dans tout le dépôt et ajoute un exemple complet de déploiement Microsoft Foundry Models avec interface chat gpt-4.1.**

#### Ajouts
- **🤖 Exemple de chat Microsoft Foundry Models** : Déploiement complet gpt-4.1 avec implémentation fonctionnelle dans `examples/azure-openai-chat/` :
  - Infrastructure complète Microsoft Foundry Models (déploiement modèle gpt-4.1)
  - Interface chat en ligne de commande Python avec historique de conversation
  - Intégration Key Vault pour stockage sécurisé de clefs API
  - Suivi d’utilisation des tokens et estimation des coûts
  - Limitation de débit et gestion des erreurs
  - README complet avec guide de déploiement de 35-45 minutes
  - 11 fichiers prêts pour production (templates Bicep, app Python, configuration)
- **📚 Exercices de documentation** : Ajout d’exercices pratiques dans le guide de configuration :
  - Exercice 1 : configuration multi-environnements (15 minutes)
  - Exercice 2 : pratique de gestion des secrets (10 minutes)
  - Critères de réussite clairs et étapes de vérification
- **✅ Vérification du déploiement** : Ajout d’une section de vérification dans le guide de déploiement :
  - Procédures de vérification de santé
  - Liste de critères de réussite
  - Résultats attendus pour toutes les commandes de déploiement
  - Référence rapide en cas de problèmes

#### Améliorations
- **examples/README.md** : Mise à jour qualité A (93%) :
  - Ajout de azure-openai-chat dans toutes les sections concernées
  - Passage de 3 à 4 exemples locaux
  - Ajout au tableau des exemples d’applications IA
  - Intégration dans Quick Start pour utilisateurs intermédiaires
  - Ajout à la section Microsoft Foundry Templates
  - Mise à jour des matrices de comparaison et des sections de recherche technologique
- **Qualité documentation** : Amélioration de B+ (87%) à A- (92%) dans le dossier docs

  - Ajout des sorties attendues aux exemples de commandes critiques
  - Inclusion des étapes de vérification pour les modifications de configuration
  - Amélioration de l'apprentissage pratique avec des exercices concrets

#### Modifié
- **Progression d’apprentissage** : Meilleure intégration des exemples d’IA pour les apprenants intermédiaires
- **Structure de la documentation** : Plus d’exercices actionnables avec résultats clairs
- **Processus de vérification** : Critères de succès explicites ajoutés aux workflows clés

#### Amélioré
- **Expérience développeur** : Le déploiement des Microsoft Foundry Models prend désormais 35-45 minutes (contre 60-90 pour des alternatives complexes)
- **Transparence des coûts** : Estimations claires des coûts (50-200 $/mois) pour l'exemple Microsoft Foundry Models
- **Parcours d’apprentissage** : Les développeurs IA ont un point d'entrée clair avec azure-openai-chat
- **Normes de documentation** : Sorties attendues cohérentes et étapes de vérification

#### Validé
- ✅ Exemple Microsoft Foundry Models fonctionnel avec `azd up`
- ✅ Tous les 11 fichiers d’implémentation syntaxiquement corrects
- ✅ Instructions README conformes à l’expérience réelle de déploiement
- ✅ Liens de documentation mis à jour dans plus de 8 emplacements
- ✅ Index des exemples reflétant précisément 4 exemples locaux
- ✅ Aucun lien externe dupliqué dans les tableaux
- ✅ Toutes les références de navigation correctes

#### Implémentation technique
- **Architecture Microsoft Foundry Models** : patron gpt-4.1 + Key Vault + Container Apps
- **Sécurité** : Identité managée prête, secrets stockés dans Key Vault
- **Surveillance** : Intégration Application Insights
- **Gestion des coûts** : Suivi des jetons et optimisation des usages
- **Déploiement** : Commande unique `azd up` pour une configuration complète

### [v3.6.0] - 2025-11-19

#### Mise à jour majeure : Exemples de déploiement Container App
**Cette version présente des exemples complets et prêts pour la production de déploiement d’applications containerisées via Azure Developer CLI (AZD), avec documentation complète et intégration au parcours d’apprentissage.**

#### Ajouté
- **🚀 Exemples Container App** : Nouveaux exemples locaux dans `examples/container-app/` :
  - [Guide Maître](examples/container-app/README.md) : Vue d’ensemble complète des déploiements containerisés, démarrage rapide, production et patrons avancés
  - [API Flask Simple](../../examples/container-app/simple-flask-api) : API REST débutant avec montée à zéro, probes de santé, surveillance et dépannage
  - [Architecture Microservices](../../examples/container-app/microservices) : Déploiement multi-services prêt pour la production (API Gateway, Produit, Commande, Utilisateur, Notification), messagerie asynchrone, Service Bus, Cosmos DB, Azure SQL, traçage distribué, déploiement blue-green/canary
- **Bonnes pratiques** : Sécurité, surveillance, optimisation des coûts, et conseils CI/CD pour charges containerisées
- **Exemples de code** : `azure.yaml` complet, templates Bicep, et implémentations multi-langages (Python, Node.js, C#, Go)
- **Tests & Dépannage** : Scénarios de test de bout en bout, commandes de surveillance, guide de dépannage

#### Modifié
- **README.md** : Mise à jour pour présenter et lier les nouveaux exemples container app sous "Exemples locaux - Applications containerisées"
- **examples/README.md** : Mise à jour pour mettre en avant les exemples container app, ajouter des entrées à la matrice de comparaison, et actualiser les références technologiques/architecturales
- **Plan du cours & Guide d’étude** : Mis à jour pour référencer les nouveaux exemples container app et patrons de déploiement dans les chapitres pertinents

#### Validé
- ✅ Tous les nouveaux exemples déployables avec `azd up` et respectant les meilleures pratiques
- ✅ Liens croisés de documentation et navigation mis à jour
- ✅ Exemples couvrant des scénarios débutants à avancés, y compris microservices en production

#### Notes
- **Portée** : Documentation et exemples uniquement en anglais
- **Prochaines étapes** : Extension avec patrons avancés de containers et automatisation CI/CD dans les prochaines versions

### [v3.5.0] - 2025-11-19

#### Rebranding produit : Microsoft Foundry
**Cette version implémente un changement complet du nom produit de "Microsoft Foundry" à "Microsoft Foundry" dans toute la documentation anglaise, reflétant le rebranding officiel de Microsoft.**

#### Modifié
- **🔄 Mise à jour nom produit** : Rebranding complet de "Microsoft Foundry" à "Microsoft Foundry"
  - Mise à jour de toutes les références dans la documentation anglaise du dossier `docs/`
  - Renommage du dossier : `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renommage du fichier : `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Au total : 23 références de contenu mises à jour dans 7 fichiers documentation

- **📁 Modifications de la structure des dossiers** :
  - `docs/ai-foundry/` renommé en `docs/microsoft-foundry/`
  - Toutes les références croisées mises à jour pour refléter la nouvelle structure
  - Liens de navigation validés dans toute la documentation

- **📄 Renommages de fichiers** :
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tous les liens internes mis à jour pour référencer le nouveau nom de fichier

#### Fichiers mis à jour
- **Documentation des chapitres** (7 fichiers) :
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 mises à jour de liens de navigation
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 références au nom produit mises à jour
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Utilisation déjà Microsoft Foundry (depuis mises à jour précédentes)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 références mises à jour (aperçu, retours communauté, documentation)
  - `docs/getting-started/azd-basics.md` - 4 liens de références croisées mis à jour
  - `docs/getting-started/first-project.md` - 2 liens de navigation de chapitre mis à jour
  - `docs/getting-started/installation.md` - 2 liens vers chapitres suivants mis à jour
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 références mises à jour (navigation, communauté Discord)
  - `docs/troubleshooting/common-issues.md` - 1 lien de navigation mis à jour
  - `docs/troubleshooting/debugging.md` - 1 lien de navigation mis à jour

- **Fichiers de structure du cours** (2 fichiers) :
  - `README.md` - 17 références mises à jour (aperçu cours, titres chapitres, section modèles, insights communauté)
  - `course-outline.md` - 14 références mises à jour (aperçu, objectifs d’apprentissage, ressources chapitres)

#### Validé
- ✅ Plus aucune référence au chemin de dossier "ai-foundry" dans les docs anglaises
- ✅ Plus aucune mention de "Microsoft Foundry" dans les noms produits des docs anglaises
- ✅ Tous les liens de navigation fonctionnent avec la nouvelle structure de dossiers
- ✅ Renommages de fichiers et dossiers effectués avec succès
- ✅ Références croisées entre chapitres validées

#### Notes
- **Portée** : Modifications appliquées uniquement à la documentation anglaise dans `docs/`
- **Traductions** : Dossiers de traduction (`translations/`) non mis à jour dans cette version
- **Atelier** : Matériel d’atelier (`workshop/`) non modifié dans cette version
- **Exemples** : Fichiers exemples pouvant encore contenir l’ancienne nomenclature (à corriger ultérieurement)
- **Liens externes** : URLs externes et références au dépôt GitHub inchangés

#### Guide de migration pour contributeurs
Si vous avez des branches locales ou de la documentation référant à l’ancienne structure :
1. Mettez à jour les références de dossier : `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Mettez à jour les références de fichiers : `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Remplacez le nom produit : "Microsoft Foundry" → "Microsoft Foundry"
4. Vérifiez que tous les liens internes à la documentation fonctionnent encore

---

### [v3.4.0] - 2025-10-24

#### Améliorations de l’aperçu et validation d’infrastructure
**Cette version introduit un support complet pour la nouvelle fonctionnalité d’aperçu de Azure Developer CLI et améliore l’expérience utilisateur de l’atelier.**

#### Ajouté
- **🧪 Documentation de la fonction azd provision --preview** : Couverture complète de la nouvelle capacité d’aperçu d’infrastructure
  - Référence de commande et exemples d’utilisation dans aide-mémoire
  - Intégration détaillée dans le guide de provisionnement avec cas d’usage et bénéfices
  - Intégration de vérifications préalables pour un déploiement plus sûr
  - Mises à jour du guide de démarrage avec pratiques de déploiement sécurisées
- **🚧 Bannière de statut atelier** : Bannière HTML professionnelle indiquant le statut de développement de l'atelier
  - Design en dégradé avec indicateurs de construction pour communiquer clairement aux utilisateurs
  - Horodatage de dernière mise à jour pour transparence
  - Design responsive adapté à tous types d’appareils mobiles

#### Amélioré
- **Sécurité d’infrastructure** : Fonctionnalité d’aperçu intégrée dans toute la documentation de déploiement
- **Validation pré-déploiement** : Scripts automatisés incluant désormais les tests d’aperçu d’infrastructure
- **Workflow développeur** : Séquences de commandes mises à jour pour inclure l’aperçu comme bonne pratique
- **Expérience atelier** : Clarification des attentes des utilisateurs sur le statut de développement du contenu

#### Modifié
- **Bonnes pratiques de déploiement** : Workflow "aperçu d’abord" maintenant recommandé
- **Flux de documentation** : Validation d’infrastructure déplacée plus tôt dans le processus d’apprentissage
- **Présentation atelier** : Communication professionnelle du statut avec calendrier clair de développement

#### Amélioré
- **Approche priorisant la sécurité** : Les changements d’infrastructure peuvent être validés avant déploiement
- **Collaboration d’équipe** : Les résultats d’aperçu peuvent être partagés pour revue et validation
- **Conscience des coûts** : Meilleure compréhension des coûts des ressources avant provisionnement
- **Atténuation des risques** : Réduction des échecs de déploiement grâce à la validation anticipée

#### Implémentation technique
- **Intégration multi-documents** : Fonctionnalité d’aperçu documentée dans 4 fichiers clés
- **Patrons de commande** : Syntaxe et exemples cohérents dans toute la documentation
- **Intégration bonne pratique** : Aperçu inclus dans les workflows et scripts de validation
- **Indicateurs visuels** : Marquages clairs de la nouveauté pour faciliter la découverte

#### Infrastructure atelier
- **Communication du statut** : Bannière HTML professionnelle avec style en dégradé
- **Expérience utilisateur** : Statut de développement clair qui évite les confusions
- **Présentation professionnelle** : Maintient la crédibilité du dépôt tout en fixant les attentes
- **Transparence temporelle** : Horodatage de dernière mise à jour en octobre 2025 pour responsabilité

### [v3.3.0] - 2025-09-24

#### Matériel d’atelier amélioré et expérience d’apprentissage interactive
**Cette version présente un matériel d’atelier complet avec guides interactifs basés sur navigateur et parcours d’apprentissage structurés.**

#### Ajouté
- **🎥 Guide interactif de l’atelier** : Expérience d’atelier basée navigateur avec capacité de prévisualisation MkDocs
- **📝 Instructions structurées pour l’atelier** : Parcours d’apprentissage guidé en 7 étapes, de la découverte à la personnalisation
  - 0-Introduction : Vue d’ensemble de l’atelier et installation
  - 1-Sélection-Modèle-IA : Découverte et sélection du modèle
  - 2-Validation-Modèle-IA : Procédures de déploiement et validation
  - 3-Déconstruction-Modèle-IA : Compréhension de l’architecture du modèle
  - 4-Configuration-Modèle-IA : Configuration et personnalisation
  - 5-Personnalisation-Modèle-IA : Modifications avancées et itérations
  - 6-Démontage-Infrastructure : Nettoyage et gestion des ressources
  - 7-Clôture : Résumé et prochaines étapes
- **🛠️ Outils atelier** : Configuration MkDocs avec thème Material pour expérience d’apprentissage améliorée
- **🎯 Parcours pratique** : Méthodologie en 3 étapes (Découverte → Déploiement → Personnalisation)
- **📱 Intégration GitHub Codespaces** : Mise en place fluide d’environnements de développement

#### Amélioré
- **Laboratoire atelier IA** : Étendu avec expérience d’apprentissage structurée de 2-3 heures
- **Documentation atelier** : Présentation professionnelle avec navigation et aides visuelles
- **Progression d’apprentissage** : Guide clair étape par étape, de la sélection du modèle au déploiement en production
- **Expérience développeur** : Outils intégrés pour des workflows de développement optimisés

#### Amélioré
- **Accessibilité** : Interface navigateur avec recherche, fonction copier, et changement de thème
- **Apprentissage autonome** : Structure flexible de l’atelier pour différents rythmes d’apprentissage
- **Application pratique** : Scénarios réels de déploiement de modèles IA
- **Intégration communautaire** : Intégration Discord pour support et collaboration d’atelier

#### Fonctionnalités de l’atelier
- **Recherche intégrée** : Découverte rapide par mots-clés et leçons
- **Copie des blocs de code** : Fonctionnalité au survol pour copier tous les exemples de code
- **Changement de thème** : Support mode sombre/clair selon préférences
- **Supports visuels** : Captures d’écran et diagrammes pour une meilleure compréhension
- **Intégration aide** : Accès direct à Discord pour support communautaire

### [v3.2.0] - 2025-09-17

#### Restructuration majeure de la navigation et système d’apprentissage par chapitres
**Cette version introduit une structure d’apprentissage complète par chapitres avec navigation améliorée dans tout le dépôt.**

#### Ajouté
- **📚 Système d’apprentissage par chapitres** : Réorganisation complète du cours en 8 chapitres progressifs
  - Chapitre 1 : Fondations & Démarrage rapide (⭐ - 30-45 minutes)
  - Chapitre 2 : Développement AI-First (⭐⭐ - 1-2 heures)
  - Chapitre 3 : Configuration & Authentification (⭐⭐ - 45-60 minutes)
  - Chapitre 4 : Infrastructure as Code & Déploiement (⭐⭐⭐ - 1-1,5 heures)
  - Chapitre 5 : Solutions IA multi-agents (⭐⭐⭐⭐ - 2-3 heures)
  - Chapitre 6 : Validation & Planification pré-déploiement (⭐⭐ - 1 heure)
  - Chapitre 7 : Dépannage & Debug (⭐⭐ - 1-1,5 heures)
  - Chapitre 8 : Patrons en production & entreprise (⭐⭐⭐⭐ - 2-3 heures)
- **📚 Système de navigation complet** : Entêtes et pieds de page de navigation cohérents dans toute la documentation
- **🎯 Suivi de progression** : Checklist d’achèvement de cours et système de vérification d’apprentissage
- **🗺️ Orientation du parcours d’apprentissage** : Points d’entrée clairs selon niveaux d’expérience et objectifs
- **🔗 Navigation par références croisées** : Chapitres liés et prérequis clairement indiqués

#### Amélioré
- **Structure README** : Transformée en plateforme d’apprentissage structurée avec organisation par chapitres
- **Navigation documentation** : Chaque page inclut désormais contexte du chapitre et guidance de progression
- **Organisation des templates** : Exemples et templates associés aux chapitres d’apprentissage appropriés

- **Intégration des ressources** : Fiches techniques, FAQ et guides d'étude reliés aux chapitres concernés
- **Intégration d'atelier** : Laboratoires pratiques associés à plusieurs objectifs d'apprentissage de chapitres

#### Modifié
- **Progression d’apprentissage** : Passage d’une documentation linéaire à un apprentissage flexible basé sur les chapitres
- **Placement de la configuration** : Guide de configuration repositionné en Chapitre 3 pour un meilleur déroulement de l’apprentissage
- **Intégration de contenu IA** : Meilleure intégration du contenu spécifique à l’IA tout au long du parcours d’apprentissage
- **Contenu production** : Modèles avancés consolidés dans le Chapitre 8 pour les apprenants entreprise

#### Amélioré
- **Expérience utilisateur** : Fil d’Ariane clair et indicateurs de progression par chapitre
- **Accessibilité** : Modèles de navigation cohérents pour faciliter le parcours de formation
- **Présentation professionnelle** : Structure de cours de type universitaire adaptée à la formation académique et en entreprise
- **Efficacité de l’apprentissage** : Réduction du temps pour trouver le contenu pertinent grâce à une meilleure organisation

#### Mise en œuvre technique
- **En-têtes de navigation** : Normalisation de la navigation des chapitres sur plus de 40 fichiers de documentation
- **Navigation pied de page** : Orientation cohérente de la progression et indicateurs d’achèvement des chapitres
- **Maillage interne** : Système complet de liens internes connectant les concepts liés
- **Cartographie des chapitres** : Modèles et exemples clairement associés aux objectifs pédagogiques

#### Amélioration du guide d’étude
- **📚 Objectifs d’apprentissage complets** : Restructuration du guide d’étude pour correspondre au système de 8 chapitres
- **🎯 Évaluation basée sur les chapitres** : Chaque chapitre comprend des objectifs spécifiques et des exercices pratiques
- **📋 Suivi des progrès** : Planning hebdomadaire avec résultats mesurables et listes de vérification d’achèvement
- **❓ Questions d’évaluation** : Questions de validation des connaissances pour chaque chapitre avec résultats professionnels
- **🛠️ Exercices pratiques** : Activités pratiques avec scénarios réels de déploiement et dépannage
- **📊 Progression des compétences** : Avancement clair des concepts de base aux modèles entreprise avec focus développement de carrière
- **🎓 Cadre de certification** : Résultats de développement professionnel et système de reconnaissance communautaire
- **⏱️ Gestion du calendrier** : Plan d’apprentissage structuré sur 10 semaines avec validation des jalons

### [v3.1.0] - 2025-09-17

#### Solutions IA multi-agent améliorées
**Cette version améliore la solution multi-agent retail avec un meilleur nommage des agents et une documentation enrichie.**

#### Modifié
- **Terminologie multi-agent** : Remplacement de "agent Cora" par "agent Client" dans toute la solution retail multi-agent pour une meilleure compréhension
- **Architecture agent** : Mise à jour de toute la documentation, des modèles ARM et des exemples de code pour utiliser un nommage cohérent "agent Client"
- **Exemples de configuration** : Modernisation des modèles de configuration agent avec conventions de nommage actualisées
- **Cohérence documentaire** : Garantie que toutes les références utilisent des noms d’agents professionnels et descriptifs

#### Amélioré
- **Package modèle ARM** : Mise à jour de retail-multiagent-arm-template avec références à l’agent Client
- **Diagrammes d’architecture** : Actualisation des diagrammes Mermaid avec nommage agent à jour
- **Exemples de code** : Les classes et exemples Python utilisent désormais le nom CustomerAgent
- **Variables d’environnement** : Mise à jour de tous les scripts de déploiement pour utiliser les conventions CUSTOMER_AGENT_NAME

#### Amélioré
- **Expérience développeur** : Rôles et responsabilités des agents clarifiés dans la documentation
- **Prêt pour la production** : Meilleure alignement avec les conventions de nommage entreprise
- **Matériel pédagogique** : Nommage agent plus intuitif à des fins éducatives
- **Utilisabilité des modèles** : Compréhension simplifiée des fonctions agents et des schémas de déploiement

#### Détails techniques
- Diagrammes d’architecture Mermaid mis à jour avec références CustomerAgent
- Remplacement des noms de classe CoraAgent par CustomerAgent dans les exemples Python
- Modifications des configurations JSON du modèle ARM pour utiliser le type agent "customer"
- Mise à jour des variables d’environnement de CORA_AGENT_* à CUSTOMER_AGENT_*
- Actualisation de toutes les commandes de déploiement et configurations de conteneurs

### [v3.0.0] - 2025-09-12

#### Changements majeurs - Focus développeur IA et intégration Microsoft Foundry
**Cette version transforme le dépôt en une ressource d’apprentissage complète axée sur l’IA avec intégration Microsoft Foundry.**

#### Ajouté
- **🤖 Parcours d’apprentissage AI-first** : Restructuration complète priorisant les développeurs et ingénieurs IA
- **Guide d’intégration Microsoft Foundry** : Documentation exhaustive pour connecter AZD aux services Microsoft Foundry
- **Modèles de déploiement IA** : Guide détaillé sur la sélection de modèles, configuration et stratégies de déploiement en production
- **Atelier AI pratique** : Atelier pratique de 2 à 3 heures pour convertir des applications IA en solutions déployables avec AZD
- **Bonnes pratiques production IA** : Modèles entreprise prêts pour la mise à l’échelle, surveillance et sécurisation des charges IA
- **Guide de dépannage spécifique IA** : Assistance complète pour Microsoft Foundry Models, Cognitive Services et déploiements IA
- **Galerie de modèles IA** : Collection en vedette des modèles Microsoft Foundry avec évaluations de complexité
- **Matériel d’atelier** : Structure complète de l’atelier avec laboratoires pratiques et matériels de référence

#### Amélioré
- **Structure du README** : Axée sur les développeurs IA avec 45% d’intérêt communautaire sur le Discord Microsoft Foundry
- **Parcours d’apprentissage** : Parcours dédié aux développeurs IA parallèlement aux parcours traditionnels étudiants et ingénieurs DevOps
- **Recommandations de modèles** : Modèles IA en vedette dont azure-search-openai-demo, contoso-chat et openai-chat-app-quickstart
- **Intégration communautaire** : Support amélioré du Discord communautaire avec canaux et discussions spécifiques IA

#### Sécurité et production
- **Modèles d’identité gérée** : Configurations d’authentification et de sécurité spécifiques IA
- **Optimisation des coûts** : Suivi d’utilisation des jetons et contrôle budgétaire pour charges IA
- **Déploiement multi-régions** : Stratégies de déploiement global des applications IA
- **Surveillance des performances** : Métriques IA spécifiques et intégration Application Insights

#### Qualité de la documentation
- **Structure de cours linéaire** : Progression logique du débutant aux modèles de déploiement IA avancés
- **URLs validées** : Tous les liens externes des dépôts vérifiés et accessibles
- **Référence complète** : Tous les liens internes validés et fonctionnels
- **Prêt pour la production** : Modèles de déploiement entreprise avec exemples concrets

### [v2.0.0] - 2025-09-09

#### Changements majeurs - Restructuration du dépôt et amélioration professionnelle
**Cette version représente une refonte significative de la structure du dépôt et de la présentation du contenu.**

#### Ajouté
- **Cadre d’apprentissage structuré** : Toutes les pages de documentation incluent des sections Introduction, Objectifs d’apprentissage et Résultats attendus
- **Système de navigation** : Ajout de liens Leçon précédente/Suivante dans toute la documentation pour une progression guidée
- **Guide d’étude** : guide d’étude.md complet avec objectifs, exercices pratiques et matériaux d’évaluation
- **Présentation professionnelle** : Suppression des icônes emoji pour une meilleure accessibilité et apparence professionnelle
- **Structure de contenu améliorée** : Organisation et fluidité des matériaux d’apprentissage optimisées

#### Modifié
- **Format de documentation** : Standardisation de toute la documentation avec une structure cohérente axée sur l’apprentissage
- **Flux de navigation** : Mise en œuvre d’une progression logique dans tous les contenus d’apprentissage
- **Présentation du contenu** : Suppression des éléments décoratifs au profit d’un format clair et professionnel
- **Structure des liens** : Mise à jour des liens internes pour supporter le nouveau système de navigation

#### Amélioré
- **Accessibilité** : Suppression des dépendances aux emojis pour une meilleure compatibilité lecteurs d’écran
- **Apparence professionnelle** : Présentation claire de type académique adaptée à l’apprentissage en entreprise
- **Expérience d’apprentissage** : Approche structurée avec objectifs et résultats clairs pour chaque leçon
- **Organisation du contenu** : Meilleure cohérence et connexion logique entre sujets liés

### [v1.0.0] - 2025-09-09

#### Version initiale - Dépôt complet d’apprentissage AZD

#### Ajouté
- **Structure de documentation principale**
  - Série complète de guides de démarrage
  - Documentation exhaustive sur le déploiement et le provisioning
  - Ressources détaillées de dépannage et guides de débogage
  - Outils et procédures de validation pré-déploiement

- **Module de démarrage**
  - Bases AZD : concepts clés et terminologie
  - Guide d’installation : instructions de configuration spécifiques à la plateforme
  - Guide de configuration : paramétrage environnement et authentification
  - Tutoriel premier projet : apprentissage pratique étape par étape

- **Module déploiement et provisioning**
  - Guide de déploiement : documentation complète du workflow
  - Guide de provisioning : Infrastructure as Code avec Bicep
  - Bonnes pratiques pour les déploiements en production
  - Modèles d’architecture multi-service

- **Module validation pré-déploiement**
  - Planification de capacité : validation de disponibilité des ressources Azure
  - Sélection de SKU : guide complet des niveaux de service
  - Contrôles préalables : scripts de validation automatisés (PowerShell et Bash)
  - Outils d’estimation des coûts et planification budgétaire

- **Module dépannage**
  - Problèmes courants : problèmes fréquents et solutions
  - Guide de débogage : méthodologies systématiques de dépannage
  - Techniques et outils de diagnostic avancés
  - Surveillance et optimisation des performances

- **Ressources et références**
  - Fiche mémo commandes : référence rapide des commandes essentielles
  - Glossaire : définitions complètes des termes et acronymes
  - FAQ : réponses détaillées aux questions fréquentes
  - Liens vers ressources externes et communautés

- **Exemples et modèles**
  - Exemple d’application web simple
  - Modèle de déploiement site web statique
  - Configuration application conteneur
  - Modèles d’intégration de base de données
  - Exemples d’architecture microservices
  - Implémentations fonction serverless

#### Fonctionnalités
- **Support multi-plateforme** : guides d’installation et configuration pour Windows, macOS et Linux
- **Niveaux de compétence multiples** : contenu conçu pour étudiants jusqu’aux développeurs professionnels
- **Accent pratique** : exemples pratiques et scénarios réels
- **Couverture complète** : des concepts basiques aux modèles entreprise avancés
- **Approche « sécurité d’abord »** : bonnes pratiques de sécurité intégrées de bout en bout
- **Optimisation des coûts** : conseils pour déploiements économiques et gestion des ressources

#### Qualité de la documentation
- **Exemples de code détaillés** : exemples pratiques et testés
- **Instructions étape par étape** : directives claires et exploitables
- **Gestion complète des erreurs** : procédures de dépannage pour problèmes courants
- **Intégration des bonnes pratiques** : standards et recommandations de l’industrie
- **Compatibilité des versions** : à jour avec les derniers services Azure et fonctionnalités azd

## Améliorations futures planifiées

### Version 3.1.0 (Planifiée)
#### Extension plateforme IA
- **Support multi-modèle** : patrons d’intégration pour Hugging Face, Azure Machine Learning et modèles personnalisés
- **Cadres d’agents IA** : modèles pour déploiements LangChain, Semantic Kernel et AutoGen
- **Modèles avancés RAG** : options bases vectorielles au-delà d’Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilité IA** : surveillance améliorée des performances des modèles, usage des jetons et qualité des réponses

#### Expérience développeur
- **Extension VS Code** : expérience de développement intégrée AZD + Microsoft Foundry
- **Intégration GitHub Copilot** : génération assistée de modèles AZD par IA
- **Tutoriels interactifs** : exercices pratiques de codage avec validation automatisée pour scénarios IA
- **Contenu vidéo** : tutoriels vidéo complémentaires pour apprenants visuels centrés sur les déploiements IA

### Version 4.0.0 (Planifiée)
#### Modèles IA entreprise
- **Cadre de gouvernance** : gouvernance des modèles IA, conformité et pistes d’audit
- **IA multi-tenant** : modèles pour servir plusieurs clients avec services IA isolés
- **Déploiement IA Edge** : intégration avec Azure IoT Edge et instances conteneurs
- **Cloud hybride IA** : modèles de déploiement multi-cloud et hybride pour charges IA

#### Fonctionnalités avancées
- **Automatisation pipeline IA** : intégration MLOps avec pipelines Azure Machine Learning
- **Sécurité avancée** : modèles zero-trust, points de terminaison privés et protection avancée contre les menaces
- **Optimisation des performances** : réglages avancés et stratégies de montée en charge pour applications IA à haute débit
- **Distribution globale** : modèles de livraison de contenu et mise en cache edge pour applications IA

### Version 3.0.0 (Planifiée) - Supplantée par la version actuelle
#### Ajouts proposés - Maintenant implémentés en v3.0.0
- ✅ **Contenu axé IA** : intégration complète Microsoft Foundry (Terminée)
- ✅ **Tutoriels interactifs** : atelier pratique IA (Terminé)
- ✅ **Module sécurité avancée** : modèles de sécurité spécifiques IA (Terminé)
- ✅ **Optimisation des performances** : stratégies de réglage pour charges IA (Terminé)

### Version 2.1.0 (Planifiée) - Partiellement implémentée en v3.0.0
#### Améliorations mineures - Certaines terminées dans la version actuelle
- ✅ **Exemples supplémentaires** : scénarios de déploiement axés IA (Terminés)
- ✅ **FAQ étendue** : questions et dépannage spécifiques IA (Terminés)
- **Intégration outils** : guides améliorés pour IDE et éditeurs
- ✅ **Extension surveillance** : modèles IA spécifiques de monitoring et alertes (Terminés)

#### Encore prévu pour une future version
- **Documentation adaptée mobile** : design responsive pour apprentissage mobile
- **Accès hors ligne** : paquets de documentation téléchargeables
- **Intégration IDE améliorée** : extension VS Code pour flux AZD + IA
- **Tableau de bord communauté** : métriques en temps réel et suivi des contributions

## Contribution au changelog

### Rapport de changements
Lorsque vous contribuez à ce dépôt, veuillez vous assurer que les entrées du changelog incluent :

1. **Numéro de version** : suivant la sémantique (majeur.mineur.correction)
2. **Date** : date de sortie ou mise à jour au format AAAA-MM-JJ
3. **Catégorie** : Ajouté, Modifié, Obsolète, Supprimé, Corrigé, Sécurité
4. **Description claire** : description concise du changement
5. **Évaluation d’impact** : comment les changements affectent les utilisateurs existants

### Catégories de changements

#### Ajouté
- Nouvelles fonctionnalités, sections documentaires ou capacités
- Nouveaux exemples, modèles ou ressources pédagogiques
- Outils, scripts ou utilitaires supplémentaires

#### Modifié
- Modifications des fonctionnalités ou de la documentation existantes
- Mises à jour pour améliorer la clarté ou la précision
- Restructuration du contenu ou de l’organisation

#### Obsolète
- Fonctionnalités ou approches en cours de suppression
- Sections documentaires prévues pour suppression
- Méthodes remplacées par de meilleures alternatives

#### Supprimé
- Fonctionnalités, documentations ou exemples devenus non pertinents
- Informations obsolètes ou approches dépréciées
- Contenu redondant ou consolidé

#### Corrigé
- Corrections d’erreurs dans la documentation ou le code
- Résolution des problèmes signalés
- Améliorations de la précision ou de la fonctionnalité


#### Sécurité
- Améliorations ou corrections liées à la sécurité
- Mises à jour des meilleures pratiques de sécurité
- Résolution des vulnérabilités de sécurité

### Lignes directrices pour le versionnage sémantique

#### Version Majeure (X.0.0)
- Changements incompatibles nécessitant une action de l'utilisateur
- Restructuration significative du contenu ou de l'organisation
- Changements modifiant l'approche ou la méthodologie fondamentale

#### Version Mineure (X.Y.0)
- Nouvelles fonctionnalités ou ajouts de contenu
- Améliorations maintenant la compatibilité ascendante
- Exemples, outils ou ressources supplémentaires

#### Version Corrective (X.Y.Z)
- Corrections de bugs et ajustements
- Améliorations mineures du contenu existant
- Clarifications et petites améliorations

## Retour et suggestions de la communauté

Nous encourageons activement les retours de la communauté pour améliorer cette ressource d'apprentissage :

### Comment fournir un retour
- **GitHub Issues** : Signalez des problèmes ou suggérez des améliorations (problèmes spécifiques à l'IA bienvenus)
- **Discussions Discord** : Partagez des idées et échangez avec la communauté Microsoft Foundry
- **Pull Requests** : Contribuez directement à l'amélioration du contenu, notamment les modèles et guides IA
- **Microsoft Foundry Discord** : Participez au canal #Azure pour les discussions AZD + IA
- **Forums communautaires** : Participez aux discussions plus larges des développeurs Azure

### Catégories de retours
- **Précision du contenu IA** : Corrections concernant l'intégration et le déploiement des services IA
- **Expérience d'apprentissage** : Suggestions pour améliorer le parcours d’apprentissage des développeurs IA
- **Contenu IA manquant** : Demandes de modèles, motifs ou exemples IA supplémentaires
- **Accessibilité** : Améliorations pour répondre aux besoins d'apprentissage divers
- **Intégration d’outils IA** : Suggestions pour mieux intégrer les flux de travail de développement IA
- **Modèles IA en production** : Demandes de modèles de déploiement IA pour l'entreprise

### Engagement de réponse
- **Réponse aux problèmes** : Sous 48 heures pour les problèmes signalés
- **Demandes de fonctionnalités** : Évaluation sous une semaine
- **Contributions communautaires** : Revue sous une semaine
- **Problèmes de sécurité** : Priorité immédiate avec réponse accélérée

## Calendrier de maintenance

### Mises à jour régulières
- **Revue mensuelle** : Vérification de la précision du contenu et validation des liens
- **Mises à jour trimestrielles** : Ajouts majeurs de contenu et améliorations
- **Revue semestrielle** : Restructuration complète et améliorations
- **Versions annuelles** : Mises à jour majeures avec améliorations significatives

### Surveillance et assurance qualité
- **Tests automatisés** : Validation régulière des exemples de code et des liens
- **Intégration des retours communautaires** : Prise en compte régulière des suggestions des utilisateurs
- **Mises à jour technologiques** : Alignement avec les derniers services Azure et versions azd
- **Audits d'accessibilité** : Revue régulière pour les principes de conception inclusive

## Politique de prise en charge des versions

### Prise en charge des versions actuelles
- **Dernière version majeure** : Prise en charge complète avec mises à jour régulières
- **Version majeure précédente** : Mises à jour de sécurité et corrections critiques pendant 12 mois
- **Versions héritées** : Support communautaire uniquement, pas de mises à jour officielles

### Guide de migration
Lors de la sortie de versions majeures, nous fournissons :
- **Guides de migration** : Instructions étape par étape pour la transition
- **Notes de compatibilité** : Détails sur les changements incompatibles
- **Outils de support** : Scripts ou utilitaires pour faciliter la migration
- **Support communautaire** : Forums dédiés aux questions de migration

---

**Navigation**
- **Leçon précédente** : [Guide d'étude](resources/study-guide.md)
- **Leçon suivante** : Retour au [README principal](README.md)

**Restez informé** : Surveillez ce dépôt pour recevoir des notifications sur les nouvelles versions et les mises à jour importantes des supports d'apprentissage.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->