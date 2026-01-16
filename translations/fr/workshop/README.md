<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T15:16:16+00:00",
  "source_file": "workshop/README.md",
  "language_code": "fr"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Atelier en construction 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Cet atelier est actuellement en cours de développement.</strong><br>
      Le contenu peut être incomplet ou sujet à modification. Revenez bientôt pour des mises à jour !
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Dernière mise à jour : octobre 2025
      </span>
    </div>
  </div>
</div>

# Atelier AZD pour développeurs IA

Bienvenue dans cet atelier pratique pour apprendre à utiliser Azure Developer CLI (AZD) avec un focus sur le déploiement d'applications IA. Cet atelier vous permet de comprendre les modèles AZD en 3 étapes :

1. **Découverte** - trouvez le modèle qui vous convient.
1. **Déploiement** - déployez et validez son fonctionnement.
1. **Personnalisation** - modifiez et adaptez-le à vos besoins !

Au cours de cet atelier, vous serez également introduit aux outils et workflows essentiels pour les développeurs, afin de simplifier votre parcours de développement de bout en bout.

<br/>

## Guide basé sur le navigateur

Les leçons de l'atelier sont en Markdown. Vous pouvez les consulter directement sur GitHub - ou lancer un aperçu dans le navigateur comme illustré dans la capture d'écran ci-dessous.

![Atelier](../../../translated_images/fr/workshop.75906f133e6f8ba0.webp)

Pour utiliser cette option - créez un fork du dépôt sur votre profil, et lancez GitHub Codespaces. Une fois le terminal VS Code actif, tapez cette commande :

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

En quelques secondes, une boîte de dialogue apparaîtra. Sélectionnez l'option `Ouvrir dans le navigateur`. Le guide basé sur le web s'ouvrira alors dans un nouvel onglet du navigateur. Quelques avantages de cet aperçu :

1. **Recherche intégrée** - trouvez rapidement des mots-clés ou des leçons.
1. **Icône de copie** - survolez les blocs de code pour voir cette option.
1. **Basculer le thème** - passez du mode sombre au mode clair.
1. **Obtenir de l'aide** - cliquez sur l'icône Discord dans le pied de page pour rejoindre !

<br/>

## Aperçu de l'atelier

**Durée :** 3-4 heures  
**Niveau :** Débutant à intermédiaire  
**Prérequis :** Connaissance d'Azure, des concepts IA, de VS Code et des outils en ligne de commande.

Cet atelier est pratique et vous apprenez en pratiquant. Une fois les exercices terminés, nous vous recommandons de consulter le programme AZD pour débutants afin de poursuivre votre apprentissage sur les meilleures pratiques en matière de sécurité et de productivité.

| Temps | Module  | Objectif |
|:---|:---|:---|
| 15 min | [Introduction](docs/instructions/0-Introduction.md) | Poser les bases, comprendre les objectifs |
| 30 min | [Choisir un modèle IA](docs/instructions/1-Select-AI-Template.md) | Explorer les options et choisir un modèle de départ | 
| 30 min | [Valider le modèle IA](docs/instructions/2-Validate-AI-Template.md) | Déployer la solution par défaut sur Azure |
| 30 min | [Déconstruire le modèle IA](docs/instructions/3-Deconstruct-AI-Template.md) | Explorer la structure et la configuration |
| 30 min | [Configurer le modèle IA](docs/instructions/4-Configure-AI-Template.md) | Activer et tester les fonctionnalités disponibles |
| 30 min | [Personnaliser le modèle IA](docs/instructions/5-Customize-AI-Template.md) | Adapter le modèle à vos besoins |
| 30 min | [Démanteler l'infrastructure](docs/instructions/6-Teardown-Infrastructure.md) | Nettoyer et libérer les ressources |
| 15 min | [Conclusion et prochaines étapes](docs/instructions/7-Wrap-up.md) | Ressources d'apprentissage, défi de l'atelier |

<br/>

## Ce que vous apprendrez

Considérez le modèle AZD comme un bac à sable d'apprentissage pour explorer diverses capacités et outils pour le développement de bout en bout sur Azure AI Foundry. À la fin de cet atelier, vous devriez avoir une compréhension intuitive des différents outils et concepts dans ce contexte.

| Concept  | Objectif |
|:---|:---|
| **Azure Developer CLI** | Comprendre les commandes et workflows de l'outil |
| **Modèles AZD** | Comprendre la structure et la configuration des projets |
| **Agent IA Azure** | Provisionner et déployer un projet Azure AI Foundry |
| **Recherche IA Azure** | Activer l'ingénierie contextuelle avec des agents |
| **Observabilité** | Explorer le traçage, la surveillance et les évaluations |
| **Red Teaming** | Explorer les tests adverses et les mitigations |

<br/>

## Structure de l'atelier

L'atelier est structuré pour vous guider dans un parcours allant de la découverte des modèles, au déploiement, à la déconstruction et à la personnalisation - en utilisant le modèle de départ officiel [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) comme base.

### [Module 1 : Choisir un modèle IA](docs/instructions/1-Select-AI-Template.md) (30 min)

- Qu'est-ce qu'un modèle IA ?
- Où puis-je trouver des modèles IA ?
- Comment puis-je commencer à créer des agents IA ?
- **Lab** : Démarrage rapide avec GitHub Codespaces

### [Module 2 : Valider le modèle IA](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Quelle est l'architecture du modèle IA ?
- Quel est le workflow de développement AZD ?
- Comment puis-je obtenir de l'aide pour le développement AZD ?
- **Lab** : Déployer et valider le modèle d'agents IA

### [Module 3 : Déconstruire le modèle IA](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Explorer votre environnement dans `.azure/` 
- Explorer la configuration des ressources dans `infra/` 
- Explorer votre configuration AZD dans les fichiers `azure.yaml`
- **Lab** : Modifier les variables d'environnement et redéployer

### [Module 4 : Configurer le modèle IA](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Explorer : Génération augmentée par récupération
- Explorer : Évaluation des agents et Red Teaming
- Explorer : Traçage et surveillance
- **Lab** : Explorer l'agent IA + Observabilité 

### [Module 5 : Personnaliser le modèle IA](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Définir : PRD avec exigences de scénario
- Configurer : Variables d'environnement pour AZD
- Implémenter : Hooks de cycle de vie pour des tâches supplémentaires
- **Lab** : Personnaliser le modèle pour mon scénario

### [Module 6 : Démanteler l'infrastructure](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Récapitulatif : Qu'est-ce que les modèles AZD ?
- Récapitulatif : Pourquoi utiliser Azure Developer CLI ?
- Prochaines étapes : Essayer un autre modèle !
- **Lab** : Déprovisionner l'infrastructure et nettoyer

<br/>

## Défi de l'atelier

Envie de vous challenger davantage ? Voici quelques suggestions de projets - ou partagez vos idées avec nous !!

| Projet | Description |
|:---|:---|
|1. **Déconstruire un modèle IA complexe** | Utilisez le workflow et les outils décrits et voyez si vous pouvez déployer, valider et personnaliser un autre modèle de solution IA. _Qu'avez-vous appris ?_|
|2. **Personnaliser avec votre scénario**  | Essayez de rédiger un PRD (Product Requirements Document) pour un autre scénario. Ensuite, utilisez GitHub Copilot dans votre dépôt de modèle en mode Agent et demandez-lui de générer un workflow de personnalisation pour vous. _Qu'avez-vous appris ? Comment pourriez-vous améliorer ces suggestions ?_|
| | |

## Vous avez des retours ?

1. Publiez une issue sur ce dépôt - taguez-la `Workshop` pour plus de commodité.
1. Rejoignez le Discord Azure AI Foundry - connectez-vous avec vos pairs !

| | | 
|:---|:---|
| **📚 Accueil du cours**| [AZD pour débutants](../README.md)|
| **📖 Documentation** | [Commencer avec les modèles IA](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ Modèles IA** | [Modèles Azure AI Foundry](https://ai.azure.com/templates) |
|**🚀 Prochaines étapes** | [Relevez le défi](../../../workshop) |
| | |

<br/>

---

**Précédent :** [Guide de dépannage IA](../docs/troubleshooting/ai-troubleshooting.md) | **Suivant :** Commencez avec [Lab 1 : Bases AZD](../../../workshop/lab-1-azd-basics)

**Prêt à commencer à créer des applications IA avec AZD ?**

[Commencez le Lab 1 : Fondations AZD →](./lab-1-azd-basics/README.md)

---

**Avertissement** :  
Ce document a été traduit à l'aide du service de traduction automatique [Co-op Translator](https://github.com/Azure/co-op-translator). Bien que nous nous efforcions d'assurer l'exactitude, veuillez noter que les traductions automatisées peuvent contenir des erreurs ou des inexactitudes. Le document original dans sa langue d'origine doit être considéré comme la source faisant autorité. Pour des informations critiques, il est recommandé de recourir à une traduction professionnelle humaine. Nous ne sommes pas responsables des malentendus ou des interprétations erronées résultant de l'utilisation de cette traduction.