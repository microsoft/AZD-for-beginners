# Chapitre 2 : Développement AI-First

**📚 Cours** : [AZD Pour Débutants](../../README.md) | **⏱️ Durée** : 4-5 heures incluant l'atelier | **⭐ Complexité** : Intermédiaire

---

## Vue d'ensemble

Ce chapitre se concentre sur le déploiement d’applications alimentées par l’IA utilisant Azure Developer CLI et les services Microsoft Foundry. Des simples applications de chat IA aux agents intelligents avec des outils.

> **Mise à jour GA Foundry (2026-11-09) :** Le bundle `microsoft.foundry` 1.0 est [disponible en général](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Utilisez `azd >= 1.37.0` ; les évaluations restent une installation séparée. Le [guide de l'agent hébergé](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) couvre les tests locaux dans Agent Inspector et le déploiement de code à distance. Ceci est une revue documentaire, pas une validation de déploiement en direct ; les fonctionnalités en aperçu restent dans leur propre statut.

## Objectifs d'apprentissage

En complétant ce chapitre, vous allez :
- Déployer des applications IA à l’aide de templates AZD préconçus
- Comprendre l’intégration Microsoft Foundry avec AZD
- Installer le bundle GA et tester un agent hébergé localement avant de déployer son code source sur Foundry
- Revoir `azure.yaml`, les ressources d’évaluation, et la gestion des projets nouveaux contre réutilisés
- Configurer et personnaliser des agents IA avec des outils
- Déployer des applications RAG (Retrieval-Augmented Generation)

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|------|
| 1 | [Intégration Microsoft Foundry](microsoft-foundry-integration.md) | Bundle GA, workflow local-à-cloud de l’agent hébergé, et évaluations | 60 min |
| 2 | [Guide des Agents IA](agents.md) | Déployer des agents intelligents avec outils | 45 min |
| 3 | [Déploiement de modèle IA](ai-model-deployment.md) | Déployer et configurer des modèles IA | 30 min |
| 4 | [Atelier Laboratoire IA](ai-workshop-lab.md) | Pratique : Explorer un template et planifier votre conversion | 2-3 heures |

---

## 🚀 Démarrage rapide

Choisissez une option dans un nouveau répertoire vide. Le suffixe `.` initialise le répertoire courant ; sinon AZD peut créer un sous-répertoire sans changer le répertoire de travail de votre shell.

Pour le **chemin de déploiement de code agent hébergé GA**, commencez avec le [guide pas-à-pas](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Il nécessite AZD 1.37.0+, uv actuel, Python 3.13+, permissions Foundry, et quota de modèle. Les templates complets d’application ci-dessous sont des alternatives, non des prérequis pour ce guide.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 Templates IA phares

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG avec citations | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agent IA avec outils | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat IA basique | OpenAI + Container Apps |

---

## 💰 Sensibilisation aux coûts

Ce sont des plages illustratives, pas des devis ni des plafonds ; le trafic modèle, les SKU Search/compute, la région, et les fonctionnalités optionnelles peuvent les dépasser. Consultez la tarification actuelle de votre échantillon choisi avant de provisionner.

| Environnement | Coût Mensuel Estimé |
|-------------|----------------------|
| Développement | 80-150 $ |
| Préproduction | 150-300 $ |
| Production | 300-3 500+ $ |

**Nettoyage :** Consultez `azd down` avant de confirmer : pour un projet Foundry nouvellement créé, il supprime le groupe de ressources et tout ce qu’il contient. Pour un projet Foundry réutilisé, il laisse en place les ressources du projet et de l’agent ; suivez les [instructions de nettoyage du guide](microsoft-foundry-integration.md#7-clean-up-deliberately) pour supprimer séparément les ressources indésirables.

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|---------|
| **Précédent** | [Chapitre 1 : Fondation](../chapter-01-foundation/README.md) |
| **Suivant** | [Chapitre 3 : Configuration](../chapter-03-configuration/README.md) |
| **Aller à** | [Chapitre 8 : Modèles de Production](../chapter-08-production/README.md) |

---

## 📖 Ressources associées

- [Dépannage IA](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Pratiques IA en Production](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->