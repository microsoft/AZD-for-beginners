# Chapitre 7 : Résolution des problèmes et débogage

**📚 Cours** : [AZD Pour débutants](../../README.md) | **⏱️ Durée** : 1-1,5 heures | **⭐ Complexité** : Intermédiaire

---

## Aperçu

Ce chapitre vous aide à diagnostiquer et résoudre les problèmes courants lors de l'utilisation d'Azure Developer CLI. Des échecs de déploiement aux problèmes spécifiques à l'IA.

> Validé avec `azd 1.23.12` en mars 2026.

## Objectifs d'apprentissage

En complétant ce chapitre, vous allez :
- Diagnostiquer les échecs courants de déploiement AZD
- Déboguer les problèmes d'authentification et de permissions
- Résoudre les problèmes de connectivité des services IA
- Utiliser Azure Portal et CLI pour la résolution des problèmes

---

## 📚 Leçons

| # | Leçon | Description | Durée |
|---|--------|-------------|-------|
| 1 | [Problèmes courants](common-issues.md) | Problèmes fréquemment rencontrés | 30 min |
| 2 | [Guide de débogage](debugging.md) | Stratégies de débogage étape par étape | 45 min |
| 3 | [Dépannage IA](ai-troubleshooting.md) | Problèmes spécifiques à l'IA | 30 min |

---

## 🚨 Résolutions rapides

### Problèmes d'authentification
```bash
# Requis pour les workflows AZD
azd auth login

# Optionnel si vous utilisez également les commandes Azure CLI directement
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

## 📋 Référence des codes d'erreur

| Erreur | Cause | Solution |
|--------|-------|----------|
| `AuthenticationError` | Non connecté | `azd auth login` |
| `ResourceNotFound` | Ressource manquante | Vérifiez les noms des ressources |
| `QuotaExceeded` | Limites d’abonnement | Demandez une augmentation de quota |
| `InvalidTemplate` | Erreur de syntaxe Bicep | `az bicep build` |
| `Conflict` | Ressource existante | Utilisez un nouveau nom ou supprimez |
| `Forbidden` | Permissions insuffisantes | Vérifiez les rôles RBAC |

---

## 🔄 Réinitialisation et récupération

```bash
# Réinitialisation douce (conserver les ressources, redéployer le code)
azd deploy --force

# Réinitialisation complète (tout supprimer, recommencer à zéro)
azd down --force --purge
azd up
```

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|----------|
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
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer la précision, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction professionnelle humaine est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou de mauvaises interprétations découlant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->