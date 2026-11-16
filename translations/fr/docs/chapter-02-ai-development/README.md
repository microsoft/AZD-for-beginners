# Chapitre 2 : Développement AI-First

**📚 Cours** : [AZD Pour Débutants](../../README.md) | **⏱️ Durée** : 4-5 heures incluant l'atelier | **⭐ Complexité** : Intermédiaire

---

## Vue d’ensemble

Ce chapitre se concentre sur le déploiement d'applications alimentées par l'IA en utilisant Azure Developer CLI et les services Microsoft Foundry. Des applications simples de chat IA aux agents intelligents avec outils.

> **Revue de la version (2026-11-04) :** Les directives AI CLI ont été vérifiées par rapport à la documentation/source publiée `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, et `azure.ai.evaluations` `1.0.0-beta.2`. Utilisez `azd >= 1.37.0` pour le flux de travail combiné. Les évaluations utilisent désormais l’espace de noms distinct `azd ai eval` ; voir [changements de version et guide de migration](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Ceci n’est pas une validation de déploiement en direct.

## Objectifs d’apprentissage

En complétant ce chapitre, vous serez capable de :
- Déployer des applications IA en utilisant des modèles AZD préconstruits
- Comprendre l’intégration Microsoft Foundry avec AZD
- Configurer et personnaliser des agents IA avec des outils
- Déployer des applications RAG (Génération augmentée par récupération)

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|------|
| 1 | [Intégration Microsoft Foundry](microsoft-foundry-integration.md) | Connecter AZD aux services Foundry | 30 min |
| 2 | [Guide des Agents IA](agents.md) | Déployer des agents intelligents avec outils | 45 min |
| 3 | [Déploiement de Modèle IA](ai-model-deployment.md) | Déployer et configurer des modèles IA | 30 min |
| 4 | [Atelier Laboratoire IA](ai-workshop-lab.md) | Pratique : Explorer un modèle et planifier votre conversion | 2-3 heures |

---

## 🚀 Démarrage rapide

Choisissez une option dans un nouveau répertoire vide. Le `.` final initialise le répertoire actuel ; sinon AZD peut créer un sous-répertoire sans changer le répertoire de travail du shell.

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

## 🤖 Modèles IA en vedette

| Modèle | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG avec citations | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agent IA avec outils | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat IA basique | OpenAI + Container Apps |

---

## 💰 Sensibilisation aux coûts

Ce sont des fourchettes indicatives, pas des devis ou plafonds ; le trafic du modèle, les SKU Search/Compute, la région et les fonctionnalités optionnelles peuvent les dépasser. Consultez la tarification actuelle de l’exemple choisi avant le provisionnement.

| Environnement | Coût mensuel estimé |
|-------------|----------------------|
| Développement | 80-150 $ |
| Mise en scène | 150-300 $ |
| Production | 300-3 500+ $ |

**Astuce :** Lancez `azd down` après les tests pour éviter des frais.

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|---------|
| **Précédent** | [Chapitre 1 : Fondations](../chapter-01-foundation/README.md) |
| **Suivant** | [Chapitre 3 : Configuration](../chapter-03-configuration/README.md) |
| **Aller à** | [Chapitre 8 : Modèles de Production](../chapter-08-production/README.md) |

---

## 📖 Ressources Associées

- [Dépannage IA](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Pratiques IA en Production](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->