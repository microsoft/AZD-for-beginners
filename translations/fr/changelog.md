<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f5b8f32f488b99a90718a42137621194",
  "translation_date": "2025-11-19T14:16:59+00:00",
  "source_file": "changelog.md",
  "language_code": "fr"
}
-->
# Journal des modifications - AZD pour les débutants

## Introduction

Ce journal des modifications documente tous les changements notables, mises à jour et améliorations apportés au dépôt AZD pour les débutants. Nous suivons les principes de versionnement sémantique et maintenons ce journal pour aider les utilisateurs à comprendre ce qui a changé entre les versions.

## Objectifs d'apprentissage

En consultant ce journal des modifications, vous pourrez :
- Rester informé des nouvelles fonctionnalités et ajouts de contenu
- Comprendre les améliorations apportées à la documentation existante
- Suivre les corrections de bugs et garantir l'exactitude
- Suivre l'évolution des supports d'apprentissage au fil du temps

## Résultats d'apprentissage

Après avoir consulté les entrées du journal des modifications, vous serez capable de :
- Identifier les nouveaux contenus et ressources disponibles pour l'apprentissage
- Comprendre quelles sections ont été mises à jour ou améliorées
- Planifier votre parcours d'apprentissage en fonction des supports les plus récents
- Contribuer avec des retours et suggestions pour de futures améliorations

## Historique des versions

### [v3.7.0] - 2025-11-19

#### Améliorations de la qualité de la documentation et nouvel exemple Azure OpenAI
**Cette version améliore la qualité de la documentation dans tout le dépôt et ajoute un exemple complet de déploiement Azure OpenAI avec une interface de chat GPT-4.**

#### Ajouté
- **🤖 Exemple de chat Azure OpenAI** : Déploiement complet de GPT-4 avec une implémentation fonctionnelle dans `examples/azure-openai-chat/` :
  - Infrastructure Azure OpenAI complète (déploiement du modèle GPT-4)
  - Interface de chat en ligne de commande Python avec historique des conversations
  - Intégration Key Vault pour un stockage sécurisé des clés API
  - Suivi de l'utilisation des jetons et estimation des coûts
  - Limitation du débit et gestion des erreurs
  - README complet avec guide de déploiement en 35-45 minutes
  - 11 fichiers prêts pour la production (modèles Bicep, application Python, configuration)
- **📚 Exercices de documentation** : Ajout d'exercices pratiques au guide de configuration :
  - Exercice 1 : Configuration multi-environnements (15 minutes)
  - Exercice 2 : Pratique de gestion des secrets (10 minutes)
  - Critères de réussite clairs et étapes de vérification
- **✅ Vérification du déploiement** : Section de vérification ajoutée au guide de déploiement :
  - Procédures de vérification de l'état
  - Liste de contrôle des critères de réussite
  - Résultats attendus pour toutes les commandes de déploiement
  - Référence rapide pour le dépannage

#### Amélioré
- **examples/README.md** : Mis à jour à une qualité de niveau A (93 %) :
  - Ajout de azure-openai-chat à toutes les sections pertinentes
  - Mise à jour du nombre d'exemples locaux de 3 à 4
  - Ajout au tableau des exemples d'applications IA
  - Intégré dans le guide de démarrage rapide pour utilisateurs intermédiaires
  - Ajout à la section des modèles Azure AI Foundry
  - Mise à jour du tableau comparatif et des sections de recherche technologique
- **Qualité de la documentation** : Améliorée de B+ (87 %) → A- (92 %) dans le dossier docs :
  - Ajout des résultats attendus aux exemples de commandes critiques
  - Inclusion d'étapes de vérification pour les changements de configuration
  - Apprentissage pratique renforcé avec des exercices concrets

#### Modifié
- **Progression d'apprentissage** : Meilleure intégration des exemples IA pour les apprenants intermédiaires
- **Structure de la documentation** : Exercices plus concrets avec des résultats clairs
- **Processus de vérification** : Critères de réussite explicites ajoutés aux flux de travail clés

#### Amélioré
- **Expérience développeur** : Le déploiement Azure OpenAI prend désormais 35-45 minutes (contre 60-90 pour des alternatives complexes)
- **Transparence des coûts** : Estimations claires des coûts (50-200 $/mois) pour l'exemple Azure OpenAI
- **Parcours d'apprentissage** : Les développeurs IA disposent d'un point d'entrée clair avec azure-openai-chat
- **Normes de documentation** : Résultats attendus et étapes de vérification cohérents

#### Validé
- ✅ Exemple Azure OpenAI entièrement fonctionnel avec `azd up`
- ✅ Les 11 fichiers d'implémentation sont syntaxiquement corrects
- ✅ Les instructions README correspondent à l'expérience réelle de déploiement
- ✅ Liens de documentation mis à jour dans plus de 8 emplacements
- ✅ L'index des exemples reflète avec précision 4 exemples locaux
- ✅ Aucun lien externe en double dans les tableaux
- ✅ Toutes les références de navigation sont correctes

#### Résultats de notation de la documentation
- **getting-started/installation.md** : A- (92 %)
- **getting-started/azd-basics.md** : A (94 %)
- **getting-started/first-project.md** : A- (93 %)
- **getting-started/configuration.md** : B+ (88 %) → A- (92 %) ✅ AMÉLIORÉ
- **deployment/deployment-guide.md** : B+ (87 %) → A- (91 %) ✅ AMÉLIORÉ
- **ai-foundry/production-ai-practices.md** : A- (91 %)
- **troubleshooting/common-issues.md** : A- (92 %)
- **Documentation globale** : B+ (87 %) → A- (92 %) ✅ AMÉLIORÉ

#### Mise en œuvre technique
- **Architecture Azure OpenAI** : Modèle GPT-4 + Key Vault + Container Apps
- **Sécurité** : Prêt pour Managed Identity, secrets dans Key Vault
- **Surveillance** : Intégration Application Insights
- **Gestion des coûts** : Suivi des jetons et optimisation de l'utilisation
- **Déploiement** : Commande unique `azd up` pour une configuration complète

### [v3.6.0] - 2025-11-19

#### Mise à jour majeure : Exemples de déploiement d'applications conteneurisées
**Cette version introduit des exemples complets et prêts pour la production de déploiement d'applications conteneurisées à l'aide d'Azure Developer CLI (AZD), avec documentation complète et intégration dans le parcours d'apprentissage.**

#### Ajouté
- **🚀 Exemples d'applications conteneurisées** : Nouveaux exemples locaux dans `examples/container-app/` :
  - [Guide principal](examples/container-app/README.md) : Vue d'ensemble complète des déploiements conteneurisés, démarrage rapide, production et modèles avancés
  - [API Flask simple](../../examples/container-app/simple-flask-api) : API REST conviviale pour les débutants avec mise à l'échelle à zéro, sondes de santé, surveillance et dépannage
  - [Architecture microservices](../../examples/container-app/microservices) : Déploiement multi-services prêt pour la production (API Gateway, Product, Order, User, Notification), messagerie asynchrone, Service Bus, Cosmos DB, Azure SQL, traçage distribué, déploiement blue-green/canary
- **Bonnes pratiques** : Sécurité, surveillance, optimisation des coûts et conseils CI/CD pour les charges de travail conteneurisées
- **Exemples de code** : `azure.yaml` complet, modèles Bicep et implémentations de services multi-langages (Python, Node.js, C#, Go)
- **Tests et dépannage** : Scénarios de test de bout en bout, commandes de surveillance, guide de dépannage

#### Modifié
- **README.md** : Mis à jour pour présenter et lier les nouveaux exemples d'applications conteneurisées sous "Exemples locaux - Applications conteneurisées"
- **examples/README.md** : Mis à jour pour mettre en avant les exemples d'applications conteneurisées, ajouter des entrées au tableau comparatif et mettre à jour les références technologiques/architecturales
- **Plan de cours et guide d'étude** : Mis à jour pour référencer les nouveaux exemples d'applications conteneurisées et les modèles de déploiement dans les chapitres pertinents

#### Validé
- ✅ Tous les nouveaux exemples déployables avec `azd up` et suivent les bonnes pratiques
- ✅ Liens croisés et navigation dans la documentation mis à jour
- ✅ Les exemples couvrent des scénarios allant des débutants aux avancés, y compris des microservices en production

#### Notes
- **Portée** : Documentation et exemples en anglais uniquement
- **Prochaines étapes** : Étendre avec des modèles conteneurisés avancés supplémentaires et une automatisation CI/CD dans les futures versions

### [v3.5.0] - 2025-11-19

#### Rebranding produit : Microsoft Foundry
**Cette version met en œuvre un changement complet de nom de produit, passant de "Azure AI Foundry" à "Microsoft Foundry" dans toute la documentation en anglais, reflétant le rebranding officiel de Microsoft.**

#### Modifié
- **🔄 Mise à jour du nom du produit** : Rebranding complet de "Azure AI Foundry" à "Microsoft Foundry"
  - Mise à jour de toutes les références dans la documentation anglaise du dossier `docs/`
  - Renommage du dossier : `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renommage du fichier : `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total : 23 références de contenu mises à jour dans 7 fichiers de documentation

- **📁 Changements de structure de dossier** :
  - `docs/ai-foundry/` renommé en `docs/microsoft-foundry/`
  - Tous les liens croisés mis à jour pour refléter la nouvelle structure de dossier
  - Liens de navigation validés dans toute la documentation

- **📄 Renommage de fichiers** :
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Tous les liens internes mis à jour pour référencer le nouveau nom de fichier

#### Fichiers mis à jour
- **Documentation des chapitres** (7 fichiers) :
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 mises à jour de liens de navigation
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 références au nom du produit mises à jour
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Déjà à jour avec Microsoft Foundry (depuis des mises à jour précédentes)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 références mises à jour (aperçu, retours de la communauté, documentation)
  - `docs/getting-started/azd-basics.md` - 4 liens croisés mis à jour
  - `docs/getting-started/first-project.md` - 2 liens de navigation de chapitre mis à jour
  - `docs/getting-started/installation.md` - 2 liens vers les chapitres suivants mis à jour
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 références mises à jour (navigation, communauté Discord)
  - `docs/troubleshooting/common-issues.md` - 1 lien de navigation mis à jour
  - `docs/troubleshooting/debugging.md` - 1 lien de navigation mis à jour

- **Fichiers de structure de cours** (2 fichiers) :
  - `README.md` - 17 références mises à jour (aperçu du cours, titres des chapitres, section des modèles, retours de la communauté)
  - `course-outline.md` - 14 références mises à jour (aperçu, objectifs d'apprentissage, ressources des chapitres)

#### Validé
- ✅ Aucune référence restante au chemin de dossier "ai-foundry" dans les documents en anglais
- ✅ Aucune référence restante au nom de produit "Azure AI Foundry" dans les documents en anglais
- ✅ Tous les liens de navigation fonctionnent avec la nouvelle structure de dossier
- ✅ Renommage des fichiers et dossiers effectué avec succès
- ✅ Liens croisés entre chapitres validés

#### Notes
- **Portée** : Changements appliqués uniquement à la documentation en anglais dans le dossier `docs/`
- **Traductions** : Les dossiers de traduction (`translations/`) n'ont pas été mis à jour dans cette version
- **Atelier** : Les supports d'atelier (`workshop/`) n'ont pas été mis à jour dans cette version
- **Exemples** : Les fichiers d'exemple peuvent encore référencer l'ancien nom (à traiter dans une future mise à jour)
- **Liens externes** : Les URL externes et références au dépôt GitHub restent inchangées

#### Guide de migration pour les contributeurs
Si vous avez des branches locales ou des documents référencés avec l'ancienne structure :
1. Mettez à jour les références de dossier : `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Mettez à jour les références de fichier : `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Remplacez le nom du produit : "Azure AI Foundry" → "Microsoft Foundry"
4. Validez que tous les liens internes de la documentation fonctionnent encore

---

### [v3.4.0] - 2025-10-24

#### Aperçu de l'infrastructure et améliorations de validation
**Cette version introduit un support complet pour la nouvelle fonctionnalité d'aperçu de l'infrastructure d'Azure Developer CLI et améliore l'expérience utilisateur des ateliers.**

#### Ajouté
- **🧪 Documentation de la fonctionnalité azd provision --preview** : Couverture complète de la nouvelle capacité d'aperçu de l'infrastructure
  - Référence des commandes et exemples d'utilisation dans la fiche pratique
  - Intégration détaillée dans le guide de provisionnement avec cas d'utilisation et avantages
  - Intégration de vérifications préalables pour un déploiement plus sûr
  - Mises à jour du guide de démarrage avec des pratiques de déploiement axées sur la sécurité
- **🚧 Bannière de statut d'atelier** : Bannière HTML professionnelle indiquant le statut de développement de l'atelier
  - Design en dégradé avec indicateurs de construction pour une communication claire avec l'utilisateur
  - Horodatage de la dernière mise à jour pour plus de transparence
  - Design responsive pour tous les types d'appareils

#### Amélioré
- **Sécurité de l'infrastructure** : Fonctionnalité d'aperçu intégrée dans toute la documentation de déploiement
- **Validation avant déploiement** : Les scripts automatisés incluent désormais des tests d'aperçu de l'infrastructure
- **Flux de travail des développeurs** : Séquences de commandes mises à jour pour inclure l'aperçu comme meilleure pratique
- **Expérience atelier** : Attentes claires définies pour les utilisateurs concernant le statut de développement du contenu

#### Modifié
- **Bonnes pratiques de déploiement** : Le flux de travail basé sur l'aperçu est désormais l'approche recommandée
- **Flux de documentation** : La validation de l'infrastructure déplacée plus tôt dans le processus d'apprentissage
- **Présentation de l'atelier** : Communication professionnelle du statut avec un calendrier de développement clair

#### Amélioré
- **Approche axée sur la sécurité** : Les changements d'infrastructure peuvent désormais être validés avant le déploiement
- **Collaboration en équipe** : Les résultats de l'aperçu peuvent être partagés pour examen et approbation
- **Conscience des coûts** : Meilleure compréhension des coûts des ressources avant le provisionnement
- **Réduction des risques** : Moins d'échecs de déploiement grâce à une validation anticipée

#### Mise en œuvre technique
- **Intégration multi-documents** : Fonctionnalité d'aperçu documentée dans 4 fichiers clés
- **Modèles de commande** : Syntaxe et exemples cohérents dans toute la documentation
- **Intégration des meilleures pratiques** : L'aperçu inclus dans les flux de validation et les scripts
- **Indicateurs visuels** : Marquages clairs NOUVEAU pour une meilleure découvrabilité

#### Infrastructure de l'atelier
- **Communication du statut** : Bannière HTML professionnelle avec style en dégradé
- **Expérience utilisateur** : Statut de développement clair pour éviter toute confusion
- **Présentation professionnelle** : Maintient la crédibilité du dépôt tout en définissant les attentes
- **Transparence du calendrier** : Horodatage d'octobre 2025 pour plus de responsabilité

### [v3.3.0] - 2025-09-24

#### Matériaux d'atelier améliorés et expérience d'apprentissage interactive
**Cette version introduit des matériaux d'atelier complets avec des guides interactifs basés sur le navigateur et des parcours d'apprentissage structurés.**

#### Ajouté
- **🎥 Guide interactif d'atelier** : Expérience d'atelier basée sur le navigateur avec capacité de prévisualisation MkDocs
- **📝 Instructions structurées pour l'atelier** : Parcours d'apprentissage guidé en 7 étapes, de la découverte à la personnalisation
  - 0-Introduction : Vue d'ensemble de l'atelier et configuration
  - 1-Sélectionner-Modèle-AI : Processus de découverte et sélection de modèles
  - 2-Valider-Modèle-AI : Procédures de déploiement et validation
  - 3-Déconstruire-Modèle-AI : Comprendre l'architecture des modèles
  - 4-Configurer-Modèle-AI : Configuration et personnalisation
  - 5-Personnaliser-Modèle-AI : Modifications avancées et itérations
  - 6-Démanteler-Infrastructure : Nettoyage et gestion des ressources
  - 7-Conclure : Résumé et prochaines étapes
- **🛠️ Outils du Workshop** : Configuration MkDocs avec le thème Material pour une expérience d'apprentissage améliorée
- **🎯 Parcours d'apprentissage pratique** : Méthodologie en 3 étapes (Découverte → Déploiement → Personnalisation)
- **📱 Intégration GitHub Codespaces** : Configuration fluide de l'environnement de développement

#### Amélioré
- **Laboratoire du Workshop AI** : Étendu avec une expérience d'apprentissage structurée de 2 à 3 heures
- **Documentation du Workshop** : Présentation professionnelle avec navigation et supports visuels
- **Progression d'apprentissage** : Guide clair étape par étape, de la sélection de modèles au déploiement en production
- **Expérience développeur** : Outils intégrés pour des workflows de développement simplifiés

#### Optimisé
- **Accessibilité** : Interface basée sur navigateur avec recherche, fonction de copie et bascule de thème
- **Apprentissage autonome** : Structure flexible du workshop adaptée à différents rythmes d'apprentissage
- **Application pratique** : Scénarios réels de déploiement de modèles AI
- **Intégration communautaire** : Intégration Discord pour support et collaboration pendant le workshop

#### Fonctionnalités du Workshop
- **Recherche intégrée** : Découverte rapide de mots-clés et leçons
- **Copie des blocs de code** : Fonctionnalité de copie au survol pour tous les exemples de code
- **Bascule de thème** : Support mode sombre/clair selon les préférences
- **Supports visuels** : Captures d'écran et diagrammes pour une meilleure compréhension
- **Intégration d'aide** : Accès direct à Discord pour le support communautaire

### [v3.2.0] - 17/09/2025

#### Restructuration majeure de la navigation et système d'apprentissage par chapitres
**Cette version introduit une structure d'apprentissage par chapitres avec navigation améliorée dans tout le dépôt.**

#### Ajouté
- **📚 Système d'apprentissage par chapitres** : Restructuration complète du cours en 8 chapitres progressifs
  - Chapitre 1 : Fondations & Démarrage rapide (⭐ - 30-45 min)
  - Chapitre 2 : Développement orienté AI (⭐⭐ - 1-2 heures)
  - Chapitre 3 : Configuration & Authentification (⭐⭐ - 45-60 min)
  - Chapitre 4 : Infrastructure en tant que code & Déploiement (⭐⭐⭐ - 1-1,5 heures)
  - Chapitre 5 : Solutions AI multi-agents (⭐⭐⭐⭐ - 2-3 heures)
  - Chapitre 6 : Validation & Planification pré-déploiement (⭐⭐ - 1 heure)
  - Chapitre 7 : Résolution de problèmes & Débogage (⭐⭐ - 1-1,5 heures)
  - Chapitre 8 : Modèles de production & entreprise (⭐⭐⭐⭐ - 2-3 heures)
- **📚 Système de navigation complet** : En-têtes et pieds de page de navigation cohérents dans toute la documentation
- **🎯 Suivi de progression** : Liste de vérification de fin de cours et système de validation d'apprentissage
- **🗺️ Orientation du parcours d'apprentissage** : Points d'entrée clairs pour différents niveaux d'expérience et objectifs
- **🔗 Navigation croisée** : Chapitres liés et prérequis clairement indiqués

#### Amélioré
- **Structure du README** : Transformé en plateforme d'apprentissage structurée avec organisation par chapitres
- **Navigation dans la documentation** : Chaque page inclut le contexte du chapitre et des indications de progression
- **Organisation des modèles** : Exemples et modèles associés aux chapitres d'apprentissage appropriés
- **Intégration des ressources** : Fiches pratiques, FAQ et guides d'étude connectés aux chapitres pertinents
- **Intégration au Workshop** : Laboratoires pratiques associés à plusieurs objectifs d'apprentissage par chapitre

#### Modifié
- **Progression d'apprentissage** : Passage d'une documentation linéaire à un apprentissage flexible par chapitres
- **Placement de la configuration** : Guide de configuration repositionné en Chapitre 3 pour un meilleur flux d'apprentissage
- **Intégration du contenu AI** : Meilleure intégration du contenu spécifique à l'AI tout au long du parcours d'apprentissage
- **Contenu de production** : Modèles avancés consolidés dans le Chapitre 8 pour les apprenants en entreprise

#### Optimisé
- **Expérience utilisateur** : Indicateurs clairs de progression et navigation par chapitres
- **Accessibilité** : Modèles de navigation cohérents pour une traversée plus facile du cours
- **Présentation professionnelle** : Structure de cours de style universitaire adaptée à la formation académique et en entreprise
- **Efficacité d'apprentissage** : Temps réduit pour trouver le contenu pertinent grâce à une organisation améliorée

#### Mise en œuvre technique
- **En-têtes de navigation** : Navigation par chapitres standardisée dans plus de 40 fichiers de documentation
- **Navigation en pied de page** : Indications de progression cohérentes et indicateurs de fin de chapitre
- **Liens croisés** : Système de liaison interne complet connectant les concepts liés
- **Cartographie des chapitres** : Modèles et exemples clairement associés aux objectifs d'apprentissage

#### Amélioration du guide d'étude
- **📚 Objectifs d'apprentissage complets** : Guide d'étude restructuré pour s'aligner sur le système en 8 chapitres
- **🎯 Évaluation par chapitre** : Chaque chapitre inclut des objectifs d'apprentissage spécifiques et des exercices pratiques
- **📋 Suivi de progression** : Programme d'apprentissage hebdomadaire avec résultats mesurables et listes de vérification
- **❓ Questions d'évaluation** : Questions de validation des connaissances pour chaque chapitre avec résultats professionnels
- **🛠️ Exercices pratiques** : Activités pratiques avec scénarios réels de déploiement et résolution de problèmes
- **📊 Progression des compétences** : Avancement clair des concepts de base aux modèles d'entreprise avec focus sur le développement de carrière
- **🎓 Cadre de certification** : Résultats de développement professionnel et système de reconnaissance communautaire
- **⏱️ Gestion du calendrier** : Plan d'apprentissage structuré sur 10 semaines avec validation des étapes clés

### [v3.1.0] - 17/09/2025

#### Solutions AI multi-agents améliorées
**Cette version améliore la solution multi-agents pour le commerce de détail avec une meilleure nomenclature des agents et une documentation enrichie.**

#### Modifié
- **Terminologie multi-agents** : Remplacement de "agent Cora" par "agent Client" dans toute la solution multi-agents pour le commerce de détail pour une meilleure compréhension
- **Architecture des agents** : Mise à jour de toute la documentation, des modèles ARM et des exemples de code pour utiliser une nomenclature cohérente "agent Client"
- **Exemples de configuration** : Modernisation des modèles de configuration des agents avec des conventions de nommage mises à jour
- **Cohérence de la documentation** : Garantie que toutes les références utilisent des noms d'agents professionnels et descriptifs

#### Amélioré
- **Package de modèles ARM** : Mise à jour du modèle retail-multiagent-arm-template avec des références à l'agent Client
- **Diagrammes d'architecture** : Rafraîchissement des diagrammes Mermaid avec des noms d'agents mis à jour
- **Exemples de code** : Les classes Python et exemples d'implémentation utilisent désormais la nomenclature CustomerAgent
- **Variables d'environnement** : Mise à jour de tous les scripts de déploiement pour utiliser les conventions CUSTOMER_AGENT_NAME

#### Optimisé
- **Expérience développeur** : Rôles et responsabilités des agents plus clairs dans la documentation
- **Prêt pour la production** : Meilleur alignement avec les conventions de nommage en entreprise
- **Matériel pédagogique** : Noms d'agents plus intuitifs pour les besoins éducatifs
- **Utilisabilité des modèles** : Compréhension simplifiée des fonctions des agents et des modèles de déploiement

#### Détails techniques
- Diagrammes d'architecture Mermaid mis à jour avec des références CustomerAgent
- Remplacement des noms de classe CoraAgent par CustomerAgent dans les exemples Python
- Modifications des configurations JSON des modèles ARM pour utiliser le type d'agent "client"
- Mise à jour des variables d'environnement de CORA_AGENT_* à CUSTOMER_AGENT_*
- Rafraîchissement de toutes les commandes de déploiement et configurations de conteneurs

### [v3.0.0] - 12/09/2025

#### Changements majeurs - Focus développeur AI et intégration Azure AI Foundry
**Cette version transforme le dépôt en une ressource complète axée sur l'apprentissage AI avec intégration Azure AI Foundry.**

#### Ajouté
- **🤖 Parcours d'apprentissage AI-First** : Restructuration complète priorisant les développeurs et ingénieurs AI
- **Guide d'intégration Azure AI Foundry** : Documentation complète pour connecter AZD aux services Azure AI Foundry
- **Modèles de déploiement AI** : Guide détaillé couvrant la sélection, configuration et stratégies de déploiement en production
- **Laboratoire du Workshop AI** : Workshop pratique de 2-3 heures pour convertir des applications AI en solutions déployables AZD
- **Meilleures pratiques AI en production** : Modèles prêts pour l'entreprise pour l'évolutivité, la surveillance et la sécurisation des charges AI
- **Guide de dépannage spécifique AI** : Résolution complète des problèmes liés à Azure OpenAI, Cognitive Services et déploiements AI
- **Galerie de modèles AI** : Collection de modèles Azure AI Foundry avec évaluations de complexité
- **Matériel du Workshop** : Structure complète du workshop avec laboratoires pratiques et matériel de référence

#### Amélioré
- **Structure du README** : Axée sur les développeurs AI avec 45 % de données d'intérêt communautaire provenant de Discord Azure AI Foundry
- **Parcours d'apprentissage** : Parcours dédié aux développeurs AI en parallèle des parcours traditionnels pour étudiants et ingénieurs DevOps
- **Recommandations de modèles** : Modèles AI recommandés incluant azure-search-openai-demo, contoso-chat et openai-chat-app-quickstart
- **Intégration communautaire** : Support communautaire Discord amélioré avec des canaux et discussions spécifiques AI

#### Focus sur la sécurité et la production
- **Modèles d'identité gérée** : Configurations d'authentification et sécurité spécifiques AI
- **Optimisation des coûts** : Suivi de l'utilisation des tokens et contrôle budgétaire pour les charges AI
- **Déploiement multi-régions** : Stratégies pour le déploiement global des applications AI
- **Surveillance des performances** : Intégration de métriques spécifiques AI et Application Insights

#### Qualité de la documentation
- **Structure de cours linéaire** : Progression logique des modèles de déploiement AI débutants à avancés
- **URLs validées** : Tous les liens externes du dépôt vérifiés et accessibles
- **Références complètes** : Tous les liens internes de la documentation validés et fonctionnels
- **Prêt pour la production** : Modèles de déploiement en entreprise avec exemples réels

### [v2.0.0] - 09/09/2025

#### Changements majeurs - Restructuration du dépôt et amélioration professionnelle
**Cette version représente une refonte significative de la structure du dépôt et de la présentation du contenu.**

#### Ajouté
- **Cadre d'apprentissage structuré** : Toutes les pages de documentation incluent désormais des sections Introduction, Objectifs d'apprentissage et Résultats d'apprentissage
- **Système de navigation** : Ajout de liens de leçon précédente/suivante dans toute la documentation pour une progression guidée
- **Guide d'étude** : study-guide.md complet avec objectifs d'apprentissage, exercices pratiques et matériel d'évaluation
- **Présentation professionnelle** : Suppression de tous les icônes emoji pour une meilleure accessibilité et une apparence professionnelle
- **Structure de contenu améliorée** : Organisation et flux des supports d'apprentissage optimisés

#### Modifié
- **Format de la documentation** : Standardisation de toute la documentation avec une structure cohérente axée sur l'apprentissage
- **Flux de navigation** : Mise en œuvre d'une progression logique dans tous les supports d'apprentissage
- **Présentation du contenu** : Suppression des éléments décoratifs au profit d'un format clair et professionnel
- **Structure des liens** : Mise à jour de tous les liens internes pour prendre en charge le nouveau système de navigation

#### Optimisé
- **Accessibilité** : Suppression des dépendances aux emojis pour une meilleure compatibilité avec les lecteurs d'écran
- **Apparence professionnelle** : Présentation propre de style académique adaptée à l'apprentissage en entreprise
- **Expérience d'apprentissage** : Approche structurée avec objectifs et résultats clairs pour chaque leçon
- **Organisation du contenu** : Meilleure connexion logique entre les sujets liés

### [v1.0.0] - 09/09/2025

#### Version initiale - Dépôt d'apprentissage complet AZD

#### Ajouté
- **Structure de documentation principale**
  - Série complète de guides de démarrage
  - Documentation complète de déploiement et de provisionnement
  - Ressources de dépannage détaillées et guides de débogage
  - Outils et procédures de validation pré-déploiement

- **Module de démarrage**
  - Bases AZD : Concepts et terminologie essentiels
  - Guide d'installation : Instructions de configuration spécifiques à la plateforme
  - Guide de configuration : Configuration de l'environnement et authentification
  - Premier tutoriel de projet : Apprentissage pratique étape par étape

- **Module de déploiement et provisionnement**
  - Guide de déploiement : Documentation complète du workflow
  - Guide de provisionnement : Infrastructure en tant que code avec Bicep
  - Meilleures pratiques pour les déploiements en production
  - Modèles d'architecture multi-services

- **Module de validation pré-déploiement**
  - Planification de capacité : Validation de la disponibilité des ressources Azure
  - Sélection de SKU : Guide complet des niveaux de service
  - Vérifications préalables : Scripts de validation automatisés (PowerShell et Bash)
  - Outils d'estimation des coûts et de planification budgétaire

- **Module de dépannage**
  - Problèmes courants : Problèmes fréquemment rencontrés et solutions
  - Guide de débogage : Méthodologies de dépannage systématique
  - Techniques et outils de diagnostic avancés
  - Surveillance des performances et optimisation

- **Ressources et références**
  - Fiche de commande : Référence rapide pour les commandes essentielles
  - Glossaire : Définitions complètes des termes et acronymes
  - FAQ : Réponses détaillées aux questions courantes
  - Liens vers des ressources externes et connexions communautaires

- **Exemples et modèles**
  - Exemple d'application web simple
  - Modèle de déploiement de site web statique
  - Configuration d'application conteneurisée
  - Modèles d'intégration de base de données
  - Exemples d'architecture microservices
  - Implémentations de fonctions serverless

#### Fonctionnalités
- **Support multi-plateforme** : Guides d'installation et de configuration pour Windows, macOS et Linux
- **Niveaux de compétence multiples** : Contenu conçu pour les étudiants jusqu'aux développeurs professionnels
- **Focus pratique** : Exemples pratiques et scénarios réels
- **Couverture complète** : Des concepts de base aux modèles d'entreprise avancés
- **Approche axée sur la sécurité** : Meilleures pratiques de sécurité intégrées partout
- **Optimisation des coûts** : Conseils pour des déploiements rentables et une gestion des ressources

#### Qualité de la documentation
- **Exemples de code détaillés** : Exemples de code pratiques et testés
- **Instructions étape par étape** : Conseils clairs et actionnables
- **Gestion complète des erreurs** : Dépannage des problèmes courants
- **Intégration des meilleures pratiques** : Normes et recommandations de l'industrie
- **Compatibilité des versions** : À jour avec les derniers services Azure et fonctionnalités azd

## Améliorations futures prévues

### Version 3.1.0 (Prévue)
#### Expansion de la plateforme AI
- **Support multi-modèles** : Modèles d'intégration pour Hugging Face, Azure Machine Learning et modèles personnalisés
- **Frameworks d'agents AI** : Modèles pour les déploiements LangChain, Semantic Kernel et AutoGen
- **Modèles RAG avancés** : Options de bases de données vectorielles au-delà d'Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilité de l'IA** : Surveillance améliorée des performances des modèles, de l'utilisation des jetons et de la qualité des réponses

#### Expérience développeur
- **Extension VS Code** : Expérience de développement intégrée AZD + AI Foundry
- **Intégration GitHub Copilot** : Génération assistée par IA de modèles AZD
- **Tutoriels interactifs** : Exercices pratiques de codage avec validation automatisée pour les scénarios IA
- **Contenu vidéo** : Tutoriels vidéo complémentaires pour les apprenants visuels axés sur les déploiements IA

### Version 4.0.0 (Prévue)
#### Modèles IA pour entreprises
- **Cadre de gouvernance** : Gouvernance des modèles IA, conformité et traçabilité des audits
- **IA multi-locataires** : Modèles pour servir plusieurs clients avec des services IA isolés
- **Déploiement IA en périphérie** : Intégration avec Azure IoT Edge et instances de conteneurs
- **IA hybride en cloud** : Modèles de déploiement multi-cloud et hybride pour les charges de travail IA

#### Fonctionnalités avancées
- **Automatisation des pipelines IA** : Intégration MLOps avec les pipelines Azure Machine Learning
- **Sécurité avancée** : Modèles de confiance zéro, points de terminaison privés et protection contre les menaces avancées
- **Optimisation des performances** : Stratégies avancées de réglage et de mise à l'échelle pour les applications IA à haut débit
- **Distribution mondiale** : Modèles de diffusion de contenu et de mise en cache en périphérie pour les applications IA

### Version 3.0.0 (Prévue) - Supplantée par la version actuelle
#### Ajouts proposés - Maintenant implémentés dans la v3.0.0
- ✅ **Contenu axé sur l'IA** : Intégration complète d'Azure AI Foundry (Terminé)
- ✅ **Tutoriels interactifs** : Atelier pratique IA (Terminé)
- ✅ **Module de sécurité avancée** : Modèles de sécurité spécifiques à l'IA (Terminé)
- ✅ **Optimisation des performances** : Stratégies de réglage des charges de travail IA (Terminé)

### Version 2.1.0 (Prévue) - Partiellement implémentée dans la v3.0.0
#### Améliorations mineures - Certaines terminées dans la version actuelle
- ✅ **Exemples supplémentaires** : Scénarios de déploiement axés sur l'IA (Terminé)
- ✅ **FAQ étendue** : Questions spécifiques à l'IA et dépannage (Terminé)
- **Intégration des outils** : Guides améliorés pour l'intégration des IDE et éditeurs
- ✅ **Extension de la surveillance** : Modèles de surveillance et d'alerte spécifiques à l'IA (Terminé)

#### Toujours prévu pour une future version
- **Documentation adaptée aux mobiles** : Design réactif pour l'apprentissage mobile
- **Accès hors ligne** : Packages de documentation téléchargeables
- **Intégration IDE améliorée** : Extension VS Code pour les workflows AZD + IA
- **Tableau de bord communautaire** : Suivi en temps réel des métriques communautaires et des contributions

## Contribuer au journal des modifications

### Signalement des modifications
Lors de la contribution à ce dépôt, assurez-vous que les entrées du journal des modifications incluent :

1. **Numéro de version** : Suivant la version sémantique (majeur.mineur.correctif)
2. **Date** : Date de publication ou de mise à jour au format AAAA-MM-JJ
3. **Catégorie** : Ajouté, Modifié, Obsolète, Supprimé, Corrigé, Sécurité
4. **Description claire** : Description concise de ce qui a changé
5. **Évaluation de l'impact** : Comment les changements affectent les utilisateurs existants

### Catégories de modifications

#### Ajouté
- Nouvelles fonctionnalités, sections de documentation ou capacités
- Nouveaux exemples, modèles ou ressources d'apprentissage
- Outils, scripts ou utilitaires supplémentaires

#### Modifié
- Modifications des fonctionnalités ou de la documentation existantes
- Mises à jour pour améliorer la clarté ou l'exactitude
- Restructuration du contenu ou de l'organisation

#### Obsolète
- Fonctionnalités ou approches en cours de suppression
- Sections de documentation prévues pour être retirées
- Méthodes ayant de meilleures alternatives

#### Supprimé
- Fonctionnalités, documentation ou exemples qui ne sont plus pertinents
- Informations obsolètes ou approches dépréciées
- Contenu redondant ou consolidé

#### Corrigé
- Corrections d'erreurs dans la documentation ou le code
- Résolution de problèmes ou de bugs signalés
- Améliorations de l'exactitude ou de la fonctionnalité

#### Sécurité
- Améliorations ou corrections liées à la sécurité
- Mises à jour des meilleures pratiques de sécurité
- Résolution des vulnérabilités de sécurité

### Directives de versionnement sémantique

#### Version majeure (X.0.0)
- Changements majeurs nécessitant une action de l'utilisateur
- Restructuration significative du contenu ou de l'organisation
- Modifications altérant l'approche ou la méthodologie fondamentale

#### Version mineure (X.Y.0)
- Nouvelles fonctionnalités ou ajouts de contenu
- Améliorations compatibles avec les versions précédentes
- Exemples, outils ou ressources supplémentaires

#### Version corrective (X.Y.Z)
- Corrections de bugs et ajustements
- Améliorations mineures du contenu existant
- Clarifications et petites améliorations

## Feedback et suggestions de la communauté

Nous encourageons activement les retours de la communauté pour améliorer cette ressource d'apprentissage :

### Comment fournir un feedback
- **Problèmes GitHub** : Signalez des problèmes ou proposez des améliorations (problèmes spécifiques à l'IA bienvenus)
- **Discussions Discord** : Partagez des idées et engagez-vous avec la communauté Azure AI Foundry
- **Pull Requests** : Contribuez directement à l'amélioration du contenu, en particulier des modèles et guides IA
- **Discord Azure AI Foundry** : Participez au canal #Azure pour les discussions AZD + IA
- **Forums communautaires** : Participez aux discussions plus larges des développeurs Azure

### Catégories de feedback
- **Exactitude du contenu IA** : Corrections sur l'intégration et le déploiement des services IA
- **Expérience d'apprentissage** : Suggestions pour améliorer le flux d'apprentissage des développeurs IA
- **Contenu IA manquant** : Demandes de modèles, schémas ou exemples IA supplémentaires
- **Accessibilité** : Améliorations pour répondre aux besoins d'apprentissage diversifiés
- **Intégration des outils IA** : Suggestions pour une meilleure intégration des workflows de développement IA
- **Modèles IA en production** : Demandes de modèles de déploiement IA pour entreprises

### Engagement de réponse
- **Réponse aux problèmes** : Sous 48 heures pour les problèmes signalés
- **Demandes de fonctionnalités** : Évaluation sous une semaine
- **Contributions communautaires** : Revue sous une semaine
- **Problèmes de sécurité** : Priorité immédiate avec réponse accélérée

## Calendrier de maintenance

### Mises à jour régulières
- **Revues mensuelles** : Exactitude du contenu et validation des liens
- **Mises à jour trimestrielles** : Ajouts et améliorations majeurs de contenu
- **Revues semestrielles** : Restructuration et amélioration complètes
- **Versions annuelles** : Mises à jour majeures avec améliorations significatives

### Surveillance et assurance qualité
- **Tests automatisés** : Validation régulière des exemples de code et des liens
- **Intégration des retours communautaires** : Incorporation régulière des suggestions des utilisateurs
- **Mises à jour technologiques** : Alignement avec les derniers services Azure et versions AZD
- **Audits d'accessibilité** : Revue régulière des principes de design inclusif

## Politique de support des versions

### Support des versions actuelles
- **Dernière version majeure** : Support complet avec mises à jour régulières
- **Version majeure précédente** : Mises à jour de sécurité et correctifs critiques pendant 12 mois
- **Versions héritées** : Support communautaire uniquement, sans mises à jour officielles

### Guide de migration
Lors de la publication de versions majeures, nous fournissons :
- **Guides de migration** : Instructions étape par étape pour la transition
- **Notes de compatibilité** : Détails sur les changements majeurs
- **Support des outils** : Scripts ou utilitaires pour faciliter la migration
- **Support communautaire** : Forums dédiés aux questions de migration

---

**Navigation**
- **Leçon précédente** : [Guide d'étude](resources/study-guide.md)
- **Leçon suivante** : Retour au [README principal](README.md)

**Restez informé** : Suivez ce dépôt pour recevoir des notifications sur les nouvelles versions et les mises à jour importantes des supports d'apprentissage.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction humaine professionnelle. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->