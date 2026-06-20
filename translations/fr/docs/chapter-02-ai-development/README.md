# Chapitre 2 : Développement AI-First

**📚 Cours** : [AZD Pour Débutants](../../README.md) | **⏱️ Durée** : 1-2 heures | **⭐ Complexité** : Intermédiaire

---

## Aperçu

Ce chapitre se concentre sur le déploiement d’applications alimentées par l’IA en utilisant Azure Developer CLI et les services Microsoft Foundry. Des applications de chat IA simples aux agents intelligents avec outils.

> **Note de validation (2026-06-15) :** Le flux de commandes et les indications sur l’extension dans ce chapitre ont été vérifiés avec `azd` `1.25.6` et la version preview actuelle de l’extension agent IA `azure.ai.agents` `0.1.40-preview`. Si vous utilisez une version plus ancienne d’AZD, mettez-la à jour avant de poursuivre les exercices.

## Objectifs d’apprentissage

En complétant ce chapitre, vous allez :
- Déployer des applications IA en utilisant des templates AZD préconstruits
- Comprendre l’intégration Microsoft Foundry avec AZD
- Configurer et personnaliser des agents IA avec des outils
- Déployer des applications RAG (Retrieval-Augmented Generation)

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|-------|
| 1 | [Intégration Microsoft Foundry](microsoft-foundry-integration.md) | Connecter AZD aux services Foundry | 30 min |
| 2 | [Guide des Agents IA](agents.md) | Déployer des agents intelligents avec des outils | 45 min |
| 3 | [Déploiement de modèles IA](ai-model-deployment.md) | Déployer et configurer des modèles IA | 30 min |
| 4 | [Atelier IA](ai-workshop-lab.md) | Pratique : Préparer votre solution IA pour AZD | 60 min |

---

## 🚀 Démarrage rapide

```bash
# Option 1 : Application de chat RAG
azd init --template azure-search-openai-demo
azd up

# Option 2 : Agents IA
azd init --template get-started-with-ai-agents
azd up

# Option 3 : Application de chat rapide
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Templates IA en vedette

| Template | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG avec citations | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agent IA avec outils | Service Agent IA |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat IA basique | OpenAI + Container Apps |

---

## 💰 Sensibilisation aux coûts

| Environnement | Coût mensuel estimé |
|-------------|---------------------|
| Développement | 80-150 $ |
| Préproduction | 150-300 $ |
| Production | 300-3 500 $+ |

**Astuce :** Exécutez `azd down` après vos tests pour éviter des frais.

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|----------|
| **Précédent** | [Chapitre 1 : Fondations](../chapter-01-foundation/README.md) |
| **Suivant** | [Chapitre 3 : Configuration](../chapter-03-configuration/README.md) |
| **Aller à** | [Chapitre 8 : Modèles de production](../chapter-08-production/README.md) |

---

## 📖 Ressources liées

- [Dépannage IA](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Pratiques IA en production](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->