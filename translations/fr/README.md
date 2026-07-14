# AZD Pour Débutants : Un Parcours d'Apprentissage Structuré

![AZD-pour-débutants](../../translated_images/fr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Traductions Automatisées (Toujours à Jour)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabe](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgare](../bg/README.md) | [Birman (Myanmar)](../my/README.md) | [Chinois (Simplifié)](../zh-CN/README.md) | [Chinois (Traditionnel, Hong Kong)](../zh-HK/README.md) | [Chinois (Traditionnel, Macao)](../zh-MO/README.md) | [Chinois (Traditionnel, Taïwan)](../zh-TW/README.md) | [Croate](../hr/README.md) | [Tchèque](../cs/README.md) | [Danois](../da/README.md) | [Néerlandais](../nl/README.md) | [Estonien](../et/README.md) | [Finnois](../fi/README.md) | [Français](./README.md) | [Allemand](../de/README.md) | [Grec](../el/README.md) | [Hébreu](../he/README.md) | [Hindi](../hi/README.md) | [Hongrois](../hu/README.md) | [Indonésien](../id/README.md) | [Italien](../it/README.md) | [Japonais](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Coréen](../ko/README.md) | [Lituanien](../lt/README.md) | [Malais](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Népalais](../ne/README.md) | [Pidgin Nigérian](../pcm/README.md) | [Norvégien](../no/README.md) | [Persan (Farsi)](../fa/README.md) | [Polonais](../pl/README.md) | [Portugais (Brésil)](../pt-BR/README.md) | [Portugais (Portugal)](../pt-PT/README.md) | [Pendjabi (Gurmukhi)](../pa/README.md) | [Roumain](../ro/README.md) | [Russe](../ru/README.md) | [Serbe (Cyrillique)](../sr/README.md) | [Slovaque](../sk/README.md) | [Slovène](../sl/README.md) | [Espagnol](../es/README.md) | [Swahili](../sw/README.md) | [Suédois](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamoul](../ta/README.md) | [Télougou](../te/README.md) | [Thaï](../th/README.md) | [Turc](../tr/README.md) | [Ukrainien](../uk/README.md) | [Ourdou](../ur/README.md) | [Vietnamien](../vi/README.md)

> **Préférez Cloner Localement ?**
>
> Ce dépôt inclut plus de 50 traductions de langues ce qui augmente significativement la taille du téléchargement. Pour cloner sans les traductions, utilisez le sparse checkout :
>
> **Bash / macOS / Linux :**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows) :**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Cela vous donne tout ce dont vous avez besoin pour compléter le cours avec un téléchargement beaucoup plus rapide.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Quoi de Neuf dans azd Aujourd'hui

> 📌 Ce cours est validé avec **`azd 1.27.1`** (Juillet 2026). Exécutez `azd version` pour vérifier votre version, et `azd upgrade` pour obtenir la dernière.

Azure Developer CLI a dépassé les applications web traditionnelles et les API. Aujourd'hui, azd est l’outil unique pour déployer **toute** application sur Azure — y compris les applications alimentées par l'IA et les agents intelligents.

Voici ce que cela signifie pour vous :

- **Les agents IA sont désormais des charges de travail azd de première classe.** Vous pouvez initialiser, déployer et gérer des projets d’agents IA avec le même flux `azd init` → `azd up` que vous connaissez déjà.
- **Un cycle de vie complet des agents depuis la CLI.** L'extension `azure.ai.agents` couvre désormais tout le parcours — `azd ai agent init` pour générer la structure, `azd ai agent invoke` pour tester (avec sortie du temps de réponse), `azd ai agent eval generate` et `azd ai agent optimize` pour mesurer et améliorer la qualité, et `azd ai agent delete` pour nettoyer.
- **Plus de blocs de construction IA.** Les nouvelles extensions en aperçu — `azure.ai.skills` et `azure.ai.connections` — vous permettent de gérer directement avec azd les compétences d’agents réutilisables et les connexions Foundry.
- **Intégration Microsoft Foundry** apporte le déploiement de modèles, l'hébergement d’agents, et la configuration des services IA directement dans l’écosystème des templates azd.
- **Les bases du quotidien plus fluides.** Les dernières versions ont rendu `azd init` idempotent (sécurisé à relancer), ont fait en sorte que `azd auth login` nettoie automatiquement les jetons périmés, et ont ajouté une invite d’installation conviviale lors du premier lancement de `azd tool`.
- **Le flux de travail principal n’a pas changé.** Que vous déployiez une application todo, un microservice ou une solution IA multi-agent, les commandes sont les mêmes.

> **Note pour les utilisateurs Aspire :** Microsoft désigne désormais le produit simplement comme **Aspire** (anciennement ".NET Aspire"). Le support Aspire dans azd reste identique — seul le nom a été mis à jour.

Si vous avez utilisé azd auparavant, le support IA est une extension naturelle — pas un outil séparé ni une piste avancée. Si vous commencez, vous apprendrez un seul flux de travail qui fonctionne pour tout.

---

## 🚀 Qu'est-ce que Azure Developer CLI (azd) ?

**Azure Developer CLI (azd)** est un outil en ligne de commande convivial pour les développeurs qui facilite le déploiement d’applications sur Azure. Au lieu de créer et connecter manuellement dizaines de ressources Azure, vous pouvez déployer des applications complètes avec une seule commande.

### La Magie de `azd up`

```bash
# Cette seule commande fait tout :
# ✅ Crée toutes les ressources Azure
# ✅ Configure le réseau et la sécurité
# ✅ Compile votre code d'application
# ✅ Déploie sur Azure
# ✅ Vous fournit une URL fonctionnelle
azd up
```

**Voilà !** Pas besoin de cliquer dans le portail Azure, ni d'apprendre des templates ARM complexes, ni de configurer manuellement - juste des applications fonctionnelles sur Azure.

---

## ❓ Azure Developer CLI vs Azure CLI : Quelle est la Différence ?

C’est la question la plus fréquente chez les débutants. Voici la réponse simple :

| Fonctionnalité | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Objectif** | Gérer des ressources Azure individuelles | Déployer des applications complètes |
| **Mentalité** | Axée sur l’infrastructure | Axée sur l’application |
| **Exemple** | `az webapp create --name myapp...` | `azd up` |
| **Courbe d’apprentissage** | Doit connaître les services Azure | Connaître votre application |
| **Idéal pour** | DevOps, Infrastructure | Développeurs, Prototypage |

### Analogie Simple

- **Azure CLI** c’est comme avoir tous les outils pour construire une maison — marteaux, scies, clous. Vous pouvez construire tout ce que vous voulez, mais vous devez connaître la construction.
- **Azure Developer CLI** c’est comme engager un entrepreneur — vous décrivez ce que vous voulez, et il s'occupe de la construction.

### Quand Utiliser Chacun

| Scénario | Utiliser Ceci |
|----------|----------|
| "Je veux déployer rapidement mon application web" | `azd up` |
| "J’ai besoin de créer uniquement un compte de stockage" | `az storage account create` |
| "Je construis une application IA complète" | `azd init --template azure-search-openai-demo` |
| "Je dois déboguer une ressource Azure spécifique" | `az resource show` |
| "Je veux un déploiement prêt pour la production en quelques minutes" | `azd up --environment production` |

### Ils Fonctionnent Ensemble !

AZD utilise Azure CLI sous le capot. Vous pouvez utiliser les deux :
```bash
# Déployez votre application avec AZD
azd up

# Puis ajustez finement des ressources spécifiques avec Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Trouvez des Templates dans Awesome AZD

Ne commencez pas de zéro ! **Awesome AZD** est la collection communautaire de templates prêts à déployer :

| Ressource | Description |
|----------|-------------|
| 🔗 [**Galerie Awesome AZD**](https://azure.github.io/awesome-azd/) | Parcourez plus de 200 templates avec déploiement en un clic |
| 🔗 [**Soumettre un Template**](https://github.com/Azure/awesome-azd/issues) | Contribuez votre propre template à la communauté |
| 🔗 [**Dépôt GitHub**](https://github.com/Azure/awesome-azd) | Étoilez et explorez la source |

### Templates IA Populaires d’Awesome AZD

```bash
# Chat RAG avec les modèles Microsoft Foundry + Recherche IA
azd init --template azure-search-openai-demo

# Application de chat IA rapide
azd init --template openai-chat-app-quickstart

# Agents IA avec agents Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Commencer en 3 Étapes

Avant de commencer, assurez-vous que votre machine est prête pour le template que vous voulez déployer :

**Windows :**
```powershell
.\validate-setup.ps1
```

**macOS / Linux :**
```bash
bash ./validate-setup.sh
```

Si un contrôle requis échoue, corrigez-le d'abord puis continuez avec le démarrage rapide.

### Étape 1 : Installer AZD (2 minutes)

**Windows :**
```powershell
winget install microsoft.azd
```

**macOS :**
```bash
brew tap azure/azd && brew install azd
```

**Linux :**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Étape 2 : Authentifiez-vous pour AZD

```bash
# Facultatif si vous prévoyez d'utiliser directement les commandes Azure CLI dans ce cours
az login

# Requis pour les flux de travail AZD
azd auth login
```

Si vous ne savez pas laquelle choisir, suivez le flux complet d’installation dans [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Étape 3 : Déployez Votre Première Application

```bash
# Initialiser à partir d'un modèle
azd init --template todo-nodejs-mongo

# Déployer sur Azure (crée tout !)
azd up
```

**🎉 Voilà !** Votre application est maintenant en ligne sur Azure.

### Nettoyage (N’oubliez Pas !)

```bash
# Supprimez toutes les ressources une fois les expérimentations terminées
azd down --force --purge
```

---

## 📚 Comment Utiliser Ce Cours

Ce cours est conçu pour un **apprentissage progressif** - commencez où vous êtes à l’aise et progressez à votre rythme :

| Votre Expérience | Commencez Ici |
|-----------------|------------|
| **Nouveau sur Azure** | [Chapitre 1 : Fondations](#-chapter-1-foundation--quick-start) |
| **Connaît Azure, nouveau sur AZD** | [Chapitre 1 : Fondations](#-chapter-1-foundation--quick-start) |
| **Voulez déployer des applications IA** | [Chapitre 2 : Développement AI-First](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Souhaitez une pratique interactive** | [🎓 Atelier Interactif](workshop/README.md) - 3-4 heures de laboratoire guidé |
| **Besoin de modèles prêts pour la production** | [Chapitre 8 : Production & Entreprise](#-chapter-8-production--enterprise-patterns) |

### Mise en Place Rapide

1. **Forkez ce dépôt** : [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonez-le** : `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtenez de l’aide** : [Communauté Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Préférez Cloner Localement ?**

> Ce dépôt inclut plus de 50 traductions de langues ce qui augmente significativement la taille du téléchargement. Pour cloner sans les traductions, utilisez le sparse checkout :
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Cela vous donne tout ce dont vous avez besoin pour compléter le cours avec un téléchargement beaucoup plus rapide.


## Aperçu du Cours

Maîtrisez Azure Developer CLI (azd) à travers des chapitres structurés conçus pour un apprentissage progressif. **Focus spécial sur le déploiement d’applications IA avec l’intégration Microsoft Foundry.**


### Pourquoi ce cours est essentiel pour les développeurs modernes

D'après les informations de la communauté Microsoft Foundry Discord, **45 % des développeurs souhaitent utiliser AZD pour les charges de travail d'IA** mais rencontrent des difficultés avec :
- Architectures d'IA complexes multi-services
- Meilleures pratiques de déploiement d'IA en production  
- Intégration et configuration des services Azure AI
- Optimisation des coûts pour les charges de travail d'IA
- Résolution des problèmes spécifiques aux déploiements d'IA

### Objectifs d’apprentissage

En suivant ce cours structuré, vous allez :
- **Maîtriser les fondamentaux d'AZD** : Concepts de base, installation et configuration
- **Déployer des applications IA** : Utiliser AZD avec les services Microsoft Foundry
- **Implémenter l'Infrastructure as Code** : Gérer les ressources Azure avec des templates Bicep
- **Résoudre les problèmes de déploiement** : Corriger les erreurs courantes et déboguer
- **Optimiser pour la production** : Sécurité, mise à l'échelle, surveillance et gestion des coûts
- **Construire des solutions multi-agents** : Déployer des architectures IA complexes

## Avant de commencer : Comptes, accès et hypothèses

Avant de commencer le Chapitre 1, assurez-vous d’avoir mis en place les éléments suivants. Les étapes d'installation plus loin dans ce guide supposent que ces bases sont déjà prises en compte.

- **Un abonnement Azure** : Vous pouvez utiliser un abonnement existant de votre travail ou personnel, ou créer un [essai gratuit](https://aka.ms/azurefreetrial) pour commencer.
- **Permission de créer des ressources Azure** : Pour la plupart des exercices, vous devez avoir au moins les droits de **Contributeur** sur l'abonnement ou le groupe de ressources cible. Certains chapitres peuvent également supposer que vous pouvez créer des groupes de ressources, des identités managées et des assignations RBAC.
- [**Un compte GitHub**](https://github.com) : Utile pour forker le dépôt, suivre vos propres modifications et utiliser GitHub Codespaces pour l'atelier.
- **Prérequis d'exécution des templates** : Certains templates nécessitent des outils locaux comme Node.js, Python, Java ou Docker. Lancez le validateur d'installation avant de commencer pour détecter rapidement l'absence d'outils.
- **Familiarité de base avec le terminal** : Pas besoin d’être expert, mais vous devez être à l'aise pour exécuter des commandes comme `git clone`, `azd auth login`, et `azd up`.

> **Vous travaillez dans un abonnement d’entreprise ?**
> Si votre environnement Azure est géré par un administrateur, confirmez à l'avance que vous pouvez déployer des ressources dans l'abonnement ou le groupe de ressources que vous souhaitez utiliser. Sinon, demandez un abonnement bac à sable ou un accès Contributeur avant de commencer.

> **Nouveau sur Azure ?**
> Commencez avec votre propre abonnement d’essai Azure ou payez à l’utilisation sur https://aka.ms/azurefreetrial pour réaliser les exercices de bout en bout sans attendre les approbations au niveau locataire.

## 🗺️ Plan du cours : Navigation rapide par chapitre

Chaque chapitre dispose d’un README dédié avec objectifs d’apprentissage, démarrages rapides et exercices :

| Chapitre | Sujet | Leçons | Durée | Complexité |
|---------|-------|---------|----------|------------|
| **[Ch 1 : Fondations](docs/chapter-01-foundation/README.md)** | Premiers pas | [Bases AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Premier projet](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2 : Développement IA](docs/chapter-02-ai-development/README.md)** | Applications IA First | [Intégration Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agents IA](docs/chapter-02-ai-development/agents.md) &#124; [Déploiement modèle IA](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Atelier](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 h | ⭐⭐ |
| **[Ch 3 : Configuration](docs/chapter-03-configuration/README.md)** | Authentification & Sécurité | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Sécurité](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4 : Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Déploiement | [Guide de déploiement](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 h | ⭐⭐⭐ |
| **[Ch 5 : Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Solutions agents IA | [Scénario retail](examples/retail-scenario.md) &#124; [Patterns de coordination](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 h | ⭐⭐⭐⭐ |
| **[Ch 6 : Pré-déploiement](docs/chapter-06-pre-deployment/README.md)** | Planification & Validation | [Vérifications préalables](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planification capacité](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Choix SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 h | ⭐⭐ |
| **[Ch 7 : Dépannage](docs/chapter-07-troubleshooting/README.md)** | Débogage & Correction | [Problèmes courants](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Débogage](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problèmes IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 h | ⭐⭐ |
| **[Ch 8 : Production](docs/chapter-08-production/README.md)** | Patterns d’entreprise | [Pratiques production](docs/chapter-08-production/production-ai-practices.md) | 2-3 h | ⭐⭐⭐⭐ |
| **[🎓 Atelier](workshop/README.md)** | Laboratoire pratique | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Sélection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Déconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personnalisation](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Démantèlement](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Conclusion](workshop/docs/instructions/7-Wrap-up.md) | 3-4 h | ⭐⭐ |

**Durée totale du cours :** ~10-14 heures | **Progression des compétences :** Débutant → Prêt pour la production

---

## 📚 Chapitres d’apprentissage

*Sélectionnez votre parcours d’apprentissage selon votre niveau d’expérience et vos objectifs*

### 🚀 Chapitre 1 : Fondations & Démarrage rapide
**Prérequis** : abonnement Azure, connaissances de base en ligne de commande  
**Durée** : 30-45 minutes  
**Complexité** : ⭐

#### Ce que vous apprendrez
- Comprendre les fondamentaux d'Azure Developer CLI
- Installer AZD sur votre plateforme
- Votre premier déploiement réussi

#### Ressources d’apprentissage
- **🎯 Commencez ici** : [Qu’est-ce qu’Azure Developer CLI ?](#what-is-azure-developer-cli)
- **📖 Théorie** : [Bases AZD](docs/chapter-01-foundation/azd-basics.md) - Concepts et terminologie clés
- **⚙️ Installation** : [Installation & configuration](docs/chapter-01-foundation/installation.md) - Guides spécifiques à la plateforme
- **🛠️ Pratique** : [Votre premier projet](docs/chapter-01-foundation/first-project.md) - Tutoriel étape par étape
- **📋 Référence rapide** : [Fiche de commandes](resources/cheat-sheet.md)

#### Exercices pratiques
```bash
# Vérification rapide de l'installation
azd version

# Déployez votre première application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Résultat du chapitre** : Déployer avec succès une application web simple sur Azure en utilisant AZD

**✅ Validation de réussite :**
```bash
# Après avoir terminé le chapitre 1, vous devriez être capable de :
azd version              # Affiche la version installée
azd init --template todo-nodejs-mongo  # Initialise le projet
azd up                  # Déploie sur Azure
azd show                # Affiche l'URL de l'application en cours d'exécution
# L'application s'ouvre dans le navigateur et fonctionne
azd down --force --purge  # Nettoie les ressources
```

**📊 Temps estimé :** 30-45 minutes  
**📈 Niveau de compétence à la fin :** Peut déployer des applications basiques de façon autonome
**📈 Niveau de compétence à la fin :** Peut déployer des applications basiques de façon autonome

---

### 🤖 Chapitre 2 : Développement IA First (recommandé pour les développeurs IA)
**Prérequis** : Chapitre 1 terminé  
**Durée** : 1-2 heures  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Intégration Microsoft Foundry avec AZD
- Déploiement d’applications alimentées par IA
- Compréhension des configurations de services IA

#### Ressources d’apprentissage
- **🎯 Commencez ici** : [Intégration Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Agents IA** : [Guide des agents IA](docs/chapter-02-ai-development/agents.md) - Déployer des agents intelligents avec AZD
- **📖 Patterns** : [Déploiement de modèles IA](docs/chapter-02-ai-development/ai-model-deployment.md) - Déployer et gérer des modèles IA
- **🛠️ Atelier** : [Atelier IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Préparer vos solutions IA pour AZD
- **🎥 Guide interactif** : [Matériel d’atelier](workshop/README.md) - Apprentissage en navigateur avec MkDocs * Environnement DevContainer
- **📋 Templates** : [Modèles Microsoft Foundry](#ressources-de-l’atelier)
- **📝 Exemples** : [Exemples de déploiement AZD](examples/README.md)

#### Exercices pratiques
```bash
# Déployez votre première application d'IA
azd init --template azure-search-openai-demo
azd up

# Essayez des modèles d’IA supplémentaires
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Résultat du chapitre** : Déployer et configurer une application de chat IA avec capacités RAG

**✅ Validation de réussite :**
```bash
# Après le chapitre 2, vous devriez être capable de :
azd init --template azure-search-openai-demo
azd up
# Tester l'interface de chat IA
# Poser des questions et obtenir des réponses alimentées par l'IA avec des sources
# Vérifier que l'intégration de la recherche fonctionne
azd monitor  # Vérifier que Application Insights affiche la télémétrie
azd down --force --purge
```

**📊 Temps estimé :** 1-2 heures  
**📈 Niveau de compétence à la fin :** Peut déployer et configurer des applications IA prêtes pour la production  
**💰 Sensibilisation aux coûts :** Comprendre les coûts de développement à 80-150 $/mois, production à 300-3500 $/mois

#### 💰 Considérations sur les coûts pour les déploiements IA

**Environnement de développement (estimé à 80-150 $/mois) :**
- Modèles Microsoft Foundry (paiement à l’utilisation) : 0-50 $/mois (selon l’usage des tokens)
- Recherche IA (niveau Basique) : 75 $/mois
- Applications Container (Consommation) : 0-20 $/mois
- Stockage (Standard) : 1-5 $/mois

**Environnement de production (estimé à 300-3 500+ $/mois) :**
- Modèles Microsoft Foundry (PTU pour performances constantes) : 3 000+ $/mois OU Paiement à l’usage avec volume élevé
- Recherche IA (niveau Standard) : 250 $/mois
- Applications Container (Dédié) : 50-100 $/mois
- Application Insights : 5-50 $/mois
- Stockage (Premium) : 10-50 $/mois

**💡 Conseils d’optimisation des coûts :**
- Utilisez les modèles Microsoft Foundry **Gratuit** pour l’apprentissage (Azure OpenAI inclut 50 000 tokens/mois)
- Exécutez `azd down` pour désallouer les ressources quand vous ne développez pas activement
- Commencez avec facturation à la consommation, passez à PTU uniquement en production
- Utilisez `azd provision --preview` pour estimer les coûts avant déploiement
- Activez l’auto-scaling : payez uniquement pour la consommation réelle

**Surveillance des coûts :**
```bash
# Vérifiez les coûts mensuels estimés
azd provision --preview

# Surveillez les coûts réels dans le portail Azure
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapitre 3 : Configuration & Authentification
**Prérequis** : Chapitre 1 terminé  
**Durée** : 45-60 minutes  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Configuration et gestion d’environnement
- Meilleures pratiques d’authentification et de sécurité
- Nommage et organisation des ressources

#### Ressources d’apprentissage
- **📖 Configuration** : [Guide de configuration](docs/chapter-03-configuration/configuration.md) - Mise en place de l’environnement
- **🔐 Sécurité** : [Patterns d’authentification et identité managée](docs/chapter-03-configuration/authsecurity.md) - Patterns d’authentification
- **📝 Exemples** : [Exemple d’application base de données](examples/database-app/README.md) - Exemples AZD pour bases de données

#### Exercices pratiques
- Configurer plusieurs environnements (dev, staging, prod)
- Mettre en place l’authentification avec identité managée
- Implémenter des configurations spécifiques à l’environnement

**💡 Résultat du chapitre** : Gérer plusieurs environnements avec authentification et sécurité appropriées

---

### 🏗️ Chapitre 4 : Infrastructure as Code & Déploiement
**Prérequis** : Chapitres 1-3 terminés  
**Durée** : 1-1,5 heures  
**Complexité** : ⭐⭐⭐

#### Ce que vous apprendrez
- Patterns avancés de déploiement
- Infrastructure as Code avec Bicep
- Stratégies de provisioning des ressources

#### Ressources d’apprentissage
- **📖 Déploiement** : [Guide de déploiement](docs/chapter-04-infrastructure/deployment-guide.md) - Flux de travail complets
- **🏗️ Provisioning** : [Provisioning des ressources](docs/chapter-04-infrastructure/provisioning.md) - Gestion des ressources Azure
- **📝 Exemples** : [Exemple Application Container](../../examples/container-app) - Déploiements conteneurisés

#### Exercices pratiques
- Créer des templates Bicep personnalisés
- Déployer des applications multi-services
- Implémenter des stratégies de déploiement blue-green

**💡 Résultat du chapitre** : Déployer des applications multi-services complexes en utilisant des templates d'infrastructure personnalisés

---


### 🎯 Chapitre 5 : Solutions IA Multi-Agents (Avancé)
**Prérequis** : Chapitres 1-2 terminés  
**Durée** : 2-3 heures  
**Complexité** : ⭐⭐⭐⭐

#### Ce que vous apprendrez
- Modèles d’architecture multi-agent
- Orchestration et coordination des agents
- Déploiements IA prêts pour la production

#### Ressources d’apprentissage
- **🤖 Projet à la une** : [Solution Multi-Agent Retail](examples/retail-scenario.md) - Implémentation complète
- **🛠️ Templates ARM** : [Package Template ARM](../../examples/retail-multiagent-arm-template) - Déploiement en un clic
- **📖 Architecture** : [Modèles de coordination multi-agent](docs/chapter-06-pre-deployment/coordination-patterns.md) - Modèles

#### Exercices pratiques
```bash
# Déployer la solution complète multi-agent de vente au détail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorer les configurations des agents
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Résultat du chapitre** : Déployer et gérer une solution IA multi-agent prête pour la production avec des agents Client et Inventaire

---

### 🔍 Chapitre 6 : Validation & Planification Avant Déploiement
**Prérequis** : Chapitre 4 terminé  
**Durée** : 1 heure  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Planification de capacité et validation de ressources
- Stratégies de sélection de SKU
- Vérifications préalables et automatisation

#### Ressources d’apprentissage
- **📊 Planification** : [Planification de capacité](docs/chapter-06-pre-deployment/capacity-planning.md) - Validation des ressources
- **💰 Sélection** : [Sélection SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Choix rentables
- **✅ Validation** : [Vérifications préalables](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatisés

#### Exercices pratiques
- Exécuter des scripts de validation de capacité
- Optimiser les sélections SKU pour le coût
- Mettre en place des vérifications automatisées avant déploiement

**💡 Résultat du chapitre** : Valider et optimiser les déploiements avant exécution

---

### 🚨 Chapitre 7 : Dépannage & Débogage
**Prérequis** : N’importe quel chapitre de déploiement terminé  
**Durée** : 1-1,5 heure  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Approches systématiques de débogage
- Problèmes courants et solutions
- Dépannage spécifique à l’IA

#### Ressources d’apprentissage
- **🔧 Problèmes Courants** : [Problèmes courants](docs/chapter-07-troubleshooting/common-issues.md) - FAQ et solutions
- **🕵️ Débogage** : [Guide de débogage](docs/chapter-07-troubleshooting/debugging.md) - Stratégies pas à pas
- **🤖 Problèmes IA** : [Dépannage spécifique à l’IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problèmes des services IA

#### Exercices pratiques
- Diagnostiquer les échecs de déploiement
- Résoudre les problèmes d’authentification
- Déboguer la connectivité des services IA

**💡 Résultat du chapitre** : Diagnostiquer et résoudre de manière autonome les problèmes courants de déploiement

---

### 🏢 Chapitre 8 : Modèles de Production & Entreprise
**Prérequis** : Chapitres 1-4 terminés  
**Durée** : 2-3 heures  
**Complexité** : ⭐⭐⭐⭐

#### Ce que vous apprendrez
- Stratégies de déploiement en production
- Modèles de sécurité d’entreprise
- Surveillance et optimisation des coûts

#### Ressources d’apprentissage
- **🏭 Production** : [Bonnes pratiques AI en production](docs/chapter-08-production/production-ai-practices.md) - Modèles d’entreprise
- **📝 Exemples** : [Exemple Microservices](../../examples/microservices) - Architectures complexes
- **📊 Surveillance** : [Intégration Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Surveillance

#### Exercices pratiques
- Mettre en œuvre des modèles de sécurité d’entreprise
- Mettre en place une surveillance complète
- Déployer en production avec gouvernance appropriée

**💡 Résultat du chapitre** : Déployer des applications prêtes pour l’entreprise avec toutes les capacités de production

---

## 🎓 Aperçu de l’atelier : Expérience d’apprentissage pratique

> **⚠️ STATUT DE L’ATELIER : Développement Actif**  
> Les matériels de l’atelier sont en cours de développement et d’affinage. Les modules principaux sont fonctionnels, mais certaines sections avancées sont incomplètes. Nous travaillons activement à terminer tout le contenu. [Suivre les progrès →](workshop/README.md)

### Matériels interactifs de l’atelier
**Apprentissage pratique complet avec outils basés sur navigateur et exercices guidés**

Nos matériels d’atelier offrent une expérience d’apprentissage interactive et structurée qui complète le programme par chapitres ci-dessus. L’atelier est conçu pour un apprentissage autonome ou dirigé par un instructeur.

#### 🛠️ Fonctionnalités de l’atelier
- **Interface basée sur navigateur** : Atelier complet propulsé par MkDocs avec recherche, copie et thèmes
- **Intégration GitHub Codespaces** : Configuration de l’environnement de développement en un clic
- **Parcours d’apprentissage structuré** : 8 modules d’exercices guidés (3-4 heures au total)
- **Méthodologie progressive** : Introduction → Sélection → Validation → Déconstruction → Configuration → Personnalisation → Nettoyage → Conclusion
- **Environnement DevContainer interactif** : Outils et dépendances pré-configurés

#### 📚 Structure des modules de l’atelier
L’atelier suit une **méthodologie progressive sur 8 modules** qui vous mène de la découverte à la maîtrise du déploiement :

| Module | Sujet | Ce que vous ferez | Durée |
|--------|-------|----------------|----------|
| **0. Introduction** | Aperçu de l’atelier | Comprendre les objectifs d’apprentissage, les prérequis et la structure de l’atelier | 15 min |
| **1. Sélection** | Découverte de templates | Explorer les templates AZD et choisir le bon template IA pour votre scénario | 20 min |
| **2. Validation** | Déployer & Vérifier | Déployer le template avec `azd up` et valider que l’infrastructure fonctionne | 30 min |
| **3. Déconstruction** | Comprendre la structure | Utiliser GitHub Copilot pour explorer l’architecture, les fichiers Bicep et l’organisation du code | 30 min |
| **4. Configuration** | Analyse approfondie de azure.yaml | Maîtriser la configuration `azure.yaml`, les hooks du cycle de vie et les variables d’environnement | 30 min |
| **5. Personnalisation** | Rendez-le vôtre | Activer la recherche IA, le traçage, l’évaluation et personnaliser pour votre scénario | 45 min |
| **6. Nettoyage** | Nettoyer | Déprovisionner en toute sécurité les ressources avec `azd down --purge` | 15 min |
| **7. Conclusion** | Étapes suivantes | Revoir les acquis, concepts clés et continuer votre parcours d’apprentissage | 15 min |

**Déroulement de l’atelier :**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Démarrage de l’atelier
```bash
# Option 1 : GitHub Codespaces (Recommandé)
# Cliquez sur "Code" → "Créer un codespace sur main" dans le dépôt

# Option 2 : Développement local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Suivez les instructions d'installation dans workshop/README.md
```

#### 🎯 Résultats d’apprentissage de l’atelier
En complétant l’atelier, les participants :
- **Déploieront des applications IA en production** : Utiliser AZD avec les services Microsoft Foundry
- **Maîtriseront les architectures multi-agents** : Implémenter des solutions IA coordonnées
- **Mettront en œuvre les meilleures pratiques de sécurité** : Configurer l’authentification et le contrôle d’accès
- **Optimiseront pour l’échelle** : Concevoir des déploiements performants et économiques
- **Dépanneront les déploiements** : Résoudre de manière autonome les problèmes courants

#### 📖 Ressources de l’atelier
- **🎥 Guide interactif** : [Matériels de l’atelier](workshop/README.md) - Environnement d’apprentissage basé sur navigateur
- **📋 Instructions module par module** :
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Aperçu et objectifs de l’atelier
  - [1. Sélection](workshop/docs/instructions/1-Select-AI-Template.md) - Trouver et sélectionner des templates IA
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Déployer et vérifier les templates
  - [3. Déconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorer l’architecture du template
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Maîtriser azure.yaml
  - [5. Personnalisation](workshop/docs/instructions/5-Customize-AI-Template.md) - Personnaliser pour votre scénario
  - [6. Nettoyage](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Nettoyer les ressources
  - [7. Conclusion](workshop/docs/instructions/7-Wrap-up.md) - Revue et étapes suivantes
- **🛠️ Laboratoire Atelier IA** : [Laboratoire Atelier IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exercices centrés IA
- **💡 Démarrage rapide** : [Guide d’installation de l’atelier](workshop/README.md#quick-start) - Configuration de l’environnement

**Parfait pour** : Formation en entreprise, cours universitaires, apprentissage autonome et bootcamps développeurs.

---

## 📖 Approfondissement : Capacités AZD

Au-delà des bases, AZD fournit des fonctionnalités puissantes pour les déploiements en production :

- **Déploiements basés sur template** - Utilisation de templates préconstruits pour les modèles d’applications courants
- **Infrastructure en tant que Code** - Gestion des ressources Azure avec Bicep ou Terraform  
- **Workflows intégrés** - Provisionnement, déploiement et surveillance des applications de façon fluide
- **Convivial pour les développeurs** - Optimisé pour la productivité et l’expérience développeur

### **AZD + Microsoft Foundry : Parfait pour les déploiements IA**

**Pourquoi AZD pour les solutions IA ?** AZD répond aux principaux défis des développeurs IA :

- **Templates prêts pour l’IA** - Templates préconfigurés pour Microsoft Foundry Models, services Azure IA et charges ML
- **Déploiements IA sécurisés** - Modèles de sécurité intégrés pour services IA, clés API et points de terminaison de modèles  
- **Modèles IA en production** - Bonnes pratiques pour des déploiements IA évolutifs et économes
- **Workflows IA de bout en bout** - Du développement de modèle au déploiement avec surveillance adaptée
- **Optimisation des coûts** - Allocation intelligente des ressources et stratégies de montée en charge pour charges IA
- **Intégration Microsoft Foundry** - Connexion fluide au catalogue et points de terminaison Microsoft Foundry

---

## 🎯 Bibliothèque de Templates & Exemples

### À la une : Templates Microsoft Foundry
**Commencez ici si vous déployez des applications IA !**

> **Note :** Ces templates démontrent divers modèles IA. Certains sont des exemples Azure externes, d’autres des implémentations locales.

| Template | Chapitre | Complexité | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapitre 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externe |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapitre 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Externe |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapitre 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Externe |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapitre 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externe |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapitre 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externe |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapitre 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externe |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapitre 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### À la une : Scénarios d’apprentissage complets
**Templates d’applications prêtes pour la production mappés aux chapitres d’apprentissage**

| Template | Chapitre d’apprentissage | Complexité | Apprentissage clé |
|----------|--------------------------|------------|--------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapitre 2 | ⭐ | Modèles de déploiement IA de base |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapitre 2 | ⭐⭐ | Implémentation RAG avec Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapitre 4 | ⭐⭐ | Intégration Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapitre 5 | ⭐⭐⭐ | Framework agent et appel de fonction |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapitre 8 | ⭐⭐⭐ | Orchestration IA d’entreprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapitre 5 | ⭐⭐⭐⭐ | Architecture multi-agent avec agents Client et Inventaire |

### Apprendre par type d’exemple

> **📌 Exemples locaux vs externes :**  
> **Exemples locaux** (dans ce dépôt) = Prêts à l’emploi immédiat  
> **Exemples externes** (Exemples Azure) = Cloner depuis les repos liés

#### Exemples locaux (Prêts à l’emploi)
- [**Solution Multi-Agent Retail**](examples/retail-scenario.md) - Implémentation complète prête pour la production avec templates ARM
  - Architecture multi-agent (agents Client + Inventaire)
  - Surveillance et évaluation complètes
  - Déploiement en un clic via template ARM

#### Exemples locaux - Applications conteneurisées (Chapitres 2-5)
**Exemples complets de déploiement de conteneurs dans ce dépôt :**

- [**Exemples d'Applications Conteneurisées**](examples/container-app/README.md) - Guide complet des déploiements conteneurisés
  - [API Flask Simple](../../examples/container-app/simple-flask-api) - API REST basique avec mise à l'échelle à zéro
  - [Architecture Microservices](../../examples/container-app/microservices) - Déploiement multiproduit prêt pour la production
  - Démarrage rapide, production, et modèles de déploiement avancés
  - Conseils de surveillance, sécurité, et optimisation des coûts

#### Exemples Externes - Applications Simples (Chapitres 1-2)
**Clonez ces dépôts Azure Samples pour commencer :**
- [Application Web Simple - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Modèles de déploiement basiques
- [Site Web Statique - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Déploiement de contenu statique
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Déploiement d'API REST

#### Exemples Externes - Intégration Base de Données (Chapitres 3-4)  
- [Application Base de Données - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Modèles de connectivité base de données
- [Fonctions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Flux de données serverless

#### Exemples Externes - Modèles Avancés (Chapitres 4-8)
- [Microservices Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architectures multi-services
- [Jobs Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Traitement en arrière-plan  
- [Pipeline ML Enterprise](https://github.com/Azure-Samples/mlops-v2) - Modèles ML prêts pour la production

### Collections de Templates Externes
- [**Galerie Officielle des Templates AZD**](https://azure.github.io/awesome-azd/) - Collection sélectionnée de templates officiels et communautaires
- [**Templates Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentation de templates Microsoft Learn
- [**Répertoire d'Exemples**](examples/README.md) - Exemples locaux d’apprentissage avec explications détaillées

---

## 📚 Ressources d'Apprentissage & Références

### Références Rapides
- [**Fiche Mémo Commandes**](resources/cheat-sheet.md) - Commandes azd essentielles organisées par chapitre
- [**Glossaire**](resources/glossary.md) - Terminologie Azure et azd  
- [**FAQ**](resources/faq.md) - Questions fréquentes organisées par chapitre d’apprentissage
- [**Guide d’Étude**](resources/study-guide.md) - Exercices pratiques complets

### Ateliers Pratiques
- [**Atelier IA**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendez vos solutions IA déployables avec AZD (2-3 heures)
- [**Atelier Interactif**](workshop/README.md) - Exercices guidés en 8 modules avec MkDocs et GitHub Codespaces
  - Suit : Introduction → Sélection → Validation → Déconstruction → Configuration → Personnalisation → Démantèlement → Conclusion

### Ressources d'Apprentissage Externes
- [Documentation Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Centre d'Architecture Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculateur de Prix Azure](https://azure.microsoft.com/pricing/calculator/)
- [Statut Azure](https://status.azure.com/)

### Compétences AI Agent pour Votre Éditeur
- [**Compétences Microsoft Azure sur skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 compétences d’agents ouverts pour Azure AI, Foundry, déploiement, diagnostics, optimisation des coûts, et plus encore. Installez-les dans GitHub Copilot, Cursor, Claude Code, ou tout agent supporté :
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guide Rapide de Dépannage

**Problèmes courants rencontrés par les débutants et solutions immédiates :**

<details>
<summary><strong>❌ "azd : commande introuvable"</strong></summary>

```bash
# Installer d'abord AZD
# Windows (PowerShell) :
winget install microsoft.azd

# macOS :
brew tap azure/azd && brew install azd

# Linux :
curl -fsSL https://aka.ms/install-azd.sh | bash

# Vérifier l'installation
azd version
```
</details>

<details>
<summary><strong>❌ "Aucun abonnement trouvé" ou "Abonnement non défini"</strong></summary>

```bash
# Lister les abonnements disponibles
az account list --output table

# Définir l'abonnement par défaut
az account set --subscription "<subscription-id-or-name>"

# Configurer pour l'environnement AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Vérifier
az account show
```
</details>

<details>
<summary><strong>❌ "Quota insuffisant" ou "Quota dépassé"</strong></summary>

```bash
# Essayez une autre région Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ou utilisez des SKU plus petits en développement
# Modifiez infra/main.parameters.json :
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" échoue à mi-chemin</strong></summary>

```bash
# Option 1 : Nettoyer et réessayer
azd down --force --purge
azd up

# Option 2 : Réparer seulement l'infrastructure
azd provision

# Option 3 : Vérifier le statut détaillé
azd show

# Option 4 : Vérifier les logs dans Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Échec d'authentification" ou "Jeton expiré"</strong></summary>

```bash
# Ré-authentifiez-vous pour AZD
azd auth logout
azd auth login

# Optionnel : actualisez également Azure CLI si vous exécutez des commandes az
az logout
az login

# Vérifiez l'authentification
az account show
```
</details>

<details>
<summary><strong>❌ "La ressource existe déjà" ou conflits de nommage</strong></summary>

```bash
# AZD génère des noms uniques, mais en cas de conflit :
azd down --force --purge

# Ensuite, réessayez avec un nouvel environnement
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Déploiement du modèle trop long</strong></summary>

**Temps d'attente normaux :**
- Application web simple : 5-10 minutes
- Application avec base de données : 10-15 minutes
- Applications IA : 15-25 minutes (le provisionnement OpenAI est lent)

```bash
# Vérifier la progression
azd show

# Si bloqué >30 minutes, vérifier le portail Azure :
azd monitor --overview
# Rechercher les déploiements échoués
```
</details>

<details>
<summary><strong>❌ "Permission refusée" ou "Interdit"</strong></summary>

```bash
# Vérifiez votre rôle Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Vous avez besoin d'au moins le rôle "Contributeur"
# Demandez à votre administrateur Azure de vous accorder :
# - Contributeur (pour les ressources)
# - Administrateur d'accès utilisateur (pour les affectations de rôle)
```
</details>

<details>
<summary><strong>❌ Impossible de trouver l'URL de l'application déployée</strong></summary>

```bash
# Afficher tous les points de terminaison de service
azd show

# Ou ouvrir le portail Azure
azd monitor

# Vérifier un service spécifique
azd env get-values
# Rechercher les variables *_URL
```
</details>

### 📚 Ressources Complètes de Dépannage

- **Guide des Problèmes Courants :** [Solutions détaillées](docs/chapter-07-troubleshooting/common-issues.md)
- **Problèmes Spécifiques à l'IA :** [Dépannage IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guide de Debugging :** [Débogage pas à pas](docs/chapter-07-troubleshooting/debugging.md)
- **Obtenir de l'aide :** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Complétion du Cours & Certification

### Suivi de Progression
Suivez votre progression d’apprentissage à travers chaque chapitre :

- [ ] **Chapitre 1** : Fondations & Démarrage Rapide ✅
- [ ] **Chapitre 2** : Développement Axé IA ✅  
- [ ] **Chapitre 3** : Configuration & Authentification ✅
- [ ] **Chapitre 4** : Infrastructure as Code & Déploiement ✅
- [ ] **Chapitre 5** : Solutions IA Multi-Agent ✅
- [ ] **Chapitre 6** : Validation & Planification Pré-Déploiement ✅
- [ ] **Chapitre 7** : Dépannage & Debugging ✅
- [ ] **Chapitre 8** : Modèles en Production & Enterprise ✅

### Vérification de l'Apprentissage
Après avoir terminé chaque chapitre, vérifiez vos connaissances en :
1. **Exercice Pratique** : Complétez le déploiement pratique du chapitre
2. **Contrôle des Connaissances** : Consultez la section FAQ pour votre chapitre
3. **Discussion Communautaire** : Partagez votre expérience sur Discord Azure
4. **Chapitre Suivant** : Passez au niveau de complexité suivant

### Avantages de la Complétion du Cours
Une fois tous les chapitres terminés, vous aurez :
- **Expérience en Production** : Déployé des applications IA réelles sur Azure
- **Compétences Professionnelles** : Capacités de déploiement prêtes pour l’entreprise  
- **Reconnaissance Communautaire** : Membre actif de la communauté des développeurs Azure
- **Avancement de Carrière** : Expertise recherchée en déploiement AZD et IA

---

## 🤝 Communauté & Support

### Obtenir de l'Aide & du Support
- **Problèmes Techniques** : [Signaler des bugs et demander des fonctionnalités](https://github.com/microsoft/azd-for-beginners/issues)
- **Questions d'Apprentissage** : [Communauté Microsoft Azure Discord](https://discord.gg/microsoft-azure) et [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Aide Spécifique IA** : Rejoignez le [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation** : [Documentation officielle Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Perspectives de la Communauté sur Microsoft Foundry Discord

**Résultats récents du sondage sur le canal #Azure :**
- **45%** des développeurs veulent utiliser AZD pour les charges de travail IA
- **Principaux défis** : Déploiements multi-services, gestion des identifiants, préparation à la production  
- **Les plus demandés** : Templates spécifiques IA, guides de dépannage, bonnes pratiques

**Rejoignez notre communauté pour :**
- Partager vos expériences AZD + IA et obtenir de l'aide
- Accéder aux avant-premières des nouveaux templates IA
- Contribuer aux meilleures pratiques de déploiement IA
- Influencer le développement futur des fonctionnalités IA + AZD

### Contribution au Cours
Nous accueillons les contributions ! Veuillez lire notre [Guide de Contribution](CONTRIBUTING.md) pour les détails sur :
- **Améliorations de contenu** : Améliorer les chapitres et exemples existants
- **Nouveaux Exemples** : Ajouter des scénarios et templates réels  
- **Traduction** : Aider à maintenir le support multilingue
- **Rapports de bugs** : Améliorer la précision et la clarté
- **Normes Communautaires** : Respecter nos directives communautaires inclusives

---

## 📄 Informations sur le Cours

### Licence
Ce projet est sous licence MIT - voir le fichier [LICENSE](../../LICENSE) pour les détails.

### Ressources d'Apprentissage Microsoft Associées

Notre équipe produit d'autres cours d'apprentissage complets :

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j pour Débutants](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js pour Débutants](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain pour Débutants](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD pour Débutants](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI pour Débutants](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP pour Débutants](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Agents IA pour Débutants](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Intelligence Artificielle Générative
[![IA Générative pour Débutants](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![IA Générative (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![IA Générative (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Intelligence Artificielle Générative (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Apprentissage Fondamental
[![ML pour Débutants](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Science des Données pour Débutants](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![IA pour Débutants](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersécurité pour Débutants](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Développement Web pour Débutants](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT pour Débutants](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Développement XR pour Débutants](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot pour la Programmation en Paire IA](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot pour C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Aventure Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigation du Cours

**🚀 Prêt à Commencer à Apprendre ?**

**Débutants** : Commencez par [Chapitre 1 : Fondations et Démarrage Rapide](#-chapter-1-foundation--quick-start)  
**Développeurs IA** : Passez à [Chapitre 2 : Développement IA-Prioritaire](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Développeurs Expérimentés** : Commencez par [Chapitre 3 : Configuration & Authentification](#️-chapter-3-configuration--authentication)

**Étapes Suivantes** : [Commencer Chapitre 1 - Bases AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->