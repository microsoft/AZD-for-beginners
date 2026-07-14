# Chapitre 7 : Dépannage & Debugging

**📚 Cours** : [AZD Pour Débutants](../../README.md) | **⏱️ Durée** : 1-1,5 heures | **⭐ Complexité** : Intermédiaire

---

## Vue d'ensemble

Ce chapitre vous aide à diagnostiquer et résoudre les problèmes courants lors de l’utilisation de Azure Developer CLI. Des échecs de déploiement aux problèmes spécifiques à l’IA.

> Validé avec `azd 1.27.1` en juillet 2026.

## Objectifs d’apprentissage

En terminant ce chapitre, vous allez :
- Diagnostiquer les échecs courants de déploiement AZD
- Debugger les problèmes d’authentification et de permissions
- Résoudre les problèmes de connectivité des services IA
- Utiliser le portail Azure et la CLI pour le dépannage

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|------|
| 1 | [Problèmes Courants](common-issues.md) | Problèmes fréquemment rencontrés | 30 min |
| 2 | [Guide de Debugging](debugging.md) | Stratégies de debugging étape par étape | 45 min |
| 3 | [Dépannage IA](ai-troubleshooting.md) | Problèmes spécifiques à l’IA | 30 min |

---

## 🚨 Corrections Rapides

### Problèmes d’authentification
```bash
# Requis pour les flux de travail AZD
azd auth login

# Facultatif si vous utilisez également les commandes Azure CLI directement
az login

azd auth status
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

## 📋 Référence des Codes d’Erreur

| Erreur | Cause | Solution |
|-------|-------|----------|
| `AuthenticationError` | Non connecté | `azd auth login` |
| `ResourceNotFound` | Ressource manquante | Vérifier les noms des ressources |
| `QuotaExceeded` | Limites d’abonnement | Demander une augmentation de quota |
| `InvalidTemplate` | Erreur de syntaxe Bicep | `az bicep build` |
| `Conflict` | Ressource existante | Utiliser un nouveau nom ou supprimer |
| `Forbidden` | Permissions insuffisantes | Vérifier les rôles RBAC |

---

## 🔄 Réinitialisation et Récupération

```bash
# Réinitialisation douce (conserver les ressources, redéployer le code)
azd deploy --force

# Réinitialisation complète (tout supprimer, repartir à zéro)
azd down --force --purge
azd up
```

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|---------|
| **Précédent** | [Chapitre 6 : Pré-déploiement](../chapter-06-pre-deployment/README.md) |
| **Suivant** | [Chapitre 8 : Production](../chapter-08-production/README.md) |

---

## 📖 Ressources Associées

- [Vérifications Pré-déploiement](../chapter-06-pre-deployment/preflight-checks.md)
- [Guide de Configuration](../chapter-03-configuration/configuration.md)
- [Problèmes GitHub AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->