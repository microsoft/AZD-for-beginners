# Chapitre 2 : Développement axé sur l'IA

**📚 Cours**: [AZD pour débutants](../../README.md) | **⏱️ Durée**: 1-2 heures | **⭐ Complexité**: Intermédiaire

---

## Aperçu

Ce chapitre se concentre sur le déploiement d'applications alimentées par l'IA en utilisant Azure Developer CLI et les services Microsoft Foundry. Des applications de chat IA simples aux agents intelligents avec des outils.

## Objectifs d'apprentissage

En complétant ce chapitre, vous allez :
- Déployer des applications IA en utilisant des modèles AZD préconçus
- Comprendre l'intégration de Microsoft Foundry avec AZD
- Configurer et personnaliser des agents IA avec des outils
- Déployer des applications RAG (Retrieval-Augmented Generation)

---

## 📚 Leçons

| # | Leçon | Description | Temps |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Connecter AZD aux services Foundry | 30 min |
| 2 | [AI Agents Guide](agents.md) | Déployer des agents intelligents avec des outils | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Déployer et configurer des modèles IA | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Atelier pratique : préparez votre solution IA pour AZD | 60 min |

---

## 🚀 Démarrage rapide

```bash
# Option 1: Application de chat RAG
azd init --template azure-search-openai-demo
azd up

# Option 2: Agents IA
azd init --template get-started-with-ai-agents
azd up

# Option 3: Application de chat rapide
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Modèles IA présentés

| Modèle | Description | Services |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG avec citations | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agent IA avec outils | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat IA de base | OpenAI + Container Apps |

---

## 💰 Sensibilisation aux coûts

| Environnement | Coût mensuel estimé |
|-------------|----------------------|
| Development | $80-150 |
| Staging | $150-300 |
| Production | $300-3,500+ |

**Astuce :** Exécutez `azd down` après les tests pour éviter des frais.

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|---------|
| **Précédent** | [Chapitre 1 : Foundation](../chapter-01-foundation/README.md) |
| **Suivant** | [Chapitre 3 : Configuration](../chapter-03-configuration/README.md) |
| **Aller à** | [Chapitre 8 : Production Patterns](../chapter-08-production/README.md) |

---

## 📖 Ressources liées

- [Dépannage IA](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Pratiques IA en production](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Clause de non-responsabilité** :
Ce document a été traduit à l'aide du service de traduction IA [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'être précis, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour toute information critique, il est recommandé de recourir à une traduction professionnelle effectuée par un traducteur humain. Nous déclinons toute responsabilité en cas de malentendus ou d'erreurs d'interprétation résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->