# Chapitre 6 : Planification & Validation Pré-Déploiement

**📚 Cours** : [AZD Pour Débutants](../../README.md) | **⏱️ Durée** : 1 heure | **⭐ Complexité** : Intermédiaire

---

## Vue d'ensemble

Ce chapitre couvre les étapes essentielles de planification et validation avant de déployer votre application. Apprenez à éviter des erreurs coûteuses grâce à une planification adéquate de la capacité, une sélection de SKU adaptée et des vérifications préalables.

> Validé avec `azd 1.23.12` en mars 2026.

## Objectifs d'apprentissage

En complétant ce chapitre, vous serez capable de :
- Effectuer des vérifications préalables avant le déploiement
- Planifier la capacité et estimer les besoins en ressources
- Sélectionner les SKU appropriés pour optimiser les coûts
- Configurer Application Insights pour la surveillance
- Comprendre les modèles de coordination d'équipe

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|-------|
| 1 | [Vérifications préalables](preflight-checks.md) | Valider la configuration avant le déploiement | 15 min |
| 2 | [Planification de la capacité](capacity-planning.md) | Estimer les besoins en ressources | 20 min |
| 3 | [Sélection des SKU](sku-selection.md) | Choisir les niveaux de tarification appropriés | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurer la surveillance | 20 min |
| 5 | [Modèles de coordination](coordination-patterns.md) | Flux de travail d’équipe pour le déploiement | 15 min |

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

## ☑️ Liste de contrôle pré-déploiement

### Avant `azd provision`

- [ ] Quota vérifié pour la région
- [ ] SKUs sélectionnés de manière appropriée
- [ ] Estimation des coûts revue
- [ ] Convention de nommage cohérente
- [ ] Sécurité/RBAC configurée

### Avant `azd deploy`

- [ ] Variables d’environnement définies
- [ ] Secrets dans Key Vault
- [ ] Chaînes de connexion vérifiées
- [ ] Vérifications de santé configurées

---

## 💰 Guide de sélection des SKU

| Charge de travail | Développement | Production |
|-------------------|---------------|------------|
| Container Apps | Consommation | Dédié D4 |
| App Service | B1/B2 | P1v3+ |
| Modèles Microsoft Foundry | Standard | Standard + PTU |
| AI Search | Basique | Standard S2+ |

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|----------|
| **Précédent** | [Chapitre 5 : Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Suivant** | [Chapitre 7 : Dépannage](../chapter-07-troubleshooting/README.md) |

---

## 📖 Ressources associées

- [Guide de configuration](../chapter-03-configuration/configuration.md)
- [Guide de déploiement](../chapter-04-infrastructure/deployment-guide.md)
- [Problèmes courants](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :  
Ce document a été traduit à l’aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçons d’assurer l’exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction professionnelle réalisée par un humain est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations résultant de l’utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->