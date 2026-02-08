# Chapitre 8 : Production et modèles d'entreprise

**📚 Cours**: [AZD pour débutants](../../README.md) | **⏱️ Durée**: 2-3 heures | **⭐ Complexité**: Avancé

---

## Aperçu

Ce chapitre couvre les modèles de déploiement prêts pour l'entreprise, le renforcement de la sécurité, la supervision et l'optimisation des coûts pour les charges de travail IA en production.

## Objectifs d'apprentissage

En terminant ce chapitre, vous allez :
- Déployer des applications résilientes multi-régions
- Mettre en œuvre des modèles de sécurité d'entreprise
- Configurer une supervision complète
- Optimiser les coûts à grande échelle
- Mettre en place des pipelines CI/CD avec AZD

---

## 📚 Lessons

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Pratiques IA en production](production-ai-practices.md) | Modèles de déploiement d'entreprise | 90 min |

---

## 🚀 Checklist de production

- [ ] Déploiement multi-région pour la résilience
- [ ] Identité gérée pour l'authentification (sans clés)
- [ ] Application Insights pour la surveillance
- [ ] Budgets de coûts et alertes configurés
- [ ] Analyse de sécurité activée
- [ ] Intégration du pipeline CI/CD
- [ ] Plan de reprise après sinistre

---

## 🏗️ Modèles d'architecture

### Modèle 1 : Microservices IA

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   API Gateway   │───▶│   AI Service    │───▶│   Azure OpenAI  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │
         ▼                      ▼
┌─────────────────┐    ┌─────────────────┐
│   Auth Service  │    │   Data Store    │
└─────────────────┘    └─────────────────┘
```

### Modèle 2 : IA pilotée par événements

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Bonnes pratiques de sécurité

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Optimisation des coûts

| Stratégie | Économies |
|----------|---------|
| Mise à l'échelle à zéro (Container Apps) | 60-80% |
| Utiliser des niveaux de consommation pour le dev | 50-70% |
| Mise à l'échelle planifiée | 30-50% |
| Capacité réservée | 20-40% |

```bash
# Définir des alertes budgétaires
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Configuration de la surveillance

```bash
# Flux de journaux
azd monitor --logs

# Consulter Application Insights
azd monitor

# Afficher les métriques
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigation

| Direction | Chapitre |
|-----------|---------|
| **Précédent** | [Chapitre 7 : Dépannage](../chapter-07-troubleshooting/README.md) |
| **Cours terminé** | [Accueil du cours](../../README.md) |

---

## 📖 Ressources liées

- [Guide des agents IA](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Solutions multi-agents](../chapter-05-multi-agent/README.md)
- [Exemple de microservices](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Avertissement :**
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatiques peuvent contenir des erreurs ou des inexactitudes. Le document original, dans sa langue d'origine, doit être considéré comme la source faisant foi. Pour les informations critiques, une traduction humaine professionnelle est recommandée. Nous déclinons toute responsabilité en cas de malentendus ou d'interprétations erronées résultant de l'utilisation de cette traduction.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->