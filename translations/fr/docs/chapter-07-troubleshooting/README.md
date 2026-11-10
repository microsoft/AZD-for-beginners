# Chapitre 7 : Dépannage et Debugging

**📚 Cours** : [AZD pour débutants](../../README.md) | **⏱️ Durée** : 1-1,5 heures | **⭐ Complexité** : Intermédiaire

---

## Vue d'ensemble

Ce chapitre vous aide à diagnostiquer et résoudre les problèmes courants lors de l’utilisation de l’Azure Developer CLI. Des échecs de déploiement aux problèmes spécifiques à l’IA.

> Les instructions de commande ont été vérifiées par rapport à la référence publiée `azd 1.37.2`. Les déploiements cloud n’ont pas été exécutés. Remplacez les noms et ID d’exemple des ressources avant d’utiliser les commandes.

## Objectifs d’apprentissage

En complétant ce chapitre, vous allez :
- Diagnostiquer les échecs courants de déploiement AZD
- Debugger les problèmes d’authentification et de permissions
- Résoudre les problèmes de connectivité aux services IA
- Utiliser Azure Portal et CLI pour le dépannage

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|------|
| 1 | [Problèmes courants](common-issues.md) | Problèmes fréquemment rencontrés | 30 min |
| 2 | [Guide de debugging](debugging.md) | Stratégies de debugging pas à pas | 45 min |
| 3 | [Dépannage IA](ai-troubleshooting.md) | Problèmes spécifiques à l’IA | 30 min |

---

## 🚨 Correctifs rapides

### Problèmes d’authentification
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Échecs de provisionnement
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Conflits de ressources
Inspectez d’abord les erreurs existantes de ressources et de déploiement. Ne supprimez pas un environnement partagé ou de production pour résoudre un conflit de nom. Pour un **nouvel environnement jetable**, utilisez un nom unique :

```bash
azd env new different-name
azd up
```

### Quota dépassé
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Modifier `AZURE_LOCATION` ne déplace pas les ressources existantes et peut provoquer des conflits de localisation lors du redéploiement.

---

## 📋 Référence des codes d’erreur

| Erreur | Cause | Solution |
|-------|-------|----------|
| `AuthenticationError` | Non connecté | `azd auth login` |
| `ResourceNotFound` | Ressource manquante | Vérifiez les noms des ressources |
| `QuotaExceeded` | Limites d’abonnement | Demandez une augmentation de quota |
| `InvalidTemplate` | Erreur de syntaxe Bicep | `az bicep build` |
| `Conflict` | Ressource existante | Utilisez un nouveau nom ou supprimez |
| `Forbidden` | Permissions insuffisantes | Vérifiez les rôles RBAC |

---

## 🔄 Réinitialisation et récupération

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

La réinitialisation complète supprime les données et peut modifier les points de terminaison. Sauvegardez d’abord et consultez les invites de suppression interactive. `--force --purge` convient uniquement aux environnements jetables lorsque la suppression irréversible est prévue.

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|---------|
| **Précédent** | [Chapitre 6 : Pré-déploiement](../chapter-06-pre-deployment/README.md) |
| **Suivant** | [Chapitre 8 : Production](../chapter-08-production/README.md) |

---

## 📖 Ressources associées

- [Vérifications pré-déploiement](../chapter-06-pre-deployment/preflight-checks.md)
- [Guide de configuration](../chapter-03-configuration/configuration.md)
- [Problèmes GitHub AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement** :
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforçions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue native doit être considéré comme la source faisant autorité. Pour les informations critiques, il est recommandé de recourir à une traduction professionnelle réalisée par un humain. Nous ne saurions être tenus responsables des malentendus ou erreurs d'interprétation découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->