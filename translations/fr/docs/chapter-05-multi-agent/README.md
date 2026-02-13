# Chapitre 5 : Solutions d'IA multi-agents

**📚 Cours**: [AZD For Beginners](../../README.md) | **⏱️ Durée**: 2-3 heures | **⭐ Complexité**: Avancé

---

## Aperçu

Ce chapitre couvre des modèles d'architecture multi-agent avancés, l'orchestration d'agents et des déploiements d'IA prêts pour la production pour des scénarios complexes.

## Objectifs d'apprentissage

En complétant ce chapitre, vous allez :
- Comprendre les modèles d'architecture multi-agent
- Déployer des systèmes d'agents d'IA coordonnés
- Implémenter la communication agent-à-agent
- Construire des solutions multi-agents prêtes pour la production

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|------|
| 1 | [Solution multi-agent pour la vente au détail](../../examples/retail-scenario.md) | Présentation complète de l'implémentation | 90 min |
| 2 | [Modèles de coordination](../chapter-06-pre-deployment/coordination-patterns.md) | Stratégies d'orchestration des agents | 30 min |
| 3 | [Déploiement de modèle ARM](../../examples/retail-multiagent-arm-template/README.md) | Déploiement en un clic | 30 min |

---

## 🚀 Démarrage rapide

```bash
# Déployer la solution multi-agents pour le commerce de détail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Ou utilisez directement le modèle
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Architecture multi-agent

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 Solution mise en avant : Solution multi-agent pour la vente au détail

La [Solution multi-agent pour la vente au détail](../../examples/retail-scenario.md) présente :

- **Agent client** : Gère les interactions avec les utilisateurs et leurs préférences
- **Agent inventaire** : Gère le stock et le traitement des commandes
- **Orchestrateur** : Coordonne entre les agents
- **Mémoire partagée** : Gestion du contexte entre agents

### Services utilisés

| Service | Objectif |
|---------|---------|
| Azure OpenAI | Compréhension du langage |
| Azure AI Search | Catalogue de produits |
| Cosmos DB | État et mémoire des agents |
| Container Apps | Hébergement des agents |
| Application Insights | Surveillance |

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|---------|
| **Précédent** | [Chapter 4: Infrastructure](../chapter-04-infrastructure/README.md) |
| **Suivant** | [Chapter 6: Pre-Deployment](../chapter-06-pre-deployment/README.md) |

---

## 📖 Ressources liées

- [Guide des agents d'IA](../chapter-02-ai-development/agents.md)
- [Pratiques d'IA en production](../chapter-08-production/production-ai-practices.md)
- [Dépannage IA](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Clause de non-responsabilité :
Ce document a été traduit à l'aide du service de traduction par IA Co-op Translator (https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction professionnelle réalisée par un traducteur humain est recommandée. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->