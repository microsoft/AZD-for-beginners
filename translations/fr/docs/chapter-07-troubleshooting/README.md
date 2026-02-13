# Chapitre 7 : Dépannage & Débogage

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 1–1,5 heures | **⭐ Complexity**: Intermédiaire

---

## Aperçu

Ce chapitre vous aide à diagnostiquer et résoudre les problèmes courants lors de l'utilisation de Azure Developer CLI. Des échecs de déploiement aux problèmes spécifiques à l'IA.

## Objectifs d'apprentissage

En terminant ce chapitre, vous allez :
- Diagnostiquer les échecs de déploiement AZD courants
- Déboguer les problèmes d'authentification et d'autorisations
- Résoudre les problèmes de connectivité des services IA
- Utiliser le portail Azure et la CLI pour le dépannage

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Common Issues](common-issues.md) | Problèmes fréquemment rencontrés | 30 min |
| 2 | [Debugging Guide](debugging.md) | Stratégies de débogage étape par étape | 45 min |
| 3 | [AI Troubleshooting](ai-troubleshooting.md) | Problèmes spécifiques à l'IA | 30 min |

---

## 🚨 Correctifs rapides

### Problèmes d'authentification
```bash
azd auth login
az login
azd auth whoami
```

### Échecs de provisionnement
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Conflits de ressources
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Quota dépassé
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Référence des codes d'erreur

| Error | Cause | Solution |
|-------|-------|----------|
| `AuthenticationError` | Non connecté | `azd auth login` |
| `ResourceNotFound` | Ressource manquante | Vérifier les noms des ressources |
| `QuotaExceeded` | Limites de l'abonnement | Demander une augmentation du quota |
| `InvalidTemplate` | Erreur de syntaxe Bicep | `az bicep build` |
| `Conflict` | La ressource existe | Utiliser un nouveau nom ou supprimer |
| `Forbidden` | Autorisations insuffisantes | Vérifier les rôles RBAC |

---

## 🔄 Réinitialisation et récupération

```bash
# Réinitialisation douce (conserver les ressources, redéployer le code)
azd deploy --force

# Réinitialisation complète (tout supprimer, repartir à zéro)
azd down --force --purge
azd up
```

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapitre 6 : Pré-déploiement](../chapter-06-pre-deployment/README.md) |
| **Next** | [Chapitre 8 : Production](../chapter-08-production/README.md) |

---

## 📖 Ressources associées

- [Vérifications pré-déploiement](../chapter-06-pre-deployment/preflight-checks.md)
- [Guide de configuration](../chapter-03-configuration/configuration.md)
- [Problèmes GitHub d'AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Avertissement :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des imprécisions. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un traducteur humain. Nous ne pouvons être tenus responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->