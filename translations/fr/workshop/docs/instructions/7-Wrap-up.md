# 7. Conclusion et prochaines étapes

!!! tip "LES PRINCIPAUX MESSAGES À RETENIR SONT"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. Ce que vous avez accompli

Félicitations ! Lors de cet atelier, vous avez réussi à :

| Module | Accomplissement |
|:---|:---|
| **Module 1** | Découvrir Azure Developer CLI et sélectionner un modèle IA |
| **Module 2** | Déployer et valider une solution complète d'agents IA |
| **Module 3** | Déconstruire le modèle pour comprendre son architecture |
| **Module 4** | Explorer `azure.yaml` la configuration et les hooks du cycle de vie |
| **Module 5** | Personnaliser le modèle pour votre propre scénario |
| **Module 6** | Démanteler l'infrastructure de manière sécurisée et gérer les ressources |

---

## 2. Concepts clés maîtrisés

### Azure Developer CLI (azd)
- `azd init` - Initialiser des projets à partir de modèles
- `azd up` - Provisionner et déployer en une seule commande
- `azd env` - Gérer les variables d'environnement
- `azd down` - Nettoyer les ressources en toute sécurité

### Structure du modèle AZD
- `azure.yaml` - Hooks de configuration et de déploiement
- `infra/` - Infrastructure-as-code Bicep
- `src/` - Code source de l'application
- `scripts/` - Scripts d'automatisation et de configuration

### Capacités Microsoft Foundry
- Service d'agents IA pour assistants intelligents
- Recherche de fichiers et Azure AI Search pour la recherche de connaissances
- Traçage, surveillance et évaluation intégrés
- Red teaming pour la validation de la sécurité IA

---

## 3. Poursuivez votre parcours d'apprentissage

### Prochaines étapes recommandées

| Parcours | Ressource | Durée |
|:---|:---|:---|
| **Compléter le cours** | [Programme AZD pour débutants](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | À votre rythme |
| **Essayer un autre modèle** | [Modèles Microsoft Foundry](https://ai.azure.com/templates) | 1-2 heures |
| **Approfondir** | [Documentation Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | En continu |
| **Communauté** | [Discord Azure](https://aka.ms/foundry/discord) | Rejoignez dès aujourd'hui ! |

### Modèles suggérés à essayer ensuite

1. **[Commencer avec le chat IA](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Chat basique avec vos données
2. **[Démo Azure Search OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Modèles avancés RAG
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Scénarios de grande distribution d'entreprise

---

## 4. Défi de l'atelier

Prêt à tester vos compétences ? Essayez ces défis :

| Défi | Description | Difficulté |
|:---|:---|:---|
| **1. Scénario multi-agent** | Déployer et personnaliser pour un secteur différent (ex : santé, finance) | ⭐⭐ |
| **2. Base de connaissances personnalisée** | Ajouter vos propres fichiers de données et créer un index de recherche personnalisé | ⭐⭐⭐ |
| **3. Déploiement en production** | Mettre en place CI/CD avec GitHub Actions en utilisant `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Partagez vos retours

Vos retours nous aident à améliorer cet atelier !

- **Problèmes GitHub** : [Publiez vos retours](https://github.com/microsoft/azd-for-beginners/issues) - taguez avec `Workshop`
- **Discord** : Rejoignez [Discord Microsoft Foundry](https://aka.ms/foundry/discord) - postez dans `#get-help`
- **Contributions** : Aidez à améliorer l'atelier en soumettant des pull requests !

---

## Merci ! 🎉

Merci d'avoir suivi l'atelier AZD for AI Developers. Nous espérons que cette expérience vous a doté des compétences et de la confiance pour créer et déployer des applications IA sur Azure.

**Continuez à construire, continuez à apprendre, et bienvenue dans la communauté des développeurs IA Azure !**

---

| | |
|:---|:---|
| **📚 Accueil du cours** | [AZD pour débutants](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 Documentation** | [Docs Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ Modèles IA** | [Modèles Microsoft Foundry](https://ai.azure.com/templates) |
| **💬 Communauté** | [Discord Azure](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->