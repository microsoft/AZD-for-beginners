<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2a0861541126250c3558d667e9b13c50",
  "translation_date": "2025-11-19T16:13:49+00:00",
  "source_file": "course-outline.md",
  "language_code": "fr"
}
-->
# AZD pour Débutants : Plan de Cours & Cadre d'Apprentissage

## Aperçu du Cours

Maîtrisez Azure Developer CLI (azd) grâce à des chapitres structurés pour un apprentissage progressif. **Accent particulier sur le déploiement d'applications IA avec l'intégration de Microsoft Foundry.**

### Pourquoi ce Cours est Essentiel pour les Développeurs Modernes

D'après les retours de la communauté Discord de Microsoft Foundry, **45 % des développeurs souhaitent utiliser AZD pour des charges de travail IA**, mais rencontrent des difficultés avec :
- Des architectures IA complexes impliquant plusieurs services
- Les meilleures pratiques pour le déploiement d'IA en production  
- L'intégration et la configuration des services Azure AI
- L'optimisation des coûts pour les charges de travail IA
- La résolution des problèmes spécifiques au déploiement IA

### Objectifs d'Apprentissage Principaux

En suivant ce cours structuré, vous apprendrez à :
- **Maîtriser les Fondamentaux d'AZD** : Concepts de base, installation et configuration
- **Déployer des Applications IA** : Utiliser AZD avec les services Microsoft Foundry
- **Implémenter l'Infrastructure as Code** : Gérer les ressources Azure avec des modèles Bicep
- **Résoudre les Problèmes de Déploiement** : Identifier et corriger les problèmes courants
- **Optimiser pour la Production** : Sécurité, mise à l'échelle, surveillance et gestion des coûts
- **Construire des Solutions Multi-Agents** : Déployer des architectures IA complexes

## 🎓 Expérience d'Apprentissage en Atelier

### Options Flexibles de Livraison d'Apprentissage
Ce cours est conçu pour prendre en charge à la fois **l'apprentissage individuel en autonomie** et **les sessions d'atelier encadrées**, permettant aux apprenants d'acquérir une expérience pratique avec AZD tout en développant des compétences concrètes grâce à des exercices interactifs.

#### 🚀 Mode Apprentissage en Autonomie
**Idéal pour les développeurs individuels et l'apprentissage continu**

**Caractéristiques :**
- **Interface Basée sur le Navigateur** : Atelier alimenté par MkDocs accessible via n'importe quel navigateur web
- **Intégration GitHub Codespaces** : Environnement de développement en un clic avec outils préconfigurés
- **Environnement DevContainer Interactif** : Aucun paramétrage local requis - commencez à coder immédiatement
- **Suivi des Progrès** : Points de contrôle intégrés et exercices de validation
- **Support Communautaire** : Accès aux canaux Discord Azure pour poser des questions et collaborer

**Structure d'Apprentissage :**
- **Horaires Flexibles** : Complétez les chapitres à votre rythme sur plusieurs jours ou semaines
- **Système de Points de Contrôle** : Validez vos acquis avant de passer à des sujets plus complexes
- **Bibliothèque de Ressources** : Documentation complète, exemples et guides de dépannage
- **Développement de Portfolio** : Construisez des projets déployables pour enrichir votre portfolio professionnel

**Commencer (Apprentissage en Autonomie) :**
```bash
# Option 1 : GitHub Codespaces (Recommandé)
# Accédez au dépôt et cliquez sur "Code" → "Créer un codespace sur main"

# Option 2 : Développement local
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Suivez les instructions de configuration dans workshop/README.md
```

#### 🏛️ Sessions d'Atelier Encadrées
**Idéal pour les formations en entreprise, les bootcamps et les institutions éducatives**

**Formats d'Atelier Disponibles :**

**📚 Intégration dans un Cours Académique (8-12 semaines)**
- **Programmes Universitaires** : Cours semestriel avec des sessions hebdomadaires de 2 heures
- **Format Bootcamp** : Programme intensif de 3 à 5 jours avec des sessions quotidiennes de 6 à 8 heures
- **Formation en Entreprise** : Sessions mensuelles en équipe avec mise en œuvre de projets pratiques
- **Cadre d'Évaluation** : Devoirs notés, évaluations par les pairs et projets finaux

**🚀 Atelier Intensif (1-3 jours)**
- **Jour 1** : Fondations + Développement IA (Chapitres 1-2) - 6 heures
- **Jour 2** : Configuration + Infrastructure (Chapitres 3-4) - 6 heures  
- **Jour 3** : Modèles Avancés + Production (Chapitres 5-8) - 8 heures
- **Suivi** : Mentorat optionnel de 2 semaines pour finaliser les projets

**⚡ Briefing Exécutif (4-6 heures)**
- **Aperçu Stratégique** : Proposition de valeur d'AZD et impact sur l'entreprise (1 heure)
- **Démonstration Pratique** : Déploiement d'une application IA de bout en bout (2 heures)
- **Revue d'Architecture** : Modèles d'entreprise et gouvernance (1 heure)
- **Planification de Mise en Œuvre** : Stratégie d'adoption organisationnelle (1-2 heures)

#### 🛠️ Méthodologie d'Apprentissage en Atelier
**Approche Découverte → Déploiement → Personnalisation pour développer des compétences pratiques**

**Phase 1 : Découverte (45 minutes)**
- **Exploration des Modèles** : Évaluer les modèles et services Azure AI Foundry
- **Analyse d'Architecture** : Comprendre les modèles multi-agents et les stratégies de déploiement
- **Évaluation des Besoins** : Identifier les besoins et contraintes organisationnels
- **Configuration de l'Environnement** : Configurer l'environnement de développement et les ressources Azure

**Phase 2 : Déploiement (2 heures)**
- **Mise en Œuvre Guidée** : Déploiement pas à pas d'applications IA avec AZD
- **Configuration des Services** : Configurer les services Azure AI, points de terminaison et authentification
- **Mise en Place de la Sécurité** : Appliquer des modèles de sécurité d'entreprise et des contrôles d'accès
- **Tests de Validation** : Vérifier les déploiements et résoudre les problèmes courants

**Phase 3 : Personnalisation (45 minutes)**
- **Modification d'Application** : Adapter les modèles à des cas d'utilisation et besoins spécifiques
- **Optimisation pour la Production** : Implémenter la surveillance, la gestion des coûts et les stratégies de mise à l'échelle
- **Modèles Avancés** : Explorer la coordination multi-agents et les architectures complexes
- **Planification des Étapes Suivantes** : Définir un chemin d'apprentissage pour développer davantage vos compétences

#### 🎯 Résultats d'Apprentissage en Atelier
**Compétences mesurables développées grâce à la pratique**

**Compétences Techniques :**
- **Déployer des Applications IA en Production** : Déployer et configurer avec succès des solutions alimentées par l'IA
- **Maîtrise de l'Infrastructure as Code** : Créer et gérer des modèles Bicep personnalisés
- **Architecture Multi-Agents** : Implémenter des solutions coordonnées d'agents IA
- **Préparation à la Production** : Appliquer des modèles de sécurité, de surveillance et de gouvernance
- **Expertise en Dépannage** : Résoudre de manière autonome les problèmes de déploiement et de configuration

**Compétences Professionnelles :**
- **Leadership de Projet** : Diriger des équipes techniques dans des initiatives de déploiement cloud
- **Conception d'Architecture** : Concevoir des solutions Azure évolutives et rentables
- **Transfert de Connaissances** : Former et encadrer des collègues sur les meilleures pratiques AZD
- **Planification Stratégique** : Influencer les stratégies d'adoption cloud organisationnelles

#### 📋 Ressources et Matériaux pour l'Atelier
**Boîte à outils complète pour les animateurs et les apprenants**

**Pour les Animateurs :**
- **Guide de l'Instructeur** : [Guide d'Animation d'Atelier](workshop/docs/instructor-guide.md) - Conseils pour planifier et animer les sessions
- **Matériaux de Présentation** : Diaporamas, diagrammes d'architecture et scripts de démonstration
- **Outils d'Évaluation** : Exercices pratiques, vérifications des connaissances et grilles d'évaluation
- **Configuration Technique** : Configuration de l'environnement, guides de dépannage et plans de secours

**Pour les Apprenants :**
- **Environnement d'Atelier Interactif** : [Matériaux d'Atelier](workshop/README.md) - Plateforme d'apprentissage basée sur le navigateur
- **Instructions Pas à Pas** : [Exercices Guidés](../../workshop/docs/instructions) - Tutoriels détaillés
- **Documentation de Référence** : [Laboratoire d'Atelier IA](docs/ai-foundry/ai-workshop-lab.md) - Approfondissements axés sur l'IA
- **Ressources Communautaires** : Canaux Discord Azure, discussions GitHub et support d'experts

#### 🏢 Mise en Œuvre d'Ateliers en Entreprise
**Stratégies de déploiement et de formation organisationnelles**

**Programmes de Formation en Entreprise :**
- **Intégration des Développeurs** : Orientation des nouvelles recrues avec les fondamentaux AZD (2-4 semaines)
- **Montée en Compétences des Équipes** : Ateliers trimestriels pour les équipes de développement existantes (1-2 jours)
- **Revue d'Architecture** : Sessions mensuelles pour les ingénieurs et architectes seniors (4 heures)
- **Briefings pour Dirigeants** : Ateliers exécutifs pour les décideurs techniques (demi-journée)

**Support de Mise en Œuvre :**
- **Conception d'Ateliers Personnalisés** : Contenu adapté aux besoins spécifiques de l'organisation
- **Gestion de Programmes Pilotes** : Déploiement structuré avec des métriques de succès et des boucles de retour
- **Mentorat Continu** : Support post-atelier pour la mise en œuvre des projets
- **Création de Communauté** : Communautés internes de développeurs Azure AI et partage de connaissances

**Métriques de Succès :**
- **Acquisition de Compétences** : Évaluations avant/après mesurant la croissance des compétences techniques
- **Succès des Déploiements** : Pourcentage de participants déployant avec succès des applications en production
- **Temps de Productivité** : Réduction du temps d'intégration pour les nouveaux projets Azure AI
- **Rétention des Connaissances** : Évaluations de suivi 3-6 mois après l'atelier

## Structure d'Apprentissage en 8 Chapitres

### Chapitre 1 : Fondations & Démarrage Rapide (30-45 minutes) 🌱
**Prérequis** : Abonnement Azure, connaissances de base en ligne de commande  
**Complexité** : ⭐

#### Ce que Vous Apprendrez
- Comprendre les fondamentaux d'Azure Developer CLI
- Installer AZD sur votre plateforme  
- Votre premier déploiement réussi
- Concepts et terminologie de base

#### Ressources d'Apprentissage
- [Bases d'AZD](docs/getting-started/azd-basics.md) - Concepts de base
- [Installation & Configuration](docs/getting-started/installation.md) - Guides spécifiques à la plateforme
- [Votre Premier Projet](docs/getting-started/first-project.md) - Tutoriel pratique
- [Fiche de Référence des Commandes](resources/cheat-sheet.md) - Référence rapide

#### Résultat Pratique
Déployer avec succès une application web simple sur Azure en utilisant AZD

---

### Chapitre 2 : Développement Axé sur l'IA (1-2 heures) 🤖
**Prérequis** : Chapitre 1 terminé  
**Complexité** : ⭐⭐

#### Ce que Vous Apprendrez
- Intégration de Microsoft Foundry avec AZD
- Déploiement d'applications alimentées par l'IA
- Comprendre les configurations des services IA
- Modèles RAG (Retrieval-Augmented Generation)

#### Ressources d'Apprentissage
- [Intégration Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- [Déploiement de Modèles IA](docs/microsoft-foundry/ai-model-deployment.md)
- [Laboratoire d'Atelier IA](docs/microsoft-foundry/ai-workshop-lab.md) - **NOUVEAU** : Laboratoire pratique complet de 2-3 heures
- [Guide d'Atelier Interactif](workshop/README.md) - **NOUVEAU** : Atelier basé sur le navigateur avec aperçu MkDocs
- [Modèles Microsoft Foundry](README.md#featured-microsoft-foundry-templates)
- [Instructions d'Atelier](../../workshop/docs/instructions) - **NOUVEAU** : Exercices guidés pas à pas

#### Résultat Pratique
Déployer et configurer une application de chat alimentée par l'IA avec des capacités RAG

#### Parcours d'Apprentissage en Atelier (Amélioration Optionnelle)
**Nouvelle Expérience Interactive** : [Guide Complet de l'Atelier](workshop/README.md)
1. **Découverte** (30 min) : Sélection et évaluation des modèles
2. **Déploiement** (45 min) : Déployer et valider la fonctionnalité du modèle IA  
3. **Déconstruction** (30 min) : Comprendre l'architecture et les composants du modèle
4. **Configuration** (30 min) : Personnaliser les paramètres et réglages
5. **Personnalisation** (45 min) : Modifier et itérer pour l'adapter à vos besoins
6. **Démantèlement** (15 min) : Nettoyer les ressources et comprendre le cycle de vie
7. **Conclusion** (15 min) : Étapes suivantes et parcours d'apprentissage avancé

---

### Chapitre 3 : Configuration & Authentification (45-60 minutes) ⚙️
**Prérequis** : Chapitre 1 terminé  
**Complexité** : ⭐⭐

#### Ce que Vous Apprendrez
- Configuration et gestion des environnements
- Meilleures pratiques en matière d'authentification et de sécurité
- Nommage et organisation des ressources
- Déploiements multi-environnements

#### Ressources d'Apprentissage
- [Guide de Configuration](docs/getting-started/configuration.md) - Configuration des environnements
- [Modèles de Sécurité et d'Authentification](docs/getting-started/authsecurity.md) - Intégration d'identité managée et Key Vault
- Exemples multi-environnements

#### Résultat Pratique
Gérer plusieurs environnements avec une authentification et une sécurité appropriées

---

### Chapitre 4 : Infrastructure as Code & Déploiement (1-1,5 heures) 🏗️
**Prérequis** : Chapitres 1-3 terminés  
**Complexité** : ⭐⭐⭐

#### Ce que Vous Apprendrez
- Modèles de déploiement avancés
- Infrastructure as Code avec Bicep
- Stratégies de provisionnement des ressources
- Création de modèles personnalisés

- Déploiement d'applications conteneurisées avec Azure Container Apps et AZD

#### Ressources d'Apprentissage
- [Guide de Déploiement](docs/deployment/deployment-guide.md) - Flux de travail complets
- [Provisionnement des Ressources](docs/deployment/provisioning.md) - Gestion des ressources
- Exemples de conteneurs et microservices
- [Exemples d'Applications Conteneurisées](examples/container-app/README.md) - Modèles de déploiement rapide, production et avancé

#### Résultat Pratique
Déployer des applications complexes multi-services en utilisant des modèles d'infrastructure personnalisés

---

### Chapitre 5 : Solutions IA Multi-Agents (2-3 heures) 🤖🤖
**Prérequis** : Chapitres 1-2 terminés  
**Complexité** : ⭐⭐⭐⭐

#### Ce que Vous Apprendrez
- Modèles d'architecture multi-agents
- Orchestration et coordination des agents
- Déploiements IA prêts pour la production
- Implémentations d'agents Client et Inventaire

- Intégration de microservices conteneurisés dans des solutions basées sur des agents

#### Ressources d'Apprentissage
- [Solution Multi-Agents pour le Commerce de Détail](examples/retail-scenario.md) - Implémentation complète
- [Package de Modèles ARM](../../examples/retail-multiagent-arm-template) - Déploiement en un clic
- Modèles de coordination multi-agents
- [Exemple d'Architecture Microservices](../../examples/container-app/microservices) - Communication service-à-service, messagerie asynchrone et déploiement en production

#### Résultat Pratique
Déployer et gérer une solution IA multi-agents prête pour la production

---

### Chapitre 6 : Validation & Planification Pré-Déploiement (1 heure) 🔍
**Prérequis** : Chapitre 4 terminé  
**Complexité** : ⭐⭐

#### Ce que Vous Apprendrez
- Planification de capacité et validation des ressources
- Stratégies de sélection des SKU
- Vérifications préalables et automatisation
- Planification d'optimisation des coûts

#### Ressources d'Apprentissage
- [Planification de Capacité](docs/pre-deployment/capacity-planning.md) - Validation des ressources
- [Sélection des SKU](docs/pre-deployment/sku-selection.md) - Choix rentables
- [Vérifications Préalables](docs/pre-deployment/preflight-checks.md) - Scripts automatisés
- [Intégration Application Insights](docs/pre-deployment/application-insights.md) - Surveillance et observabilité
- [Modèles de Coordination Multi-Agents](docs/pre-deployment/coordination-patterns.md) - Stratégies d'orchestration des agents

#### Résultat Pratique
Valider et optimiser les déploiements avant exécution

---

### Chapitre 7 : Dépannage et débogage (1-1,5 heures) 🔧
**Prérequis** : Tout chapitre sur les déploiements terminé  
**Complexité** : ⭐⭐

#### Ce que vous apprendrez
- Approches systématiques de débogage
- Problèmes courants et solutions
- Dépannage spécifique à l'IA
- Optimisation des performances

#### Ressources d'apprentissage
- [Problèmes courants](docs/troubleshooting/common-issues.md) - FAQ et solutions
- [Guide de débogage](docs/troubleshooting/debugging.md) - Stratégies étape par étape
- [Dépannage spécifique à l'IA](docs/troubleshooting/ai-troubleshooting.md) - Problèmes liés aux services IA

#### Résultat pratique
Diagnostiquer et résoudre de manière autonome les problèmes courants de déploiement

---

### Chapitre 8 : Modèles de production et d'entreprise (2-3 heures) 🏢
**Prérequis** : Chapitres 1 à 4 terminés  
**Complexité** : ⭐⭐⭐⭐

#### Ce que vous apprendrez
- Stratégies de déploiement en production
- Modèles de sécurité pour les entreprises
- Surveillance et optimisation des coûts
- Évolutivité et gouvernance

- Bonnes pratiques pour les déploiements d'applications conteneurisées en production (sécurité, surveillance, coûts, CI/CD)

#### Ressources d'apprentissage
- [Bonnes pratiques IA en production](docs/microsoft-foundry/production-ai-practices.md) - Modèles pour les entreprises
- Exemples de microservices et d'entreprises
- Cadres de surveillance et de gouvernance
- [Exemple d'architecture de microservices](../../examples/container-app/microservices) - Déploiement blue-green/canary, traçage distribué et optimisation des coûts

#### Résultat pratique
Déployer des applications prêtes pour l'entreprise avec des capacités complètes de production

---

## Progression d'apprentissage et complexité

### Développement progressif des compétences

- **🌱 Débutants** : Commencez par le Chapitre 1 (Fondations) → Chapitre 2 (Développement IA)
- **🔧 Intermédiaire** : Chapitres 3-4 (Configuration & Infrastructure) → Chapitre 6 (Validation)
- **🚀 Avancé** : Chapitre 5 (Solutions multi-agents) → Chapitre 7 (Dépannage)
- **🏢 Entreprise** : Complétez tous les chapitres, concentrez-vous sur le Chapitre 8 (Modèles de production)

- **Parcours Application Conteneurisée** : Chapitres 4 (Déploiement conteneurisé), 5 (Intégration des microservices), 8 (Bonnes pratiques en production)

### Indicateurs de complexité

- **⭐ Basique** : Concepts simples, tutoriels guidés, 30-60 minutes
- **⭐⭐ Intermédiaire** : Concepts multiples, pratique pratique, 1-2 heures  
- **⭐⭐⭐ Avancé** : Architectures complexes, solutions personnalisées, 1-3 heures
- **⭐⭐⭐⭐ Expert** : Systèmes de production, modèles d'entreprise, 2-4 heures

### Parcours d'apprentissage flexibles

#### 🎯 Parcours rapide pour développeurs IA (4-6 heures)
1. **Chapitre 1** : Fondations & Démarrage rapide (45 min)
2. **Chapitre 2** : Développement IA-First (2 heures)  
3. **Chapitre 5** : Solutions IA multi-agents (3 heures)
4. **Chapitre 8** : Bonnes pratiques IA en production (1 heure)

#### 🛠️ Parcours spécialiste infrastructure (5-7 heures)
1. **Chapitre 1** : Fondations & Démarrage rapide (45 min)
2. **Chapitre 3** : Configuration & Authentification (1 heure)
3. **Chapitre 4** : Infrastructure as Code & Déploiement (1,5 heure)
4. **Chapitre 6** : Validation & Planification pré-déploiement (1 heure)
5. **Chapitre 7** : Dépannage & Débogage (1,5 heure)
6. **Chapitre 8** : Modèles de production & d'entreprise (2 heures)

#### 🎓 Parcours complet d'apprentissage (8-12 heures)
Achèvement séquentiel des 8 chapitres avec pratique et validation

## Cadre de validation des connaissances

### Validation des connaissances
- **Points de contrôle des chapitres** : Exercices pratiques avec résultats mesurables
- **Vérification pratique** : Déployer des solutions fonctionnelles pour chaque chapitre
- **Suivi des progrès** : Indicateurs visuels et badges de complétion
- **Validation communautaire** : Partager des expériences sur les canaux Discord Azure

### Évaluation des résultats d'apprentissage

#### Achèvement des chapitres 1-2 (Fondations + IA)
- ✅ Déployer une application web de base avec AZD
- ✅ Déployer une application de chat IA avec RAG
- ✅ Comprendre les concepts de base d'AZD et l'intégration IA

#### Achèvement des chapitres 3-4 (Configuration + Infrastructure)  
- ✅ Gérer des déploiements multi-environnements
- ✅ Créer des modèles d'infrastructure personnalisés avec Bicep
- ✅ Implémenter des modèles d'authentification sécurisés

#### Achèvement des chapitres 5-6 (Multi-agents + Validation)
- ✅ Déployer une solution IA multi-agents complexe
- ✅ Réaliser une planification de capacité et une optimisation des coûts
- ✅ Implémenter une validation pré-déploiement automatisée

#### Achèvement des chapitres 7-8 (Dépannage + Production)
- ✅ Déboguer et résoudre des problèmes de déploiement de manière autonome  
- ✅ Implémenter une surveillance et une sécurité de niveau entreprise
- ✅ Déployer des applications prêtes pour la production avec gouvernance

### Certification et reconnaissance
- **Badge de complétion de cours** : Compléter les 8 chapitres avec validation pratique
- **Reconnaissance communautaire** : Participation active sur Discord Microsoft Foundry
- **Développement professionnel** : Compétences pertinentes en déploiement AZD et IA
- **Avancement de carrière** : Capacités de déploiement cloud prêtes pour l'entreprise

## 🎓 Résultats d'apprentissage complets

### Niveau Fondations (Chapitres 1-2)
Après avoir terminé les chapitres de fondation, les apprenants démontreront :

**Compétences techniques :**
- Déployer des applications web simples sur Azure avec des commandes AZD
- Configurer et déployer des applications de chat IA avec des capacités RAG
- Comprendre les concepts de base d'AZD : modèles, environnements, workflows de provisionnement
- Intégrer les services Microsoft Foundry avec des déploiements AZD
- Naviguer dans les configurations des services Azure AI et les points de terminaison API

**Compétences professionnelles :**
- Suivre des workflows de déploiement structurés pour des résultats cohérents
- Dépanner des problèmes de déploiement de base à l'aide des journaux et de la documentation
- Communiquer efficacement sur les processus de déploiement cloud
- Appliquer les meilleures pratiques pour une intégration sécurisée des services IA

**Vérification de l'apprentissage :**
- ✅ Déployer avec succès le modèle `todo-nodejs-mongo`
- ✅ Déployer et configurer `azure-search-openai-demo` avec RAG
- ✅ Compléter les exercices interactifs de l'atelier (phase de découverte)
- ✅ Participer aux discussions communautaires sur Discord Azure

### Niveau Intermédiaire (Chapitres 3-4)
Après avoir terminé les chapitres intermédiaires, les apprenants démontreront :

**Compétences techniques :**
- Gérer des déploiements multi-environnements (dev, staging, production)
- Créer des modèles Bicep personnalisés pour l'infrastructure as code
- Implémenter des modèles d'authentification sécurisés avec identité managée
- Déployer des applications multi-services complexes avec des configurations personnalisées
- Optimiser les stratégies de provisionnement des ressources pour les coûts et les performances

**Compétences professionnelles :**
- Concevoir des architectures d'infrastructure évolutives
- Implémenter les meilleures pratiques de sécurité pour les déploiements cloud
- Documenter les modèles d'infrastructure pour la collaboration en équipe
- Évaluer et sélectionner les services Azure appropriés pour les besoins

**Vérification de l'apprentissage :**
- ✅ Configurer des environnements distincts avec des paramètres spécifiques à chaque environnement
- ✅ Créer et déployer un modèle Bicep personnalisé pour une application multi-services
- ✅ Implémenter une authentification par identité managée pour un accès sécurisé
- ✅ Compléter des exercices de gestion de configuration avec des scénarios réels

### Niveau Avancé (Chapitres 5-6)
Après avoir terminé les chapitres avancés, les apprenants démontreront :

**Compétences techniques :**
- Déployer et orchestrer des solutions IA multi-agents avec des workflows coordonnés
- Implémenter des architectures d'agents Client et Inventaire pour des scénarios de vente au détail
- Réaliser une planification de capacité et une validation complète des ressources
- Exécuter une validation pré-déploiement automatisée et une optimisation
- Concevoir des sélections de SKU rentables basées sur les besoins de charge de travail

**Compétences professionnelles :**
- Architecturer des solutions IA complexes pour des environnements de production
- Diriger des discussions techniques sur les stratégies de déploiement IA
- Encadrer des développeurs juniors sur les meilleures pratiques de déploiement AZD et IA
- Évaluer et recommander des modèles d'architecture IA pour les besoins métier

**Vérification de l'apprentissage :**
- ✅ Déployer une solution multi-agents complète pour le commerce de détail avec des modèles ARM
- ✅ Démontrer la coordination des agents et l'orchestration des workflows
- ✅ Compléter des exercices de planification de capacité avec des contraintes réelles de ressources
- ✅ Valider la préparation au déploiement via des vérifications préalables automatisées

### Niveau Expert (Chapitres 7-8)
Après avoir terminé les chapitres experts, les apprenants démontreront :

**Compétences techniques :**
- Diagnostiquer et résoudre de manière autonome des problèmes de déploiement complexes
- Implémenter des modèles de sécurité et des cadres de gouvernance de niveau entreprise
- Concevoir des stratégies complètes de surveillance et d'alerte
- Optimiser les déploiements en production pour l'échelle, les coûts et les performances
- Établir des pipelines CI/CD avec tests et validations appropriés

**Compétences professionnelles :**
- Diriger des initiatives de transformation cloud pour les entreprises
- Concevoir et implémenter des standards organisationnels de déploiement
- Former et encadrer des équipes de développement sur les pratiques avancées AZD
- Influencer les décisions techniques pour les déploiements IA d'entreprise

**Vérification de l'apprentissage :**
- ✅ Résoudre des échecs complexes de déploiement multi-services
- ✅ Implémenter des modèles de sécurité d'entreprise conformes aux exigences
- ✅ Concevoir et déployer une surveillance en production avec Application Insights
- ✅ Compléter l'implémentation d'un cadre de gouvernance d'entreprise

## 🎯 Certification de complétion du cours

### Cadre de suivi des progrès
Suivez vos progrès d'apprentissage grâce à des points de contrôle structurés :

- [ ] **Chapitre 1** : Fondations & Démarrage rapide ✅
- [ ] **Chapitre 2** : Développement IA-First ✅  
- [ ] **Chapitre 3** : Configuration & Authentification ✅
- [ ] **Chapitre 4** : Infrastructure as Code & Déploiement ✅
- [ ] **Chapitre 5** : Solutions IA multi-agents ✅
- [ ] **Chapitre 6** : Validation & Planification pré-déploiement ✅
- [ ] **Chapitre 7** : Dépannage & Débogage ✅
- [ ] **Chapitre 8** : Modèles de production & d'entreprise ✅

### Processus de vérification
Après avoir terminé chaque chapitre, vérifiez vos connaissances via :

1. **Achèvement des exercices pratiques** : Déployer des solutions fonctionnelles pour chaque chapitre
2. **Évaluation des connaissances** : Revoir les sections FAQ et compléter les auto-évaluations
3. **Engagement communautaire** : Partager des expériences et obtenir des retours sur Discord Azure
4. **Développement de portfolio** : Documenter vos déploiements et leçons apprises
5. **Revue par les pairs** : Collaborer avec d'autres apprenants sur des scénarios complexes

### Avantages de la complétion du cours
Après avoir complété tous les chapitres avec vérification, les diplômés disposeront de :

**Expertise technique :**
- **Expérience en production** : Déploiement d'applications IA réelles dans des environnements Azure
- **Compétences professionnelles** : Capacités de déploiement et de dépannage prêtes pour l'entreprise  
- **Connaissances en architecture** : Solutions IA multi-agents et modèles d'infrastructure complexes
- **Maîtrise du dépannage** : Résolution indépendante des problèmes de déploiement et de configuration

**Développement professionnel :**
- **Reconnaissance dans l'industrie** : Compétences vérifiables dans des domaines AZD et IA très demandés
- **Avancement de carrière** : Qualifications pour des rôles d'architecte cloud et de spécialiste en déploiement IA
- **Leadership communautaire** : Participation active dans les communautés de développeurs Azure et IA
- **Apprentissage continu** : Base pour une spécialisation avancée Microsoft Foundry

**Atouts pour le portfolio :**
- **Solutions déployées** : Exemples fonctionnels d'applications IA et de modèles d'infrastructure
- **Documentation** : Guides de déploiement complets et procédures de dépannage  
- **Contributions communautaires** : Discussions, exemples et améliorations partagés avec la communauté Azure
- **Réseau professionnel** : Connexions avec des experts Azure et des praticiens du déploiement IA

### Parcours d'apprentissage post-cours
Les diplômés sont préparés pour une spécialisation avancée dans :
- **Expert Microsoft Foundry** : Spécialisation approfondie dans le déploiement et l'orchestration de modèles IA
- **Leadership en architecture cloud** : Conception et gouvernance de déploiements à l'échelle de l'entreprise
- **Leadership communautaire pour les développeurs** : Contribution aux exemples Azure et aux ressources communautaires
- **Formation en entreprise** : Enseignement des compétences en déploiement AZD et IA au sein des organisations

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->