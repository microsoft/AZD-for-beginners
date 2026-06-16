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
[Arabe](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgare](../bg/README.md) | [Birman (Myanmar)](../my/README.md) | [Chinois (Simplifié)](../zh-CN/README.md) | [Chinois (Traditionnel, Hong Kong)](../zh-HK/README.md) | [Chinois (Traditionnel, Macao)](../zh-MO/README.md) | [Chinois (Traditionnel, Taïwan)](../zh-TW/README.md) | [Croate](../hr/README.md) | [Tchèque](../cs/README.md) | [Danois](../da/README.md) | [Néerlandais](../nl/README.md) | [Estonien](../et/README.md) | [Finnois](../fi/README.md) | [Français](./README.md) | [Allemand](../de/README.md) | [Grec](../el/README.md) | [Hébreu](../he/README.md) | [Hindi](../hi/README.md) | [Hongrois](../hu/README.md) | [Indonésien](../id/README.md) | [Italien](../it/README.md) | [Japonais](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Coréen](../ko/README.md) | [Lituanien](../lt/README.md) | [Malais](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Népalais](../ne/README.md) | [Pidgin Nigérian](../pcm/README.md) | [Norvégien](../no/README.md) | [Persan (Farsi)](../fa/README.md) | [Polonais](../pl/README.md) | [Portugais (Brésil)](../pt-BR/README.md) | [Portugais (Portugal)](../pt-PT/README.md) | [Penjabi (Gurmukhi)](../pa/README.md) | [Roumain](../ro/README.md) | [Russe](../ru/README.md) | [Serbe (Cyrillique)](../sr/README.md) | [Slovaque](../sk/README.md) | [Slovène](../sl/README.md) | [Espagnol](../es/README.md) | [Swahili](../sw/README.md) | [Suédois](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamoul](../ta/README.md) | [Télougou](../te/README.md) | [Thaï](../th/README.md) | [Turc](../tr/README.md) | [Ukrainien](../uk/README.md) | [Ourdou](../ur/README.md) | [Vietnamien](../vi/README.md)

> **Préférez Cloner Localement ?**
>
> Ce dépôt inclut plus de 50 traductions ce qui augmente significativement la taille du téléchargement. Pour cloner sans traductions, utilisez le sparse checkout :
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
> Ceci vous fournit tout ce dont vous avez besoin pour compléter le cours avec un téléchargement beaucoup plus rapide.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Quoi de Neuf dans azd Aujourd'hui

> 📌 Ce cours est validé avec **`azd 1.25.6`** (juin 2026). Exécutez `azd version` pour vérifier votre version, et `azd upgrade` pour obtenir la dernière.

Azure Developer CLI s’est développée au-delà des applications web et API traditionnelles. Aujourd’hui, azd est l’outil unique pour déployer **n’importe quelle** application sur Azure—y compris les applications basées sur l’IA et les agents intelligents.

Voici ce que cela signifie pour vous :

- **Les agents IA sont désormais des charges de travail azd de première classe.** Vous pouvez initialiser, déployer et gérer des projets d’agents IA en utilisant le même workflow `azd init` → `azd up` que vous connaissez déjà.
- **Un cycle de vie complet d’agent depuis la CLI.** L’extension `azure.ai.agents` couvre désormais tout le parcours — `azd ai agent init` pour générer le modèle, `azd ai agent invoke` pour tester (avec un affichage du temps de réponse), `azd ai agent eval generate` et `azd ai agent optimize` pour mesurer et améliorer la qualité, et `azd ai agent delete` pour nettoyer.
- **Plus de blocs de construction IA.** Les nouvelles extensions en aperçu — `azure.ai.skills` et `azure.ai.connections` — vous permettent de gérer des compétences d’agent réutilisables et des connexions Foundry directement avec azd.
- **Intégration Microsoft Foundry** apporte le déploiement de modèles, l’hébergement d’agents et la configuration de services IA directement dans l’écosystème des templates azd.
- **Des bases quotidiennes plus fluides.** Les dernières versions ont rendu `azd init` idempotent (sécurisé à relancer), ont fait en sorte que `azd auth login` supprime automatiquement les jetons expirés, et ajouté une invite amicale de configuration initiale `azd tool`.
- **Le workflow principal n’a pas changé.** Que vous déployiez une application todo, un microservice ou une solution IA multi-agents, les commandes restent les mêmes.

> **Note pour les utilisateurs Aspire :** Microsoft désigne désormais le produit simplement comme **Aspire** (anciennement ".NET Aspire"). Le support Aspire d’azd est inchangé—seul le nom a été modifié.

Si vous avez déjà utilisé azd, le support IA est une extension naturelle—pas un outil séparé ni une voie avancée. Si vous commencez, vous apprendrez un workflow unique qui fonctionne pour tout.

---

## 🚀 Qu'est-ce qu'Azure Developer CLI (azd) ?

**Azure Developer CLI (azd)** est un outil en ligne de commande convivial qui simplifie le déploiement d’applications sur Azure. Au lieu de créer et connecter manuellement des dizaines de ressources Azure, vous pouvez déployer des applications entières en une seule commande.

### La magie de `azd up`

```bash
# Cette unique commande fait tout :
# ✅ Crée toutes les ressources Azure
# ✅ Configure le réseau et la sécurité
# ✅ Construit le code de votre application
# ✅ Déploie sur Azure
# ✅ Vous fournit une URL fonctionnelle
azd up
```

**C’est tout !** Pas besoin de cliquer dans le portail Azure, pas de modèles ARM complexes à apprendre d’abord, ni de configuration manuelle — juste des applications fonctionnelles sur Azure.

---

## ❓ Azure Developer CLI vs Azure CLI : Quelle Différence ?

C’est la question la plus fréquemment posée par les débutants. Voici la réponse simple :

| Fonctionnalité | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|----------------|----------------------|---------------------------------|
| **Objectif** | Gérer des ressources Azure individuelles | Déployer des applications complètes |
| **Approche** | Axée sur l’infrastructure | Axée sur l’application |
| **Exemple** | `az webapp create --name myapp...` | `azd up` |
| **Courbe d’apprentissage** | Connaître les services Azure | Juste connaître votre application |
| **Convient à** | DevOps, Infrastructure | Développeurs, Prototypage |

### Analogie Simple

- **Azure CLI** est comme avoir tous les outils pour construire une maison — marteaux, scies, clous. Vous pouvez tout construire, mais vous devez connaître la construction.
- **Azure Developer CLI** est comme engager un entrepreneur — vous décrivez ce que vous voulez, il gère la construction.

### Quand utiliser lequel

| Scénario | Utilisez ceci |
|----------|--------------|
| "Je veux déployer rapidement mon application web" | `azd up` |
| "J’ai juste besoin de créer un compte de stockage" | `az storage account create` |
| "Je crée une application IA complète" | `azd init --template azure-search-openai-demo` |
| "Je dois déboguer une ressource Azure spécifique" | `az resource show` |
| "Je veux un déploiement prêt pour la production en quelques minutes" | `azd up --environment production` |

### Ils fonctionnent ensemble !

AZD utilise Azure CLI en arrière-plan. Vous pouvez utiliser les deux :
```bash
# Déployez votre application avec AZD
azd up

# Puis ajustez des ressources spécifiques avec Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Trouvez des Templates dans Awesome AZD

Ne partez pas de zéro ! **Awesome AZD** est une collection communautaire de templates prêts à déployer :

| Ressource | Description |
|-----------|-------------|
| 🔗 [**Galerie Awesome AZD**](https://azure.github.io/awesome-azd/) | Parcourez plus de 200 templates avec déploiement en un clic |
| 🔗 [**Soumettre un Template**](https://github.com/Azure/awesome-azd/issues) | Contribuez avec votre propre template à la communauté |
| 🔗 [**Dépôt GitHub**](https://github.com/Azure/awesome-azd) | Ajoutez une étoile et explorez le code source |

### Templates IA populaires dans Awesome AZD

```bash
# RAG Chat avec les modèles Microsoft Foundry + Recherche IA
azd init --template azure-search-openai-demo

# Application de chat IA rapide
azd init --template openai-chat-app-quickstart

# Agents IA avec les agents Foundry
azd init --template get-started-with-ai-agents
```

---

## 🎯 Commencer en 3 étapes

Avant de commencer, assurez-vous que votre machine est prête pour le template que vous souhaitez déployer :

**Windows :**
```powershell
.\validate-setup.ps1
```

**macOS / Linux :**
```bash
bash ./validate-setup.sh
```

Si un contrôle requis échoue, corrigez-le d’abord puis continuez avec le démarrage rapide.

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

### Étape 2 : S’authentifier pour AZD

```bash
# Optionnel si vous prévoyez d'utiliser directement les commandes Azure CLI dans ce cours
az login

# Requis pour les workflows AZD
azd auth login
```

Si vous ne savez pas lequel choisir, suivez le flux complet de configuration dans [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Étape 3 : Déployer votre première application

```bash
# Initialiser à partir d'un modèle
azd init --template todo-nodejs-mongo

# Déployer sur Azure (crée tout !)
azd up
```

**🎉 C’est tout !** Votre application est maintenant en ligne sur Azure.

### Nettoyage (N’oubliez pas !)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Comment utiliser ce cours

Ce cours est conçu pour un **apprentissage progressif** : commencez où vous êtes à l’aise et progressez :

| Votre expérience | Commencez Ici |
|------------------|--------------|
| **Nouveau sur Azure** | [Chapitre 1 : Fondations](#-chapter-1-foundation--quick-start) |
| **Connaissance d’Azure, nouveau sur AZD** | [Chapitre 1 : Fondations](#-chapter-1-foundation--quick-start) |
| **Veut déployer des applications IA** | [Chapitre 2 : Développement IA d’abord](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Veut de la pratique interactive** | [🎓 Atelier interactif](workshop/README.md) - lab guidé de 3-4 heures |
| **Besoin de modèles pour production** | [Chapitre 8 : Production & Entreprise](#-chapter-8-production--enterprise-patterns) |

### Configuration rapide

1. **Forkez ce dépôt** : [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clonez-le** : `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Obtenez de l’aide** : [Communauté Discord Azure](https://discord.com/invite/ByRwuEEgH4)

> **Préférez Cloner Localement ?**

> Ce dépôt inclut plus de 50 traductions ce qui augmente significativement la taille du téléchargement. Pour cloner sans traductions, utilisez le sparse checkout :
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ceci vous fournit tout ce dont vous avez besoin pour compléter le cours avec un téléchargement beaucoup plus rapide.


## Aperçu du Cours

Maîtrisez Azure Developer CLI (azd) à travers des chapitres structurés conçus pour un apprentissage progressif. **Accent particulier sur le déploiement d’applications IA avec intégration Microsoft Foundry.**
### Pourquoi ce cours est essentiel pour les développeurs modernes

D'après les retours de la communauté Microsoft Foundry Discord, **45 % des développeurs souhaitent utiliser AZD pour les charges de travail IA** mais rencontrent des difficultés avec :
- Architectures IA complexes multi-services
- Meilleures pratiques de déploiement IA en production  
- Intégration et configuration des services Azure AI
- Optimisation des coûts pour les charges de travail IA
- Dépannage des problèmes spécifiques au déploiement IA

### Objectifs d'apprentissage

En suivant ce cours structuré, vous allez :
- **Maîtriser les fondamentaux d’AZD** : concepts clés, installation et configuration
- **Déployer des applications IA** : utiliser AZD avec les services Microsoft Foundry
- **Mettre en œuvre l’infrastructure en tant que code** : gérer les ressources Azure avec des templates Bicep
- **Dépanner les déploiements** : résoudre les problèmes courants et déboguer
- **Optimiser pour la production** : sécurité, mise à l’échelle, surveillance et gestion des coûts
- **Construire des solutions multi-agents** : déployer des architectures IA complexes

## Avant de commencer : comptes, accès et prérequis

Avant de commencer le Chapitre 1, assurez-vous que les éléments suivants sont en place. Les étapes d’installation présentées plus loin partent du principe que ces bases sont déjà gérées.

- **Un abonnement Azure** : vous pouvez utiliser un abonnement existant de votre travail ou personnel, ou créer un [essai gratuit](https://aka.ms/azurefreetrial) pour commencer.
- **Autorisation de créer des ressources Azure** : pour la plupart des exercices, vous devriez disposer d’au moins un accès **Contributeur** sur l’abonnement ou le groupe de ressources cible. Certains chapitres supposent aussi que vous pouvez créer des groupes de ressources, des identités gérées et des affectations RBAC.
- [**Un compte GitHub**](https://github.com) : utile pour forker le dépôt, suivre vos propres modifications et utiliser GitHub Codespaces pour l’atelier.
- **Prérequis d’exécution des templates** : certains templates nécessitent des outils locaux comme Node.js, Python, Java ou Docker. Exécutez le validateur d’installation avant de commencer pour détecter tout outil manquant.
- **Notions de base du terminal** : pas besoin d’être expert, mais vous devez être à l’aise avec des commandes comme `git clone`, `azd auth login` et `azd up`.

> **Travaillez-vous dans un abonnement entreprise ?**
> Si votre environnement Azure est géré par un administrateur, vérifiez à l’avance que vous pouvez déployer des ressources dans l’abonnement ou le groupe de ressources que vous prévoyez d’utiliser. Sinon, demandez un abonnement sandbox ou un accès Contributeur avant de commencer.

> **Nouveau sur Azure ?**
> Commencez avec votre propre abonnement d’essai Azure ou à la consommation sur https://aka.ms/azurefreetrial pour pouvoir réaliser les exercices de bout en bout sans attendre des approbations au niveau du locataire.

## 🗺️ Plan du cours : navigation rapide par chapitre

Chaque chapitre possède un README dédié avec les objectifs d’apprentissage, des démarrages rapides et des exercices :

| Chapitre | Sujet | Leçons | Durée | Complexité |
|---------|-------|---------|----------|------------|
| **[Ch 1 : Fondations](docs/chapter-01-foundation/README.md)** | Premiers pas | [Notions de base AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Premier projet](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2 : Développement IA](docs/chapter-02-ai-development/README.md)** | Applications IA | [Intégration Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Agents IA](docs/chapter-02-ai-development/agents.md) &#124; [Déploiement modèle](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Atelier](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 h | ⭐⭐ |
| **[Ch 3 : Configuration](docs/chapter-03-configuration/README.md)** | Authentification & Sécurité | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Authentification & Sécurité](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4 : Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Déploiement | [Guide de déploiement](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionnement](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 h | ⭐⭐⭐ |
| **[Ch 5 : Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Solutions Agents IA | [Scénario Retail](examples/retail-scenario.md) &#124; [Patrons de coordination](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 h | ⭐⭐⭐⭐ |
| **[Ch 6 : Pré-déploiement](docs/chapter-06-pre-deployment/README.md)** | Planification & Validation | [Contrôles préalables](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planification capacité](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Choix SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 h | ⭐⭐ |
| **[Ch 7 : Dépannage](docs/chapter-07-troubleshooting/README.md)** | Débogage & Correction | [Problèmes courants](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Débogage](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problèmes IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 h | ⭐⭐ |
| **[Ch 8 : Production](docs/chapter-08-production/README.md)** | Patrons en entreprise | [Pratiques de production](docs/chapter-08-production/production-ai-practices.md) | 2-3 h | ⭐⭐⭐⭐ |
| **[🎓 Atelier](workshop/README.md)** | Laboratoire pratique | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Sélection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Déconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Personnalisation](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Démantèlement](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Synthèse](workshop/docs/instructions/7-Wrap-up.md) | 3-4 h | ⭐⭐ |

**Durée totale du cours :** ~10-14 heures | **Progression des compétences :** Débutant → Prêt pour la production

---

## 📚 Chapitres d’apprentissage

*Choisissez votre parcours selon votre niveau d’expérience et vos objectifs*

### 🚀 Chapitre 1 : Fondations & Démarrage rapide  
**Prérequis** : abonnement Azure, connaissances basiques en ligne de commande  
**Durée** : 30-45 minutes  
**Complexité** : ⭐

#### Ce que vous apprendrez  
- Comprendre les fondamentaux de l’Azure Developer CLI  
- Installer AZD sur votre plateforme  
- Réaliser votre premier déploiement réussi  

#### Ressources d’apprentissage  
- **🎯 Commencez ici** : [Qu’est-ce que l’Azure Developer CLI ?](#what-is-azure-developer-cli)  
- **📖 Théorie** : [Notions de base AZD](docs/chapter-01-foundation/azd-basics.md) - Concepts clés et terminologie  
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
  
**💡 Résultat du chapitre** : Déployer avec succès une application web simple sur Azure avec AZD  

**✅ Validation de réussite :**  
```bash
# Après avoir terminé le Chapitre 1, vous devriez être capable de :
azd version              # Affiche la version installée
azd init --template todo-nodejs-mongo  # Initialise le projet
azd up                  # Déploie sur Azure
azd show                # Affiche l'URL de l'application en cours d'exécution
# L'application s'ouvre dans le navigateur et fonctionne
azd down --force --purge  # Nettoie les ressources
```
  
**📊 Temps estimé :** 30-45 minutes  
**📈 Niveau de compétence après :** Peut déployer des applications basiques de façon autonome  

---

### 🤖 Chapitre 2 : Développement orienté IA (recommandé aux développeurs IA)  
**Prérequis** : Chapitre 1 terminé  
**Durée** : 1-2 heures  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez  
- Intégration Microsoft Foundry avec AZD  
- Déploiement d’applications propulsées par IA  
- Compréhension des configurations des services IA  

#### Ressources d’apprentissage  
- **🎯 Commencez ici** : [Intégration Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 Agents IA** : [Guide des agents IA](docs/chapter-02-ai-development/agents.md) - Déployer des agents intelligents avec AZD  
- **📖 Patrons** : [Déploiement de modèles IA](docs/chapter-02-ai-development/ai-model-deployment.md) - Déployer et gérer des modèles IA  
- **🛠️ Atelier** : [Atelier IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendre vos solutions IA prêtes pour AZD  
- **🎥 Guide interactif** : [Matériel d’atelier](workshop/README.md) - Apprentissage navigateur avec MkDocs * environnement DevContainer  
- **📋 Templates** : [Templates Microsoft Foundry](#ressources-de-latelier)  
- **📝 Exemples** : [Exemples de déploiement AZD](examples/README.md)  

#### Exercices pratiques  
```bash
# Déployez votre première application d'IA
azd init --template azure-search-openai-demo
azd up

# Essayez des modèles d'IA supplémentaires
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 Résultat du chapitre** : Déployer et configurer une application de chat IA avec capacités RAG  

**✅ Validation de réussite :**  
```bash
# Après le Chapitre 2, vous devriez être capable de :
azd init --template azure-search-openai-demo
azd up
# Tester l'interface de chat IA
# Poser des questions et obtenir des réponses alimentées par l'IA avec des sources
# Vérifier que l'intégration de la recherche fonctionne
azd monitor  # Vérifier que Application Insights affiche la télémétrie
azd down --force --purge
```
  
**📊 Temps estimé :** 1-2 heures  
**📈 Niveau de compétence après :** Peut déployer et configurer des applications IA prêtes pour la production  
**💰 Sensibilisation aux coûts :** Comprend les coûts dev de 80-150 $/mois, coûts production de 300-3500 $/mois  

#### 💰 Considérations de coûts pour le déploiement IA

**Environnement de développement (estimé à 80-150 $/mois) :**  
- Modèles Microsoft Foundry (paiement à l’usage) : 0-50 $/mois (selon usage en tokens)  
- Recherche IA (niveau Basic) : 75 $/mois  
- Container Apps (consommation) : 0-20 $/mois  
- Stockage (standard) : 1-5 $/mois  

**Environnement de production (estimé à 300-3500+ $/mois) :**  
- Modèles Microsoft Foundry (PTU pour performance stable) : 3000+ $/mois OU paiement à l’usage avec fort volume  
- Recherche IA (niveau Standard) : 250 $/mois  
- Container Apps (dédié) : 50-100 $/mois  
- Application Insights : 5-50 $/mois  
- Stockage (premium) : 10-50 $/mois  

**💡 Conseils d’optimisation des coûts :**  
- Utilisez les modèles Microsoft Foundry en **niveau gratuit** pour l’apprentissage (Azure OpenAI inclut 50 000 tokens/mois)  
- Exécutez `azd down` pour désallouer les ressources lorsque vous ne développez pas activement  
- Commencez avec un mode facturation à la consommation, passez au PTU uniquement en production  
- Utilisez `azd provision --preview` pour estimer les coûts avant déploiement  
- Activez l’auto-scaling : ne payez que pour l’usage réel  

**Surveillance des coûts :**  
```bash
# Vérifier les coûts mensuels estimés
azd provision --preview

# Surveiller les coûts réels dans le portail Azure
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ Chapitre 3 : Configuration & Authentification  
**Prérequis** : Chapitre 1 terminé  
**Durée** : 45-60 minutes  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez  
- Configuration et gestion des environnements  
- Meilleures pratiques d’authentification et de sécurité  
- Nommage et organisation des ressources  

#### Ressources d’apprentissage  
- **📖 Configuration** : [Guide de configuration](docs/chapter-03-configuration/configuration.md) - Mise en place des environnements  
- **🔐 Sécurité** : [Patrons d’authentification et identité gérée](docs/chapter-03-configuration/authsecurity.md)  
- **📝 Exemples** : [Exemple d’application base de données](examples/database-app/README.md) - Exemples AZD avec bases de données  

#### Exercices pratiques  
- Configurer plusieurs environnements (dev, staging, prod)  
- Mettre en place l’authentification avec identité gérée  
- Implémenter des configurations spécifiques par environnement  

**💡 Résultat du chapitre** : Gérer plusieurs environnements avec une authentification et une sécurité appropriées  

---

### 🏗️ Chapitre 4 : Infrastructure as Code & Déploiement  
**Prérequis** : Chapitres 1-3 terminés  
**Durée** : 1-1,5 heures  
**Complexité** : ⭐⭐⭐

#### Ce que vous apprendrez  
- Patrons avancés de déploiement  
- Infrastructure as Code avec Bicep  
- Stratégies de provisionnement des ressources  

#### Ressources d’apprentissage  
- **📖 Déploiement** : [Guide de déploiement](docs/chapter-04-infrastructure/deployment-guide.md) - Workflows complets  
- **🏗️ Provisionnement** : [Provisionnement des ressources](docs/chapter-04-infrastructure/provisioning.md) - Gestion des ressources Azure  
- **📝 Exemples** : [Exemple Container App](../../examples/container-app) - Déploiements conteneurisés  

#### Exercices pratiques  
- Créer des templates Bicep personnalisés  
- Déployer des applications multi-services  
- Mettre en œuvre des stratégies de déploiement blue-green  

**💡 Résultat du chapitre** : Déployer des applications multi-services complexes avec des templates d’infrastructure personnalisés  

---
### 🎯 Chapitre 5 : Solutions d'IA multi-agents (Avancé)
**Prérequis** : Chapitres 1-2 terminés  
**Durée** : 2-3 heures  
**Complexité** : ⭐⭐⭐⭐

#### Ce que vous apprendrez
- Modèles d'architecture multi-agents
- Orchestration et coordination des agents
- Déploiements d'IA prêts pour la production

#### Ressources d'apprentissage
- **🤖 Projet mis en avant** : [Solution multi-agent pour le commerce de détail](examples/retail-scenario.md) - Implémentation complète
- **🛠️ Templates ARM** : [Package de templates ARM](../../examples/retail-multiagent-arm-template) - Déploiement en un clic
- **📖 Architecture** : [Modèles de coordination multi-agents](docs/chapter-06-pre-deployment/coordination-patterns.md) - Modèles

#### Exercices pratiques
```bash
# Déployer la solution complète de multi-agent pour le commerce de détail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explorer les configurations des agents
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Résultat du chapitre** : Déployer et gérer une solution d'IA multi-agents prête pour la production avec des agents Client et Inventaire

---

### 🔍 Chapitre 6 : Validation et planification pré-déploiement
**Prérequis** : Chapitre 4 terminé  
**Durée** : 1 heure  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Planification de capacité et validation des ressources
- Stratégies de sélection de SKU
- Contrôles préalables et automatisation

#### Ressources d'apprentissage
- **📊 Planification** : [Planification de capacité](docs/chapter-06-pre-deployment/capacity-planning.md) - Validation des ressources
- **💰 Sélection** : [Sélection de SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Choix économiques
- **✅ Validation** : [Contrôles préalables](docs/chapter-06-pre-deployment/preflight-checks.md) - Scripts automatisés

#### Exercices pratiques
- Exécuter des scripts de validation de capacité
- Optimiser la sélection des SKU pour réduire les coûts
- Mettre en œuvre des contrôles automatisés avant le déploiement

**💡 Résultat du chapitre** : Valider et optimiser les déploiements avant leur exécution

---

### 🚨 Chapitre 7 : Dépannage et débogage
**Prérequis** : N'importe quel chapitre de déploiement terminé  
**Durée** : 1 à 1,5 heure  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Approches systématiques de débogage
- Problèmes courants et solutions
- Dépannage spécifique à l'IA

#### Ressources d'apprentissage
- **🔧 Problèmes courants** : [Problèmes courants](docs/chapter-07-troubleshooting/common-issues.md) - FAQ et solutions
- **🕵️ Débogage** : [Guide de débogage](docs/chapter-07-troubleshooting/debugging.md) - Stratégies étape par étape
- **🤖 Problèmes IA** : [Dépannage spécifique à l'IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problèmes des services IA

#### Exercices pratiques
- Diagnostiquer des échecs de déploiement
- Résoudre des problèmes d'authentification
- Déboguer la connectivité des services IA

**💡 Résultat du chapitre** : Diagnostiquer et résoudre de manière autonome les problèmes courants de déploiement

---

### 🏢 Chapitre 8 : Modèles en production et entreprise
**Prérequis** : Chapitres 1-4 terminés  
**Durée** : 2-3 heures  
**Complexité** : ⭐⭐⭐⭐

#### Ce que vous apprendrez
- Stratégies de déploiement en production
- Modèles de sécurité en entreprise
- Supervision et optimisation des coûts

#### Ressources d'apprentissage
- **🏭 Production** : [Bonnes pratiques IA en production](docs/chapter-08-production/production-ai-practices.md) - Modèles entreprise
- **📝 Exemples** : [Exemple microservices](../../examples/microservices) - Architectures complexes
- **📊 Supervision** : [Intégration Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Surveillance

#### Exercices pratiques
- Mettre en œuvre des modèles de sécurité en entreprise
- Installer une surveillance complète
- Déployer en production avec une gouvernance adéquate

**💡 Résultat du chapitre** : Déployer des applications prêtes pour l'entreprise avec toutes les capacités de production

---

## 🎓 Aperçu de l'atelier : Expérience d'apprentissage pratique

> **⚠️ ÉTAT DE L'ATELIER : Développement actif**  
> Les matériaux de l'atelier sont actuellement en cours de développement et d'affinement. Les modules principaux sont fonctionnels, mais certaines sections avancées ne sont pas encore complètes. Nous travaillons activement pour finaliser tout le contenu. [Suivez la progression →](workshop/README.md)

### Matériels d'atelier interactifs
**Apprentissage pratique complet avec outils en ligne et exercices guidés**

Nos matériaux d'atelier offrent une expérience d'apprentissage structurée et interactive qui complète le programme par chapitre ci-dessus. L'atelier est conçu pour un apprentissage autonome ou animé par un instructeur.

#### 🛠️ Fonctionnalités de l'atelier
- **Interface dans le navigateur** : Atelier complet propulsé par MkDocs avec recherche, copie, et fonctionnalités de thème
- **Intégration GitHub Codespaces** : Configuration d'un environnement de développement en un clic
- **Parcours d'apprentissage structuré** : 8 modules d'exercices guidés (3-4 heures total)
- **Méthodologie progressive** : Introduction → Sélection → Validation → Déconstruction → Configuration → Personnalisation → Démantèlement → Conclusion
- **Environnement DevContainer interactif** : Outils et dépendances préconfigurés

#### 📚 Structure des modules d'atelier
L'atelier suit une **méthodologie progressive en 8 modules** qui vous mène de la découverte à la maîtrise du déploiement :

| Module | Sujet | Ce que vous ferez | Durée |
|--------|-------|-------------------|--------|
| **0. Introduction** | Aperçu de l'atelier | Comprendre les objectifs, prérequis, et la structure de l'atelier | 15 min |
| **1. Sélection** | Découverte de templates | Explorer les templates AZD et sélectionner le bon template IA pour votre cas | 20 min |
| **2. Validation** | Déployer et vérifier | Déployer le template avec `azd up` et valider le fonctionnement de l'infrastructure | 30 min |
| **3. Déconstruction** | Comprendre la structure | Utiliser GitHub Copilot pour explorer l'architecture du template, les fichiers Bicep, et l'organisation du code | 30 min |
| **4. Configuration** | Exploration approfondie de azure.yaml | Maîtriser la configuration `azure.yaml`, les hooks du cycle de vie, et les variables d'environnement | 30 min |
| **5. Personnalisation** | Adaptez à vos besoins | Activer AI Search, le traçage, l’évaluation, et personnaliser selon votre scénario | 45 min |
| **6. Démantèlement** | Nettoyer | Supprimer proprement les ressources avec `azd down --purge` | 15 min |
| **7. Conclusion** | Prochaines étapes | Revoir les acquis, concepts clés, et poursuivre votre apprentissage | 15 min |

**Déroulement de l'atelier :**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Démarrage de l'atelier
```bash
# Option 1 : GitHub Codespaces (Recommandé)
# Cliquez sur "Code" → "Créer un codespace sur main" dans le dépôt

# Option 2 : Développement local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Suivez les instructions d'installation dans workshop/README.md
```

#### 🎯 Résultats d'apprentissage de l'atelier
En complétant l'atelier, les participants seront capables de :
- **Déployer des applications IA en production** : Utiliser AZD avec les services Microsoft Foundry
- **Maîtriser les architectures multi-agents** : Implémenter des solutions d’agents IA coordonnées
- **Mettre en œuvre les meilleures pratiques de sécurité** : Configurer l’authentification et le contrôle d’accès
- **Optimiser à l’échelle** : Concevoir des déploiements performants et économiques
- **Dépanner les déploiements** : Résoudre de manière autonome les problèmes courants

#### 📖 Ressources de l'atelier
- **🎥 Guide interactif** : [Matériels d'atelier](workshop/README.md) - Environnement d'apprentissage dans le navigateur
- **📋 Instructions module par module** :
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Aperçu et objectifs de l'atelier
  - [1. Sélection](workshop/docs/instructions/1-Select-AI-Template.md) - Trouver et choisir les templates IA
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Déployer et valider les templates
  - [3. Déconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explorer l’architecture du template
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Maîtriser azure.yaml
  - [5. Personnalisation](workshop/docs/instructions/5-Customize-AI-Template.md) - Personnaliser selon votre scénario
  - [6. Démantèlement](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Nettoyer les ressources
  - [7. Conclusion](workshop/docs/instructions/7-Wrap-up.md) - Révision et suite
- **🛠️ Laboratoire d’atelier IA** : [Laboratoire IA](docs/chapter-02-ai-development/ai-workshop-lab.md) - Exercices centrés IA
- **💡 Démarrage rapide** : [Guide de configuration de l'atelier](workshop/README.md#quick-start) - Configuration de l'environnement

**Idéal pour** : Formation en entreprise, cours universitaires, apprentissage autonome et bootcamps développeurs.

---

## 📖 Approfondissement : Capacités AZD

Au-delà des bases, AZD offre des fonctionnalités puissantes pour les déploiements en production :

- **Déploiements basés sur des templates** - Utilisez des templates pré-construits pour les modèles d'application courants
- **Infrastructure as Code** - Gérez les ressources Azure avec Bicep ou Terraform  
- **Flux de travail intégrés** - Provisionnez, déployez et surveillez les applications sans couture
- **Orienté développeur** - Optimisé pour la productivité et l’expérience des développeurs

### **AZD + Microsoft Foundry : Parfait pour les déploiements IA**

**Pourquoi utiliser AZD pour les solutions IA ?** AZD répond aux principaux défis rencontrés par les développeurs IA :

- **Templates prêts pour l’IA** - Templates préconfigurés pour Microsoft Foundry Models, Azure AI Services, et charges de travail ML
- **Déploiements IA sécurisés** - Modèles de sécurité intégrés pour les services IA, clés API, et points de terminaison de modèles  
- **Modèles IA en production** - Meilleures pratiques pour des déploiements IA évolutifs et rentables
- **Flux de travail IA de bout en bout** - Du développement du modèle au déploiement en production avec supervision appropriée
- **Optimisation des coûts** - Allocation intelligente des ressources et stratégies de montée en charge pour les charges IA
- **Intégration Microsoft Foundry** - Connexion fluide au catalogue de modèles et points de terminaison Microsoft Foundry

---

## 🎯 Bibliothèque de templates et exemples

### En vedette : Templates Microsoft Foundry
**Commencez ici si vous déployez des applications IA !**

> **Note :** Ces templates démontrent divers modèles IA. Certains sont des exemples Azure externes, d'autres des implémentations locales.

| Template | Chapitre | Complexité | Services | Type |
|----------|----------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapitre 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Externe |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapitre 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Externe |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapitre 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Stockage | Externe |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapitre 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Externe |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapitre 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Externe |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapitre 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Externe |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapitre 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Stockage + Container Apps + Cosmos DB | **Local** |

### En vedette : Scénarios d'apprentissage complets
**Templates d'applications prêtes pour la production correspondants aux chapitres d'apprentissage**

| Template | Chapitre d'apprentissage | Complexité | Apprentissage clé |
|----------|--------------------------|------------|-------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapitre 2 | ⭐ | Modèles de déploiement d'IA basiques |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapitre 2 | ⭐⭐ | Mise en œuvre RAG avec Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapitre 4 | ⭐⭐ | Intégration de l’intelligence documentaire |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapitre 5 | ⭐⭐⭐ | Framework agent et appels de fonctions |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapitre 8 | ⭐⭐⭐ | Orchestration IA en entreprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapitre 5 | ⭐⭐⭐⭐ | Architecture multi-agents avec agents Client et Inventaire |

### Apprentissage par type d'exemple

> **📌 Exemples locaux vs externes :**  
> **Exemples locaux** (dans ce dépôt) = Prêts à l'emploi immédiatement  
> **Exemples externes** (Azure Samples) = À cloner depuis les dépôts liés

#### Exemples locaux (prêts à l'emploi)
- [**Solution multi-agent pour le commerce de détail**](examples/retail-scenario.md) - Implémentation complète prête pour la production avec templates ARM
  - Architecture multi-agents (agents Client + Inventaire)
  - Supervision et évaluation complètes
  - Déploiement en un clic via template ARM

#### Exemples locaux - Applications conteneurisées (Chapitres 2-5)
**Exemples complets de déploiement conteneurisé dans ce dépôt :**
- [**Exemples d’Applications Conteneurisées**](examples/container-app/README.md) - Guide complet des déploiements conteneurisés
  - [API Flask Simple](../../examples/container-app/simple-flask-api) - API REST basique avec mise à l’échelle à zéro
  - [Architecture Microservices](../../examples/container-app/microservices) - Déploiement multi-service prêt pour la production
  - Modèles de déploiement Démarrage Rapide, Production et Avancés
  - Guide de surveillance, sécurité et optimisation des coûts

#### Exemples Externes - Applications Simples (Chapitres 1-2)
**Clonez ces dépôts Azure Samples pour commencer :**
- [Application Web Simple - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Modèles de déploiement basiques
- [Site Statique - SPA React](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Déploiement de contenu statique
- [Application Conteneurisée - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Déploiement API REST

#### Exemples Externes - Intégration de Bases de Données (Chapitres 3-4)  
- [Application Base de Données - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Modèles de connectivité base de données
- [Fonctions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Workflow de données serverless

#### Exemples Externes - Modèles Avancés (Chapitres 4-8)
- [Microservices Java](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architectures multi-services
- [Jobs Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Traitement en arrière-plan  
- [Pipeline ML Entreprise](https://github.com/Azure-Samples/mlops-v2) - Modèles ML prêts pour la production

### Collections de Templates Externes
- [**Galerie Officielle de Templates AZD**](https://azure.github.io/awesome-azd/) - Collection sélectionnée de templates officiels et communautaires
- [**Templates Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Documentation Microsoft Learn des templates
- [**Répertoire d’Exemples**](examples/README.md) - Exemples d’apprentissage locaux avec explications détaillées

---

## 📚 Ressources d’Apprentissage & Références

### Références Rapides
- [**Fiche de Commandes**](resources/cheat-sheet.md) - Commandes azd essentielles classées par chapitre
- [**Glossaire**](resources/glossary.md) - Terminologie Azure et azd  
- [**FAQ**](resources/faq.md) - Questions courantes classées par chapitre d’apprentissage
- [**Guide d’Étude**](resources/study-guide.md) - Exercices pratiques complets

### Ateliers Pratiques
- [**Atelier Lab IA**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Rendez vos solutions IA déployables via AZD (2-3 heures)
- [**Atelier Interactif**](workshop/README.md) - 8 modules d’exercices guidés avec MkDocs et GitHub Codespaces
  - Suit : Introduction → Sélection → Validation → Déconstruction → Configuration → Personnalisation → Démantèlement → Conclusion

### Ressources d’Apprentissage Externes
- Documentation Azure Developer CLI (https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Centre d’Architecture Azure (https://learn.microsoft.com/en-us/azure/architecture/)
- Calculateur de Tarification Azure (https://azure.microsoft.com/pricing/calculator/)
- Statut Azure (https://status.azure.com/)

### Compétences Agents IA pour Votre Éditeur
- [**Compétences Microsoft Azure sur skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 compétences agent ouvertes pour Azure AI, Foundry, déploiement, diagnostics, optimisation des coûts et plus encore. Installez-les dans GitHub Copilot, Cursor, Claude Code ou tout agent compatible :
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Guide Rapide de Dépannage

**Problèmes courants rencontrés par les débutants et solutions immédiates :**

<details>
<summary><strong>❌ "azd : commande introuvable"</strong></summary>

```bash
# Installez d'abord AZD
# Windows (PowerShell) :
winget install microsoft.azd

# macOS :
brew tap azure/azd && brew install azd

# Linux :
curl -fsSL https://aka.ms/install-azd.sh | bash

# Vérifiez l'installation
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
# Essayez différentes régions Azure
azd env set AZURE_LOCATION "westus2"
azd up

# Ou utilisez des SKU plus petites en développement
# Modifiez infra/main.parameters.json :
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" échoue en cours d’exécution</strong></summary>

```bash
# Option 1 : Nettoyer et réessayer
azd down --force --purge
azd up

# Option 2 : Simplement réparer l'infrastructure
azd provision

# Option 3 : Vérifier le statut détaillé
azd show

# Option 4 : Vérifier les journaux dans Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Échec d’authentification" ou "Jeton expiré"</strong></summary>

```bash
# Ré-authentifiez-vous pour AZD
azd auth logout
azd auth login

# Optionnel : rafraîchissez aussi Azure CLI si vous exécutez des commandes az
az logout
az login

# Vérifiez l'authentification
az account show
```
</details>

<details>
<summary><strong>❌ "Ressource existe déjà" ou conflits de nommage</strong></summary>

```bash
# AZD génère des noms uniques, mais en cas de conflit :
azd down --force --purge

# Ensuite, réessayez avec un nouvel environnement
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Déploiement du template trop long</strong></summary>

**Temps d’attente normaux :**
- Application web simple : 5-10 minutes
- Application avec base de données : 10-15 minutes
- Applications IA : 15-25 minutes (la mise à disposition OpenAI est lente)

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

# Vous avez besoin d'au moins le rôle "Collaborateur"
# Demandez à votre administrateur Azure de vous accorder :
# - Collaborateur (pour les ressources)
# - Administrateur d'accès utilisateur (pour les affectations de rôle)
```
</details>

<details>
<summary><strong>❌ URL de l’application déployée introuvable</strong></summary>

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
- **Problèmes Spécifiques IA :** [Dépannage IA](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Guide de Débogage :** [Débogage étape par étape](docs/chapter-07-troubleshooting/debugging.md)
- **Obtenir de l’Aide :** [Discord Azure](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Fin du Cours & Certification

### Suivi de Progression
Suivez votre progression d’apprentissage à travers chaque chapitre :

- [ ] **Chapitre 1** : Fondations & Démarrage Rapide ✅
- [ ] **Chapitre 2** : Développement AI-First ✅  
- [ ] **Chapitre 3** : Configuration & Authentification ✅
- [ ] **Chapitre 4** : Infrastructure as Code & Déploiement ✅
- [ ] **Chapitre 5** : Solutions IA Multi-Agent ✅
- [ ] **Chapitre 6** : Validation & Planification Pré-Déploiement ✅
- [ ] **Chapitre 7** : Résolution de Problèmes & Débogage ✅
- [ ] **Chapitre 8** : Modèles Production & Entreprise ✅

### Vérification des Connaissances
Après chaque chapitre, validez vos acquis en :
1. **Exercice Pratique** : Complétez le déploiement pratique du chapitre
2. **Vérification des Connaissances** : Consultez la FAQ de votre chapitre
3. **Discussion Communautaire** : Partagez votre expérience sur Azure Discord
4. **Chapitre Suivant** : Passez au niveau de complexité suivant

### Avantages de la Fin de Cours
Une fois tous les chapitres terminés, vous disposerez de :
- **Expérience en Production** : Applications IA réelles déployées sur Azure
- **Compétences Professionnelles** : Capacités de déploiement prêtes pour l’entreprise  
- **Reconnaissance Communautaire** : Membre actif de la communauté des développeurs Azure
- **Avancement de Carrière** : Expertise AZD et IA très recherchée

---

## 🤝 Communauté & Support

### Obtenir Aide & Support
- **Problèmes Techniques** : [Signaler bugs et demander fonctionnalités](https://github.com/microsoft/azd-for-beginners/issues)
- **Questions d’Apprentissage** : [Communauté Discord Microsoft Azure](https://discord.gg/microsoft-azure) et [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Aide Spécifique IA** : Rejoignez le [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation** : [Documentation officielle Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Informations Communautaires du Discord Microsoft Foundry

**Résultats récents du sondage sur le canal #Azure :**
- **45%** des développeurs veulent utiliser AZD pour les charges IA
- **Principaux défis** : Déploiements multi-services, gestion d’identifiants, préparation à la production  
- **Plus demandés** : Templates IA spécifiques, guides de dépannage, meilleures pratiques

**Rejoignez notre communauté pour :**
- Partager vos expériences AZD + IA et obtenir de l’aide
- Accéder aux avant-premières de nouveaux templates IA
- Contribuer aux meilleures pratiques de déploiement IA
- Influencer le développement futur de fonctionnalités IA + AZD

### Contribution au Cours
Vos contributions sont les bienvenues ! Veuillez lire notre [Guide des Contributions](CONTRIBUTING.md) pour les modalités sur :
- **Améliorations de contenu** : Enrichissez chapitres et exemples existants
- **Nouveaux exemples** : Ajoutez des scénarios et templates réels  
- **Traduction** : Aidez à maintenir le support multilingue
- **Rapports de bugs** : Améliorez précision et clarté
- **Standards Communautaires** : Respectez nos lignes directrices inclusives

---

## 📄 Informations sur le Cours

### Licence
Ce projet est sous licence MIT - voir le fichier [LICENSE](../../LICENSE) pour plus de détails.

### Ressources Microsoft Learning Associées

Notre équipe produit d’autres cours d’apprentissage complets :

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série IA Générative
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Apprentissage Fondamental
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Série Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigation du Cours

**🚀 Prêt à commencer à apprendre ?**

**Débutants** : Commencez par [Chapitre 1 : Fondations & Démarrage Rapide](#-chapter-1-foundation--quick-start)  
**Développeurs IA** : Passez à [Chapitre 2 : Développement IA en Premier](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Développeurs expérimentés** : Commencez par [Chapitre 3 : Configuration & Authentification](#️-chapter-3-configuration--authentication)

**Prochaines étapes** : [Commencer Chapitre 1 - Bases AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->