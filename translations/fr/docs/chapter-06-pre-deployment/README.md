# Chapitre 6 : Planification et validation pré-déploiement

**📚 Cours**: [AZD pour débutants](../../README.md) | **⏱️ Durée**: 1 heure | **⭐ Complexité**: Intermédiaire

---

## Aperçu

Ce chapitre couvre les étapes essentielles de planification et de validation avant de déployer votre application. Apprenez à éviter des erreurs coûteuses grâce à une planification adéquate de la capacité, une sélection appropriée des SKU et des vérifications préalables.

## Objectifs d'apprentissage

En complétant ce chapitre, vous pourrez :
- Effectuer des vérifications préalables avant le déploiement
- Planifier la capacité et estimer les besoins en ressources
- Sélectionner des SKU appropriés pour optimiser les coûts
- Configurer Application Insights pour la surveillance
- Comprendre les modèles de coordination d'équipe

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|------|
| 1 | [Vérifications préalables](preflight-checks.md) | Valider la configuration avant le déploiement | 15 min |
| 2 | [Planification de la capacité](capacity-planning.md) | Estimer les besoins en ressources | 20 min |
| 3 | [Sélection des SKU](sku-selection.md) | Choisir les niveaux de tarification appropriés | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurer la surveillance | 20 min |
| 5 | [Modèles de coordination](coordination-patterns.md) | Flux de travail de déploiement en équipe | 15 min |

---

## 🚀 Démarrage rapide

```bash
# Vérifier les quotas de l'abonnement
az vm list-usage --location eastus --output table

# Aperçu du déploiement (aucune ressource créée)
azd provision --preview

# Valider la syntaxe Bicep
az bicep build --file infra/main.bicep

# Vérifier la configuration de l'environnement
azd env get-values
```

---

## ☑️ Liste de vérification pré-déploiement

### Avant `azd provision`

- [ ] Quota vérifié pour la région
- [ ] SKUs sélectionnés de manière appropriée
- [ ] Estimation des coûts revue
- [ ] Convention de nommage cohérente
- [ ] Sécurité/RBAC configurée

### Avant `azd deploy`

- [ ] Variables d'environnement définies
- [ ] Secrets dans Key Vault
- [ ] Chaînes de connexion vérifiées
- [ ] Vérifications d'état configurées

---

## 💰 Guide de sélection des SKU

| Charge de travail | Développement | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|---------|
| **Previous** | [Chapitre 5 : Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Next** | [Chapitre 7 : Dépannage](../chapter-07-troubleshooting/README.md) |

---

## 📖 Ressources liées

- [Guide de configuration](../chapter-03-configuration/configuration.md)
- [Guide de déploiement](../chapter-04-infrastructure/deployment-guide.md)
- [Problèmes courants](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Avis de non-responsabilité :
Ce document a été traduit à l'aide du service de traduction par IA [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent comporter des erreurs ou des inexactitudes. Le document original, dans sa langue d'origine, doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un traducteur humain. Nous ne pouvons être tenus responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->