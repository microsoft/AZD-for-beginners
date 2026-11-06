# Chapitre 6 : Planification et Validation Avant Déploiement

**📚 Cours** : [AZD Pour Débutants](../../README.md) | **⏱️ Durée** : 2-4 heures de lecture ; temps supplémentaire pour les laboratoires adaptés | **⭐ Complexité** : Intermédiaire–Avancé

---

## Aperçu

Ce chapitre couvre les étapes essentielles de planification et de validation avant de déployer votre application. Apprenez à éviter les erreurs coûteuses grâce à une planification de capacité appropriée, une sélection de SKU, et des vérifications préalables.

> Instruction des commandes vérifiées par rapport à la référence `azd 1.37.2` publiée. Aucun déploiement cloud n’a été exécuté. Les leçons plus longues incluent des fragments illustratifs, pas des projets de déploiement local complets.

## Objectifs d’apprentissage

En terminant ce chapitre, vous serez capable de :
- Effectuer des vérifications préalables avant le déploiement
- Planifier la capacité et estimer les besoins en ressources
- Choisir les SKU appropriés pour optimiser les coûts
- Configurer Application Insights pour la surveillance
- Comprendre les modèles de coordination multi-agents et leurs exigences de déploiement

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|--------|
| 1 | [Vérifications préalables](preflight-checks.md) | Valider la configuration avant le déploiement | 15 min |
| 2 | [Planification de la capacité](capacity-planning.md) | Estimer les besoins en ressources | 20 min |
| 3 | [Sélection des SKU](sku-selection.md) | Choisir les niveaux tarifaires appropriés | 15 min |
| 4 | [Application Insights](application-insights.md) | Configurer la surveillance | 20 min |
| 5 | [Modèles de coordination](coordination-patterns.md) | Conception avancée d’orchestration multi-agent | 60-75 min |

---

## 🚀 Démarrage rapide

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ Liste de vérification avant déploiement

### Avant `azd provision`

- [ ] Quota vérifié pour la région
- [ ] SKU sélectionnés de manière appropriée
- [ ] Estimation des coûts revue
- [ ] Convention de nommage cohérente
- [ ] Sécurité/RBAC configuré

### Avant `azd deploy`

- [ ] Variables d’environnement définies
- [ ] Secrets dans Key Vault
- [ ] Chaînes de connexion vérifiées
- [ ] Vérifications de santé configurées

---

## 💰 Guide de sélection des SKU

| Charge de travail | Développement | Production |
|----------|-------------|------------|
| Container Apps | Consommation | Consommation ou profil de charge dédié, selon la charge mesurée |
| App Service | B1/B2 | P1v3+ |
| Modèles Azure OpenAI | Type de déploiement paiement à l’usage supporté | Paiement à l’usage ou débit provisionné ; dépendant du modèle/région |
| AI Search | Gratuit/Basique dans les limites | Niveau Basique ou Standard dimensionné pour l’index, les réplicas, et la charge de requête |

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
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->