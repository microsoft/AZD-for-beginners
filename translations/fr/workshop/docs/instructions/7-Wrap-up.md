# 7. Conclusion et prochaines étapes

!!! tip "LES MESSAGES CLÉS SONT"

    - [ ] Les modèles AZD accélèrent le développement d'applications IA de jours à heures
    - [ ] La méthodologie Découverte → Déploiement → Personnalisation offre un parcours d’apprentissage structuré
    - [ ] GitHub Copilot avec les serveurs MCP permet l’exploration en langage naturel de bases de code complexes
    - [ ] Microsoft Foundry fournit des fonctionnalités intégrées d’observabilité, d’évaluation et de tests de sécurité

---

## 1. Ce que vous avez accompli

Félicitations ! Lors de cet atelier, vous avez réussi à :

| Module | Accomplissement |
|:---|:---|
| **Module 1** | Découvrir Azure Developer CLI et sélectionner un modèle IA |
| **Module 2** | Déployer et valider une solution complète d’agents IA |
| **Module 3** | Déconstruire le modèle pour comprendre son architecture |
| **Module 4** | Explorer la configuration `azure.yaml` et les hooks du cycle de vie |
| **Module 5** | Personnaliser le modèle pour votre propre scénario |
| **Module 6** | Démanteler l'infrastructure en toute sécurité et gérer les ressources |

---

## 2. Concepts clés maîtrisés

### Azure Developer CLI (azd)
- `azd init` - Initialiser des projets à partir de modèles
- `azd up` - Provisionner et déployer en une seule commande
- `azd env` - Gérer les variables d'environnement
- `azd down` - Nettoyer les ressources en toute sécurité

### Structure du modèle AZD
- `azure.yaml` - Configuration et hooks de déploiement
- `infra/` - Infrastructure en tant que code Bicep
- `src/` - Code source de l'application
- `scripts/` - Scripts d’automatisation et d’installation

### Capacités de Microsoft Foundry
- Service d’agents IA pour assistants intelligents
- Recherche de fichiers et Azure AI Search pour la récupération de connaissances
- Tracing, surveillance et évaluation intégrés
- Red teaming pour la validation de la sécurité IA

---

## 3. Poursuivez votre apprentissage

### Prochaines étapes recommandées

| Parcours | Ressource | Durée |
|:---|:---|:---|
| **Cours complet** | [Curriculum AZD pour débutants](../../README.md) | 8-12 heures |
| **Essayer un autre modèle** | [Modèles Microsoft Foundry](https://ai.azure.com/templates) | 1-2 heures |
| **Approfondir** | [Documentation Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | En continu |
| **Communauté** | [Azure Discord](https://aka.ms/foundry/discord) | Rejoignez dès aujourd’hui ! |

### Modèles suggérés pour la suite

1. **[Démarrer avec AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Chat basique avec vos données  
2. **[Démo Azure Search OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Modèles RAG avancés  
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Scénarios d’entreprise retail  

---

## 4. Défi de l’atelier

Prêt à tester vos compétences ? Essayez ces défis :

| Défi | Description | Difficulté |
|:---|:---|:---|
| **1. Scénario multi-agents** | Déployer et personnaliser pour une industrie différente (ex. santé, finance) | ⭐⭐ |
| **2. Base de connaissances personnalisée** | Ajouter vos propres fichiers de données et créer un index de recherche personnalisé | ⭐⭐⭐ |
| **3. Déploiement en production** | Mettre en place CI/CD avec GitHub Actions via `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Partagez vos retours

Vos retours nous aident à améliorer cet atelier !

- **GitHub Issues** : [Publiez vos retours](https://github.com/microsoft/azd-for-beginners/issues) - taggez `Workshop`  
- **Discord** : Rejoignez [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - postez dans `#get-help`  
- **Contributions** : Aidez à améliorer l’atelier en soumettant des pull requests !

---

## Merci ! 🎉

Merci d'avoir complété l’atelier AZD pour les développeurs IA. Nous espérons que cette expérience vous a donné les compétences et la confiance pour construire et déployer des applications IA sur Azure.

**Continuez à bâtir, continuez à apprendre, et bienvenue dans la communauté des développeurs Azure AI !**

---

| | |
|:---|:---|
| **📚 Page d’accueil du cours** | [AZD pour débutants](../../README.md) |
| **📖 Documentation** | [Docs Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ Modèles IA** | [Modèles Microsoft Foundry](https://ai.azure.com/templates) |
| **💬 Communauté** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d’assurer l’exactitude, veuillez noter que les traductions automatiques peuvent comporter des erreurs ou des inexactitudes. Le document original dans sa langue d’origine doit être considéré comme la source faisant autorité. Pour toute information critique, il est recommandé de faire appel à une traduction professionnelle réalisée par un humain. Nous déclinons toute responsabilité en cas de malentendus ou d’interprétations erronées résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->