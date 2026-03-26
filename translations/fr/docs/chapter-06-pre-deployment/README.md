# Chapitre 6 : Planification et validation avant le déploiement

**📚 Cours**: [AZD pour débutants](../../README.md) | **⏱️ Durée**: 1 heure | **⭐ Complexité**: Intermédiaire

---

## Aperçu

Ce chapitre couvre les étapes essentielles de planification et de validation avant le déploiement de votre application. Apprenez à éviter des erreurs coûteuses grâce à une planification de capacité appropriée, le choix des SKU et des contrôles préalables.

## Objectifs d'apprentissage

En terminant ce chapitre, vous serez capable de :
- Effectuer les vérifications préalables avant le déploiement
- Planifier la capacité et estimer les besoins en ressources
- Sélectionner des SKU appropriés pour optimiser les coûts
- Configurer Application Insights pour la surveillance
- Comprendre les modèles de coordination d'équipe

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|------|
| 1 | [Preflight Checks](preflight-checks.md) | Valider la configuration avant le déploiement | 15 min |
| 2 | [Capacity Planning](capacity-planning.md) | Estimer les besoins en ressources | 20 min |
| 3 | [SKU Selection](sku-selection.md) | Choisir les niveaux de tarification appropriés | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurer la surveillance | 20 min |
| 5 | [Coordination Patterns](coordination-patterns.md) | Flux de travail d'équipe pour le déploiement | 15 min |

---

## 🚀 Démarrage rapide

```bash
# Vérifier les quotas d'abonnement
az vm list-usage --location eastus --output table

# Aperçu du déploiement (aucune ressource créée)
azd provision --preview

# Valider la syntaxe Bicep
az bicep build --file infra/main.bicep

# Vérifier la configuration de l'environnement
azd env get-values
```

---

## ☑️ Liste de contrôle avant déploiement

### Avant `azd provision`

- [ ] Quota vérifié pour la région
- [ ] SKUs sélectionnés de manière appropriée
- [ ] Estimation des coûts revue
- [ ] Convention de nommage cohérente
- [ ] Sécurité/RBAC configurés

### Avant `azd deploy`

- [ ] Variables d'environnement définies
- [ ] Secrets dans Key Vault
- [ ] Chaînes de connexion vérifiées
- [ ] Contrôles de santé configurés

---

## 💰 Guide de sélection des SKU

| Workload | Development | Production |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|---------|
| **Précédent** | [Chapitre 5 : Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Suivant** | [Chapitre 7 : Dépannage](../chapter-07-troubleshooting/README.md) |

---

## 📖 Ressources associées

- [Guide de configuration](../chapter-03-configuration/configuration.md)
- [Guide de déploiement](../chapter-04-infrastructure/deployment-guide.md)
- [Problèmes courants](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Clause de non-responsabilité :
Ce document a été traduit à l'aide du service de traduction automatique par IA Co-op Translator (https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent comporter des erreurs ou des inexactitudes. Le document original, dans sa langue d'origine, doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction professionnelle réalisée par un traducteur humain est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->