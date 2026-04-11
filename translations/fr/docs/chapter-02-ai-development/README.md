# Chapitre 2 : Développement AI-First

**📚 Cours** : [AZD Pour Débutants](../../README.md) | **⏱️ Durée** : 1-2 heures | **⭐ Complexité** : Intermédiaire

---

## Aperçu

Ce chapitre se concentre sur le déploiement d'applications intégrant l'IA en utilisant Azure Developer CLI et les services Microsoft Foundry. Des applications de chat IA simples aux agents intelligents avec outils.

> **Note de validation (2026-03-25) :** Le flux de commandes et les instructions d'extension de ce chapitre ont été vérifiés avec `azd` `1.23.12` et la version actuelle de prévisualisation de l'extension AI agent `azure.ai.agents` `0.1.18-preview`. Si vous disposez d'une version AZD plus ancienne, mettez-la à jour avant de poursuivre les exercices.

## Objectifs d'apprentissage

En complétant ce chapitre, vous allez :
- Déployer des applications AI en utilisant des modèles AZD préconstruits
- Comprendre l'intégration Microsoft Foundry avec AZD
- Configurer et personnaliser des agents IA avec des outils
- Déployer des applications RAG (Retrieval-Augmented Generation)

---

## 📚 Leçons

| # | Leçon | Description | Temps |
|---|--------|-------------|-------|
| 1 | [Intégration Microsoft Foundry](microsoft-foundry-integration.md) | Connecter AZD aux services Foundry | 30 min |
| 2 | [Guide des agents IA](agents.md) | Déployer des agents intelligents avec outils | 45 min |
| 3 | [Déploiement de modèles IA](ai-model-deployment.md) | Déployer et configurer des modèles IA | 30 min |
| 4 | [Atelier pratique IA](ai-workshop-lab.md) | Pratique : Préparer votre solution IA pour AZD | 60 min |

---

## 🚀 Démarrage rapide

```bash
# Option 1 : Application de chat RAG
azd init --template azure-search-openai-demo
azd up

# Option 2 : Agents d'IA
azd init --template get-started-with-ai-agents
azd up

# Option 3 : Application de chat rapide
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Modèles AI phares

| Modèle | Description | Services |
|--------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG avec citations | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agent IA avec outils | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat IA basique | OpenAI + Container Apps |

---

## 💰 Sensibilisation aux coûts

| Environnement | Coût mensuel estimé |
|---------------|---------------------|
| Développement | 80-150 $ |
| Préproduction | 150-300 $ |
| Production | 300-3 500 $+ |

**Astuce :** Exécutez `azd down` après les tests pour éviter les frais.

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|----------|
| **Précédent** | [Chapitre 1 : Fondations](../chapter-01-foundation/README.md) |
| **Suivant** | [Chapitre 3 : Configuration](../chapter-03-configuration/README.md) |
| **Passer à** | [Chapitre 8 : Modèles en Production](../chapter-08-production/README.md) |

---

## 📖 Ressources associées

- [Dépannage IA](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Pratiques IA en production](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avis de non-responsabilité** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d’assurer l’exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d’origine doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction professionnelle humaine est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou d’interprétations erronées résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->